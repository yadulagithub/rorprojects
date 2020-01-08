
import { Component, OnInit } from '@angular/core';
import { HttpService } from '../http.service';
import { Observable } from 'rxjs';
import { ActivatedRoute, Params, Router } from '@angular/router';

@Component({
  selector: 'app-article-new',
  templateUrl: './article-new.component.html',
  styleUrls: ['./article-new.component.css']
})
export class ArticleNewComponent implements OnInit {

  private _httpService : HttpService;
  private _router : Router;
  public newArticle: any = {};
  public errors: any = {};
  
  constructor(_httpService : HttpService, router: Router) {
    this._httpService = _httpService;
    this._router = router;
  }

  addArticle() {
    console.log(this.newArticle);
    let articleObservable : Observable<any> = this._httpService.createArticle(this.newArticle);
    articleObservable.subscribe( res => {
      if(res.errors) {
        this.errors = res.errors;
      } else {
        this._router.navigate(['/']);
      }
    });
    return false;
  }

  ngOnInit() {
  }

}


