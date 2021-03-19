Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003EF34227D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 17:53:47 +0100 (CET)
Received: from localhost ([::1]:49340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNINe-0003mj-Is
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 12:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNIM0-0003K1-O7
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 12:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNILw-0006K2-RU
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 12:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616172718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qH9Y6qjjeiKVP2v7yOq1evrnjl8KGdPB1T+dq7N0qtM=;
 b=OfNPGoH2Zm3xmOwsdsjhqK19LSwgnW5pc+by0i2TVvXJMzq0CmV9Odp1+g2pQoBroBMpGX
 PjxcdyX+qUtmnkBKnwUgkZ+vFT7PDBYBKTuCrKKgZWGv+4m7ZTJx+IdutHW+9eLTuhGdv9
 m4O8Rcd+yC/2gTz2Rqs7wzv17QtQSUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-goOTj4NBP66CU3SljbGiVw-1; Fri, 19 Mar 2021 12:51:54 -0400
X-MC-Unique: goOTj4NBP66CU3SljbGiVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64B12A40C2;
 Fri, 19 Mar 2021 16:51:53 +0000 (UTC)
Received: from thuth.com (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5913B610F3;
 Fri, 19 Mar 2021 16:51:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] FreeBSD: Upgrade to 12.2 release
Date: Fri, 19 Mar 2021 17:51:38 +0100
Message-Id: <20210319165138.117225-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Ed Maste <emaste@freebsd.org>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD's
project's packages will work.  Update which timezone to pick. Work around a QEMU
bug that incorrectly raises an exception on a CRC32 instruction with the FPU
disabled.  The qemu bug is described here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html

Signed-off-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20210307155654.993-2-imp@bsdimp.com>
[thuth: Disable gnutls to work-around a problem with libtasn1]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/freebsd | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 09f3ee6cb8..6e20e84322 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -20,12 +20,16 @@ import socket
 import subprocess
 import basevm
 
+FREEBSD_CONFIG = {
+    'cpu'	: "max,sse4.2=off",
+}
+
 class FreeBSDVM(basevm.BaseVM):
     name = "freebsd"
     arch = "x86_64"
 
-    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.1/FreeBSD-12.1-RELEASE-amd64-disc1.iso.xz"
-    csum = "7394c3f60a1e236e7bd3a05809cf43ae39a3b8e5d42d782004cf2f26b1cfcd88"
+    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz"
+    csum = "a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd070278cbdf63f3a6f803ecae"
     size = "20G"
     pkgs = [
         # build tools
@@ -61,6 +65,8 @@ class FreeBSDVM(basevm.BaseVM):
         "zstd",
     ]
 
+    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
+    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
     BUILD_SCRIPT = """
         set -e;
         rm -rf /home/qemu/qemu-test.*
@@ -68,7 +74,7 @@ class FreeBSDVM(basevm.BaseVM):
         mkdir src build; cd src;
         tar -xf /dev/vtbd1;
         cd ../build
-        ../src/configure --python=python3.7 {configure_opts};
+        ../src/configure --python=python3.7 --disable-gnutls {configure_opts};
         gmake --output-sync -j{jobs} {target} {verbose};
     """
 
@@ -125,7 +131,7 @@ class FreeBSDVM(basevm.BaseVM):
         self.console_wait_send("IPv6",                  "n")
         self.console_wait_send("Resolver",              "\n")
 
-        self.console_wait_send("Time Zone Selector",    "a\n")
+        self.console_wait_send("Time Zone Selector",    "0\n")
         self.console_wait_send("Confirmation",          "y")
         self.console_wait_send("Time & Date",           "\n")
         self.console_wait_send("Time & Date",           "\n")
@@ -206,4 +212,4 @@ class FreeBSDVM(basevm.BaseVM):
         self.print_step("All done")
 
 if __name__ == "__main__":
-    sys.exit(basevm.main(FreeBSDVM))
+    sys.exit(basevm.main(FreeBSDVM, config=FREEBSD_CONFIG))
-- 
2.27.0


