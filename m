Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5DE488AD6
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 18:11:21 +0100 (CET)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bix-0001b6-Hi
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 12:11:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6beo-0006eW-LZ; Sun, 09 Jan 2022 12:07:02 -0500
Received: from [2a00:1450:4864:20::435] (port=39445
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6bem-0005W3-UI; Sun, 09 Jan 2022 12:07:02 -0500
Received: by mail-wr1-x435.google.com with SMTP id s1so22362734wra.6;
 Sun, 09 Jan 2022 09:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6klwIMQLm+6gVHzgriEwBCM6jutl8PXL81kAF4kdCvk=;
 b=L/MD5HyBGB/nwYGMdwEwDizF5SuvhiHr2jGxZjlJISkBKqUiaPo6Jn7np/ciaWrslN
 nvKG9IJx6X7pmP5GYoIuM+7PgMJ4C4dKAw3dt0hMO2A2gRAK+WbZBGNTmAwgTIMbp9vX
 /YwMvvELH5meTWze0/I9dQlyBWuqqxcr1DL4lBiSeCAbwwmQWCDeYbm0o+oH7X5j1EuK
 HLkhC8ilw+9LRGhOC8wnhWCp/+rDvSzdcRMxYnYL9/GkL3Kg0lRh/PRNvdKx844fbsUG
 KD0EIoACtO4jiEGL2ZacyHr/pzGgFgMtYWuRhbwF8OIXcB/YqOxz4dBOFnlqsyKtMBVf
 gKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6klwIMQLm+6gVHzgriEwBCM6jutl8PXL81kAF4kdCvk=;
 b=T9FBgeRQ4E25y+D9UPrMFOaQR6VPyvZ8zFesynR4z47q3oOmBsaUJcmVJIFLwl3N2h
 kC2gssX1CELGNO1D755CuNhQlfnGrAvDz5L6Y9jE7K4mvXYCIilsIFVcUBcT4Ds56zXn
 gwF8A1leIBD4OXf/P+agnIHFlXpw/Dh7d1Y2feCxe35GTSJVaX6z8r3wvcsDoWJGqLgl
 mZqZtc00Dt19pkO2O0et1BLVEKSw1RoxIwkKTmv0jh/DwgPH9LHEt3Waqwyq1rygF6Qb
 6nhaT/NSbpl29KL+2G+0KSI2y6k9wu5IYG5S0X/32rZLsLMHBqHpDHFAhyyGAESS40ZI
 fXjQ==
X-Gm-Message-State: AOAM533MnOC+Ni9DWS34RHJYM6SpF51mX7yQ1BZIGc5DqXNdl3DTPNne
 EHxa0caRZf5WZt/uHRPcRz8n15JQ65q15Q==
X-Google-Smtp-Source: ABdhPJwHcsimFh9wi+htaafurpQtRH+AjwxWaBXhD4L2wGqlpdZcbpG86MXrY22iXv+87HJQQazBtQ==
X-Received: by 2002:adf:ffcd:: with SMTP id x13mr3069248wrs.672.1641748019169; 
 Sun, 09 Jan 2022 09:06:59 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id n9sm4856138wmq.37.2022.01.09.09.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:06:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] gitlab-ci: Support macOS 12 via cirrus-run
Date: Sun,  9 Jan 2022 18:06:12 +0100
Message-Id: <20220109170612.574104-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109170612.574104-1-f4bug@amsat.org>
References: <20220109170612.574104-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for macOS 12 build on Cirrus-CI, similarly to commit
0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run").

Disable deprecation warnings on Objective C to avoid:

  [2789/6622] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
  ui/cocoa.m:1411:16: error: 'setAllowedFileTypes:' is deprecated: first deprecated in macOS 12.0 - Use -allowedContentTypes instead [-Werror,-Wdeprecated-declarations]
      [openPanel setAllowedFileTypes: supportedImageFileTypes];
                 ^
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: property 'allowedFileTypes' is declared deprecated here
  @property (nullable, copy) NSArray<NSString *> *allowedFileTypes API_DEPRECATED("Use -allowedContentTypes instead", macos(10.3,12.0));
                                                  ^
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSSavePanel.h:215:49: note: 'setAllowedFileTypes:' has been explicitly marked deprecated here
  FAILED: libcommon.fa.p/ui_cocoa.m.o

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Generated using lcitool from:
https://gitlab.com/libvirt/libvirt-ci/-/merge_requests/210
---
 .gitlab-ci.d/cirrus.yml           | 16 ++++++++++++++++
 .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 19e6c21401b..719008b13ca 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -90,6 +90,22 @@ x64-macos-11-base-build:
     PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
     TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
 
+x64-macos-12-base-build:
+  extends: .cirrus_build_job
+  variables:
+    NAME: macos-12
+    CIRRUS_VM_INSTANCE_TYPE: osx_instance
+    CIRRUS_VM_IMAGE_SELECTOR: image
+    CIRRUS_VM_IMAGE_NAME: monterey-base
+    CIRRUS_VM_CPUS: 12
+    CIRRUS_VM_RAM: 24G
+    UPDATE_COMMAND: brew update
+    INSTALL_COMMAND: brew install
+    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
+    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
+    TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
+    CONFIGURE_ARGS: --extra-objcflags=-Wno-deprecated-declarations
+
 
 # The following jobs run VM-based tests via KVM on a Linux-based Cirrus-CI job
 .cirrus_kvm_job:
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
new file mode 100644
index 00000000000..997dbc762c8
--- /dev/null
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -0,0 +1,16 @@
+# THIS FILE WAS AUTO-GENERATED
+#
+#  $ lcitool variables macos-12 qemu
+#
+# https://gitlab.com/libvirt/libvirt-ci
+
+CCACHE='/usr/local/bin/ccache'
+CPAN_PKGS='Test::Harness'
+CROSS_PKGS=''
+MAKE='/usr/local/bin/gmake'
+NINJA='/usr/local/bin/ninja'
+PACKAGING_COMMAND='brew'
+PIP3='/usr/local/bin/pip3'
+PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb libxml2 llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
+PYTHON='/usr/local/bin/python3'
-- 
2.33.1


