Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B9065FA39
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:29:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCZ-0001Zs-8K; Thu, 05 Jan 2023 22:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdC6-0001P3-O6
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:03 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdC4-00088g-Co
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974896; x=1704510896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UcOlSMEVvhtHfKKjQDCrCJH12+yFVKia9CUL5SqGh5o=;
 b=IYOlnYQJfjOnW79sdr/VViVY75L4p72tpPQW1stFd+xyy4U4YBrph0sZ
 SgDWcWZHP6DowYseD9JiXynp1VqORGVhSKTCWvaNOVk+jTZAyb7klknCt
 jl81Iy2voOMp4/LGX5JtXxwGU9Pc55e1zRwcP7ShhYwUZEH3OFKTIM6Ua
 zLC5w7Nd7RewOAWFWu04Mwo7YejGcHlUtzzOBJtbA0Qv4Hc0uw1VjLgs+
 Yi2Vh9B5VtQOvehGJpzVNCfAkB8fx8/HEQ5LLb1cm9dG1pkPPeAh2l+Ri
 cNJtp5dt1qNxJM6FfgFYo17IHuxjVA9Wh57SzreG9IrKWk3V53EYiyxzq A==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254784"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:32 +0800
IronPort-SDR: IvO6aTVo/aPsfwcDyXjM/Qz3JBe2vQh3WZYr0K5gDBbJ2laXhqyHzkuJ+S2MV8AoTr3Y/KpCoT
 IKij6zWRpcOomhWK01HhYwkALZN+E0he3qqdvHhMckMHAGkocPDHSka79XXQY0Y6amUQDXhvO3
 Gp8P4gV72TBxTnpDjGgmo3Z/5kvZBRnX7tJNqQyTG9RzsjlfxhudvNsMB14ZJbw6VfAWHv4Tjp
 +FqY8TYq5qrnPSPDxjMwJaL7sczEBO+cxC8ZPX7e1UHtUA/nD6oBa1awrlJwfVQrVdsIR5L3MM
 D3M=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:44 -0800
IronPort-SDR: eHLeYLGz/SnCrgHP9EKRwi3hg08mduAzUa31RdDCRD+0ZUGKDSCZ/YyF9IYjuMGm5aQId2G45C
 7woZc7fRw+am088X7rhYSVuY+HFtnxKT9j3WKAZ/L3fW63ruHC1Aa/xicijJLQvoGqkKRlfi8C
 t8axqyg5qRQRVY+7plhqDut5hdX5jalwg1uBbuwCdJDauPuDMcFfegIE54jyDKr6u1jZbPBsUR
 jN6Htnh74AS5cg9XjdL1k8etlwQoKyS0SnJ60DGtfxL46ySN93TfFhxfgjWj2ibGc7XDAHQlhZ
 628=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:34 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jh70JGz1Rwrq
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974872; x=1675566873; bh=UcOlSMEVvhtHfKKjQD
 CrCJH12+yFVKia9CUL5SqGh5o=; b=ZLEja0v0J8HoalGsJwyjT92qKtuDfPgviQ
 v3SlcUOE3EgfoX9ArI9rewPb484w3acJizVH5C8PTwsByzLIntQljAyHV+hWmN4d
 rh5O4+65NiKfG/4qk+9DBpfnu5SJvAG+4oheHJkX6a6UYb6CDamYz0sHByXUW/Km
 HL59TeMHGsXtleHQqGozcJM8MdetMhxd3Z82NfwbOjr/wGTdG11APi8sAvFkhMD8
 bVq94WCNJcrKnYwiNN0vmzpjfuDBAXEkBLXBXbZ/1NB6meJ5Ui1rzyORGu7Ktsm9
 OOJft0XFqdYEABjUWEBN9pLwza5ZHR3gcYzE3BuyOClEIs9Ojlag==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ydSNFbStNpyJ for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:32 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jg1YNhz1RvTp;
 Thu,  5 Jan 2023 19:14:30 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 16/43] hw/riscv: virt: Remove the redundant ipi-id property
Date: Fri,  6 Jan 2023 13:13:30 +1000
Message-Id: <20230106031357.777790-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Atish Patra <atishp@rivosinc.com>

The imsic DT binding[1] has changed and no longer require an ipi-id.
The latest IMSIC driver dynamically allocates ipi id if slow-ipi
is not defined.

Get rid of the unused dt property which may lead to confusion.

[1] https://lore.kernel.org/lkml/20221111044207.1478350-5-apatel@ventanam=
icro.com/

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221122080529.1692533-1-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/virt.h | 1 -
 hw/riscv/virt.c         | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index be4ab8fe7f..62513e075c 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -93,7 +93,6 @@ enum {
=20
 #define VIRT_PLATFORM_BUS_NUM_IRQS 32
=20
-#define VIRT_IRQCHIP_IPI_MSI 1
 #define VIRT_IRQCHIP_NUM_MSIS 255
 #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b4..6cf9355b99 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -546,8 +546,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const=
 MemMapEntry *memmap,
         riscv_socket_count(mc) * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
     if (riscv_socket_count(mc) > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bit=
s",
             imsic_num_bits(imsic_max_hart_per_socket));
@@ -597,8 +595,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const=
 MemMapEntry *memmap,
         riscv_socket_count(mc) * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
     if (imsic_guest_bits) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bi=
ts",
             imsic_guest_bits);
--=20
2.39.0


