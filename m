Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F773BE8AD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:19:33 +0200 (CEST)
Received: from localhost ([::1]:60746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17Se-0004rU-Jz
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m17R4-0002N8-IK
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:17:54 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m17R0-0001eW-Qw
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 09:17:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so1666301wms.5
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 06:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EMV/35pahUeHDTjdpsx/tmnJXftZxU9BEWaabwj68bY=;
 b=ETyTFGwdOf0pE9zBYwwNhQq88u4LOjpzaFuHefWXpiIIkJJgNQkhd/HZgClRh87un4
 Mt/uoxhwXVrzXOwlOA7CwuUlXjWD/fvFApHitnsXjqXdhANmXA2WbQacmFETkcEinLNp
 xPgDyD0qQGCTHrVOM92Dm5iDERWYmzFGbaOuGxa5nikBgj0Y7hu77tcWltKCQ60ZlNj/
 Phc5qxEQm0MoZwe91LXN4PYRZKVEwBbjpez4ye9Oe0eh1fYpjUDo9UvlNFSG8mREj7ap
 KUN4od2rbfPZv6iVIFDRhfW5cBZyHBKSHW3PTf1ug6we4C+ES/FOmozwEtg8NeMiREIc
 oa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EMV/35pahUeHDTjdpsx/tmnJXftZxU9BEWaabwj68bY=;
 b=FJfplxNmiwsQMf0f6BgOBl3g4Ki8HtSGFAIA4y8xrHgTst5sJME32UK2vl4X3zKcKm
 1eGF5TrP7HvZtVJYTe+ORAgJRRz7FOKs8UWcsiYGPbvcUkAZCUL28Epdpglg9Vev5u/4
 dl+Sq+Doq34udG83PmVAQbSXhXvgJKh2oBoyRxZhjGLF9TVvXoFFokn3A4GD5/cNX4of
 o2/q2nF3KYaZ6pAvaRzB1SC4sgn2PjwAMfxrdiByGhG7q4Jcs3kSRwbEyYWrNwdEBnHs
 owbYyM79zM4jTMv2jbju6wEkHwQqyqh8lBpvSra2cMAw7goH8wif3258PVBtKRYrLf4w
 LpzQ==
X-Gm-Message-State: AOAM532bU493/4sjezAHcyosOYrhzEEGczgGIyJ+Hvf93EesiMcMwSgz
 tPXSENnP7s6MvQCh85jd5+ppXw==
X-Google-Smtp-Source: ABdhPJzCG4iwP9LFo16MyfBSoL0Qx50f6q9gWQBYk5rhNesOlAVbshSfOIoAtzT5WS/9GxQ7UCKcsA==
X-Received: by 2002:a1c:e485:: with SMTP id b127mr2363020wmh.91.1625663869366; 
 Wed, 07 Jul 2021 06:17:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t11sm20741654wrz.7.2021.07.07.06.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 06:17:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F0F51FF87;
 Wed,  7 Jul 2021 14:17:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH  v2 1/5] meson: Introduce target-specific Kconfig
Date: Wed,  7 Jul 2021 14:17:40 +0100
Message-Id: <20210707131744.26027-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210707131744.26027-1-alex.bennee@linaro.org>
References: <20210707131744.26027-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a target-specific Kconfig. We need the definitions in Kconfig so
the minikconf tool can verify they exits. However CONFIG_FOO is only
enabled for target foo via the meson.build rules.

Two architecture have a particularity, ARM and MIPS. As their
translators have been split you can potentially build a plain 32 bit
build along with a 64-bit version including the 32-bit subset.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210131111316.232778-6-f4bug@amsat.org>
Message-Id: <20210621152120.4465-2-alex.bennee@linaro.org>

---
v2
  - s/exit/exist/
  - explain why we can split 32/64 builds for ARM/MIPS
---
 meson.build               |  3 ++-
 Kconfig                   |  1 +
 target/Kconfig            | 19 +++++++++++++++++++
 target/alpha/Kconfig      |  2 ++
 target/arm/Kconfig        |  6 ++++++
 target/avr/Kconfig        |  2 ++
 target/cris/Kconfig       |  2 ++
 target/hppa/Kconfig       |  2 ++
 target/i386/Kconfig       |  5 +++++
 target/m68k/Kconfig       |  2 ++
 target/microblaze/Kconfig |  2 ++
 target/mips/Kconfig       |  6 ++++++
 target/nios2/Kconfig      |  2 ++
 target/openrisc/Kconfig   |  2 ++
 target/ppc/Kconfig        |  5 +++++
 target/riscv/Kconfig      |  5 +++++
 target/rx/Kconfig         |  2 ++
 target/s390x/Kconfig      |  2 ++
 target/sh4/Kconfig        |  2 ++
 target/sparc/Kconfig      |  5 +++++
 target/tricore/Kconfig    |  2 ++
 target/xtensa/Kconfig     |  2 ++
 22 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 target/Kconfig
 create mode 100644 target/alpha/Kconfig
 create mode 100644 target/arm/Kconfig
 create mode 100644 target/avr/Kconfig
 create mode 100644 target/cris/Kconfig
 create mode 100644 target/hppa/Kconfig
 create mode 100644 target/i386/Kconfig
 create mode 100644 target/m68k/Kconfig
 create mode 100644 target/microblaze/Kconfig
 create mode 100644 target/mips/Kconfig
 create mode 100644 target/nios2/Kconfig
 create mode 100644 target/openrisc/Kconfig
 create mode 100644 target/ppc/Kconfig
 create mode 100644 target/riscv/Kconfig
 create mode 100644 target/rx/Kconfig
 create mode 100644 target/s390x/Kconfig
 create mode 100644 target/sh4/Kconfig
 create mode 100644 target/sparc/Kconfig
 create mode 100644 target/tricore/Kconfig
 create mode 100644 target/xtensa/Kconfig

diff --git a/meson.build b/meson.build
index 7e12de01be..1b1abbd030 100644
--- a/meson.build
+++ b/meson.build
@@ -1593,7 +1593,8 @@ foreach target : target_dirs
       command: [minikconf,
                 get_option('default_devices') ? '--defconfig' : '--allnoconfig',
                 config_devices_mak, '@DEPFILE@', '@INPUT@',
-                host_kconfig, accel_kconfig])
+                host_kconfig, accel_kconfig,
+                'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=y'])
 
     config_devices_data = configuration_data()
     config_devices = keyval.load(config_devices_mak)
diff --git a/Kconfig b/Kconfig
index d52ebd839b..fb6a24a2de 100644
--- a/Kconfig
+++ b/Kconfig
@@ -1,5 +1,6 @@
 source Kconfig.host
 source backends/Kconfig
 source accel/Kconfig
+source target/Kconfig
 source hw/Kconfig
 source semihosting/Kconfig
diff --git a/target/Kconfig b/target/Kconfig
new file mode 100644
index 0000000000..ae7f24fc66
--- /dev/null
+++ b/target/Kconfig
@@ -0,0 +1,19 @@
+source alpha/Kconfig
+source arm/Kconfig
+source avr/Kconfig
+source cris/Kconfig
+source hppa/Kconfig
+source i386/Kconfig
+source m68k/Kconfig
+source microblaze/Kconfig
+source mips/Kconfig
+source nios2/Kconfig
+source openrisc/Kconfig
+source ppc/Kconfig
+source riscv/Kconfig
+source rx/Kconfig
+source s390x/Kconfig
+source sh4/Kconfig
+source sparc/Kconfig
+source tricore/Kconfig
+source xtensa/Kconfig
diff --git a/target/alpha/Kconfig b/target/alpha/Kconfig
new file mode 100644
index 0000000000..267222c05b
--- /dev/null
+++ b/target/alpha/Kconfig
@@ -0,0 +1,2 @@
+config ALPHA
+    bool
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
new file mode 100644
index 0000000000..3f3394a22b
--- /dev/null
+++ b/target/arm/Kconfig
@@ -0,0 +1,6 @@
+config ARM
+    bool
+
+config AARCH64
+    bool
+    select ARM
diff --git a/target/avr/Kconfig b/target/avr/Kconfig
new file mode 100644
index 0000000000..155592d353
--- /dev/null
+++ b/target/avr/Kconfig
@@ -0,0 +1,2 @@
+config AVR
+    bool
diff --git a/target/cris/Kconfig b/target/cris/Kconfig
new file mode 100644
index 0000000000..3fdc309fbb
--- /dev/null
+++ b/target/cris/Kconfig
@@ -0,0 +1,2 @@
+config CRIS
+    bool
diff --git a/target/hppa/Kconfig b/target/hppa/Kconfig
new file mode 100644
index 0000000000..395a35d799
--- /dev/null
+++ b/target/hppa/Kconfig
@@ -0,0 +1,2 @@
+config HPPA
+    bool
diff --git a/target/i386/Kconfig b/target/i386/Kconfig
new file mode 100644
index 0000000000..ce6968906e
--- /dev/null
+++ b/target/i386/Kconfig
@@ -0,0 +1,5 @@
+config I386
+    bool
+
+config X86_64
+    bool
diff --git a/target/m68k/Kconfig b/target/m68k/Kconfig
new file mode 100644
index 0000000000..23debad519
--- /dev/null
+++ b/target/m68k/Kconfig
@@ -0,0 +1,2 @@
+config M68K
+    bool
diff --git a/target/microblaze/Kconfig b/target/microblaze/Kconfig
new file mode 100644
index 0000000000..a5410d9218
--- /dev/null
+++ b/target/microblaze/Kconfig
@@ -0,0 +1,2 @@
+config MICROBLAZE
+    bool
diff --git a/target/mips/Kconfig b/target/mips/Kconfig
new file mode 100644
index 0000000000..6adf145354
--- /dev/null
+++ b/target/mips/Kconfig
@@ -0,0 +1,6 @@
+config MIPS
+    bool
+
+config MIPS64
+    bool
+    select MIPS
diff --git a/target/nios2/Kconfig b/target/nios2/Kconfig
new file mode 100644
index 0000000000..1529ab8950
--- /dev/null
+++ b/target/nios2/Kconfig
@@ -0,0 +1,2 @@
+config NIOS2
+    bool
diff --git a/target/openrisc/Kconfig b/target/openrisc/Kconfig
new file mode 100644
index 0000000000..e0da4ac1df
--- /dev/null
+++ b/target/openrisc/Kconfig
@@ -0,0 +1,2 @@
+config OPENRISC
+    bool
diff --git a/target/ppc/Kconfig b/target/ppc/Kconfig
new file mode 100644
index 0000000000..3ff152051a
--- /dev/null
+++ b/target/ppc/Kconfig
@@ -0,0 +1,5 @@
+config PPC
+    bool
+
+config PPC64
+    bool
diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
new file mode 100644
index 0000000000..b9e5932f13
--- /dev/null
+++ b/target/riscv/Kconfig
@@ -0,0 +1,5 @@
+config RISCV32
+    bool
+
+config RISCV64
+    bool
diff --git a/target/rx/Kconfig b/target/rx/Kconfig
new file mode 100644
index 0000000000..aceb5ed28f
--- /dev/null
+++ b/target/rx/Kconfig
@@ -0,0 +1,2 @@
+config RX
+    bool
diff --git a/target/s390x/Kconfig b/target/s390x/Kconfig
new file mode 100644
index 0000000000..72da48136c
--- /dev/null
+++ b/target/s390x/Kconfig
@@ -0,0 +1,2 @@
+config S390X
+    bool
diff --git a/target/sh4/Kconfig b/target/sh4/Kconfig
new file mode 100644
index 0000000000..2397c86028
--- /dev/null
+++ b/target/sh4/Kconfig
@@ -0,0 +1,2 @@
+config SH4
+    bool
diff --git a/target/sparc/Kconfig b/target/sparc/Kconfig
new file mode 100644
index 0000000000..70cc0f3a21
--- /dev/null
+++ b/target/sparc/Kconfig
@@ -0,0 +1,5 @@
+config SPARC
+    bool
+
+config SPARC64
+    bool
diff --git a/target/tricore/Kconfig b/target/tricore/Kconfig
new file mode 100644
index 0000000000..9313409309
--- /dev/null
+++ b/target/tricore/Kconfig
@@ -0,0 +1,2 @@
+config TRICORE
+    bool
diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
new file mode 100644
index 0000000000..a3c8dc7f6d
--- /dev/null
+++ b/target/xtensa/Kconfig
@@ -0,0 +1,2 @@
+config XTENSA
+    bool
-- 
2.20.1


