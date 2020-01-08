import { Component } from '@angular/core';
//import { HttpClient } from '@angular/common/http';
//import { Article } from './Article';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
  //,providers: [HttpClient]
})
export class AppComponent {
  title = 'client';
  
  //articles;
  //private _http : HttpClient;
 
  //constructor(_http : HttpClient) {
  //  this._http = _http;
  //  this._http.get('http://localhost:3000/articles.json')
  //  .subscribe(res => this.articles = res);
  //}
}
