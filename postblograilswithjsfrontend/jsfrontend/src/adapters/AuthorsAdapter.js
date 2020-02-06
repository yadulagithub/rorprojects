class AuthorsAdapter {
    constructor() {
        this.baseUrl = 'http://localhost:3000/authors'
    }

    getAuthors() {
        fetch(this.baseUrl).then(res => res.json)
    } 
}