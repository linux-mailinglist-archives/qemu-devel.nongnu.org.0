Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E1B6788
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 17:53:56 +0200 (CEST)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAcHC-0005Jl-Mx
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 11:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49331)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsI-0006qZ-RZ
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:28:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbsH-0006iF-P4
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:28:10 -0400
Received: from mail-pl1-f170.google.com ([209.85.214.170]:45218)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbsH-0006hd-Ji
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:28:09 -0400
Received: by mail-pl1-f170.google.com with SMTP id u12so95687pls.12
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 08:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=ITYx9dUXd0Z/rGh2jtnGQVxEi9rjaCmMj8TUxH8w7iE=;
 b=bGUjePn9cAB4yp9MKp13YJ9ji6U/dFiXETxMepUt8rv0JKkjLYGpG+bwV6Wjx15JVo
 LNSsh1J9vervUU8G5A63JYu4BVT+0Ero/DjNmRrQWu5mwLSyClvH6W4oKgaIKyFH8xvc
 P7QfJSkV+dSxjxhZ3aJQ7SjZ98Hr/hq7JwgTlXnqoIZSS4k8+mP6unMFuumZO8YLBQF+
 gr1vKwno5D7Lv/dO6xABntSkeweHCYx36x6+POPeyz7kxjn18O/SP3fflizMmrdNEMSe
 b8+jx6oiK86ndqt06D0fpEOJNU7+y4+8oDYoCqSIrA+QyJRuj2XgHxLAfiF2CZcBnrN9
 KS8A==
X-Gm-Message-State: APjAAAVhYVy6HUGfXn526Rc0uUvf52JFaStJ+AcdFPHm0Ydw+prjxC5N
 72WUysA0Hdd9tG9rbHoCROzYdg==
X-Google-Smtp-Source: APXvYqyUT2835N7xd75T+UMnnDLWSsSjILwm/TFofY8CzjuB8MkKgB82oJC12N5L772yyZ7X80glvA==
X-Received: by 2002:a17:902:b287:: with SMTP id
 u7mr4728744plr.72.1568820488286; 
 Wed, 18 Sep 2019 08:28:08 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 202sm11186691pfu.161.2019.09.18.08.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:28:06 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:56:09 -0700
Message-Id: <20190918145640.17349-18-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.170
Subject: [Qemu-devel] [PULL 17/48] riscv: hw: Remove not needed PLIC
 properties in device tree
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
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, Jonathan Behrens <fintelia@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

This removes "reg-names" and "riscv,max-priority" properties of the
PLIC node from device tree.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Jonathan Behrens <fintelia@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 2 --
 hw/riscv/virt.c     | 2 --
 2 files changed, 4 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 762223c6fe..e8acdd9b12 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -180,8 +180,6 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_PLIC].base,
         0x0, memmap[SIFIVE_U_PLIC].size);
-    qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
-    qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
     plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6852178bc2..090512be13 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -244,8 +244,6 @@ static void *create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[VIRT_PLIC].base,
         0x0, memmap[VIRT_PLIC].size);
-    qemu_fdt_setprop_string(fdt, nodename, "reg-names", "control");
-    qemu_fdt_setprop_cell(fdt, nodename, "riscv,max-priority", 7);
     qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", VIRTIO_NDEV);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
     plic_phandle = qemu_fdt_get_phandle(fdt, nodename);
-- 
2.21.0


