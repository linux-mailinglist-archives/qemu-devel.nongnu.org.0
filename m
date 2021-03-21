Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0DE3433B6
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 18:26:10 +0100 (CET)
Received: from localhost ([::1]:51170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lO1q5-0004GB-Ti
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 13:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1j3-0007O1-I8
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lO1ix-0005Sc-T2
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 13:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616347126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qH9Y6qjjeiKVP2v7yOq1evrnjl8KGdPB1T+dq7N0qtM=;
 b=YZGHHsM7fnnwbL6dV+bLX8rkj9B6qd0tV6LnFh0dUDKn8ux6xcWEcQepF+ZjFjuelR05c/
 Kyv1Cup1ruM5YQfEQRhYmG5YJ0GEsVPDMMK/KVZRy0VC3MvxH95NIWLvguzTDTZ8TXd0uF
 asRfiwuZGMHl9FkuXQ/rJU6d7PQGEok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-iZIeqNhDNFWKs_7e6OzaKg-1; Sun, 21 Mar 2021 13:18:43 -0400
X-MC-Unique: iZIeqNhDNFWKs_7e6OzaKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54625801597;
 Sun, 21 Mar 2021 17:18:42 +0000 (UTC)
Received: from thuth.com (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E85E5D9CD;
 Sun, 21 Mar 2021 17:18:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/5] FreeBSD: Upgrade to 12.2 release
Date: Sun, 21 Mar 2021 18:18:33 +0100
Message-Id: <20210321171833.20736-6-thuth@redhat.com>
In-Reply-To: <20210321171833.20736-1-thuth@redhat.com>
References: <20210321171833.20736-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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


