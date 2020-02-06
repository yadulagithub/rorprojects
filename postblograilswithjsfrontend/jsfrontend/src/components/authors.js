class Authors {
    constructor() {
    this.authors = []
    this.adapter = new AuthorsAdapter()
    //this.bindEventListner()
    this.fetchAndLoadAuthors()
    }

    fetchAndLoadAuthors() {
        this.adapter.getAuthors().then(authors => { authors.forEach( author =>
            this.authors.push(author))             
        }).then(() => {
            this.render()}) 
    }

    render() {
        console.log("render...")
        const authorscontainer = document.getElementById('author-container')
        authorscontainer.innerHTML
    }
    



}