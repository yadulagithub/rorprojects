import { Component, OnInit } from '@angular/core';
import { HttpService } from '../http.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-article-list',
  templateUrl: './article-list.component.html',
  styleUrls: ['./article-list.component.css']
})
export class ArticleListComponent implements OnInit {
  private _httpService : HttpService;
  public articles : Array<any> = [];

  constructor(_httpService : HttpService) {
    this._httpService = _httpService;
  }
  
  ngOnInit() {
    const observable : Observable<any> = this._httpService.getArticles();
    observable.subscribe( res => {
      this.articles = res.reverse();
    });
  }


}



