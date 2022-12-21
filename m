Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71C7653902
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:51:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87oF-0003O3-Hu; Wed, 21 Dec 2022 17:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87o7-0003Fc-4N
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:27 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87o5-0000bQ-HG
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662605; x=1703198605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B4bsb7C+WvHwOgjHhyitFcg8hTn062ir9rkIHz/V44c=;
 b=hQHNG4dTMbDdgQ6IunGiNACkZ2X9jtE5iuRJ38l0BSVsxVzaaWr9Z54Y
 h+Y8wCrmUa/DuPj14szM3/4XBxK87LyQtsT4e9vK+DG5sZiyWJFYlOiAF
 COv1Isr7kS4od0fuAPCVT5V56sp1jlDy4+Pu8j6fDceELqty3h67ql79H
 cs/gXfrxqe/735GZP8K3xqv93c/f2vwtl6XW7vCGbWd7hONnkbx2AsQt1
 da5I9yHfiHMdSAEpFvtuxvzDxjSmqmJb27m/5X0MXQDutpgghY5Pf1wnI
 0SAtY/R0NmUctxtPkNsHgTqy1878+X1X0Ak7oENIBszbqFxpjgcMTT4Lg w==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561469"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:57 +0800
IronPort-SDR: bZ5TWgYzh85rHN8geTbgJjS3ye/2rj7LXeKgVxwFdf/DLfG13vlYYK0K4ldbQqo3mgx2TVqZAI
 PKxlPBpfiRqhcDq5zVkL7qdc69jV+Ny++PLFkc/LWN3rO6Py6nUpekH5IRCuhFCMwvQGP/e0lc
 kGgAT3dxETDBvaH15jQ/xP7BKYa7zQ+UHNzAp7M2+0bVBn49vWjTeDR60fmcx9J/BcJ6fqKWMT
 9Yu/yzJLuT5yVv1qoHhCXaD3xj1R69qk3M1xoNTjj60r5fsGYhgmmAAoPI0iy3eeB8QZFE4Lxc
 Il4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:26 -0800
IronPort-SDR: QZl4uUWuVMyKqFpn++23nptAMNwSvKc8ISP+ekuyHKZWjTzEsLVCmKijSMepIejbpuR1RJJjFH
 JCjwWdQkRM2I2mNwtolBt5w/rH3up7rQ2+CGsmYvSiqNAQ0zI3wEA3X9jtfaS6cTkMVrdVO0KZ
 G7segMwJBj8C2Nl2iysjuPtDv9baH4Xwp6xChCOVCepmdhXoqEZyV/TAN0GHjdrQW8TLktE4z4
 qhK7iHi20wyUoV+hk4jo2PZci9Vbj3bp2HlpDw1UV80hMIoFu7cKf/r3R5hODcDKmE3bYG+WFz
 M04=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:58 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpN528ssz1RwqL
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:57 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662516; x=1674254517; bh=B4bsb7C+WvHwOgjHhy
 itFcg8hTn062ir9rkIHz/V44c=; b=lmzC9D683hnOOWfaS2qDvhr2fCMxjAF+2/
 bz5IW8zB0eUIcV+SIeYDIwxwAvtVKti0RyS5fnxlqjqf09MPuf6e0ntBzCpKjvVk
 zY0RqmfI6lkPE3X4x3XtEBm32SUiWCJqqY62TSn3xlOkKw+gk1BuxRqIY0L4gkVH
 6DwK5TlzAU1vsf3dTFhXeGw/2XjLFVjpV0Qn6z53QMm9PxLn/OfHw0ZsYHh9bo1z
 r0bdjdL5BBgj38iiyTroK8+d2RfUm5EdpBZMp8d1pZN8j9yZZ/5tvmKixLzgCRSx
 lHeQMDhjEqmgQsA4mTZabdyOZWYvxQTplT8dcrZBcZggWCicl+hQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5AChHbwDp8uT for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:56 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpN24z81z1RvTp;
 Wed, 21 Dec 2022 14:41:54 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 41/45] hw/riscv: sifive_u: Avoid using magic number for
 "riscv, ndev"
Date: Thu, 22 Dec 2022 08:40:18 +1000
Message-Id: <20221221224022.425831-42-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

At present magic number is used to create "riscv,ndev" property
in the dtb. Let's use the macro SIFIVE_U_PLIC_NUM_SOURCES that
is used to instantiate the PLIC model instead.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-12-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index b139824aab..b40a4767e2 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -287,7 +287,8 @@ static void create_fdt(SiFiveUState *s, const MemMapE=
ntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_DEV_PLIC].base,
         0x0, memmap[SIFIVE_U_DEV_PLIC].size);
-    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev", 0x35);
+    qemu_fdt_setprop_cell(fdt, nodename, "riscv,ndev",
+                          SIFIVE_U_PLIC_NUM_SOURCES - 1);
     qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
     plic_phandle =3D qemu_fdt_get_phandle(fdt, nodename);
     g_free(cells);
--=20
2.38.1


