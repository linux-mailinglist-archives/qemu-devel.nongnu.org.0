Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3C954E36B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:30:27 +0200 (CEST)
Received: from localhost ([::1]:41646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qVu-00021k-Lp
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1qSl-0007Bp-30
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:27:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1qSj-0008Ko-3x
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655389628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=agRPGQFE77PZQEzTEM+AlrV0u0HxB3OOHAHNOat9e0k=;
 b=FMHOr9hAW/vWue9eZUCixtTKj0mlb2c80rE79FB1CJ1ZZ948lsE/pZezFv++IQYHWWWjWX
 B2OlaVvfJ+/+xv5dc5mIizQYPKYMJ9+DA1egqHsMQdlcaQ3vNt8gpGGx8Ib17RWJEvqvw7
 dki39DBSjTofTraX7XUqJaPW5lXDxac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-mEBvJdhIOWKEaLPDVYh7Ag-1; Thu, 16 Jun 2022 10:27:05 -0400
X-MC-Unique: mEBvJdhIOWKEaLPDVYh7Ag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC70785A584;
 Thu, 16 Jun 2022 14:27:04 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7090D2027EB4;
 Thu, 16 Jun 2022 14:27:04 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 08/10] tests/vm: remove ubuntu.i386 VM test
Date: Thu, 16 Jun 2022 10:26:57 -0400
Message-Id: <20220616142659.3184115-9-jsnow@redhat.com>
In-Reply-To: <20220616142659.3184115-1-jsnow@redhat.com>
References: <20220616142659.3184115-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

Ubuntu 18.04 is out of our support window, and Ubuntu 20.04 does not
support i386 anymore. The debian project does, but they do not provide
any cloud images for it, a new expect-style script would have to be
written.

Since we have i386 cross-compiler tests hosted on GitLab CI, we don't
need to support this VM test anymore.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/vm/Makefile.include |  3 +--
 tests/vm/ubuntu.i386      | 40 ---------------------------------------
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100755 tests/vm/ubuntu.i386

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 588bc999cc9..70eee2510c6 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -8,7 +8,7 @@ EFI_AARCH64 = $(wildcard $(BUILD_DIR)/pc-bios/edk2-aarch64-code.fd)
 
 X86_IMAGES := freebsd netbsd openbsd centos fedora haiku.x86_64
 ifneq ($(GENISOIMAGE),)
-X86_IMAGES += ubuntu.i386 centos
+X86_IMAGES += centos
 ifneq ($(EFI_AARCH64),)
 ARM64_IMAGES += ubuntu.aarch64 centos.aarch64
 endif
@@ -39,7 +39,6 @@ vm-help vm-test:
 	@echo "  vm-build-fedora                 - Build QEMU in Fedora VM"
 ifneq ($(GENISOIMAGE),)
 	@echo "  vm-build-centos                 - Build QEMU in CentOS VM, with Docker"
-	@echo "  vm-build-ubuntu.i386            - Build QEMU in ubuntu i386 VM"
 ifneq ($(EFI_AARCH64),)
 	@echo "  vm-build-ubuntu.aarch64         - Build QEMU in ubuntu aarch64 VM"
 	@echo "  vm-build-centos.aarch64         - Build QEMU in CentOS aarch64 VM"
diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
deleted file mode 100755
index 47681b6f87d..00000000000
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
2.34.3


