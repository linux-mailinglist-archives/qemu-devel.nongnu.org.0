Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3593AEC58
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:27:30 +0200 (CEST)
Received: from localhost ([::1]:45050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLph-0006SY-Q9
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvLk0-0006M9-LN
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:21:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvLjt-0000Xm-O0
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:21:36 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i94so20116376wri.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gMHPjbEVG+zdPZTF/kWXGZ5dcw2Z8WAvuD5GY0HfJxk=;
 b=QftpGjbj5LBNyvNF378nL+HYKlKnoZK5yIUtV4UUo73yBMuIqjhLAo2QeO+gQ5ietW
 PGzVVwxV/sYcgBnDR7ATwS5pEdO7cpGIVfu9zebwYWw/RKloe5KonKFvFfqh3exz11R2
 84Af6tW0UAZc3TDzC+j8C59RsyZ88sq4FzvFp7zL9EbPvCz9pD3Lx0LkpvW+zrSwJqOx
 nQyZV19zJs0d2vRmZHXgU6BCHbW9wOCJZoKIrqNNyXhxJ0LCcQMD8/iZ8OPGYEXUpYSk
 9ywkF+tfLz7jPeBF6ygsTfOmYu4fA3KsnYtkXz+izrlQ6w7+6bKc7QPdo9fefTHFB+Im
 wteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gMHPjbEVG+zdPZTF/kWXGZ5dcw2Z8WAvuD5GY0HfJxk=;
 b=RzhR7BiONMz9fII6UiWK7DYyilED0rrL58govzZiJKMTDQyeiZSStSDWTiVMcyjyti
 cGz3QwGOT7zMtTNtQrQv5HNZEjkvihizTb9bnzGB8cFiL7nNC1rcdFqhCc4pVPHtAW0I
 t8anFtwmdEN5k3lYP0020n8tTF3jpMxhrjxPECBJsEEsUMh3OFAEGSN0hx4mQs5ho7Bf
 DBbhRsKOvSEyivTu4ZeNAFdSylTYKmQN71g8gDcrncpowVwXrpSp4uMnWcBWFSYpTDib
 RiXgLr+yx4sP/GldvTlSp+9l2H44+5cnfH/Kmp1luEqDPycY5DNZnxa2PxGh7IXEKBxt
 j/Wg==
X-Gm-Message-State: AOAM530fO77zNSiUrCwsN0wJ6+62H5rfs+WMo1ZaJBs+5xWaA3HvJAOM
 i0WG2+SlS0Ddjz+/7BX/6riGZQ==
X-Google-Smtp-Source: ABdhPJzU5XpQs5SFd4mqTF/81OjHE0CdwETPHPKHqDQ+5s0EcH7NcbSxTkGvWLCTglRCcnmvRq6gcg==
X-Received: by 2002:a05:6000:180f:: with SMTP id
 m15mr29238350wrh.102.1624288888331; 
 Mon, 21 Jun 2021 08:21:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i6sm12430918wro.12.2021.06.21.08.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 08:21:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BA7C1FF90;
 Mon, 21 Jun 2021 16:21:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/5] configs: rename default-configs to configs and
 reorganise
Date: Mon, 21 Jun 2021 16:21:19 +0100
Message-Id: <20210621152120.4465-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621152120.4465-1-alex.bennee@linaro.org>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In preparation for offering variation to our build configurations lets
move everything and rename it to default. Common included base configs
are also renamed.

During the cleanup the stale usb.mak and pci.mak references were
removed from MAINTAINERS.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure                                     |  6 ++---
 .../devices/aarch64-softmmu/default.mak       |  2 +-
 .../devices/alpha-softmmu/default.mak         |  0
 .../devices/arm-softmmu/default.mak           |  0
 .../devices/avr-softmmu/default.mak           |  0
 .../devices/cris-softmmu/default.mak          |  0
 .../devices/hppa-softmmu/default.mak          |  0
 .../devices/i386-softmmu/default.mak          |  0
 .../devices/m68k-softmmu/default.mak          |  0
 .../devices/microblaze-softmmu/default.mak    |  0
 .../devices/microblazeel-softmmu/default.mak  |  2 +-
 .../devices/mips-softmmu/common.mak           |  0
 .../devices/mips-softmmu/default.mak          |  2 +-
 .../devices/mips64-softmmu/default.mak        |  2 +-
 .../devices/mips64el-softmmu/default.mak      |  2 +-
 .../devices/mipsel-softmmu/default.mak        |  2 +-
 .../devices/nios2-softmmu/default.mak         |  0
 .../devices/or1k-softmmu/default.mak          |  0
 .../devices/ppc-softmmu/default.mak           |  0
 .../devices/ppc64-softmmu/default.mak         |  2 +-
 .../devices/riscv32-softmmu/default.mak       |  0
 .../devices/riscv64-softmmu/default.mak       |  0
 .../devices/rx-softmmu/default.mak            |  0
 .../devices/s390x-softmmu/default.mak         |  0
 .../devices/sh4-softmmu/default.mak           |  0
 .../devices/sh4eb-softmmu/default.mak         |  2 +-
 .../devices/sparc-softmmu/default.mak         |  0
 .../devices/sparc64-softmmu/default.mak       |  0
 .../devices/tricore-softmmu/default.mak       |  0
 .../devices/x86_64-softmmu/default.mak        |  2 +-
 .../devices/xtensa-softmmu/default.mak        |  0
 configs/devices/xtensaeb-softmmu/default.mak  |  3 +++
 .../targets/aarch64-linux-user.mak            |  0
 .../targets/aarch64-softmmu.mak               |  0
 .../targets/aarch64_be-linux-user.mak         |  0
 .../targets/alpha-linux-user.mak              |  0
 .../targets/alpha-softmmu.mak                 |  0
 .../targets/arm-linux-user.mak                |  0
 .../targets/arm-softmmu.mak                   |  0
 .../targets/armeb-linux-user.mak              |  0
 .../targets/avr-softmmu.mak                   |  0
 .../targets/cris-linux-user.mak               |  0
 .../targets/cris-softmmu.mak                  |  0
 .../targets/hexagon-linux-user.mak            |  0
 .../targets/hppa-linux-user.mak               |  0
 .../targets/hppa-softmmu.mak                  |  0
 .../targets/i386-bsd-user.mak                 |  0
 .../targets/i386-linux-user.mak               |  0
 .../targets/i386-softmmu.mak                  |  0
 .../targets/m68k-linux-user.mak               |  0
 .../targets/m68k-softmmu.mak                  |  0
 .../targets/microblaze-linux-user.mak         |  0
 .../targets/microblaze-softmmu.mak            |  0
 .../targets/microblazeel-linux-user.mak       |  0
 .../targets/microblazeel-softmmu.mak          |  0
 .../targets/mips-linux-user.mak               |  0
 .../targets/mips-softmmu.mak                  |  0
 .../targets/mips64-linux-user.mak             |  0
 .../targets/mips64-softmmu.mak                |  0
 .../targets/mips64el-linux-user.mak           |  0
 .../targets/mips64el-softmmu.mak              |  0
 .../targets/mipsel-linux-user.mak             |  0
 .../targets/mipsel-softmmu.mak                |  0
 .../targets/mipsn32-linux-user.mak            |  0
 .../targets/mipsn32el-linux-user.mak          |  0
 .../targets/nios2-linux-user.mak              |  0
 .../targets/nios2-softmmu.mak                 |  0
 .../targets/or1k-linux-user.mak               |  0
 .../targets/or1k-softmmu.mak                  |  0
 .../targets/ppc-linux-user.mak                |  0
 .../targets/ppc-softmmu.mak                   |  0
 .../targets/ppc64-linux-user.mak              |  0
 .../targets/ppc64-softmmu.mak                 |  0
 .../targets/ppc64abi32-linux-user.mak         |  0
 .../targets/ppc64le-linux-user.mak            |  0
 .../targets/riscv32-linux-user.mak            |  0
 .../targets/riscv32-softmmu.mak               |  0
 .../targets/riscv64-linux-user.mak            |  0
 .../targets/riscv64-softmmu.mak               |  0
 .../targets/rx-softmmu.mak                    |  0
 .../targets/s390x-linux-user.mak              |  0
 .../targets/s390x-softmmu.mak                 |  0
 .../targets/sh4-linux-user.mak                |  0
 .../targets/sh4-softmmu.mak                   |  0
 .../targets/sh4eb-linux-user.mak              |  0
 .../targets/sh4eb-softmmu.mak                 |  0
 .../targets/sparc-linux-user.mak              |  0
 .../targets/sparc-softmmu.mak                 |  0
 .../targets/sparc32plus-linux-user.mak        |  0
 .../targets/sparc64-linux-user.mak            |  0
 .../targets/sparc64-softmmu.mak               |  0
 .../targets/tricore-softmmu.mak               |  0
 .../targets/x86_64-bsd-user.mak               |  0
 .../targets/x86_64-linux-user.mak             |  0
 .../targets/x86_64-softmmu.mak                |  0
 .../targets/xtensa-linux-user.mak             |  0
 .../targets/xtensa-softmmu.mak                |  0
 .../targets/xtensaeb-linux-user.mak           |  0
 .../targets/xtensaeb-softmmu.mak              |  0
 default-configs/devices/xtensaeb-softmmu.mak  |  3 ---
 meson.build                                   |  4 ++--
 MAINTAINERS                                   | 22 +++++++++----------
 tests/Makefile.include                        |  2 +-
 103 files changed, 28 insertions(+), 30 deletions(-)
 rename default-configs/devices/aarch64-softmmu.mak => configs/devices/aarch64-softmmu/default.mak (82%)
 rename default-configs/devices/alpha-softmmu.mak => configs/devices/alpha-softmmu/default.mak (100%)
 rename default-configs/devices/arm-softmmu.mak => configs/devices/arm-softmmu/default.mak (100%)
 rename default-configs/devices/avr-softmmu.mak => configs/devices/avr-softmmu/default.mak (100%)
 rename default-configs/devices/cris-softmmu.mak => configs/devices/cris-softmmu/default.mak (100%)
 rename default-configs/devices/hppa-softmmu.mak => configs/devices/hppa-softmmu/default.mak (100%)
 rename default-configs/devices/i386-softmmu.mak => configs/devices/i386-softmmu/default.mak (100%)
 rename default-configs/devices/m68k-softmmu.mak => configs/devices/m68k-softmmu/default.mak (100%)
 rename default-configs/devices/microblaze-softmmu.mak => configs/devices/microblaze-softmmu/default.mak (100%)
 rename default-configs/devices/microblazeel-softmmu.mak => configs/devices/microblazeel-softmmu/default.mak (54%)
 rename default-configs/devices/mips-softmmu-common.mak => configs/devices/mips-softmmu/common.mak (100%)
 rename default-configs/devices/mips-softmmu.mak => configs/devices/mips-softmmu/default.mak (56%)
 rename default-configs/devices/mips64-softmmu.mak => configs/devices/mips64-softmmu/default.mak (62%)
 rename default-configs/devices/mips64el-softmmu.mak => configs/devices/mips64el-softmmu/default.mak (88%)
 rename default-configs/devices/mipsel-softmmu.mak => configs/devices/mipsel-softmmu/default.mak (55%)
 rename default-configs/devices/nios2-softmmu.mak => configs/devices/nios2-softmmu/default.mak (100%)
 rename default-configs/devices/or1k-softmmu.mak => configs/devices/or1k-softmmu/default.mak (100%)
 rename default-configs/devices/ppc-softmmu.mak => configs/devices/ppc-softmmu/default.mak (100%)
 rename default-configs/devices/ppc64-softmmu.mak => configs/devices/ppc64-softmmu/default.mak (79%)
 rename default-configs/devices/riscv32-softmmu.mak => configs/devices/riscv32-softmmu/default.mak (100%)
 rename default-configs/devices/riscv64-softmmu.mak => configs/devices/riscv64-softmmu/default.mak (100%)
 rename default-configs/devices/rx-softmmu.mak => configs/devices/rx-softmmu/default.mak (100%)
 rename default-configs/devices/s390x-softmmu.mak => configs/devices/s390x-softmmu/default.mak (100%)
 rename default-configs/devices/sh4-softmmu.mak => configs/devices/sh4-softmmu/default.mak (100%)
 rename default-configs/devices/sh4eb-softmmu.mak => configs/devices/sh4eb-softmmu/default.mak (55%)
 rename default-configs/devices/sparc-softmmu.mak => configs/devices/sparc-softmmu/default.mak (100%)
 rename default-configs/devices/sparc64-softmmu.mak => configs/devices/sparc64-softmmu/default.mak (100%)
 rename default-configs/devices/tricore-softmmu.mak => configs/devices/tricore-softmmu/default.mak (100%)
 rename default-configs/devices/x86_64-softmmu.mak => configs/devices/x86_64-softmmu/default.mak (55%)
 rename default-configs/devices/xtensa-softmmu.mak => configs/devices/xtensa-softmmu/default.mak (100%)
 create mode 100644 configs/devices/xtensaeb-softmmu/default.mak
 rename {default-configs => configs}/targets/aarch64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/aarch64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/aarch64_be-linux-user.mak (100%)
 rename {default-configs => configs}/targets/alpha-linux-user.mak (100%)
 rename {default-configs => configs}/targets/alpha-softmmu.mak (100%)
 rename {default-configs => configs}/targets/arm-linux-user.mak (100%)
 rename {default-configs => configs}/targets/arm-softmmu.mak (100%)
 rename {default-configs => configs}/targets/armeb-linux-user.mak (100%)
 rename {default-configs => configs}/targets/avr-softmmu.mak (100%)
 rename {default-configs => configs}/targets/cris-linux-user.mak (100%)
 rename {default-configs => configs}/targets/cris-softmmu.mak (100%)
 rename {default-configs => configs}/targets/hexagon-linux-user.mak (100%)
 rename {default-configs => configs}/targets/hppa-linux-user.mak (100%)
 rename {default-configs => configs}/targets/hppa-softmmu.mak (100%)
 rename {default-configs => configs}/targets/i386-bsd-user.mak (100%)
 rename {default-configs => configs}/targets/i386-linux-user.mak (100%)
 rename {default-configs => configs}/targets/i386-softmmu.mak (100%)
 rename {default-configs => configs}/targets/m68k-linux-user.mak (100%)
 rename {default-configs => configs}/targets/m68k-softmmu.mak (100%)
 rename {default-configs => configs}/targets/microblaze-linux-user.mak (100%)
 rename {default-configs => configs}/targets/microblaze-softmmu.mak (100%)
 rename {default-configs => configs}/targets/microblazeel-linux-user.mak (100%)
 rename {default-configs => configs}/targets/microblazeel-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mips-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mips-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mips64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mips64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mips64el-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mips64el-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mipsel-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mipsel-softmmu.mak (100%)
 rename {default-configs => configs}/targets/mipsn32-linux-user.mak (100%)
 rename {default-configs => configs}/targets/mipsn32el-linux-user.mak (100%)
 rename {default-configs => configs}/targets/nios2-linux-user.mak (100%)
 rename {default-configs => configs}/targets/nios2-softmmu.mak (100%)
 rename {default-configs => configs}/targets/or1k-linux-user.mak (100%)
 rename {default-configs => configs}/targets/or1k-softmmu.mak (100%)
 rename {default-configs => configs}/targets/ppc-linux-user.mak (100%)
 rename {default-configs => configs}/targets/ppc-softmmu.mak (100%)
 rename {default-configs => configs}/targets/ppc64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/ppc64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/ppc64abi32-linux-user.mak (100%)
 rename {default-configs => configs}/targets/ppc64le-linux-user.mak (100%)
 rename {default-configs => configs}/targets/riscv32-linux-user.mak (100%)
 rename {default-configs => configs}/targets/riscv32-softmmu.mak (100%)
 rename {default-configs => configs}/targets/riscv64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/riscv64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/rx-softmmu.mak (100%)
 rename {default-configs => configs}/targets/s390x-linux-user.mak (100%)
 rename {default-configs => configs}/targets/s390x-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sh4-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sh4-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sh4eb-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sh4eb-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sparc-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sparc-softmmu.mak (100%)
 rename {default-configs => configs}/targets/sparc32plus-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sparc64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/sparc64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/tricore-softmmu.mak (100%)
 rename {default-configs => configs}/targets/x86_64-bsd-user.mak (100%)
 rename {default-configs => configs}/targets/x86_64-linux-user.mak (100%)
 rename {default-configs => configs}/targets/x86_64-softmmu.mak (100%)
 rename {default-configs => configs}/targets/xtensa-linux-user.mak (100%)
 rename {default-configs => configs}/targets/xtensa-softmmu.mak (100%)
 rename {default-configs => configs}/targets/xtensaeb-linux-user.mak (100%)
 rename {default-configs => configs}/targets/xtensaeb-softmmu.mak (100%)
 delete mode 100644 default-configs/devices/xtensaeb-softmmu.mak

diff --git a/configure b/configure
index 262ab71802..b47c38b504 100755
--- a/configure
+++ b/configure
@@ -1683,13 +1683,13 @@ deprecated_features=""
 mak_wilds=""
 
 if [ "$softmmu" = "yes" ]; then
-    mak_wilds="${mak_wilds} $source_path/default-configs/targets/*-softmmu.mak"
+    mak_wilds="${mak_wilds} $source_path/configs/targets/*-softmmu.mak"
 fi
 if [ "$linux_user" = "yes" ]; then
-    mak_wilds="${mak_wilds} $source_path/default-configs/targets/*-linux-user.mak"
+    mak_wilds="${mak_wilds} $source_path/configs/targets/*-linux-user.mak"
 fi
 if [ "$bsd_user" = "yes" ]; then
-    mak_wilds="${mak_wilds} $source_path/default-configs/targets/*-bsd-user.mak"
+    mak_wilds="${mak_wilds} $source_path/configs/targets/*-bsd-user.mak"
 fi
 
 # If the user doesn't explicitly specify a deprecated target we will
diff --git a/default-configs/devices/aarch64-softmmu.mak b/configs/devices/aarch64-softmmu/default.mak
similarity index 82%
rename from default-configs/devices/aarch64-softmmu.mak
rename to configs/devices/aarch64-softmmu/default.mak
index 958b1e08e4..cf43ac8da1 100644
--- a/default-configs/devices/aarch64-softmmu.mak
+++ b/configs/devices/aarch64-softmmu/default.mak
@@ -1,7 +1,7 @@
 # Default configuration for aarch64-softmmu
 
 # We support all the 32 bit boards so need all their config
-include arm-softmmu.mak
+include ../arm-softmmu/default.mak
 
 CONFIG_XLNX_ZYNQMP_ARM=y
 CONFIG_XLNX_VERSAL=y
diff --git a/default-configs/devices/alpha-softmmu.mak b/configs/devices/alpha-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/alpha-softmmu.mak
rename to configs/devices/alpha-softmmu/default.mak
diff --git a/default-configs/devices/arm-softmmu.mak b/configs/devices/arm-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/arm-softmmu.mak
rename to configs/devices/arm-softmmu/default.mak
diff --git a/default-configs/devices/avr-softmmu.mak b/configs/devices/avr-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/avr-softmmu.mak
rename to configs/devices/avr-softmmu/default.mak
diff --git a/default-configs/devices/cris-softmmu.mak b/configs/devices/cris-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/cris-softmmu.mak
rename to configs/devices/cris-softmmu/default.mak
diff --git a/default-configs/devices/hppa-softmmu.mak b/configs/devices/hppa-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/hppa-softmmu.mak
rename to configs/devices/hppa-softmmu/default.mak
diff --git a/default-configs/devices/i386-softmmu.mak b/configs/devices/i386-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/i386-softmmu.mak
rename to configs/devices/i386-softmmu/default.mak
diff --git a/default-configs/devices/m68k-softmmu.mak b/configs/devices/m68k-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/m68k-softmmu.mak
rename to configs/devices/m68k-softmmu/default.mak
diff --git a/default-configs/devices/microblaze-softmmu.mak b/configs/devices/microblaze-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/microblaze-softmmu.mak
rename to configs/devices/microblaze-softmmu/default.mak
diff --git a/default-configs/devices/microblazeel-softmmu.mak b/configs/devices/microblazeel-softmmu/default.mak
similarity index 54%
rename from default-configs/devices/microblazeel-softmmu.mak
rename to configs/devices/microblazeel-softmmu/default.mak
index 2fcf442fc7..29f7f13816 100644
--- a/default-configs/devices/microblazeel-softmmu.mak
+++ b/configs/devices/microblazeel-softmmu/default.mak
@@ -1,3 +1,3 @@
 # Default configuration for microblazeel-softmmu
 
-include microblaze-softmmu.mak
+include ../microblaze-softmmu/default.mak
diff --git a/default-configs/devices/mips-softmmu-common.mak b/configs/devices/mips-softmmu/common.mak
similarity index 100%
rename from default-configs/devices/mips-softmmu-common.mak
rename to configs/devices/mips-softmmu/common.mak
diff --git a/default-configs/devices/mips-softmmu.mak b/configs/devices/mips-softmmu/default.mak
similarity index 56%
rename from default-configs/devices/mips-softmmu.mak
rename to configs/devices/mips-softmmu/default.mak
index 9fede6e00f..c23d95a83a 100644
--- a/default-configs/devices/mips-softmmu.mak
+++ b/configs/devices/mips-softmmu/default.mak
@@ -1,3 +1,3 @@
 # Default configuration for mips-softmmu
 
-include mips-softmmu-common.mak
+include common.mak
diff --git a/default-configs/devices/mips64-softmmu.mak b/configs/devices/mips64-softmmu/default.mak
similarity index 62%
rename from default-configs/devices/mips64-softmmu.mak
rename to configs/devices/mips64-softmmu/default.mak
index a169738635..566672f3c2 100644
--- a/default-configs/devices/mips64-softmmu.mak
+++ b/configs/devices/mips64-softmmu/default.mak
@@ -1,4 +1,4 @@
 # Default configuration for mips64-softmmu
 
-include mips-softmmu-common.mak
+include ../mips-softmmu/common.mak
 CONFIG_JAZZ=y
diff --git a/default-configs/devices/mips64el-softmmu.mak b/configs/devices/mips64el-softmmu/default.mak
similarity index 88%
rename from default-configs/devices/mips64el-softmmu.mak
rename to configs/devices/mips64el-softmmu/default.mak
index 26c660a05c..c511a061ba 100644
--- a/default-configs/devices/mips64el-softmmu.mak
+++ b/configs/devices/mips64el-softmmu/default.mak
@@ -1,6 +1,6 @@
 # Default configuration for mips64el-softmmu
 
-include mips-softmmu-common.mak
+include ../mips-softmmu/common.mak
 CONFIG_IDE_VIA=y
 CONFIG_FULOONG=y
 CONFIG_LOONGSON3V=y
diff --git a/default-configs/devices/mipsel-softmmu.mak b/configs/devices/mipsel-softmmu/default.mak
similarity index 55%
rename from default-configs/devices/mipsel-softmmu.mak
rename to configs/devices/mipsel-softmmu/default.mak
index a7f6059484..009ccb0e2d 100644
--- a/default-configs/devices/mipsel-softmmu.mak
+++ b/configs/devices/mipsel-softmmu/default.mak
@@ -1,3 +1,3 @@
 # Default configuration for mipsel-softmmu
 
-include mips-softmmu-common.mak
+include ../mips-softmmu/common.mak
diff --git a/default-configs/devices/nios2-softmmu.mak b/configs/devices/nios2-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/nios2-softmmu.mak
rename to configs/devices/nios2-softmmu/default.mak
diff --git a/default-configs/devices/or1k-softmmu.mak b/configs/devices/or1k-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/or1k-softmmu.mak
rename to configs/devices/or1k-softmmu/default.mak
diff --git a/default-configs/devices/ppc-softmmu.mak b/configs/devices/ppc-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/ppc-softmmu.mak
rename to configs/devices/ppc-softmmu/default.mak
diff --git a/default-configs/devices/ppc64-softmmu.mak b/configs/devices/ppc64-softmmu/default.mak
similarity index 79%
rename from default-configs/devices/ppc64-softmmu.mak
rename to configs/devices/ppc64-softmmu/default.mak
index cca52665d9..b90e5bf455 100644
--- a/default-configs/devices/ppc64-softmmu.mak
+++ b/configs/devices/ppc64-softmmu/default.mak
@@ -1,7 +1,7 @@
 # Default configuration for ppc64-softmmu
 
 # Include all 32-bit boards
-include ppc-softmmu.mak
+include ../ppc-softmmu/default.mak
 
 # For PowerNV
 CONFIG_POWERNV=y
diff --git a/default-configs/devices/riscv32-softmmu.mak b/configs/devices/riscv32-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/riscv32-softmmu.mak
rename to configs/devices/riscv32-softmmu/default.mak
diff --git a/default-configs/devices/riscv64-softmmu.mak b/configs/devices/riscv64-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/riscv64-softmmu.mak
rename to configs/devices/riscv64-softmmu/default.mak
diff --git a/default-configs/devices/rx-softmmu.mak b/configs/devices/rx-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/rx-softmmu.mak
rename to configs/devices/rx-softmmu/default.mak
diff --git a/default-configs/devices/s390x-softmmu.mak b/configs/devices/s390x-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/s390x-softmmu.mak
rename to configs/devices/s390x-softmmu/default.mak
diff --git a/default-configs/devices/sh4-softmmu.mak b/configs/devices/sh4-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/sh4-softmmu.mak
rename to configs/devices/sh4-softmmu/default.mak
diff --git a/default-configs/devices/sh4eb-softmmu.mak b/configs/devices/sh4eb-softmmu/default.mak
similarity index 55%
rename from default-configs/devices/sh4eb-softmmu.mak
rename to configs/devices/sh4eb-softmmu/default.mak
index 522a7a50fa..f18d1f6519 100644
--- a/default-configs/devices/sh4eb-softmmu.mak
+++ b/configs/devices/sh4eb-softmmu/default.mak
@@ -1,3 +1,3 @@
 # Default configuration for sh4eb-softmmu
 
-include sh4-softmmu.mak
+include ../sh4-softmmu/default.mak
diff --git a/default-configs/devices/sparc-softmmu.mak b/configs/devices/sparc-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/sparc-softmmu.mak
rename to configs/devices/sparc-softmmu/default.mak
diff --git a/default-configs/devices/sparc64-softmmu.mak b/configs/devices/sparc64-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/sparc64-softmmu.mak
rename to configs/devices/sparc64-softmmu/default.mak
diff --git a/default-configs/devices/tricore-softmmu.mak b/configs/devices/tricore-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/tricore-softmmu.mak
rename to configs/devices/tricore-softmmu/default.mak
diff --git a/default-configs/devices/x86_64-softmmu.mak b/configs/devices/x86_64-softmmu/default.mak
similarity index 55%
rename from default-configs/devices/x86_64-softmmu.mak
rename to configs/devices/x86_64-softmmu/default.mak
index 64b2ee2960..ddfc2ea626 100644
--- a/default-configs/devices/x86_64-softmmu.mak
+++ b/configs/devices/x86_64-softmmu/default.mak
@@ -1,3 +1,3 @@
 # Default configuration for x86_64-softmmu
 
-include i386-softmmu.mak
+include ../i386-softmmu/default.mak
diff --git a/default-configs/devices/xtensa-softmmu.mak b/configs/devices/xtensa-softmmu/default.mak
similarity index 100%
rename from default-configs/devices/xtensa-softmmu.mak
rename to configs/devices/xtensa-softmmu/default.mak
diff --git a/configs/devices/xtensaeb-softmmu/default.mak b/configs/devices/xtensaeb-softmmu/default.mak
new file mode 100644
index 0000000000..00eafcc292
--- /dev/null
+++ b/configs/devices/xtensaeb-softmmu/default.mak
@@ -0,0 +1,3 @@
+# Default configuration for Xtensa
+
+include ../xtensa-softmmu/default.mak
diff --git a/default-configs/targets/aarch64-linux-user.mak b/configs/targets/aarch64-linux-user.mak
similarity index 100%
rename from default-configs/targets/aarch64-linux-user.mak
rename to configs/targets/aarch64-linux-user.mak
diff --git a/default-configs/targets/aarch64-softmmu.mak b/configs/targets/aarch64-softmmu.mak
similarity index 100%
rename from default-configs/targets/aarch64-softmmu.mak
rename to configs/targets/aarch64-softmmu.mak
diff --git a/default-configs/targets/aarch64_be-linux-user.mak b/configs/targets/aarch64_be-linux-user.mak
similarity index 100%
rename from default-configs/targets/aarch64_be-linux-user.mak
rename to configs/targets/aarch64_be-linux-user.mak
diff --git a/default-configs/targets/alpha-linux-user.mak b/configs/targets/alpha-linux-user.mak
similarity index 100%
rename from default-configs/targets/alpha-linux-user.mak
rename to configs/targets/alpha-linux-user.mak
diff --git a/default-configs/targets/alpha-softmmu.mak b/configs/targets/alpha-softmmu.mak
similarity index 100%
rename from default-configs/targets/alpha-softmmu.mak
rename to configs/targets/alpha-softmmu.mak
diff --git a/default-configs/targets/arm-linux-user.mak b/configs/targets/arm-linux-user.mak
similarity index 100%
rename from default-configs/targets/arm-linux-user.mak
rename to configs/targets/arm-linux-user.mak
diff --git a/default-configs/targets/arm-softmmu.mak b/configs/targets/arm-softmmu.mak
similarity index 100%
rename from default-configs/targets/arm-softmmu.mak
rename to configs/targets/arm-softmmu.mak
diff --git a/default-configs/targets/armeb-linux-user.mak b/configs/targets/armeb-linux-user.mak
similarity index 100%
rename from default-configs/targets/armeb-linux-user.mak
rename to configs/targets/armeb-linux-user.mak
diff --git a/default-configs/targets/avr-softmmu.mak b/configs/targets/avr-softmmu.mak
similarity index 100%
rename from default-configs/targets/avr-softmmu.mak
rename to configs/targets/avr-softmmu.mak
diff --git a/default-configs/targets/cris-linux-user.mak b/configs/targets/cris-linux-user.mak
similarity index 100%
rename from default-configs/targets/cris-linux-user.mak
rename to configs/targets/cris-linux-user.mak
diff --git a/default-configs/targets/cris-softmmu.mak b/configs/targets/cris-softmmu.mak
similarity index 100%
rename from default-configs/targets/cris-softmmu.mak
rename to configs/targets/cris-softmmu.mak
diff --git a/default-configs/targets/hexagon-linux-user.mak b/configs/targets/hexagon-linux-user.mak
similarity index 100%
rename from default-configs/targets/hexagon-linux-user.mak
rename to configs/targets/hexagon-linux-user.mak
diff --git a/default-configs/targets/hppa-linux-user.mak b/configs/targets/hppa-linux-user.mak
similarity index 100%
rename from default-configs/targets/hppa-linux-user.mak
rename to configs/targets/hppa-linux-user.mak
diff --git a/default-configs/targets/hppa-softmmu.mak b/configs/targets/hppa-softmmu.mak
similarity index 100%
rename from default-configs/targets/hppa-softmmu.mak
rename to configs/targets/hppa-softmmu.mak
diff --git a/default-configs/targets/i386-bsd-user.mak b/configs/targets/i386-bsd-user.mak
similarity index 100%
rename from default-configs/targets/i386-bsd-user.mak
rename to configs/targets/i386-bsd-user.mak
diff --git a/default-configs/targets/i386-linux-user.mak b/configs/targets/i386-linux-user.mak
similarity index 100%
rename from default-configs/targets/i386-linux-user.mak
rename to configs/targets/i386-linux-user.mak
diff --git a/default-configs/targets/i386-softmmu.mak b/configs/targets/i386-softmmu.mak
similarity index 100%
rename from default-configs/targets/i386-softmmu.mak
rename to configs/targets/i386-softmmu.mak
diff --git a/default-configs/targets/m68k-linux-user.mak b/configs/targets/m68k-linux-user.mak
similarity index 100%
rename from default-configs/targets/m68k-linux-user.mak
rename to configs/targets/m68k-linux-user.mak
diff --git a/default-configs/targets/m68k-softmmu.mak b/configs/targets/m68k-softmmu.mak
similarity index 100%
rename from default-configs/targets/m68k-softmmu.mak
rename to configs/targets/m68k-softmmu.mak
diff --git a/default-configs/targets/microblaze-linux-user.mak b/configs/targets/microblaze-linux-user.mak
similarity index 100%
rename from default-configs/targets/microblaze-linux-user.mak
rename to configs/targets/microblaze-linux-user.mak
diff --git a/default-configs/targets/microblaze-softmmu.mak b/configs/targets/microblaze-softmmu.mak
similarity index 100%
rename from default-configs/targets/microblaze-softmmu.mak
rename to configs/targets/microblaze-softmmu.mak
diff --git a/default-configs/targets/microblazeel-linux-user.mak b/configs/targets/microblazeel-linux-user.mak
similarity index 100%
rename from default-configs/targets/microblazeel-linux-user.mak
rename to configs/targets/microblazeel-linux-user.mak
diff --git a/default-configs/targets/microblazeel-softmmu.mak b/configs/targets/microblazeel-softmmu.mak
similarity index 100%
rename from default-configs/targets/microblazeel-softmmu.mak
rename to configs/targets/microblazeel-softmmu.mak
diff --git a/default-configs/targets/mips-linux-user.mak b/configs/targets/mips-linux-user.mak
similarity index 100%
rename from default-configs/targets/mips-linux-user.mak
rename to configs/targets/mips-linux-user.mak
diff --git a/default-configs/targets/mips-softmmu.mak b/configs/targets/mips-softmmu.mak
similarity index 100%
rename from default-configs/targets/mips-softmmu.mak
rename to configs/targets/mips-softmmu.mak
diff --git a/default-configs/targets/mips64-linux-user.mak b/configs/targets/mips64-linux-user.mak
similarity index 100%
rename from default-configs/targets/mips64-linux-user.mak
rename to configs/targets/mips64-linux-user.mak
diff --git a/default-configs/targets/mips64-softmmu.mak b/configs/targets/mips64-softmmu.mak
similarity index 100%
rename from default-configs/targets/mips64-softmmu.mak
rename to configs/targets/mips64-softmmu.mak
diff --git a/default-configs/targets/mips64el-linux-user.mak b/configs/targets/mips64el-linux-user.mak
similarity index 100%
rename from default-configs/targets/mips64el-linux-user.mak
rename to configs/targets/mips64el-linux-user.mak
diff --git a/default-configs/targets/mips64el-softmmu.mak b/configs/targets/mips64el-softmmu.mak
similarity index 100%
rename from default-configs/targets/mips64el-softmmu.mak
rename to configs/targets/mips64el-softmmu.mak
diff --git a/default-configs/targets/mipsel-linux-user.mak b/configs/targets/mipsel-linux-user.mak
similarity index 100%
rename from default-configs/targets/mipsel-linux-user.mak
rename to configs/targets/mipsel-linux-user.mak
diff --git a/default-configs/targets/mipsel-softmmu.mak b/configs/targets/mipsel-softmmu.mak
similarity index 100%
rename from default-configs/targets/mipsel-softmmu.mak
rename to configs/targets/mipsel-softmmu.mak
diff --git a/default-configs/targets/mipsn32-linux-user.mak b/configs/targets/mipsn32-linux-user.mak
similarity index 100%
rename from default-configs/targets/mipsn32-linux-user.mak
rename to configs/targets/mipsn32-linux-user.mak
diff --git a/default-configs/targets/mipsn32el-linux-user.mak b/configs/targets/mipsn32el-linux-user.mak
similarity index 100%
rename from default-configs/targets/mipsn32el-linux-user.mak
rename to configs/targets/mipsn32el-linux-user.mak
diff --git a/default-configs/targets/nios2-linux-user.mak b/configs/targets/nios2-linux-user.mak
similarity index 100%
rename from default-configs/targets/nios2-linux-user.mak
rename to configs/targets/nios2-linux-user.mak
diff --git a/default-configs/targets/nios2-softmmu.mak b/configs/targets/nios2-softmmu.mak
similarity index 100%
rename from default-configs/targets/nios2-softmmu.mak
rename to configs/targets/nios2-softmmu.mak
diff --git a/default-configs/targets/or1k-linux-user.mak b/configs/targets/or1k-linux-user.mak
similarity index 100%
rename from default-configs/targets/or1k-linux-user.mak
rename to configs/targets/or1k-linux-user.mak
diff --git a/default-configs/targets/or1k-softmmu.mak b/configs/targets/or1k-softmmu.mak
similarity index 100%
rename from default-configs/targets/or1k-softmmu.mak
rename to configs/targets/or1k-softmmu.mak
diff --git a/default-configs/targets/ppc-linux-user.mak b/configs/targets/ppc-linux-user.mak
similarity index 100%
rename from default-configs/targets/ppc-linux-user.mak
rename to configs/targets/ppc-linux-user.mak
diff --git a/default-configs/targets/ppc-softmmu.mak b/configs/targets/ppc-softmmu.mak
similarity index 100%
rename from default-configs/targets/ppc-softmmu.mak
rename to configs/targets/ppc-softmmu.mak
diff --git a/default-configs/targets/ppc64-linux-user.mak b/configs/targets/ppc64-linux-user.mak
similarity index 100%
rename from default-configs/targets/ppc64-linux-user.mak
rename to configs/targets/ppc64-linux-user.mak
diff --git a/default-configs/targets/ppc64-softmmu.mak b/configs/targets/ppc64-softmmu.mak
similarity index 100%
rename from default-configs/targets/ppc64-softmmu.mak
rename to configs/targets/ppc64-softmmu.mak
diff --git a/default-configs/targets/ppc64abi32-linux-user.mak b/configs/targets/ppc64abi32-linux-user.mak
similarity index 100%
rename from default-configs/targets/ppc64abi32-linux-user.mak
rename to configs/targets/ppc64abi32-linux-user.mak
diff --git a/default-configs/targets/ppc64le-linux-user.mak b/configs/targets/ppc64le-linux-user.mak
similarity index 100%
rename from default-configs/targets/ppc64le-linux-user.mak
rename to configs/targets/ppc64le-linux-user.mak
diff --git a/default-configs/targets/riscv32-linux-user.mak b/configs/targets/riscv32-linux-user.mak
similarity index 100%
rename from default-configs/targets/riscv32-linux-user.mak
rename to configs/targets/riscv32-linux-user.mak
diff --git a/default-configs/targets/riscv32-softmmu.mak b/configs/targets/riscv32-softmmu.mak
similarity index 100%
rename from default-configs/targets/riscv32-softmmu.mak
rename to configs/targets/riscv32-softmmu.mak
diff --git a/default-configs/targets/riscv64-linux-user.mak b/configs/targets/riscv64-linux-user.mak
similarity index 100%
rename from default-configs/targets/riscv64-linux-user.mak
rename to configs/targets/riscv64-linux-user.mak
diff --git a/default-configs/targets/riscv64-softmmu.mak b/configs/targets/riscv64-softmmu.mak
similarity index 100%
rename from default-configs/targets/riscv64-softmmu.mak
rename to configs/targets/riscv64-softmmu.mak
diff --git a/default-configs/targets/rx-softmmu.mak b/configs/targets/rx-softmmu.mak
similarity index 100%
rename from default-configs/targets/rx-softmmu.mak
rename to configs/targets/rx-softmmu.mak
diff --git a/default-configs/targets/s390x-linux-user.mak b/configs/targets/s390x-linux-user.mak
similarity index 100%
rename from default-configs/targets/s390x-linux-user.mak
rename to configs/targets/s390x-linux-user.mak
diff --git a/default-configs/targets/s390x-softmmu.mak b/configs/targets/s390x-softmmu.mak
similarity index 100%
rename from default-configs/targets/s390x-softmmu.mak
rename to configs/targets/s390x-softmmu.mak
diff --git a/default-configs/targets/sh4-linux-user.mak b/configs/targets/sh4-linux-user.mak
similarity index 100%
rename from default-configs/targets/sh4-linux-user.mak
rename to configs/targets/sh4-linux-user.mak
diff --git a/default-configs/targets/sh4-softmmu.mak b/configs/targets/sh4-softmmu.mak
similarity index 100%
rename from default-configs/targets/sh4-softmmu.mak
rename to configs/targets/sh4-softmmu.mak
diff --git a/default-configs/targets/sh4eb-linux-user.mak b/configs/targets/sh4eb-linux-user.mak
similarity index 100%
rename from default-configs/targets/sh4eb-linux-user.mak
rename to configs/targets/sh4eb-linux-user.mak
diff --git a/default-configs/targets/sh4eb-softmmu.mak b/configs/targets/sh4eb-softmmu.mak
similarity index 100%
rename from default-configs/targets/sh4eb-softmmu.mak
rename to configs/targets/sh4eb-softmmu.mak
diff --git a/default-configs/targets/sparc-linux-user.mak b/configs/targets/sparc-linux-user.mak
similarity index 100%
rename from default-configs/targets/sparc-linux-user.mak
rename to configs/targets/sparc-linux-user.mak
diff --git a/default-configs/targets/sparc-softmmu.mak b/configs/targets/sparc-softmmu.mak
similarity index 100%
rename from default-configs/targets/sparc-softmmu.mak
rename to configs/targets/sparc-softmmu.mak
diff --git a/default-configs/targets/sparc32plus-linux-user.mak b/configs/targets/sparc32plus-linux-user.mak
similarity index 100%
rename from default-configs/targets/sparc32plus-linux-user.mak
rename to configs/targets/sparc32plus-linux-user.mak
diff --git a/default-configs/targets/sparc64-linux-user.mak b/configs/targets/sparc64-linux-user.mak
similarity index 100%
rename from default-configs/targets/sparc64-linux-user.mak
rename to configs/targets/sparc64-linux-user.mak
diff --git a/default-configs/targets/sparc64-softmmu.mak b/configs/targets/sparc64-softmmu.mak
similarity index 100%
rename from default-configs/targets/sparc64-softmmu.mak
rename to configs/targets/sparc64-softmmu.mak
diff --git a/default-configs/targets/tricore-softmmu.mak b/configs/targets/tricore-softmmu.mak
similarity index 100%
rename from default-configs/targets/tricore-softmmu.mak
rename to configs/targets/tricore-softmmu.mak
diff --git a/default-configs/targets/x86_64-bsd-user.mak b/configs/targets/x86_64-bsd-user.mak
similarity index 100%
rename from default-configs/targets/x86_64-bsd-user.mak
rename to configs/targets/x86_64-bsd-user.mak
diff --git a/default-configs/targets/x86_64-linux-user.mak b/configs/targets/x86_64-linux-user.mak
similarity index 100%
rename from default-configs/targets/x86_64-linux-user.mak
rename to configs/targets/x86_64-linux-user.mak
diff --git a/default-configs/targets/x86_64-softmmu.mak b/configs/targets/x86_64-softmmu.mak
similarity index 100%
rename from default-configs/targets/x86_64-softmmu.mak
rename to configs/targets/x86_64-softmmu.mak
diff --git a/default-configs/targets/xtensa-linux-user.mak b/configs/targets/xtensa-linux-user.mak
similarity index 100%
rename from default-configs/targets/xtensa-linux-user.mak
rename to configs/targets/xtensa-linux-user.mak
diff --git a/default-configs/targets/xtensa-softmmu.mak b/configs/targets/xtensa-softmmu.mak
similarity index 100%
rename from default-configs/targets/xtensa-softmmu.mak
rename to configs/targets/xtensa-softmmu.mak
diff --git a/default-configs/targets/xtensaeb-linux-user.mak b/configs/targets/xtensaeb-linux-user.mak
similarity index 100%
rename from default-configs/targets/xtensaeb-linux-user.mak
rename to configs/targets/xtensaeb-linux-user.mak
diff --git a/default-configs/targets/xtensaeb-softmmu.mak b/configs/targets/xtensaeb-softmmu.mak
similarity index 100%
rename from default-configs/targets/xtensaeb-softmmu.mak
rename to configs/targets/xtensaeb-softmmu.mak
diff --git a/default-configs/devices/xtensaeb-softmmu.mak b/default-configs/devices/xtensaeb-softmmu.mak
deleted file mode 100644
index f7e48c750c..0000000000
--- a/default-configs/devices/xtensaeb-softmmu.mak
+++ /dev/null
@@ -1,3 +0,0 @@
-# Default configuration for Xtensa
-
-include xtensa-softmmu.mak
diff --git a/meson.build b/meson.build
index 3ddd22ab7a..4893ffa2ac 100644
--- a/meson.build
+++ b/meson.build
@@ -1322,7 +1322,7 @@ foreach target : target_dirs
   endif
 
   actual_target_dirs += target
-  config_target += keyval.load('default-configs/targets' / target + '.mak')
+  config_target += keyval.load('configs/targets' / target + '.mak')
   config_target += { 'TARGET_' + config_target['TARGET_ARCH'].to_upper(): 'y' }
 
   if 'TARGET_NEED_FDT' in config_target
@@ -1370,7 +1370,7 @@ foreach target : target_dirs
   if target.endswith('-softmmu')
     config_devices_mak = target + '-config-devices.mak'
     config_devices_mak = configure_file(
-      input: ['default-configs/devices' / target + '.mak', 'Kconfig'],
+      input: ['configs/devices' / target / 'default.mak', 'Kconfig'],
       output: config_devices_mak,
       depfile: config_devices_mak + '.d',
       capture: true,
diff --git a/MAINTAINERS b/MAINTAINERS
index f7e12ea248..0901a0e4de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -87,7 +87,7 @@ S390 general architecture support
 M: Cornelia Huck <cohuck@redhat.com>
 M: Thomas Huth <thuth@redhat.com>
 S: Supported
-F: default-configs/*/s390x-softmmu.mak
+F: configs/devices/s390x-softmmu/default.mak
 F: gdb-xml/s390*.xml
 F: hw/char/sclp*.[hc]
 F: hw/char/terminal3270.c
@@ -195,7 +195,7 @@ F: target/hexagon/
 F: linux-user/hexagon/
 F: tests/tcg/hexagon/
 F: disas/hexagon.c
-F: default-configs/targets/hexagon-linux-user.mak
+F: configs/targets/hexagon-linux-user/default.mak
 F: docker/dockerfiles/debian-hexagon-cross.docker
 F: docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
 
@@ -228,7 +228,7 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
-F: default-configs/*/*mips*
+F: configs/devices/mips*/*
 F: disas/mips.c
 F: docs/system/cpu-models-mips.rst.inc
 F: hw/intc/mips_gic.c
@@ -253,7 +253,7 @@ S: Maintained
 F: target/nios2/
 F: hw/nios2/
 F: disas/nios2.c
-F: default-configs/*/nios2-softmmu.mak
+F: configs/devices/nios2-softmmu/default.mak
 
 OpenRISC TCG CPUs
 M: Stafford Horne <shorne@gmail.com>
@@ -340,7 +340,7 @@ F: hw/xtensa/
 F: tests/tcg/xtensa/
 F: disas/xtensa.c
 F: include/hw/xtensa/xtensa-isa.h
-F: default-configs/*/xtensa*.mak
+F: configs/devices/xtensa*/default.mak
 
 TriCore TCG CPUs
 M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
@@ -1038,7 +1038,7 @@ AVR Machines
 AVR MCUs
 M: Michael Rolnik <mrolnik@gmail.com>
 S: Maintained
-F: default-configs/*/avr-softmmu.mak
+F: configs/devices/avr-softmmu/default.mak
 F: hw/avr/
 F: include/hw/char/avr_usart.h
 F: hw/char/avr_usart.c
@@ -1066,7 +1066,7 @@ HP B160L
 M: Richard Henderson <richard.henderson@linaro.org>
 R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
-F: default-configs/*/hppa-softmmu.mak
+F: configs/devices/hppa-softmmu/default.mak
 F: hw/hppa/
 F: pc-bios/hppa-firmware.img
 
@@ -1494,7 +1494,7 @@ F: hw/s390x/
 F: include/hw/s390x/
 F: hw/watchdog/wdt_diag288.c
 F: include/hw/watchdog/wdt_diag288.h
-F: default-configs/*/s390x-softmmu.mak
+F: configs/devices/s390x-softmmu/default.mak
 F: tests/acceptance/machine_s390_ccw_virtio.py
 T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
@@ -1698,7 +1698,6 @@ F: hw/pci-bridge/*
 F: qapi/pci.json
 F: docs/pci*
 F: docs/specs/*pci*
-F: default-configs/pci.mak
 
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
@@ -1803,7 +1802,6 @@ F: docs/usb2.txt
 F: docs/usb-storage.txt
 F: include/hw/usb.h
 F: include/hw/usb/
-F: default-configs/usb.mak
 
 USB (serial adapter)
 M: Gerd Hoffmann <kraxel@redhat.com>
@@ -2952,14 +2950,14 @@ M: Warner Losh <imp@bsdimp.com>
 R: Kyle Evans <kevans@freebsd.org>
 S: Maintained
 F: bsd-user/
-F: default-configs/targets/*-bsd-user.mak
+F: configs/targets/*-bsd-user.mak
 T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
 
 Linux user
 M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
 F: linux-user/
-F: default-configs/targets/*linux-user.mak
+F: configs/targets/*linux-user.mak
 F: scripts/qemu-binfmt-conf.sh
 F: scripts/update-syscalltbl.sh
 F: scripts/update-mips-syscall-args.sh
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 8f220e15d1..e4dcb17329 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -36,7 +36,7 @@ export SRC_PATH
 
 # Get the list of all supported sysemu targets
 SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
-   $(wildcard $(SRC_PATH)/default-configs/*-softmmu.mak)))
+   $(wildcard $(SRC_PATH)/configs/*-softmmu.mak)))
 
 SPEED = quick
 
-- 
2.20.1


