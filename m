Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3733B7FE4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 11:22:45 +0200 (CEST)
Received: from localhost ([::1]:58166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyWQe-0006Vv-AT
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 05:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyWPe-0005Rl-US
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:21:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyWPc-0002be-Ny
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625044899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vnfOc4woXbtZXryhK0Lfex7mGigtpR4XicVR0usVFQ0=;
 b=arNWjV38nGCXIJPlOqeCjOuox3e3UExweveL0lSq3rgJqOnVA6oIDswOW4myqk5IR9Hqdm
 s3GTo4IraOZI73DSjLlOICkrNvtRJUHhz1zdaIe9SGMEJI744gldKJglp/seaNcSnAL38x
 nFy+rzV/C7/Aw5p5o8/qu+vlBAfRUjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-H9jt9H4iNUCVY6Mjj4kCrQ-1; Wed, 30 Jun 2021 05:21:38 -0400
X-MC-Unique: H9jt9H4iNUCVY6Mjj4kCrQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BB6E362FC
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 09:21:37 +0000 (UTC)
Received: from thuth.com (ovpn-113-129.ams2.redhat.com [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A58060C13;
 Wed, 30 Jun 2021 09:21:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com
Subject: [PATCH] ui: Mark the '-no-quit' option as deprecated
Date: Wed, 30 Jun 2021 11:21:27 +0200
Message-Id: <20210630092127.374720-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's just a cumbersome wrapper around the -display ...,window_close=off
parameter, so we should rather tell our users to use that instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/deprecated.rst | 6 ++++++
 qemu-options.hx            | 5 +++--
 softmmu/vl.c               | 2 ++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e2e0090878..c76da98761 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -126,6 +126,12 @@ other options have been processed.  This will either have no effect (if
 if they were not given.  The property is therefore useless and should not be
 specified.
 
+``-no-quit`` (since 6.1.0)
+''''''''''''''''''''''''''
+
+The ``-no-quit`` is a synonym for ``-display ...,window_close=off`` which
+should be used instead.
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index ba3ca9da1d..9fdd823c1b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1910,10 +1910,11 @@ SRST
 ERST
 
 DEF("no-quit", 0, QEMU_OPTION_no_quit,
-    "-no-quit        disable SDL window close capability\n", QEMU_ARCH_ALL)
+    "-no-quit        disable SDL window close capability (deprecated)\n", QEMU_ARCH_ALL)
 SRST
 ``-no-quit``
-    Disable SDL window close capability.
+    Disable SDL window close capability. This option is deprecated, please
+    use ``-display ...,window_close=off`` instead.
 ERST
 
 DEF("sdl", 0, QEMU_OPTION_sdl,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index cee6339580..3f79b9c8a3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3232,6 +3232,8 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_no_quit:
                 dpy.has_window_close = true;
                 dpy.window_close = false;
+                warn_report("-no-quit is deprecated, please use "
+                            "-display ...,window_close=off instead.");
                 break;
             case QEMU_OPTION_sdl:
 #ifdef CONFIG_SDL
-- 
2.27.0


