
class EventApplication extends React.Component {

  componentDidMount() {
    this.getDataFromApi('/sports');
        
  }
  componentDidUpdate(){
  
  }

  /**
  * Get a data from a API
  **/
  getDataFromApi(query) {
    var self = this;
    $.getJSON('/api/v1' + query, (response) => {
        if(response.status == 200){
            this.setState({ data: response.data,
            type: this.getQueryType(query)})
        }else{
            alert('Error file not found');
        }
    });  
    
  }
  /**
  * Get a correct query after pass a filter
  * TODO: It is possible to make a str.match()
  **/
  getCorrectQuery(query){
    var end_query = "/sports"
    if(query === end_query){
        return query
    }
    if(query.includes("/sports/")){
        end_query = query
    }
    if(query.includes("/events/") && query.includes("/sports/")){
        type_query = query
    }
    if(query.includes("//") || (query.length >=7 && !query.includes('/sports/')) || query.length <= 6 || !query.includes('/')){
        end_query = null
    }
    return end_query;
  }
  
  /**
  * Get query type is a method that return if it is for sport, events or outcomes and render diferent
  **/
  getQueryType(query){
    var type_query = "sports"
    if(query.includes("/sports/")){
        type_query = "events"
    }
    if(query.includes("/events/") && query.includes("/sports/")){
        type_query = "outcomes"
    }
    return type_query;
  }
  
  /**
  * Constructor
  **/
  constructor(props) {
    super(props);
    this.state = {
        data: [],
        query: "/sports",
        type: 'sports'
    };
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
      
  }

  
  handleChange(event) {
    this.setState({query: event.target.value});
  }

  handleSubmit(event) {
    query_check = this.getCorrectQuery(this.state.query)
    if(query_check != null){
        alert('A query was submitted: ' + this.state.query);
        this.getDataFromApi(this.state.query)
        event.preventDefault();
    }else{
        alert('The query ' + this.state.query + ' has an error');
    }
  }

  
  
  render() {
    return(
       <div className="container">
        <div className="jumbotron">
          <h1>Test - BetVictor</h1>
          <p>by Jerónimo Perez</p>
        </div>
        <div className="row">
            <div className="col-md-12">
             <form onSubmit={this.handleSubmit}>
                <label>
                  Query:
                  <input type="text" id="input-query" value={this.state.query} onChange={this.handleChange} placeholder="/sports/:id_sport/events/:id_event"/>
                </label>
                <input type="submit" id="btn-submit" value="Submit" />
              </form>
            </div>
            
        </div>
        <div className="row">
          <div className="col-md-12">
            <EventTable data={this.state.data} type={this.state.type} />
          </div>
        </div>
      </div>
    )
  }
}
