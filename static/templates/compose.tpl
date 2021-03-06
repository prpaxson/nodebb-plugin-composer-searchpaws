<div component="composer" class="composer<!-- IF resizable --> resizable<!-- ENDIF resizable --><!-- IF !isTopicOrMain --> reply<!-- ENDIF !isTopicOrMain -->"<!-- IF !disabled --> style="visibility: inherit;"<!-- ENDIF !disabled -->>

  <div class="composer-container">
    <form id="compose-form" method="post">
      <!-- IF pid -->
      <input type="hidden" name="pid" value="{pid}" />
      <input type="hidden" name="thumb" value="{thumb}" />
      <!-- ENDIF pid -->
      <!-- IF tid -->
      <input type="hidden" name="tid" value="{tid}" />
      <!-- ENDIF tid -->
      <!-- IF cid -->
      <input type="hidden" name="cid" value="{cid}" />
      <!-- ENDIF cid -->
      <input type="hidden" name="_csrf" value="{config.csrf_token}" />
    </form>

    <div class="title-container row">
      <!-- IF showHandleInput -->
      <div class="col-sm-3 col-md-12">
        <input class="handle form-control" type="text" tabindex="1" placeholder="[[topic:composer.handle_placeholder]]" value="{handle}" />
      </div>
      <!-- ENDIF showHandleInput -->
      <div class="<!-- IF isTopic -->col-lg-9<!-- ELSE -->col-lg-12<!-- ENDIF isTopic --> col-md-12">
        <!-- IF isTopicOrMain -->
        <input name="title" form="compose-form" class="title form-control" type="text" tabindex="1" placeholder="[[topic:composer.title_placeholder]]" value="{topicTitle}"/>
        <!-- ELSE -->
        <span class="title">[[topic:composer.replying_to, "{topicTitle}"]]</span>
        <!-- ENDIF isTopicOrMain -->
        <div id="quick-search-container" class="quick-search-container hidden">
          <div class="quick-search-results-container"></div>
        </div>
      </div>
    </div>

    <div class="category-tag-row">
      <div class="btn-toolbar formatting-bar">
        <ul class="formatting-group">
          <!-- BEGIN formatting -->
            <!-- IF formatting.spacer -->
            <li class="spacer"></li>
            <!-- ELSE -->
            <!-- IF !formatting.mobile -->
            <li tabindex="-1" data-format="{formatting.name}"><i class="{formatting.className}"></i></li>
            <!-- ENDIF !formatting.mobile -->
            <!-- ENDIF formatting.spacer -->
          <!-- END formatting -->

          <!--[if gte IE 9]><!-->
            <!-- IF privileges.upload:post:image -->
            <li class="img-upload-btn hide" data-format="picture" tabindex="-1">
              <i class="fa fa-file-image-o"></i>
            </li>
            <!-- ENDIF privileges.upload:post:image -->
            <!-- IF privileges.upload:post:file -->
            <li class="file-upload-btn hide" data-format="upload" tabindex="-1">
              <span class="fa-stack">
                <i class="fa fa-file-o fa-stack-1x"></i>
                <i class="fa fa-arrow-up fa-stack-1x"></i>
              </span>
            </li>
            <!-- ENDIF privileges.upload:post:file -->
          <!--<![endif]-->

          <!-- IF allowTopicsThumbnail -->
          <li tabindex="-1">
            <i class="fa fa-th-large topic-thumb-btn topic-thumb-toggle-btn hide" title="[[topic:composer.thumb_title]]"></i>
          </li>
          <div class="topic-thumb-container center-block hide">
            <form id="thumbForm" method="post" class="topic-thumb-form form-inline" enctype="multipart/form-data">
              <img class="topic-thumb-preview" {{{if thumb}}}src="{thumb}"{{{end}}}></img>
              <div class="form-group">
                <label for="topic-thumb-url">[[topic:composer.thumb_url_label]]</label>
                <input type="text" id="topic-thumb-url" class="form-control" placeholder="[[topic:composer.thumb_url_placeholder]]" {{{if thumb}}}value="{thumb}"{{{end}}}/>
              </div>
              <div class="form-group">
                <label for="topic-thumb-file">[[topic:composer.thumb_file_label]]</label>
                <input type="file" id="topic-thumb-file" class="form-control" />
              </div>
              <div class="form-group topic-thumb-ctrl">
                <i class="fa fa-spinner fa-spin hide topic-thumb-spinner" title="[[topic:composer.uploading]]"></i>
                <i class="fa fa-times topic-thumb-btn hide topic-thumb-clear-btn" title="[[topic:composer.thumb_remove]]"></i>
              </div>
            </form>
          </div>
          <!-- ENDIF allowTopicsThumbnail -->

          <form id="fileForm" method="post" enctype="multipart/form-data">
            <!--[if gte IE 9]><!-->
              <input type="file" id="files" name="files[]" multiple class="gte-ie9 hide"/>
            <!--<![endif]-->
            <!--[if lt IE 9]>
              <input type="file" id="files" name="files[]" class="lt-ie9 hide" value="Upload"/>
            <![endif]-->
          </form>
        </ul>
      </div>
    </div>

    <div class="row write-preview-container">
      <div class="col-md-6 col-sm-12 write-container">
        <div class="help-text">
          [[modules:composer.compose]] <span class="help hidden"><i class="fa fa-question-circle"></i></span>
          <span class="toggle-preview hide">[[modules:composer.show_preview]]</span>
        </div>
        <textarea name="content" form="compose-form" class="write" tabindex="5" placeholder="[[modules:composer.textarea.placeholder]]"></textarea>
      </div>
      <div class="col-md-6 hidden-sm hidden-xs preview-container">
        <div class="help-text">
          <span class="toggle-preview">[[modules:composer.hide_preview]]</span>
        </div>
        <div class="preview well"></div>
      </div>
    </div>

    <!-- IF isTopicOrMain -->
    <div class="tag-row">
      <!-- IF isTopic -->
      <div class="col-md-6">
        <h4 class="col-md-2">Category:</h4>
        <div class="category-list-container col-md-4"></div>
      </div>
      <!-- ENDIF isTopic -->
      <div class="col-md-6">
        <h4 class="col-md-2">City:</h4>
        <div class="tags-container col-md-4">
          <div class="btn-group dropdown" component="composer/tag/dropdown" placeholder="Choose your city" >
            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" type="button" style="display:flex;">
              <input class="tags" type="text" class="form-control" placeholder="Choose your city" tabindex="5" style="width:auto;"/>
              <span class="visible-sm-inline visible-md-inline visible-lg-inline"><i class="fa fa-tags"></i></span>
              <span class="caret" style="margin-top: 15px;"></span>
            </button>

            <ul class="dropdown-menu">
              <!-- BEGIN tagWhitelist -->
              <li data-tag="" class="<!-- IF tagWhitelist.length -->hidden<!-- ENDIF tagWhitelist.length -->"><a>Choose a Category First</a></li>
              <li data-tag="{@value}"><a href="#">{@value}</a></li>
              <!-- END tagWhitelist -->
            </ul>
          </div>

        </div>
      </div>
    </div>

    <div class="btn-group pull-right action-bar">
      <a href="{discardRoute}" class="btn btn-default composer-discard" data-action="discard" tabindex="-1"><i class="fa fa-times"></i> [[topic:composer.discard]]</a>

      <button type="submit" form="compose-form" class="btn btn-primary composer-submit" data-action="post" tabindex="6"><i class="fa fa-check"></i> [[topic:composer.submit]]</button>
    </div>
    <!-- ENDIF isTopicOrMain -->


  </div>
</div>
