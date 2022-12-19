Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0576650641
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:19:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jM-0008V4-QL; Sun, 18 Dec 2022 21:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jK-0008SM-Vf
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:14 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jJ-00015X-BQ
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416293; x=1702952293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+M7+37H0131qu5DnZvJJSIbui8Sp1KNr5DG3bv1IxMw=;
 b=guGkl3CE+ZehpUQeb/ywDCMYhr2kgu5Yq0wgzCGqnEif1U3mpJNSSdwb
 PXnVk1cekVGgT4kDOPvwqSOpckaH1IBMj24ukWRB1CtF5Etog5HuyenIV
 lKT3eVVaeeFIE5YlKe4O1TFwNk0D1kyQ+fq7FD9okifUXEQj6MrWuzotB
 N3jg+nRn5F8WMavNiax6WhyBKpbTrNDnK+WHLrpzP4IdPoABP8HI183D7
 Fqbrby6RkJoxBbDO5vw7bsH4W2hLhM4zIEyjPe6ps9gX8N/wyJ9NTf6Kz
 Do6gD3ken8KXcoeCMrtAW82jqtcEpV8F/1YjHKCUCAh9gK/LaoCLtVvEK g==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199342"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:57 +0800
IronPort-SDR: LjUy/7GsZlr1GPj90i1YS38Q2JEv0GgNmV56rwehuDvqqUVpFXe9SQIikc5R1SxJvqP3giRFME
 LTdaDafTJaCk2RL61tPohwPsZT3lK/pqDw0TUpOWGvUrooPwtkzeRm/vHCahLUaFqsRA2McN3r
 vtldAY2/r0I+FKKGkM4cUTOCMWlAmoIdKlovp/ZyKSrcN68J/fK+6luNQcpuymnc9Qvlx+Q9Ax
 CxAKhBApnFM7vaM5FRBLCzyO/2PnGdOzDzgZtf/iIXSgKH8TikinwNp3KU9kQBeVdqvui710Id
 +Xc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:30 -0800
IronPort-SDR: URHj8SXh/Dq3Xn74dJxl6AdHt0SCHXMyE4RTL6OYq9DdBD6rZ9TsmFifDK90hrBgIPq4B86tpy
 XebkxUeAv/Vh+HGt8uUXctzwI4bZxnAM4dC1Kn+BsFNvacmJDwID5uWTRaRtrrGiky2tqRN37s
 O8ElRDsaUUCrwOPtRu/sxY76fMw1WoWOOnhCayAlKHcAM94HIIBB09eIHshLm286M998dYNTjw
 pzyNTilhOgshhHTRhAhRLLbTxnNR5Vg7xROk/x1YpSEurpNWBbFkJjfXz5BI9IoCL+qtv0/FlD
 av4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:57 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Jj1hnFz1RvTr
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:57 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416276; x=1674008277; bh=+M7+37H0131qu5DnZv
 JJSIbui8Sp1KNr5DG3bv1IxMw=; b=ZYm+xqghOTUQUDkRZmTAWcEW0QXt+OnYb2
 W2KcbKsW2t5tJmgtjmY3WEE6z3cr8p2HgN31nB67Up+g8Glwb800lcnSyFaFDKA7
 gArBgSz2bE1oGmSmutokd+xLG/5RVrTvYL0HlZEpzSsg5qZkNMdBeiKGsUfuH/xj
 WoTCPTwOxNQuEGwwuRiFHGdbsVDgtqo6jNiFmoVx4SwIUUTpU01fuWZtijRnw0Q1
 EkgRVTh5dDdpV2hNTtsjRhE+V6vjDLXQ04xjGcdx+tD8lgxCJ2PLVfCqCsLnJJ0E
 RZwO4f1LayTkLRGeBOvw6brOvVcku3FdYze3895hz5psSIMTRD2g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id GrDNfnEAGTn8 for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:56 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Jg311Zz1Rwrq;
 Sun, 18 Dec 2022 18:17:55 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/45] hw/riscv: virt: Remove the redundant ipi-id property
Date: Mon, 19 Dec 2022 12:16:36 +1000
Message-Id: <20221219021703.20473-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
2.38.1


