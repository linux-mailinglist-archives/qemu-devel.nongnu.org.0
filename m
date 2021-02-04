Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C727430F15A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:00:46 +0100 (CET)
Received: from localhost ([::1]:45266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cNR-0007i2-OT
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:00:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cGc-0006Hi-V0
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:53:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l7cGb-0007fc-Aj
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zunxw6yF88ILKrQTkQaQG+MuxNlRhuf4zon9WKmeQZ4=;
 b=WfkAhLUNqswENFE3H1J4uyJKHzNFUROLb/EPM9QNgU4MW1PC2wt4L0X9aoCIfWyb/5mj/r
 uTpq1Km2jM5tNFDlJGtzmYjGev3nY5D+sqXJVV0uQULaVGDHqGWwdyVF/IiQL9vPiZKWRs
 dZrffVRCfQj/yRxmi3Dp/f4XatdHTnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-9WjAs6e0OB-F0BUJ_9aJ7w-1; Thu, 04 Feb 2021 05:53:38 -0500
X-MC-Unique: 9WjAs6e0OB-F0BUJ_9aJ7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12FDD8030BC
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 10:53:38 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A764777BF8;
 Thu,  4 Feb 2021 10:53:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/20] ui: remove extra #ifdef CONFIG_OPENGL
Date: Thu,  4 Feb 2021 14:52:17 +0400
Message-Id: <20210204105232.834642-6-marcandre.lureau@redhat.com>
In-Reply-To: <20210204105232.834642-1-marcandre.lureau@redhat.com>
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit 5cb69566daa8081abb82a13403dcc0fffed02007 ("gtk: remove
CONFIG_GTK_GL"), some #ifdef are redundants.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/gtk.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 26665cd2e6..e1ee0840b3 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -625,8 +625,6 @@ static const DisplayChangeListenerOps dcl_ops = {
 
 /** DisplayState Callbacks (opengl version) **/
 
-#if defined(CONFIG_OPENGL)
-
 static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_name             = "gtk-egl",
     .dpy_gfx_update       = gd_gl_area_update,
@@ -644,8 +642,6 @@ static const DisplayChangeListenerOps dcl_gl_area_ops = {
     .dpy_gl_update           = gd_gl_area_scanout_flush,
 };
 
-#endif /* CONFIG_OPENGL */
-
 static const DisplayChangeListenerOps dcl_egl_ops = {
     .dpy_name             = "gtk-egl",
     .dpy_gfx_update       = gd_egl_update,
@@ -1993,13 +1989,10 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
 
 #if defined(CONFIG_OPENGL)
     if (display_opengl) {
-#if defined(CONFIG_OPENGL)
         if (gtk_use_gl_area) {
             vc->gfx.drawing_area = gtk_gl_area_new();
             vc->gfx.dcl.ops = &dcl_gl_area_ops;
-        } else
-#endif /* CONFIG_OPENGL */
-        {
+        } else {
             vc->gfx.drawing_area = gtk_drawing_area_new();
             /*
              * gtk_widget_set_double_buffered() was deprecated in 3.14.
-- 
2.29.0


