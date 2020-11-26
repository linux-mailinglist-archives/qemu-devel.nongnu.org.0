Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175C32C5708
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 15:24:30 +0100 (CET)
Received: from localhost ([::1]:36548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiICD-0006CO-2q
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 09:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIAG-0004VW-QA
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIAD-0005n2-Rl
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606400545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoLew6fCJvQ4C8y1gmDHrdDLwCAMji/JWWXDSHwIdec=;
 b=Z/v07afBoz+hGKUq5G8qY1syEFTLn/QRvILj62ig6voHK63O15dSRljQgYpN+103KQA/F5
 ZTT2gTrjACz1TFK0qn3cb8fVnNGknjjsU5Bn1dlQcr3lUERClDPYKsQgTnpXzggo9gj4KP
 RD2t3y29R9zbvuCpYonUDEpnkI3zwnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-ITLUI4qlNymT8E8I7HRjAA-1; Thu, 26 Nov 2020 09:22:21 -0500
X-MC-Unique: ITLUI4qlNymT8E8I7HRjAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE5C5720C
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 14:22:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7949910013C0;
 Thu, 26 Nov 2020 14:22:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] tests/docker, tests/vm: remove setuptools from images
Date: Thu, 26 Nov 2020 09:22:17 -0500
Message-Id: <20201126142218.3121595-4-pbonzini@redhat.com>
In-Reply-To: <20201126142218.3121595-1-pbonzini@redhat.com>
References: <20201126142218.3121595-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setuptools is not needed anymore by the bundled copy of meson,
remove it.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .cirrus.yml                                        | 1 -
 tests/docker/dockerfiles/debian10.docker           | 1 -
 tests/docker/dockerfiles/fedora-win32-cross.docker | 1 -
 tests/docker/dockerfiles/fedora-win64-cross.docker | 1 -
 tests/vm/freebsd                                   | 1 -
 tests/vm/haiku.x86_64                              | 1 -
 tests/vm/netbsd                                    | 1 -
 tests/vm/openbsd                                   | 1 -
 8 files changed, 8 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index f0209b7a3e..2e45b3254f 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -85,7 +85,6 @@ windows_msys2_task:
         C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -S --needed \
           diffutils git grep make pkg-config sed \
           mingw-w64-x86_64-python \
-          mingw-w64-x86_64-python-setuptools \
           mingw-w64-x86_64-toolchain \
           mingw-w64-x86_64-SDL2 \
           mingw-w64-x86_64-SDL2_image \
diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 21cc671d71..73a3caac9c 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -30,7 +30,6 @@ RUN apt update && \
         pkg-config \
         psmisc \
         python3 \
-        python3-setuptools \
         python3-sphinx \
         $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
 
diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index 5903e1b0b4..087df598a0 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -30,7 +30,6 @@ ENV PACKAGES \
     perl-Test-Harness \
     python3 \
     python3-PyYAML \
-    python3-setuptools \
     tar \
     which
 
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 7f03cd8ffc..d5d2f5f00d 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -26,7 +26,6 @@ ENV PACKAGES \
     perl-Test-Harness \
     python3 \
     python3-PyYAML \
-    python3-setuptools \
     tar \
     which
 
diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 04ee793381..09f3ee6cb8 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -33,7 +33,6 @@ class FreeBSDVM(basevm.BaseVM):
         "pkgconf",
         "bzip2",
         "python37",
-        "py37-setuptools",
         "ninja",
 
         # gnu tools
diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
index 37af48bf1b..2eb736dae1 100755
--- a/tests/vm/haiku.x86_64
+++ b/tests/vm/haiku.x86_64
@@ -77,7 +77,6 @@ class HaikuVM(basevm.BaseVM):
         "devel:libusb_1.0",
         "devel:libz",
         "ninja",
-        "setuptools_python3"
     ]
 
     # https://dev.haiku-os.org/ticket/16512 virtio disk1 shows up as 0 (reversed order)
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 596717cc76..b9efc269d2 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -31,7 +31,6 @@ class NetBSDVM(basevm.BaseVM):
         "pkgconf",
         "xz",
         "python37",
-        "py37-setuptools",
         "ninja-build",
 
         # gnu tools
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 386b2c72f7..4d1399378e 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -30,7 +30,6 @@ class OpenBSDVM(basevm.BaseVM):
         "git",
         "pkgconf",
         "bzip2", "xz",
-        "py3-setuptools",
         "ninja",
 
         # gnu tools
-- 
2.26.2



