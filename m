Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1601A57940F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:23:15 +0200 (CEST)
Received: from localhost ([::1]:34164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhZZ-0006Ut-VO
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHZ-0002li-NS
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHY-00030S-0V
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AWfRsO6UndV7SgVvUgwWHsCDhVxYFjHdmfkiLAFh6fY=;
 b=T00U/8/ekDObnblnYhC0GQAiOPB+Y6ioyuRZM2ToKD6UKq2T7hYG+hWByEOm7QaTH4/gHV
 OBzADtNvXrJV9IAV6f4UBMRbXG44cg4mxpFMOclg+xVL7ahll9HhmuHhKI3ce17/l3USMf
 AC419EpXX+KKVWst0YGt8hn28Zewgjs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-WZ4CqLvSPHygoECma5n5ZQ-1; Tue, 19 Jul 2022 03:04:20 -0400
X-MC-Unique: WZ4CqLvSPHygoECma5n5ZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1C15185A7BA;
 Tue, 19 Jul 2022 07:04:19 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 306B9404754B;
 Tue, 19 Jul 2022 07:04:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 06/14] tests/vm: remove ubuntu.i386 VM test
Date: Tue, 19 Jul 2022 09:04:04 +0200
Message-Id: <20220719070412.16757-7-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
References: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: John Snow <jsnow@redhat.com>

Ubuntu 18.04 is out of our support window, and Ubuntu 20.04 does not
support i386 anymore. The debian project does, but they do not provide
any cloud images for it, a new expect-style script would have to be
written.

Since we have i386 cross-compiler tests hosted on GitLab CI, we don't
need to support this VM test anymore.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220708153503.18864-7-jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/Makefile.include |  3 +--
 tests/vm/ubuntu.i386      | 40 ---------------------------------------
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100755 tests/vm/ubuntu.i386

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 5f5b1fbfe6..a94f0ebf7f 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -17,7 +17,7 @@ EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
 
 X86_IMAGES := freebsd netbsd openbsd centos fedora haiku.x86_64
 ifneq ($(GENISOIMAGE),)
-X86_IMAGES += ubuntu.i386 centos
+X86_IMAGES += centos
 ifneq ($(EFI_AARCH64),)
 ARM64_IMAGES += ubuntu.aarch64 centos.aarch64
 endif
@@ -48,7 +48,6 @@ vm-help vm-test:
 	@echo "  vm-build-fedora                 - Build QEMU in Fedora VM"
 ifneq ($(GENISOIMAGE),)
 	@echo "  vm-build-centos                 - Build QEMU in CentOS VM, with Docker"
-	@echo "  vm-build-ubuntu.i386            - Build QEMU in ubuntu i386 VM"
 ifneq ($(EFI_AARCH64),)
 	@echo "  vm-build-ubuntu.aarch64         - Build QEMU in ubuntu aarch64 VM"
 	@echo "  vm-build-centos.aarch64         - Build QEMU in CentOS aarch64 VM"
diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
deleted file mode 100755
index 47681b6f87..0000000000
--- a/tests/vm/ubuntu.i386
+++ /dev/null
@@ -1,40 +0,0 @@
-#!/usr/bin/env python3
-#
-# Ubuntu i386 image
-#
-# Copyright 2017 Red Hat Inc.
-#
-# Authors:
-#  Fam Zheng <famz@redhat.com>
-#
-# This code is licensed under the GPL version 2 or later.  See
-# the COPYING file in the top-level directory.
-#
-
-import sys
-import basevm
-import ubuntuvm
-
-DEFAULT_CONFIG = {
-    'install_cmds' : "apt-get update,"\
-                     "apt-get build-dep -y qemu,"\
-                     "apt-get install -y libfdt-dev language-pack-en ninja-build",
-}
-
-class UbuntuX86VM(ubuntuvm.UbuntuVM):
-    name = "ubuntu.i386"
-    arch = "i386"
-    image_link="https://cloud-images.ubuntu.com/releases/bionic/"\
-               "release-20191114/ubuntu-18.04-server-cloudimg-i386.img"
-    image_sha256="28969840626d1ea80bb249c08eef1a4533e8904aa51a327b40f37ac4b4ff04ef"
-    BUILD_SCRIPT = """
-        set -e;
-        cd $(mktemp -d);
-        sudo chmod a+r /dev/vdb;
-        tar -xf /dev/vdb;
-        ./configure {configure_opts};
-        make --output-sync {target} -j{jobs} {verbose};
-    """
-
-if __name__ == "__main__":
-    sys.exit(basevm.main(UbuntuX86VM, DEFAULT_CONFIG))
-- 
2.31.1


