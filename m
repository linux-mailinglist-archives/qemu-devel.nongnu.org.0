Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779062FEC44
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 14:50:54 +0100 (CET)
Received: from localhost ([::1]:37442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2aML-0006Nk-M3
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 08:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2aK2-0005in-Ve
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:48:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2aK0-00047E-8p
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611236897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nwqo/nYznHttAiuDRgtWEU6qBSBMkdrfePaH0rvxN5E=;
 b=hpiD9zhCRVQmoGl1m5E2it+6KVSF9MF11invhgNlBluqkf0aQpvW4b86P5+1e+fGYO3ZQY
 z1oJYkUh+g7xGdZN/aORdbxeMi/gt641ZXdLeYOtcwmd3t9oap7iwTBust4mJdRf4bgduH
 FCSUBK+U9ufM8VN0RNVzsYK+8XgsiwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-is8ns-OIMFSsRqsRaXm2Qw-1; Thu, 21 Jan 2021 08:48:15 -0500
X-MC-Unique: is8ns-OIMFSsRqsRaXm2Qw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE31C1005504;
 Thu, 21 Jan 2021 13:48:14 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F1C360BF3;
 Thu, 21 Jan 2021 13:48:14 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] nsis: adjust for new MinGW paths
Date: Thu, 21 Jan 2021 08:48:13 -0500
Message-Id: <20210121134813.1002946-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Joshua Watt <jpewhacker@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu.nsi | 42 ++++--------------------------------------
 1 file changed, 4 insertions(+), 38 deletions(-)

diff --git a/qemu.nsi b/qemu.nsi
index 1a0112265b..c3df8c9d3b 100644
--- a/qemu.nsi
+++ b/qemu.nsi
@@ -35,11 +35,6 @@
 !define OUTFILE "qemu-setup.exe"
 !endif
 
-; Optionally install documentation.
-!ifndef CONFIG_DOCUMENTATION
-!define CONFIG_DOCUMENTATION
-!endif
-
 ; Use maximum compression.
 SetCompressor /SOLID lzma
 
@@ -116,26 +111,13 @@ Section "${PRODUCT} (required)"
     ; Set output path to the installation directory.
     SetOutPath "$INSTDIR"
 
-    File "${SRCDIR}\Changelog"
     File "${SRCDIR}\COPYING"
     File "${SRCDIR}\COPYING.LIB"
     File "${SRCDIR}\README.rst"
     File "${SRCDIR}\VERSION"
 
-    File "${BINDIR}\*.bmp"
-    File "${BINDIR}\*.bin"
-    File "${BINDIR}\*.dtb"
-    File "${BINDIR}\*.fd"
-    File "${BINDIR}\*.img"
-    File "${BINDIR}\*.lid"
-    File "${BINDIR}\*.ndrv"
-    File "${BINDIR}\*.rom"
-    File "${BINDIR}\openbios-*"
-
     File /r "${BINDIR}\keymaps"
-!ifdef CONFIG_GTK
     File /r "${BINDIR}\share"
-!endif
 
 !ifdef W64
     SetRegView 64
@@ -176,21 +158,11 @@ SectionEnd
 
 !ifdef CONFIG_DOCUMENTATION
 Section "Documentation" SectionDoc
-    SetOutPath "$INSTDIR"
-    File "${BINDIR}\index.html"
-    SetOutPath "$INSTDIR\interop"
-    FILE /r "${BINDIR}\interop\*.*"
-    SetOutPath "$INSTDIR\specs"
-    FILE /r "${BINDIR}\specs\*.*"
-    SetOutPath "$INSTDIR\system"
-    FILE /r "${BINDIR}\system\*.*"
-    SetOutPath "$INSTDIR\tools"
-    FILE /r "${BINDIR}\tools\*.*"
-    SetOutPath "$INSTDIR\user"
-    FILE /r "${BINDIR}\user\*.*"
+    SetOutPath "$INSTDIR\doc"
+    File /r "${BINDIR}\doc"
     SetOutPath "$INSTDIR"
     CreateDirectory "$SMPROGRAMS\${PRODUCT}"
-    CreateShortCut "$SMPROGRAMS\${PRODUCT}\User Documentation.lnk" "$INSTDIR\index.html" "" "$INSTDIR\index.html" 0
+    CreateShortCut "$SMPROGRAMS\${PRODUCT}\User Documentation.lnk" "$INSTDIR\doc\index.html" "" "$INSTDIR\doc\index.html" 0
 SectionEnd
 !endif
 
@@ -238,13 +210,7 @@ Section "Uninstall"
     Delete "$INSTDIR\qemu-io.exe"
     Delete "$INSTDIR\qemu.exe"
     Delete "$INSTDIR\qemu-system-*.exe"
-    Delete "$INSTDIR\index.html"
-    RMDir /r "$INSTDIR\interop"
-    RMDir /r "$INSTDIR\specs"
-    RMDir /r "$INSTDIR\system"
-    RMDir /r "$INSTDIR\tools"
-    RMDir /r "$INSTDIR\user"
-    RMDir /r "$INSTDIR\keymaps"
+    RMDir /r "$INSTDIR\doc"
     RMDir /r "$INSTDIR\share"
     ; Remove generated files
     Delete "$INSTDIR\stderr.txt"
-- 
2.26.2


