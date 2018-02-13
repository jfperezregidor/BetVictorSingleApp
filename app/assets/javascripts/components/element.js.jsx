// app/assets/javascripts/components/element.js.jsx
// It's the react component of an Element (row) in the table
// It ll render depends on the type of query
class Element extends React.Component {
  
  constructor(props) {
    super(props);
  }
  
  render() {
    var data = this.props.data;
    return(
      <tr>
        <td className="col-md-1">{data.id}</td>
        <td className="col-md-1" className={this.props.type != 'outcomes'  ?  '' : 'hidden'}>{data.pos}</td>
        <td className="col-md-2" className={this.props.type != 'outcomes'  ?  '' : 'hidden'}>{data.title}</td>
        <td className="col-md-2" className={this.props.type == 'events'  ?  '' : 'hidden'}>{data.status}</td>
        <td className="col-md-2" className={this.props.type == 'events'  ?  '' : 'hidden'}>{data.score}</td>
        <td className="col-md-2" className={this.props.type == 'outcomes'  ?  '' : 'hidden'}>{data.description}</td>
        <td className="col-md-2" className={this.props.type == 'outcomes'  ?  '' : 'hidden'}>{data.price_decimal}</td>
                            
      </tr>
    );
  }
}

Element.propTypes =  {
    title: PropTypes.string,
  };


