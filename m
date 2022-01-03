Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9623C483811
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 21:47:32 +0100 (CET)
Received: from localhost ([::1]:34680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4UEt-0002TT-5O
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 15:47:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1n4UDY-00016c-NM
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:46:08 -0500
Received: from [2607:f938:3000:8::2] (port=27936 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1n4UDV-0000y4-E5
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 15:46:08 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4JSSSh40KWz8PbN;
 Mon,  3 Jan 2022 15:45:56 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:subject:message-id:mime-version:content-type; s=default; bh=
 t/YjoNj5hS4ooNuYRiw6hFTJIRM=; b=PvacxyPT+X2QcAFH3uAktL+enHqhf4v4
 gU5pJi6dM6mOwoRuJn4HyIHsxrkFcrSRqDuym9cPzRfSBgts1iGAEXjntwszXhyo
 sk+vNtlNNK7511JWaC6OOjw/ILQlXfH/VGPLeMNEF4oDksaL2WlQHiJ/4utLNvlu
 kn7f80DCnxI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :subject:message-id:mime-version:content-type; q=dns; s=default; b=
 AggxNwIsKxcGIHW2MH8IfBY7BIvWDBFTbpPVriw+R/e5urJG3F6wUWMnmBamlzI0
 Uia41JxYUqcLam0BrK/Y7MyvfPcWkr6d69asZGQXAT4Odaf9jEN2/m5vlaOBDowl
 lSIaD1nEjYZTYXRBJ4H86iNGfGbFcHTO2V8TPGUME5M=
Received: from humpty.home.comstyle.com
 (bras-base-toroon2719w-grc-53-142-114-5-252.dsl.bell.ca [142.114.5.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4JSSSh1vy9z8PbK;
 Mon,  3 Jan 2022 15:45:56 -0500 (EST)
Date: Mon, 3 Jan 2022 15:45:55 -0500
From: Brad Smith <brad@comstyle.com>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 WainerdosSantosMoschetta@humpty.home.comstyle.com,
 Beraldo Leal <bleal@redhat.com>, Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>
Subject: [PATCH] FreeBSD: Upgrade to 12.3 release
Message-ID: <YdNgg/FI6LdYmDJ5@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f938:3000:8::2
 (failed)
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

FreeBSD: Upgrade to 12.3 release

Signed-off-by: Brad Smith <brad@comstyle.com>
Tested-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/cirrus.yml | 5 +----
 tests/vm/freebsd        | 8 +++-----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index d273a9e713..18ded37c77 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -52,14 +52,11 @@ x64-freebsd-12-build:
     NAME: freebsd-12
     CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
     CIRRUS_VM_IMAGE_SELECTOR: image_family
-    CIRRUS_VM_IMAGE_NAME: freebsd-12-2
+    CIRRUS_VM_IMAGE_NAME: freebsd-12-3
     CIRRUS_VM_CPUS: 8
     CIRRUS_VM_RAM: 8G
     UPDATE_COMMAND: pkg update
     INSTALL_COMMAND: pkg install -y
-    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
-    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
-    CONFIGURE_ARGS: --disable-gnutls
     TEST_TARGETS: check
 
 x64-freebsd-13-build:
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 6e20e84322..805db759d6 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):
     name = "freebsd"
     arch = "x86_64"
 
-    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz"
-    csum = "a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd070278cbdf63f3a6f803ecae"
+    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz"
+    csum = "36dd0de50f1fe5f0a88e181e94657656de26fb64254412f74e80e128e8b938b4"
     size = "20G"
     pkgs = [
         # build tools
@@ -65,8 +65,6 @@ class FreeBSDVM(basevm.BaseVM):
         "zstd",
     ]
 
-    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
-    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
     BUILD_SCRIPT = """
         set -e;
         rm -rf /home/qemu/qemu-test.*
@@ -74,7 +72,7 @@ class FreeBSDVM(basevm.BaseVM):
         mkdir src build; cd src;
         tar -xf /dev/vtbd1;
         cd ../build
-        ../src/configure --python=python3.7 --disable-gnutls {configure_opts};
+        ../src/configure --python=python3.7 {configure_opts};
         gmake --output-sync -j{jobs} {target} {verbose};
     """
 
-- 
2.34.1


