Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FEB403A0F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:42:26 +0200 (CEST)
Received: from localhost ([::1]:55876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwuH-0008BP-PN
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgp-0008FI-H7
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNwgn-0003xJ-Ez
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631104107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zZAIy3/RpWmJPlt2xcxZsHVWDhYOajeB+lptwQJRS20=;
 b=H5UyNLLh0bVzalVM2egQrz/1jjYgcHpdlZIwiP74qupVgzm9E/7aQe17tmEdH62ZIQXuM/
 u3sH26KWasRGvEpAPAga69LG5FHV8p3P4j/7AonJx4Vd1E8qluH5A/QYYwM15h1GZclTLm
 wOJJyfFpaxmPEKITQUQmFGRCKS5bCn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-eiT7IQBKOzaxaxacVQfHMQ-1; Wed, 08 Sep 2021 08:28:25 -0400
X-MC-Unique: eiT7IQBKOzaxaxacVQfHMQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1A9D100C661
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 12:28:20 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7FC060C04;
 Wed,  8 Sep 2021 12:28:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH 2/6] Simplify copyright and integrate into footer
Date: Wed,  8 Sep 2021 13:28:10 +0100
Message-Id: <20210908122814.707744-3-berrange@redhat.com>
In-Reply-To: <20210908122814.707744-1-berrange@redhat.com>
References: <20210908122814.707744-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, CONTENT_AFTER_HTML=2.499,
 DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The copyright information is at the base of the page so logically part of
the page footer structure.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 _includes/copyright.html    |  8 --------
 _includes/footer.html       |  3 +++
 _layouts/blog.html          |  1 -
 _layouts/home.html          |  1 -
 _layouts/page.html          |  1 -
 assets/css/style-mobile.css |  2 +-
 assets/css/style.css        | 28 ++++++++++++----------------
 7 files changed, 16 insertions(+), 28 deletions(-)
 delete mode 100644 _includes/copyright.html

diff --git a/_includes/copyright.html b/_includes/copyright.html
deleted file mode 100644
index cdcd98f..0000000
--- a/_includes/copyright.html
+++ /dev/null
@@ -1,8 +0,0 @@
-<div id="copyright">
-	<div id="copyright-inner">
-	  <div class="container">
-	    This site is made available under the terms of
-	    <a href="{{ relative_root }}/license.html">a number of licenses</a>.
-	  </div>
-	</div>
-</div>
diff --git a/_includes/footer.html b/_includes/footer.html
index b614795..6e1b247 100644
--- a/_includes/footer.html
+++ b/_includes/footer.html
@@ -27,4 +27,7 @@
 			<li><a href="https://xenproject.org">Xen</a></li>
 		</ul>
 	</div>
+	<div id="licenses">
+		<a href="{{ relative_root }}/license.html">Website licenses</a>
+	</div>
 </div>
diff --git a/_layouts/blog.html b/_layouts/blog.html
index b300636..b7fcdbf 100644
--- a/_layouts/blog.html
+++ b/_layouts/blog.html
@@ -21,7 +21,6 @@ Released for free under the Creative Commons Attribution 3.0 license (templated.
 	
 	{% include sidebar.html %}
 	{% include footer.html %}
-	{% include copyright.html %}
 
 </body>
 </html>
diff --git a/_layouts/home.html b/_layouts/home.html
index d94c9b0..f7b6931 100644
--- a/_layouts/home.html
+++ b/_layouts/home.html
@@ -18,7 +18,6 @@ Released for free under the Creative Commons Attribution 3.0 license (templated.
 	{{ content }}
 
 	{% include footer.html %}
-	{% include copyright.html %}
 
 </body>
 </html>
diff --git a/_layouts/page.html b/_layouts/page.html
index d650054..765d204 100644
--- a/_layouts/page.html
+++ b/_layouts/page.html
@@ -23,7 +23,6 @@ Released for free under the Creative Commons Attribution 3.0 license (templated.
 	</div>
 	
 	{% include footer.html %}
-	{% include copyright.html %}
 
 </body>
 </html>
diff --git a/assets/css/style-mobile.css b/assets/css/style-mobile.css
index 1bae7a2..213a3fb 100644
--- a/assets/css/style-mobile.css
+++ b/assets/css/style-mobile.css
@@ -242,7 +242,7 @@
 /* Columns                                                                       */
 /*********************************************************************************/
 
-	#main, #footer-inner, #copyright-inner
+	#main, #footer-inner
 	{
 		margin-left: 0%;
 		width: 100%;
diff --git a/assets/css/style.css b/assets/css/style.css
index bed0bf4..9daa18b 100644
--- a/assets/css/style.css
+++ b/assets/css/style.css
@@ -428,7 +428,7 @@
 /* Columns                                                                       */
 /*********************************************************************************/
 
-	#main, #copyright-inner
+	#main
 	{
 		margin-left: 16.667%;
 		width: 66.667%;
@@ -525,23 +525,19 @@
 		margin: 0
 	}
 
-/*********************************************************************************/
-/* Copyright                                                                     */
-/*********************************************************************************/
-
-	#copyright
-	{
-		clear: left;
-		border-top: 1px solid #aaaaaa;
-		position: relative;
-		color: #aaaaaa;
-		background: #ffffff;
-		padding: 1em 0em;
+	#licenses {
+		padding: 0em;
+		padding-left: 1em;
+		padding-right: 1em;
+		font-size: smaller;
+		color: #401200;
+		background: #fff;
+		margin: 1em;
+		margin-top: 2em;
 	}
 
-	#copyright a
-	{
-		color: inherit;
+	#licenses {
+		float: right;
 	}
 
 /*********************************************************************************/
-- 
2.31.1


