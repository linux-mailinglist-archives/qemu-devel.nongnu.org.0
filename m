Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B8E3002D8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 13:27:21 +0100 (CET)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2vX7-00036Y-1n
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 07:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2vUG-0001n8-Ft
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 07:24:24 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:40376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2vUE-0000ph-R4
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 07:24:24 -0500
Received: by mail-pj1-x102d.google.com with SMTP id m5so3651328pjv.5
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 04:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94C77uzbMvsJS8KdB0RwGddKHiPZdeZzumFBF2m1OCI=;
 b=bCNuwhS5WsINge/enJPpk7AbFcDdhHUFV3B3FkouEMdXAAmuw4D6a1lH3jrFMuLEfK
 gD9hn2hDCjBRCuJiCqYX4HOAh81cWaJGZ93zVOLGDToY7w/kOx8yrj53dRTiSUnN3bMf
 xXzrgHKDkFZ1I+1+94+fs7nT7MvklwGvxPwhG5/1L0Hll5P0KBNPnIfFxsFrm0Hj7T6H
 BypdO8JSzInfmWI1L1T/Y6gdrje+5PigedpLb7Itx637MJRtrBTXnvH5NawR0W2TPkIw
 Bx/cV1HX9nEYE3VMc8//mDZKTse40XTssZeMD77pHgB8miLjf0splgb/kcBzen/GWVtQ
 gqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94C77uzbMvsJS8KdB0RwGddKHiPZdeZzumFBF2m1OCI=;
 b=Ug+RCpHmCZdwy5iClaVc7jHroaYRI8Rq7s0hN0cxEDKzBWAz1dIRXRhaxY2oT3HCxg
 OvA89G4BNS3a300AjDKKRNhZymerpbj5zXsRWJu++CQquf2A3aOqYE0/oNp32MAQXP/L
 J8k+fkMxmIZg+W8XKI7nrepAuyYr8GzIbYTa9DfG2iYuGDdfZV0yezpygTgisU4pz+rj
 Nkey6lHRxSb/v2+iaXm4FxjMAP37egabQM1DoiZnheTYaE6+ZdAoyvwKmjJRr9359GRg
 NgUuBAgr3yE06pfFSCvjEqb8tMNuH3mIwoFuOnjx1S/vKjxgR5rekbmJotuqIVl7Yy4O
 jdeg==
X-Gm-Message-State: AOAM5303XoOEuftfxP4xArWuZNZEVkZas/bxwZbxIPVH21mdBX7vXTiN
 Wt6M8C7tswvxaT9YlAk5/ag=
X-Google-Smtp-Source: ABdhPJxkqXRZ/SmWOg8zbTxzmacfZdjDzURTKV2xeKnyUpDFxsXw6SA2LVNT5Le4+NoFs4L+mR0DBg==
X-Received: by 2002:a17:90b:a53:: with SMTP id
 gw19mr5159677pjb.192.1611318260114; 
 Fri, 22 Jan 2021 04:24:20 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y16sm8240093pgg.20.2021.01.22.04.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 04:24:19 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Subject: [PATCH] hw/mips: loongson3: Drop 'struct MemmapEntry'
Date: Fri, 22 Jan 2021 20:24:04 +0800
Message-Id: <20210122122404.11970-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

There is already a MemMapEntry type defined in hwaddr.h. Let's drop
the loongson3 defined `struct MemmapEntry` and use the existing one.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/mips/loongson3_bootp.h | 7 +------
 hw/mips/loongson3_virt.c  | 6 +++---
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/mips/loongson3_bootp.h b/hw/mips/loongson3_bootp.h
index 09f8480abf..d525ab745a 100644
--- a/hw/mips/loongson3_bootp.h
+++ b/hw/mips/loongson3_bootp.h
@@ -228,12 +228,7 @@ enum {
     LOADER_PARAM,
 };
 
-struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-};
-
-extern const struct MemmapEntry virt_memmap[];
+extern const MemMapEntry virt_memmap[];
 void init_loongson_params(struct loongson_params *lp, void *p,
                           uint64_t cpu_freq, uint64_t ram_size);
 void init_reset_system(struct efi_reset_system_t *reset);
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index d4a82fa536..b15071defc 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -72,7 +72,7 @@
 #define RTC_IRQ             1
 #define PCIE_IRQ_BASE       2
 
-const struct MemmapEntry virt_memmap[] = {
+const MemMapEntry virt_memmap[] = {
     [VIRT_LOWMEM] =      { 0x00000000,    0x10000000 },
     [VIRT_PM] =          { 0x10080000,         0x100 },
     [VIRT_FW_CFG] =      { 0x10080100,         0x100 },
@@ -86,13 +86,13 @@ const struct MemmapEntry virt_memmap[] = {
     [VIRT_HIGHMEM] =     { 0x80000000,           0x0 }, /* Variable */
 };
 
-static const struct MemmapEntry loader_memmap[] = {
+static const MemMapEntry loader_memmap[] = {
     [LOADER_KERNEL] =    { 0x00000000,     0x4000000 },
     [LOADER_INITRD] =    { 0x04000000,           0x0 }, /* Variable */
     [LOADER_CMDLINE] =   { 0x0ff00000,      0x100000 },
 };
 
-static const struct MemmapEntry loader_rommap[] = {
+static const MemMapEntry loader_rommap[] = {
     [LOADER_BOOTROM] =   { 0x1fc00000,        0x1000 },
     [LOADER_PARAM] =     { 0x1fc01000,       0x10000 },
 };
-- 
2.25.1


