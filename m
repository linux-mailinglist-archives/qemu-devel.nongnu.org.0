Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEFE484C77
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 03:29:49 +0100 (CET)
Received: from localhost ([::1]:49866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4w3g-0000ja-RK
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 21:29:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1n4w2P-0008Sd-NQ
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:28:30 -0500
Received: from [2607:f938:3000:8::2] (port=14261 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1n4w2N-0006Bh-AG
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:28:29 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4JTD1F6Mj1z8PbN;
 Tue,  4 Jan 2022 21:28:17 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:subject:message-id:mime-version:content-type; s=default; bh=
 E/dFGlcBK4Vjz9RGJZckVo2lZJA=; b=dJK/gQMnfcPcDMX2SI54EuoRFhvt8Us3
 dUvavhkzv7Jv3JhmxAp81xXkTRHnnxg4zuboWrteO8lYvFvq0c+wZ3U7jyqo5qyU
 SwS5e5LqS9UeR8peMY7Kd3ShmL5XtqesQc9bAgEdoC3PqAhRZxAOrVJAg3LNBIU4
 GLCZiWTdWUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :subject:message-id:mime-version:content-type; q=dns; s=default; b=
 OAxSlnPvvqycieqPs9gbC0iI6kOfEtY9oIALpRIGKAtaMbxaJ2zbORIb5+oWeCTy
 eWdG+8X/RalYLcr932MpNh1MvR6uUJjR8vW8Gp+xSXeMT2imyrkX1IPpjuGlUvU9
 Q0r5dZhYyMEJjg7VlGQwEGkDgBzOky4PrQ9ckH8NEd8=
Received: from humpty.home.comstyle.com
 (bras-base-toroon2719w-grc-53-142-114-5-252.dsl.bell.ca [142.114.5.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4JTD1F5XG2z8PbK;
 Tue,  4 Jan 2022 21:28:17 -0500 (EST)
Date: Tue, 4 Jan 2022 21:28:16 -0500
From: Brad Smith <brad@comstyle.com>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>
Subject: [PATCH v2] FreeBSD: Upgrade to 12.3 release
Message-ID: <YdUCQLVe5JSWZByQ@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f938:3000:8::2
 (failed)
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Note, since libtasn1 was fixed in 12.3 [*], this commit re-enables GnuTLS.

[*] https://gitlab.com/gnutls/libtasn1/-/merge_requests/71


Signed-off-by: Brad Smith <brad@comstyle.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
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


