import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { HttpClientModule } from '@angular/common/http';
import { HttpService } from './http.service';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { ArticleListComponent } from './article-list/article-list.component';
import { ArticleNewComponent } from './article-new/article-new.component';
import { ArticleEditComponent } from './article-edit/article-edit.component';
import { ArticleDetailComponent } from './article-detail/article-detail.component';


@NgModule({
  declarations: [
    AppComponent,
    ArticleListComponent,
    ArticleNewComponent,
    ArticleEditComponent,
    ArticleDetailComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule, 
    FormsModule,
    AppRoutingModule
  ],
  providers: [ HttpService ],
  bootstrap: [AppComponent]
})
export class AppModule { }
