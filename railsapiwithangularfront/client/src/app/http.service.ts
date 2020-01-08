
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Article } from './article'

@Injectable()

export class HttpService {

  Articles_url = "http://localhost:3000/articles"; 

  private _http : HttpClient;
  
  constructor(_http : HttpClient) {
    this._http = _http;
    console.log(_http);
  }

  getArticles() : Observable<any> {
    //console.log(this._http.get("/articles"));
    return this._http.get(this.Articles_url);
    //return this._http.get('/articles');
  }

  getOneArticle(_id) {
    return this._http.get(this.Articles_url + `/${_id}`);
  }

  createArticle(articleData: any) : Observable<any> {
    return this._http.post(this.Articles_url, articleData);
  }

  updateArticle(_id, articleData) {
    return this._http.put(this.Articles_url + `/${_id}`, articleData);
  }

  deleteArticle(_id, articleData) {
    return this._http.delete(this.Articles_url + `/${_id}`, articleData);
  }


}
  
