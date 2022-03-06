Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B97A4CEE81
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:30:09 +0100 (CET)
Received: from localhost ([::1]:46792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0KG-0000qR-BF
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:30:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0AP-0002Ak-DF; Sun, 06 Mar 2022 18:19:57 -0500
Received: from [2a00:1450:4864:20::433] (port=38698
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0AN-0007YV-B3; Sun, 06 Mar 2022 18:19:57 -0500
Received: by mail-wr1-x433.google.com with SMTP id t11so20679725wrm.5;
 Sun, 06 Mar 2022 15:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hG3fzMLjA1MqokTt6OJRgmQLIdkbnzb2RNEkMvPsfF0=;
 b=JjsrdUDXCB2+jSMOrGHFJsxc7weqEdBw8e/CzkqRvL8G3I7/agdMKAtPJykeyAdO0Q
 G0kKu5A8tFd5k14u/S60+OAJUXSrm+9fKwsvf7TnPDjyqsuEI16EKo6srrrPaVvF1vR8
 gszfE62BCddZytBcMiMJw4UDZuzXvnNkKcUfqvIsgANqhEPwabMGqNBmVRrZ2aRQa8vS
 J8zaUj/W8x9dmY7wMg12ZFn7c56r47CEXpdixVBTel/4YiJgd6/V5BnGi5wPNp2To8DB
 6zfy9jYj3OXOyZ35QYgR7/vFQN7lm/+2TjQfIgXEXOY/QVPhCDZYTQ9V3mz0z2oT0ofF
 kcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hG3fzMLjA1MqokTt6OJRgmQLIdkbnzb2RNEkMvPsfF0=;
 b=hi1cCEvm1ivO9I97aZKjQ/uCPy0kB4wG5kxKwUKya34rqVuuYwgt083oEGrnvSjESN
 32tHJjICX5PGSGQAsdYbY1RYXVy2ckNApV2jIfYdWUkCtgRfHdh6hiyqrXwI2ZGUTMNL
 z8fu4zMlKZ9kG2EA9ggSNEbtkj8JZQshRUae0gxQS/mBgurhUlldkphLgdolsuy3isAN
 zA4WmMJujSKWzHQea6+jDIz3GwMFFE9iMbH6185KQ2pdYc+T55jrwqyqAwEwrEskO8/z
 s4fnrdfPfYeIkFWfcbiP90d2PfGr565SCGir0PG0hZeO4RLidf4sQbDJofVs273KzEvj
 ddvg==
X-Gm-Message-State: AOAM530u1Ejq/XzL+BOafzHTAwkHvVkSp+Vap6yWJ1/aGh5Oarn+T6fy
 iKcU9dHoI+MBGb5EUz0ravnidaLIPkU=
X-Google-Smtp-Source: ABdhPJw35sUeyKXU+Ir6y5wMH8wd0hCu4iRMSWSdtt1XNtbiWu7Q8TQVriP/WsZpYWqAAuCYOlRnOA==
X-Received: by 2002:a5d:4e83:0:b0:1ea:99dd:d335 with SMTP id
 e3-20020a5d4e83000000b001ea99ddd335mr6584646wru.16.1646608793397; 
 Sun, 06 Mar 2022 15:19:53 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b003816edb5711sm18689220wms.26.2022.03.06.15.19.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:19:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 22/22] gitlab-ci: Support macOS 12 via cirrus-run
Date: Mon,  7 Mar 2022 00:17:53 +0100
Message-Id: <20220306231753.50277-23-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add support for macOS 12 build on Cirrus-CI, similarly to commit
0e103a65ba1 ("gitlab: support for ... macOS 11 via cirrus-run"),
but with the following differences:
 - Enable modules (configure --enable-modules)
 - Do not run softfloat3 tests (make check-softfloat)
 - Run Aarch64 qtests instead of x86_64 ones

Generate the vars file by calling 'make lcitool-refresh'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/cirrus.yml           | 16 ++++++++++++++++
 .gitlab-ci.d/cirrus/macos-12.vars | 16 ++++++++++++++++
 tests/lcitool/refresh             |  1 +
 3 files changed, 33 insertions(+)
 create mode 100644 .gitlab-ci.d/cirrus/macos-12.vars

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index b96b22e269..be1dce5d4e 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -87,6 +87,22 @@ x64-macos-11-base-build:
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
+    CONFIGURE_ARGS: --enable-modules
+    TEST_TARGETS: check-unit check-block check-qapi-schema check-qtest-aarch64
+
 
 # The following jobs run VM-based tests via KVM on a Linux-based Cirrus-CI job
 .cirrus_kvm_job:
diff --git a/.gitlab-ci.d/cirrus/macos-12.vars b/.gitlab-ci.d/cirrus/macos-12.vars
new file mode 100644
index 0000000000..a793258c64
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
+PKGS='bash bc bzip2 capstone ccache cpanminus ctags curl dbus diffutils dtc gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
+PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme virtualenv'
+PYTHON='/usr/local/bin/python3'
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 1f00281b44..e2f0bbd1b1 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -105,6 +105,7 @@ try:
    generate_cirrus("freebsd-12")
    generate_cirrus("freebsd-13")
    generate_cirrus("macos-11")
+   generate_cirrus("macos-12")
 
    sys.exit(0)
 except Exception as ex:
-- 
2.34.1


