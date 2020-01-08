import { Component, OnInit } from '@angular/core';
import { HttpService } from '../http.service';
import { ActivatedRoute, Params, Route, Router } from '@angular/router';
import { Observable } from 'rxjs';

//import { CounterService } from '../counter.service';

@Component({
  selector: 'app-article-detail',
  templateUrl: './article-detail.component.html',
  styleUrls: ['./article-detail.component.css']
})
export class ArticleDetailComponent implements OnInit {

  private _httpService : HttpService;
  private _route : ActivatedRoute;
  private _router : Router;
  public error2s: any = {};
  public oneArticle : any = {};
  //public _articlenter : CounterService;
  public disabled : boolean = false;

  constructor(httpService : HttpService, route : ActivatedRoute, router : Router) {
    this._httpService = httpService;
    this._route = route;
    this._router = router;
  }

  ngOnInit() {
    this._route.params.subscribe((params: Params) => {
      console.log(params['id']);
      const articleObservable : Observable<any> = this._httpService.getOneArticle(params['_id']);
      articleObservable.subscribe( res => this.oneArticle = res );
    });
  }

  getArticle(id) {
    let observable = this._httpService.updateArticle(id, this.oneArticle)
    observable.subscribe( res => {
      console.log(res);
      if(res['errors']) {
        this.error2s = res['errors'];
      } 
      else {
        this._router.navigate(['/']);
      }
    });
  }

  delArticle(id) {
    let observable = this._httpService.deleteArticle(id, this.oneArticle);
    observable.subscribe( res => {
      console.log(res);
      if(res['errors']) {
        this.error2s = res['errors'];
      } 
      else {
        this._router.navigate(['/']);
      }
    });
  }
 
  getArticle2(id) {
    let observable = this._httpService.updateArticle(id, this.oneArticle);
    observable.subscribe( res => {
      console.log(res);
      if(res['errors']) {
        this.error2s = res['errors'];
      } 
    });
  }


  // public getCount() {
  //   return this._counter.count;
  // }
  // public incCount(event: any, _id){
  //   this.oneArticle.likes += 1;
  //   console.log('Counter ' + this.oneArticle.likes);
  //   console.log('Event ' + event);
  //   console.log(id);
  //   event.target.disabled = true;
  //   this.disabled = true;
  //   this.getArticle2(id) ;


  //   return false;
    
  // }

  public disableBtn(){
    this.disabled = true;
  }

  
}

