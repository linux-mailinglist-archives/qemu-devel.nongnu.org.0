Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063F5646973
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 07:53:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Alx-0002Dl-Lp; Thu, 08 Dec 2022 01:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1p3Alt-0002DK-97
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:52:41 -0500
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1p3Alr-0005eT-Im
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 01:52:41 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4NSPwR2PKGz8Pbg;
 Thu,  8 Dec 2022 01:52:23 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=date:from
 :to:cc:subject:message-id:mime-version:content-type; s=default;
 bh=7S02naQfsB9gP35dpj8i0WnxeAY=; b=Y5peqRjwqRKA+j6G4PNG1Uf9Ftin
 J97FBXgmLCLACOteuQsmfix559bBPn3YPqRmVt/ghpPjLjmFKu1eBbMfLIGN7tGJ
 hiGEEDip7m9O4w/SM0jdxiRuiPPkkMIzPyax5ranOmQs83JnzejuzfOly2iDwv0b
 Ngu4br6K+wNmOEE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; q=dns; s=
 default; b=qZ32ByE/zfYGEQmwgXIUKsCjUHMnImD/n6W4gaG1NRmkABsIFY0ce
 eaigwQY9nAXyYSWUzeWue9w9gkCNbviBRyQxJb0jOg1NUs2k1xDxtMmZ+p5c1w6y
 uO2cNIwIXBKNvANX1+fzHX+ZTPOJdV9Gs6Q6SL9MLQ593YuDEtbvw0=
Received: from humpty.home.comstyle.com (unknown
 [IPv6:2001:470:b050:3:fcec:2e52:65b1:3de8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4NSPwR1H6Gz8Pbd;
 Thu,  8 Dec 2022 01:52:23 -0500 (EST)
Date: Thu, 8 Dec 2022 01:52:21 -0500
From: Brad Smith <brad@comstyle.com>
To: Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] FreeBSD: Upgrade to 12.4 release
Message-ID: <Y5GJpW/1s+NEah98@humpty.home.comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

FreeBSD: Upgrade to 12.4 release

Signed-off-by: Brad Smith <brad@comstyle.com>
---
 .gitlab-ci.d/cirrus.yml | 2 +-
 tests/vm/freebsd        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 634a73a742..785b163aa6 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -50,7 +50,7 @@ x64-freebsd-12-build:
     NAME: freebsd-12
     CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
     CIRRUS_VM_IMAGE_SELECTOR: image_family
-    CIRRUS_VM_IMAGE_NAME: freebsd-12-3
+    CIRRUS_VM_IMAGE_NAME: freebsd-12-4
     CIRRUS_VM_CPUS: 8
     CIRRUS_VM_RAM: 8G
     UPDATE_COMMAND: pkg update
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index d6ff4461ba..ba2ba23d24 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -28,8 +28,8 @@ class FreeBSDVM(basevm.BaseVM):
     name = "freebsd"
     arch = "x86_64"
 
-    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.3/FreeBSD-12.3-RELEASE-amd64-disc1.iso.xz"
-    csum = "36dd0de50f1fe5f0a88e181e94657656de26fb64254412f74e80e128e8b938b4"
+    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.4/FreeBSD-12.4-RELEASE-amd64-disc1.iso.xz"
+    csum = "1dcf6446e31bf3f81b582e9aba3319a258c29a937a2af6138ee4b181ed719a87"
     size = "20G"
     pkgs = [
         # build tools
-- 
2.38.1


