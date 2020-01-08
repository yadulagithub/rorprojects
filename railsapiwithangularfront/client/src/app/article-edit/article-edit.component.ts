import { Component, OnInit } from '@angular/core';
import { HttpService } from '../http.service';
import { ActivatedRoute, Params, Route, Router } from '@angular/router';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-article-edit',
  templateUrl: './article-edit.component.html',
  styleUrls: ['./article-edit.component.css']
})
export class ArticleEditComponent implements OnInit {

  private _httpService : HttpService;
  private _route : ActivatedRoute;
  private _router : Router;
  public error2s: any = {};
  public oneArticle : any = {};

  constructor(httpService : HttpService, route : ActivatedRoute, router : Router) {
    this._httpService = httpService;
    this._route = route;
    this._router = router;
  }
  ngOnInit() {
    this._route.params.subscribe((params: Params) => {
      console.log(params['id']);
      const articleObservable : Observable<any> = this._httpService.getOneArticle(params['id']);
      articleObservable.subscribe( res => this.oneArticle = res );
    });
  }

  updateArticle(id) {
   let observable = this._httpService.updateArticle(id, this.oneArticle);
    observable.subscribe( res => {
      console.log(res);
      if(res['errors']) {
        this.error2s = res['errors'];
      } else {
        this._router.navigate(['/']);
      }
    });
  }

}

