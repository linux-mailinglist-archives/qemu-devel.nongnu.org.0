Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8CD3B8728
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:37:03 +0200 (CEST)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lydCt-0007P2-8O
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyd94-0005JX-65
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyd8w-0000Kd-7S
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:33:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625070772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfEugb6DcQqvdzNLNiCiRlAcEDO5vSelAQwY9MmKOJY=;
 b=eOM33luNs6Vwfrq3o0RLCJkWv0Q4XtNj1Td6HLCGkRMKaMvhZ1gusCufSuAJXLdLXiwalV
 dQnjb05ivScxQ+clM7wSwwg1zrPpJmUbVdo2C8xaX2lxDf5eeE3E9oLzA7qYE7uWM+V5/8
 EXPgYEnuWPD/RBGYlCc9SC9PIjJCWao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-jYO14GitODaJkg9Qzxec2g-1; Wed, 30 Jun 2021 12:32:50 -0400
X-MC-Unique: jYO14GitODaJkg9Qzxec2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B3D1023F40
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 16:32:49 +0000 (UTC)
Received: from thuth.com (ovpn-113-129.ams2.redhat.com [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3102E5C1A3;
 Wed, 30 Jun 2021 16:32:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com
Subject: [PATCH 3/4] ui: Mark the '-no-quit' option as deprecated
Date: Wed, 30 Jun 2021 18:32:30 +0200
Message-Id: <20210630163231.467987-4-thuth@redhat.com>
In-Reply-To: <20210630163231.467987-1-thuth@redhat.com>
References: <20210630163231.467987-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's just a wrapper around the -display ...,window-close=off parameter,
and the name "no-quit" is rather confusing compared to "window-close"
(since there are still other means to quit the emulator), so we should
rather tell our users to use the "window-close" parameter instead.

While we're at it, update the documentation to state that
"-no-quit" is available for GTK, too, not only for SDL.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/deprecated.rst | 6 ++++++
 qemu-options.hx            | 5 +++--
 softmmu/vl.c               | 2 ++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index bb624d3170..70e08baff6 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -132,6 +132,12 @@ specified.
 Use ``-display sdl,window-close=...`` instead (i.e. with a minus instead of
 an underscore between "window" and "close").
 
+``-no-quit`` (since 6.1)
+''''''''''''''''''''''''
+
+The ``-no-quit`` is a synonym for ``-display ...,window-close=off`` which
+should be used instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index ae56fa4f28..c862f1fa57 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1910,10 +1910,11 @@ SRST
 ERST
 
 DEF("no-quit", 0, QEMU_OPTION_no_quit,
-    "-no-quit        disable SDL window close capability\n", QEMU_ARCH_ALL)
+    "-no-quit        disable SDL/GTK window close capability (deprecated)\n", QEMU_ARCH_ALL)
 SRST
 ``-no-quit``
-    Disable SDL window close capability.
+    Disable window close capability (SDL and GTK only). This option is
+    deprecated, please use ``-display ...,window-close=off`` instead.
 ERST
 
 DEF("sdl", 0, QEMU_OPTION_sdl,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 36b761677d..7dd2d72d0b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3237,6 +3237,8 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_no_quit:
                 dpy.has_window_close = true;
                 dpy.window_close = false;
+                warn_report("-no-quit is deprecated, please use "
+                            "-display ...,window-close=off instead.");
                 break;
             case QEMU_OPTION_sdl:
 #ifdef CONFIG_SDL
-- 
2.27.0


