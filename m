Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD14B47541E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 09:11:23 +0100 (CET)
Received: from localhost ([::1]:44864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxPNi-0000Wh-US
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 03:11:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOoN-0003l1-Ly
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOoL-0004Lq-Ix
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43FWb8ukFsXtSZ24yJlu0uB+a8+g/zBW1ii5q4Ou9r4=;
 b=CrUBTrQWzgoeNQTCYq1C4C/DRTll7DHDO1HRgmmBz5mH4ESBemMCpbIrQM1TQeh0A3uCdH
 eJpEnfvw7w3rv+MfTxVsWRP8cTUjrKKRBulKX9+zwWSmDugAHgzQC++5Sh9scSPeHLVL/E
 QdDRyIlmlVJbHB7ZYUY/oW3NtKVbjSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-F7e-Qj5NOGu0HftoaQ_yWw-1; Wed, 15 Dec 2021 02:34:31 -0500
X-MC-Unique: F7e-Qj5NOGu0HftoaQ_yWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 196D1801AAB;
 Wed, 15 Dec 2021 07:34:30 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B3E91092790;
 Wed, 15 Dec 2021 07:34:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/16] gitlab-ci: Test compilation on Windows with MSYS2
Date: Wed, 15 Dec 2021 08:34:02 +0100
Message-Id: <20211215073402.144286-17-thuth@redhat.com>
In-Reply-To: <20211215073402.144286-1-thuth@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Gitlab also provides runners with Windows, we can use them to
test compilation with MSYS2, in both, 64-bit and 32-bit.

However, it takes quite a long time to set up the VM, so to stay
in a reasonable time frame, we can only compile and check one
target here.

Message-Id: <20211115140623.104116-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/qemu-project.yml |  1 +
 .gitlab-ci.d/windows.yml      | 98 +++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 .gitlab-ci.d/windows.yml

diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index b3d79bc429..871262fe0e 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -11,3 +11,4 @@ include:
   - local: '/.gitlab-ci.d/static_checks.yml'
   - local: '/.gitlab-ci.d/custom-runners.yml'
   - local: '/.gitlab-ci.d/cirrus.yml'
+  - local: '/.gitlab-ci.d/windows.yml'
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
new file mode 100644
index 0000000000..309f7e7fb8
--- /dev/null
+++ b/.gitlab-ci.d/windows.yml
@@ -0,0 +1,98 @@
+.shared_msys2_builder:
+  tags:
+  - shared-windows
+  - windows
+  - windows-1809
+  cache:
+    key: "${CI_JOB_NAME}-cache"
+    paths:
+      - ${CI_PROJECT_DIR}/msys64/var/cache
+  needs: []
+  stage: build
+  timeout: 70m
+  before_script:
+  - If ( !(Test-Path -Path msys64\var\cache ) ) {
+      mkdir msys64\var\cache
+    }
+  - If ( !(Test-Path -Path msys64\var\cache\msys2.exe ) ) {
+      Invoke-WebRequest
+      "https://github.com/msys2/msys2-installer/releases/download/2021-07-25/msys2-base-x86_64-20210725.sfx.exe"
+      -outfile "msys64\var\cache\msys2.exe"
+    }
+  - msys64\var\cache\msys2.exe -y
+  - ((Get-Content -path .\msys64\etc\\post-install\\07-pacman-key.post -Raw)
+      -replace '--refresh-keys', '--version') |
+     Set-Content -Path ${CI_PROJECT_DIR}\msys64\etc\\post-install\\07-pacman-key.post
+  - .\msys64\usr\bin\bash -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"
+  - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Core update
+  - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Normal update
+  - taskkill /F /FI "MODULES eq msys-2.0.dll"
+
+msys2-64bit:
+  extends: .shared_msys2_builder
+  script:
+  - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
+      diffutils git grep make sed
+      mingw-w64-x86_64-capstone
+      mingw-w64-x86_64-curl
+      mingw-w64-x86_64-cyrus-sasl
+      mingw-w64-x86_64-gcc
+      mingw-w64-x86_64-glib2
+      mingw-w64-x86_64-gnutls
+      mingw-w64-x86_64-libnfs
+      mingw-w64-x86_64-libpng
+      mingw-w64-x86_64-libssh
+      mingw-w64-x86_64-libtasn1
+      mingw-w64-x86_64-libusb
+      mingw-w64-x86_64-libxml2
+      mingw-w64-x86_64-nettle
+      mingw-w64-x86_64-ninja
+      mingw-w64-x86_64-pixman
+      mingw-w64-x86_64-pkgconf
+      mingw-w64-x86_64-python
+      mingw-w64-x86_64-SDL2
+      mingw-w64-x86_64-SDL2_image
+      mingw-w64-x86_64-snappy
+      mingw-w64-x86_64-usbredir
+      mingw-w64-x86_64-zstd "
+  - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
+  - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
+  - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
+      --enable-capstone=system'
+  - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=/d' build/config-host.mak"
+  - .\msys64\usr\bin\bash -lc 'make -j2'
+  - .\msys64\usr\bin\bash -lc 'make check'
+
+msys2-32bit:
+  extends: .shared_msys2_builder
+  script:
+  - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
+      diffutils git grep make sed
+      mingw-w64-i686-capstone
+      mingw-w64-i686-curl
+      mingw-w64-i686-cyrus-sasl
+      mingw-w64-i686-gcc
+      mingw-w64-i686-glib2
+      mingw-w64-i686-gnutls
+      mingw-w64-i686-gtk3
+      mingw-w64-i686-libgcrypt
+      mingw-w64-i686-libjpeg-turbo
+      mingw-w64-i686-libssh
+      mingw-w64-i686-libtasn1
+      mingw-w64-i686-libusb
+      mingw-w64-i686-libxml2
+      mingw-w64-i686-lzo2
+      mingw-w64-i686-ninja
+      mingw-w64-i686-pixman
+      mingw-w64-i686-pkgconf
+      mingw-w64-i686-python
+      mingw-w64-i686-snappy
+      mingw-w64-i686-usbredir "
+  - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
+  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
+  - mkdir output
+  - cd output
+  - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu
+      --enable-capstone=system"
+  - ..\msys64\usr\bin\bash -lc 'make -j2'
+  - ..\msys64\usr\bin\bash -lc 'make check'
-- 
2.27.0


