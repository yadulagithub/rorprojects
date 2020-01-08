import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ArticleListComponent } from './article-list/article-list.component';
import { ArticleNewComponent } from './article-new/article-new.component';
import { ArticleEditComponent } from './article-edit/article-edit.component';
import { ArticleDetailComponent } from './article-detail/article-detail.component';


const routes: Routes = [
  {path: '', pathMatch: 'full', component: ArticleListComponent},
  {path: 'new', component: ArticleNewComponent},
  {path: 'edit/:id',  component: ArticleEditComponent},
  {path: 'detail/:_id',  component: ArticleDetailComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

