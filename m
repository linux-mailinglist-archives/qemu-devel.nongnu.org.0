Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2032D612E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:07:33 +0100 (CET)
Received: from localhost ([::1]:49634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOTc-000519-8H
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOLz-0000PF-2Z
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:59:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knOLw-0005Gl-EU
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:59:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607615975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weNXQ0RWPOEHPasc6pLJLQD8ca1ncaYoxY+OugjHfuY=;
 b=DnDUOiVVGJl4CgE22zNVOphT0kK5QP4o5XcNNHMrUN2VA62Z2CNvNeRLQ2T0YUXKYTD/wM
 u9LDgIpg03ajMWgr0XOhgJeJFp9Od72ishSt61J8YNCYzDWWcCXcCEaQsqJBuaxgB12mBs
 SpE8FZFxOqgYiO+5EMVO3LV3MkHeq7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-gyMAbwyoPOmgu3yRxzGgMg-1; Thu, 10 Dec 2020 10:59:33 -0500
X-MC-Unique: gyMAbwyoPOmgu3yRxzGgMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4267100E34F
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 15:59:05 +0000 (UTC)
Received: from thuth.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1DD270862;
 Thu, 10 Dec 2020 15:58:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 4/4] Remove the deprecated -show-cursor option
Date: Thu, 10 Dec 2020 16:58:08 +0100
Message-Id: <20201210155808.233895-5-thuth@redhat.com>
In-Reply-To: <20201210155808.233895-1-thuth@redhat.com>
References: <20201210155808.233895-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 kraxel@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It has been marked as deprecated since QEMU v5.0, replaced by the
corresponding parameter of the -display option.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/deprecated.rst       | 6 ------
 docs/system/removed-features.rst | 6 ++++++
 qemu-options.hx                  | 7 -------
 softmmu/vl.c                     | 8 --------
 4 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 307b83ea60..2ea7ec812d 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -94,12 +94,6 @@ QEMU 5.1 has three options:
       to the user to load all the images they need.
  3. ``-bios <file>`` - Tells QEMU to load the specified file as the firmwrae.
 
-``-show-cursor`` option (since 5.0)
-'''''''''''''''''''''''''''''''''''
-
-Use ``-display sdl,show-cursor=on`` or
- ``-display gtk,show-cursor=on`` instead.
-
 ``Configuring floppies with ``-global``
 '''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 63046d5c24..89c45f23f8 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -26,6 +26,12 @@ The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
 The ``-realtime mlock=on|off`` argument has been replaced by the
 ``-overcommit mem-lock=on|off`` argument.
 
+``-show-cursor`` option (since 5.0)
+'''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,show-cursor=on``, ``-display gtk,show-cursor=on``
+or ``-display default,show-cursor=on`` instead.
+
 ``-tb-size`` option (removed in 6.0)
 '''''''''''''''''''''''''''''''
 
diff --git a/qemu-options.hx b/qemu-options.hx
index 79a4c35b49..daa6bc2eda 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4061,13 +4061,6 @@ SRST
 
 ERST
 
-DEF("show-cursor", 0, QEMU_OPTION_show_cursor, \
-    "-show-cursor    show cursor\n", QEMU_ARCH_ALL)
-SRST
-``-show-cursor``
-    Show cursor.
-ERST
-
 DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
     "-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]\n" \
     "-incoming rdma:host:port[,ipv4][,ipv6]\n" \
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 9f4c228c0e..1d6d144442 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3557,14 +3557,6 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_no_shutdown:
                 no_shutdown = 1;
                 break;
-            case QEMU_OPTION_show_cursor:
-                warn_report("The -show-cursor option is deprecated. Please "
-                            "add show-cursor=on to your -display options.");
-                warn_report("When using the default display you can use "
-                            "-display default,show-cursor=on");
-                dpy.has_show_cursor = true;
-                dpy.show_cursor = true;
-                break;
             case QEMU_OPTION_uuid:
                 if (qemu_uuid_parse(optarg, &qemu_uuid) < 0) {
                     error_report("failed to parse UUID string: wrong format");
-- 
2.27.0


