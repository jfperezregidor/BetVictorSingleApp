// app/assets/javascripts/components/event_table.js.jsx
// It's the react component of a Table
class EventTable extends React.Component {
  render() {
  var data_arr = [];
    if(this.props.data != null){
        this.props.data.forEach(function(result) {
          data_arr.push(<Element data={result} type={this.props.type}
                             key={'result' + result.id}/>);
        }.bind(this));
    }
    
    return(
      <table className="table table-striped">
        <thead>
          <tr>
            <th className="col-md-1">Id</th>
            <th className="col-md-2" className={this.props.type != 'outcomes'  ?  '' : 'hidden'}>Pos</th>
            <th className="col-md-1" className={this.props.type != 'outcomes'  ?  '' : 'hidden'}>Title</th>
            <th className="col-md-2" className={this.props.type == 'events'  ?  '' : 'hidden'}>Status</th>
            <th className="col-md-2" className={this.props.type == 'events'  ?  '' : 'hidden'}>Score</th>
            <th className="col-md-2" className={this.props.type == 'outcomes'  ?  '' : 'hidden'}>Description</th>
            <th className="col-md-2" className={this.props.type == 'outcomes'  ?  '' : 'hidden'}>Price</th>
          </tr>
        </thead>
        <tbody>{data_arr}</tbody>
      </table>
    )
  }
}
