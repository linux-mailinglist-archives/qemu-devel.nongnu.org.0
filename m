Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E590DB8DC3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 11:28:38 +0200 (CEST)
Received: from localhost ([::1]:57048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBFDR-0003jo-G9
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 05:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBF8K-0005nI-Ti
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 05:23:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1iBF4G-0002nx-OS
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 05:19:09 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44927)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1iBF4G-0002nb-HY; Fri, 20 Sep 2019 05:19:08 -0400
Received: by mail-pl1-x641.google.com with SMTP id q15so2888072pll.11;
 Fri, 20 Sep 2019 02:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=m9UduNtnihfL2Oqo445LRoF5PGEV/LiXCQ4Ew/lAK+U=;
 b=LyOoewGNLDkcKhlgHT2gTSOZ9v7FMPyPHHnyk3yJkiBLy4wFcciZYH6hfqH56iJxby
 zYiar3xBTY/b7vdzdSiRLlhYfn7ZHBMdkgpZI2AMDEja+BSTzSHIoaqhKW13KD8Mk9/n
 AqrQzZx1sY4UYtK85U/6DpY6vOEfWQOUopFiWdCIeveA/2dWz7FV+7vjjmyNGzWixPfS
 G3ujGOkI3/ZHt1k+rjUoGBzI5m1ZndLm0cLzor0W5YD4+1uDlLqXi/bUTcXpFekcGcHp
 21y3JlPkNV8izYWbxYFJclwBIRC09QSyDhlV3EeHjHLCBHYeR9rFy48NBcKeCBLvXnsY
 KmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=m9UduNtnihfL2Oqo445LRoF5PGEV/LiXCQ4Ew/lAK+U=;
 b=sMpRIkNSl8G9BMK2GtDiZJnBDABUjQ3mcRimoyb3g5BqpXXWFZAcBtg7w1NLgjEOrr
 vBiVhbucIX3yu2HhRZhbQbPH8au9ONB82sj9yrIE2hL3qGJr1RJz/217TyT0j2OeToy3
 htIgx/jBQ+y6uEbCY9nLfMPL5QaQmw+vfhJSn2V0hcIHK23j0RCMgmgo2IF/h26myTBG
 QiUZImdOHQlTUWHSc2aAJw3H6lQ8333FCnIDdoPQmqyCD/SOK0glSCoSGRxV329OFF/Z
 PMOnzQ1zghVwWiMEGguL5io8ssSKEkdVatAWs2fvd3zjTfs1sSrzTr4bUonWXjSc2pBB
 oyAg==
X-Gm-Message-State: APjAAAXYdVgb0iG0707cNhM0/hqkWQ0L77ZjznwpylPb1UBB3L2FMuvM
 706cMPx5D566ncr3aanpyZo=
X-Google-Smtp-Source: APXvYqwhctsHGWX1V0uUa4KzrkxilqzyC6XfZzayC+EJiePEktopX5vqX/6qUcMargGcqixguHEE2w==
X-Received: by 2002:a17:902:7c94:: with SMTP id
 y20mr3759593pll.229.1568971147620; 
 Fri, 20 Sep 2019 02:19:07 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id m9sm1500731pjf.11.2019.09.20.02.19.06
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 20 Sep 2019 02:19:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH 1/2] riscv: sifive_u: Drop "clock-frequency" property of cpu
 nodes
Date: Fri, 20 Sep 2019 02:19:01 -0700
Message-Id: <1568971142-27979-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "clock-frequency" property of cpu nodes isn't required. Drop it.

This is to keep in sync with Linux kernel commit below:
https://patchwork.kernel.org/patch/11133031/

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/riscv/sifive_u.c         | 2 --
 include/hw/riscv/sifive_u.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 9f8e84b..02dd761 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -151,8 +151,6 @@ static void create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
         char *isa;
         qemu_fdt_add_subnode(fdt, nodename);
-        qemu_fdt_setprop_cell(fdt, nodename, "clock-frequency",
-                              SIFIVE_U_CLOCK_FREQ);
         /* cpu 0 is the management hart that does not have mmu */
         if (cpu != 0) {
             qemu_fdt_setprop_string(fdt, nodename, "mmu-type", "riscv,sv48");
diff --git a/include/hw/riscv/sifive_u.h b/include/hw/riscv/sifive_u.h
index e4df298..4850805 100644
--- a/include/hw/riscv/sifive_u.h
+++ b/include/hw/riscv/sifive_u.h
@@ -75,7 +75,6 @@ enum {
 };
 
 enum {
-    SIFIVE_U_CLOCK_FREQ = 1000000000,
     SIFIVE_U_HFCLK_FREQ = 33333333,
     SIFIVE_U_RTCCLK_FREQ = 1000000
 };
-- 
2.7.4


