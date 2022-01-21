Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A98B495B79
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:00:07 +0100 (CET)
Received: from localhost ([::1]:57836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAoq6-0002Wm-5r
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:00:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0W-0008AP-9b
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:44 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0T-0004B6-MA
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744961; x=1674280961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/zgfZghHBu3+q1V/LGLsyQeLxybtBrIXMA8OF4Db8Mw=;
 b=B2kDt6pR9oOFnopOrKyppeky0bdJBcQFErV9ORTpN++zBtNg9CiJS0bU
 UF0dwD+fHjdaIuNtO7ax+OoBglHojWoCoxmkR6mvGh3QR4VoYiupkM8Kl
 z4Rn1bw5UlS65dSrAy3leADd9sZ5LAg28SKInJbJq48l+Se5qQ2kGpEUX
 x1TDW59bIqebNZzzdDEFWemsubssN7cNLUes60KYXO6l+vcEBJKcwIWCq
 mskElApIhrOW2vV+aNO/f9qrebY4mR5pT5EcZYuYAMffwhaI1tujjvuho
 bYE0HiClZ4jTZ34kpWgFR7UbbmDJ+NkqddmNAwL+CFE8Y2rEKpEplkmGO w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083033"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:01:20 +0800
IronPort-SDR: uODkHnJ8+K0sf1ZBsU0URPBG6I1SwxcQAkXYtQQZEI5SkBO2P6TWENMsNRUzTch6IrEzRs8XaK
 Bqj793+DR9Y7n2fcG1vgxi8OXkSI4s6kUclbGy5gTHlVw4QRq4+ovFbUV6img+84D1v6e96cKB
 Xsfx0QqYKqcUzP7TKfvctbmri3ApVszM/3/9e4A+wE3nHVClY0B/5Qp5DYZ6IcWfe6rrwZsCjF
 S05HgEQxFqdf/V8YlV9qIBVANDWojT/8eEu8V+3atWDQP/BMZSc4j+pZn+3EMu9p6Tir7JZtAb
 tMkJrWRFHvwSzNlTtJ3LKjAP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:48 -0800
IronPort-SDR: t32kWVkOVqxzrqK6N5Rb0hauKQcraV2+j3MVxlO9z+Ji+LHVFpmelzVgwKgUxaBr8zDWpk77ew
 tKPkgcS9focUAuMUIGyeaP2kBd5kKK3Blj7dJasUqaSmbMObJZhZ7g92eb7qfJIP8geJrQZNnq
 DWIstOg3WbKLCq9nH//63iJsTcADqlqNfJ2tqbUddq817B6K4y8/mVPuWBsdZWT6ysLn6nWNHa
 NOQoQNHVdj+jI1/gF6FdhuMAVhsDzetc5MAzgruuiVthImwxsgKOv29tnx44YJZ8hkDNXwkrDk
 cH4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:01:20 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7zh37wDz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:01:20 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744879; x=1645336880; bh=/zgfZghHBu3+q1V/LG
 LsyQeLxybtBrIXMA8OF4Db8Mw=; b=RhjkY6f9sUWA/MY7TAobQJt5vtXqg7XCFl
 ROtDAXcCceoGlWCK3nd+9YQn3U6jI2KojRQATFkwLOwuipZogBdYpZM8EQN3QZyg
 pmxg2jR5JJWnp8u4R0WPoPtCjOmO0WoSnNszXwkaY6/ajQZkTK794w4VeWQwKMjC
 IGF1FsV1bweeqInUm5sfEcqpDLJCWHFlz0Bk/5nAMBPCI7H0AcUVbeI+b1ULDL1L
 W5dJ5skmUXdbwgBnyHj1a71eyklQnZmBpWnJZd414H/8cejZNOiOCArIfPN3cWnB
 ega0UVnumk0QTkI+9sKj+nusifJXlQOASXwlVPD4ARksQjUBmOjA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id t9LvGBxXuDdd for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:01:19 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7zc6msJz1RvlN;
 Thu, 20 Jan 2022 22:01:16 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 38/61] roms/opensbi: Remove ELF images
Date: Fri, 21 Jan 2022 15:58:07 +1000
Message-Id: <20220121055830.3164408-39-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <apatel@ventanamicro.com>

Now that all RISC-V machines can use OpenSBI BIN images, we remove
OpenSBI ELF images and also exclude these images from BIOS build.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .gitlab-ci.d/opensbi.yml                       |   2 --
 pc-bios/meson.build                            |   2 --
 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf | Bin 838904 -> 0 bytes
 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf | Bin 934696 -> 0 bytes
 roms/Makefile                                  |   2 --
 5 files changed, 6 deletions(-)
 delete mode 100644 pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
 delete mode 100644 pc-bios/opensbi-riscv64-generic-fw_dynamic.elf

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 5e0a2477c5..29a22930d1 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -43,9 +43,7 @@ build-opensbi:
  artifacts:
    paths: # 'artifacts.zip' will contains the following files:
    - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
-   - pc-bios/opensbi-riscv32-generic-fw_dynamic.elf
    - pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
-   - pc-bios/opensbi-riscv64-generic-fw_dynamic.elf
    - opensbi32-generic-stdout.log
    - opensbi32-generic-stderr.log
    - opensbi64-generic-stdout.log
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index 1812a4084f..4ac7a5509b 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -80,8 +80,6 @@ blobs =3D files(
   'hppa-firmware.img',
   'opensbi-riscv32-generic-fw_dynamic.bin',
   'opensbi-riscv64-generic-fw_dynamic.bin',
-  'opensbi-riscv32-generic-fw_dynamic.elf',
-  'opensbi-riscv64-generic-fw_dynamic.elf',
   'npcm7xx_bootrom.bin',
 )
=20
diff --git a/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf b/pc-bios/ope=
nsbi-riscv32-generic-fw_dynamic.elf
deleted file mode 100644
index a19363e27c..0000000000
Binary files a/pc-bios/opensbi-riscv32-generic-fw_dynamic.elf and /dev/nu=
ll differ
diff --git a/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf b/pc-bios/ope=
nsbi-riscv64-generic-fw_dynamic.elf
deleted file mode 100644
index c59573d026..0000000000
Binary files a/pc-bios/opensbi-riscv64-generic-fw_dynamic.elf and /dev/nu=
ll differ
diff --git a/roms/Makefile b/roms/Makefile
index b967b53bb7..5e44d97890 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -178,14 +178,12 @@ opensbi32-generic:
 		CROSS_COMPILE=3D$(riscv32_cross_prefix) \
 		PLATFORM=3D"generic"
 	cp opensbi/build/platform/generic/firmware/fw_dynamic.bin ../pc-bios/op=
ensbi-riscv32-generic-fw_dynamic.bin
-	cp opensbi/build/platform/generic/firmware/fw_dynamic.elf ../pc-bios/op=
ensbi-riscv32-generic-fw_dynamic.elf
=20
 opensbi64-generic:
 	$(MAKE) -C opensbi \
 		CROSS_COMPILE=3D$(riscv64_cross_prefix) \
 		PLATFORM=3D"generic"
 	cp opensbi/build/platform/generic/firmware/fw_dynamic.bin ../pc-bios/op=
ensbi-riscv64-generic-fw_dynamic.bin
-	cp opensbi/build/platform/generic/firmware/fw_dynamic.elf ../pc-bios/op=
ensbi-riscv64-generic-fw_dynamic.elf
=20
 MESON =3D meson
 NINJA =3D ninja
--=20
2.31.1


