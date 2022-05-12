Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CD6524728
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 09:41:47 +0200 (CEST)
Received: from localhost ([::1]:52950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np3SD-0002mY-Pn
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 03:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np3QG-00026A-2j
 for qemu-devel@nongnu.org; Thu, 12 May 2022 03:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1np3QC-0006oa-Ut
 for qemu-devel@nongnu.org; Thu, 12 May 2022 03:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652341179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vtAKf39+u+3VE2xR6eWU0uGMQn4NGOyIfI+nc8Mccjg=;
 b=assPJjIDWEYugDPZdiq2N5GeP92PJQ9myXPIMS44S3g0Wo0qzlgiZV41o7fsV2RrZvUSw0
 /Mrpo5iqvmDc2TxJ93/TRFUI3F3aLZfdofPFkdSQJ4LS+iPIEGMYmoNblJls7Me9lD/2GI
 ZFS2bHHhStu3EjoxCXQ4rKrXupxMDtw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-yFNW-9kDOMi6zD-V0rUVcw-1; Thu, 12 May 2022 03:39:36 -0400
X-MC-Unique: yFNW-9kDOMi6zD-V0rUVcw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2393785A5A8;
 Thu, 12 May 2022 07:39:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4974D2026D6A;
 Thu, 12 May 2022 07:39:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>
Subject: [PATCH v2] docs/about: Update the support statement for Windows
Date: Thu, 12 May 2022 09:39:29 +0200
Message-Id: <20220512073929.988220-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our support statement for Windows currently talks about "Vista / Server
2008" - which is related to the API of Windows, and this is not easy
to understand for the non-technical users. Additionally, glib sets the
_WIN32_WINNT macro to 0x0601 already, which indicates the Windows 7 API,
so QEMU effectively depends on the Windows 7 API, too.

Thus let's bump the _WIN32_WINNT setting in QEMU to the same level as
glib uses and adjust our support statement in the documentation to
something similar that we're using for Linux and the *BSD systems
(i.e. only the two most recent versions), which should hopefully be
easier to understand for the users now.

And since we're nowadays also compile-testing QEMU with MSYS2 on Windows
itself, I think we could mention this build environment here, too.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/880
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Rephrase and update the _WIN32_WINNT macro, too

 docs/about/build-platforms.rst | 14 +++++++++-----
 include/qemu/osdep.h           |  2 +-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index e9163ba556..1958edb430 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -86,11 +86,15 @@ similar versions.
 Windows
 -------
 
-The project supports building with current versions of the MinGW toolchain,
-hosted on Linux (Debian/Fedora).
-
-The version of the Windows API that's currently targeted is Vista / Server
-2008.
+The project aims to support the two most recent versions of Windows that are
+still supported by the vendor. The minimum Windows API that is currently
+targeted is "Windows 7", so theoretically the QEMU binaries can still be run
+on older versions of Windows, too. However, such old versions of Windows are
+not tested anymore, so it is recommended to use one of the latest versions of
+Windows instead.
+
+The project supports building QEMU with current versions of the MinGW
+toolchain, either hosted on Linux (Debian/Fedora) or via MSYS2 on Windows.
 
 .. _Homebrew: https://brew.sh/
 .. _MacPorts: https://www.macports.org/
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 1c1e7eca98..e2f88597b6 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -75,7 +75,7 @@ QEMU_EXTERN_C int daemon(int, int);
 #ifdef _WIN32
 /* as defined in sdkddkver.h */
 #ifndef _WIN32_WINNT
-#define _WIN32_WINNT 0x0600 /* Vista */
+#define _WIN32_WINNT 0x0601 /* Windows 7 API */
 #endif
 /* reduces the number of implicitly included headers */
 #ifndef WIN32_LEAN_AND_MEAN
-- 
2.27.0


