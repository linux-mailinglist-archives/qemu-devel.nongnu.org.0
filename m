Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4623CCE9D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 09:36:15 +0200 (CEST)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Np0-00015z-I3
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 03:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5Nk6-0006SL-TB
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:31:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m5Nk5-0004E1-7k
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 03:31:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626679868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IQ2fvuueDsfEfwuuh01iZ9dXabPOSM87MV2KSSpuSdo=;
 b=IO7j6xYI9gzT8yrwzi85Ywh8E3+hPt6ANcc5ouhMgs3hy7kZm7aT5y70kp7FYpBEca6U/B
 vFn08DIYNTRzFhU8S6BGwUsrG9HDjKeu42G2jmzHZCi8FfbRg7P7f63uBQr8TtX+8vVaem
 IC4yAN3AtznU3VKOq77hOHrb60pTPB4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-DwznBoe_Mb6DAjAHQaIAOA-1; Mon, 19 Jul 2021 03:31:05 -0400
X-MC-Unique: DwznBoe_Mb6DAjAHQaIAOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14C66100C664;
 Mon, 19 Jul 2021 07:31:04 +0000 (UTC)
Received: from thuth.com (ovpn-112-201.ams2.redhat.com [10.36.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69C4010016FE;
 Mon, 19 Jul 2021 07:30:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Remove the second superfluous macos task
Date: Mon, 19 Jul 2021 09:30:51 +0200
Message-Id: <20210719073051.1559348-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While there might have been bigger differnces between the -base and
the -xcode images in the beginning, they almost vanished in the
current builds, e.g. when comparing the output of the "configure"
step after cleaning up the differences due to temporary path names,
I only get:

$ diff -u /tmp/base.txt /tmp/xcode.txt
--- /tmp/base.txt	2021-07-16 09:16:24.211427940 +0200
+++ /tmp/xcode.txt	2021-07-16 09:16:43.029684274 +0200
@@ -19,14 +19,14 @@
 Build type: native build
 Project name: qemu
 Project version: 6.0.50
-C compiler for the host machine: cc (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.29)")
+C compiler for the host machine: cc (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.28)")
 C linker for the host machine: cc ld64 609.8
 Host machine cpu family: x86_64
 Host machine cpu: x86_64
 Program sh found: YES (/bin/sh)
 Program python3 found: YES (/usr/local/opt/python@3.9/bin/python3.9)
 Program bzip2 found: YES (/usr/bin/bzip2)
-C++ compiler for the host machine: c++ (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.29)")
+C++ compiler for the host machine: c++ (clang 12.0.0 "Apple clang version 12.0.0 (clang-1200.0.32.28)")
 C++ linker for the host machine: c++ ld64 609.8
 Objective-C compiler for the host machine: clang (clang 12.0.0)
 Objective-C linker for the host machine: clang ld64 609.8

Since we're not using Xcode itself at all, it seems like it does not
make much sense anymore to waste compute cycles with two images here.
Thus let's delete the -xcode job now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/cirrus.yml | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 60b13ed83f..675db69622 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -85,18 +85,3 @@ x64-macos-11-base-build:
     PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
     PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
     TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
-
-x64-macos-11-xcode-build:
-  extends: .cirrus_build_job
-  variables:
-    NAME: macos-11
-    CIRRUS_VM_INSTANCE_TYPE: osx_instance
-    CIRRUS_VM_IMAGE_SELECTOR: image
-    CIRRUS_VM_IMAGE_NAME: big-sur-xcode
-    CIRRUS_VM_CPUS: 12
-    CIRRUS_VM_RAM: 24G
-    UPDATE_COMMAND: brew update
-    INSTALL_COMMAND: brew install
-    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
-    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
-    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
-- 
2.27.0


