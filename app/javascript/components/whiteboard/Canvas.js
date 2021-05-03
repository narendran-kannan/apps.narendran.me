import React, {Component} from "react"
import PropTypes from "prop-types"
import ActionCable from 'actioncable'
import { ActionCableProvider, ActionCableConsumer } from 'react-actioncable-provider';

class Canvas extends Component {
  constructor(props) {
    super(props);
    this.actionCable = ActionCable.createConsumer('ws://localhost:3001/cable');
    this.channel = this.actionCable.subscriptions.create({ channel: "WbcanvasChannel", name: "ABCDE" })
    this.channel.received = (data) => {
      console.log(data);
      this.handleChangeByOthers(data)
      // this.draw(this.canvasref.current.getContext('2d'), data['prev'][0], data['prev'][1], data['x'], data['y'])
    }
  }

  handleChangeByOthers = (data) => {
    console.log(data);
    this.draw(this.canvasref.current.getContext('2d'), data['prev'][0], data['prev'][1], data['x'], data['y'])
    this.setState({
      prev: [data['x'],data['y']]
    })
  }


  componentDidMount() {

    // const cable = ActionCable.createConsumer('ws://localhost:3001/cable');
    this.channel.connected = () => {
      console.log("Connected");
    }

  }


  canvasref = React.createRef(null)

  state = {
    prev: [],
    color: "black",
    isDrawing: false,
  }



  handleMouseDown = (e) => {
    const rect = e.target.getBoundingClientRect()

    const x = e.clientX - rect.left
    const y = e.clientY - rect.top
    this.setState({
      isDrawing: true,
      prev: [x,y]
    });
  };
  handleMouseUp= (e) => {
    this.setState({
      isDrawing: false
    });
  };

  handleMouseMove = (e) => {
    if(this.state.isDrawing) {
      const rect = e.target.getBoundingClientRect()

      const x = e.clientX - rect.left
      const y = e.clientY - rect.top

      // Draw line
      this.draw(this.canvasref.current.getContext('2d'), this.state.prev[0], this.state.prev[1], x, y)

      this.channel.send({prev: this.state.prev, x: x, y: y})


      this.setState({
        prev: [x, y]
      });
    }

  }
  draw = (ctx, x1, y1, x2, y2, color = null) => {
    color = this.state.color
    ctx.beginPath()
    ctx.strokeStyle = color
    ctx.lineWidth = 1
    ctx.moveTo(x1, y1)
    ctx.lineTo(x2, y2)
    ctx.stroke()
    ctx.closePath()
  }
  render () {

    return (
        <div>
          {/*<ActionCableProvider cable={this.actionCable}>*/}
            <div>
              {/*<ActionCableConsumer channel={{channel: 'WbcanvasChannel', name: 'ABCDE'}}*/}
              {/*                     onReceived={this.handleChangeByOthers}/>*/}
              <canvas ref={this.canvasref} width={1000} height={500} style={{border: "1px solid"}}
                      onMouseDown={this.handleMouseDown} onMouseUp={this.handleMouseUp}
                      onPointerMove={this.handleMouseMove}/>
            </div>
          {/*</ActionCableProvider>*/}
        </div>

    );
  }
}

Canvas.propTypes = {
  canvasId: PropTypes.string
};
export default Canvas
