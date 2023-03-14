Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E9A6B8B58
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:39:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbyIr-0004RO-Mu; Tue, 14 Mar 2023 02:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4300ac6ef=alistair.francis@opensource.wdc.com>)
 id 1pbyIo-0004Qf-R4
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:38:30 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=4300ac6ef=alistair.francis@opensource.wdc.com>)
 id 1pbyIn-00020C-5y
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678775908; x=1710311908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bClfELwB08urp8CbXAJKVnvdagZhKCaDt8ZhtgM4GwQ=;
 b=fDtYXLOENUJWNsAcLs+fXfp58HUfW+Peqalr7tc6EOoobUFroqxPKj2s
 WVDgYJZx2NYlX+Yz5O94++4VEkm87EnwlZEROdxVNN9DVrWhccjVwk5Nj
 aQ4tR8O2CRcH12zsEOmeXt1e6BEvkaDqCoze/3SZXH3rWKYEVzEcQSBRW
 GIfGqD+BfEai1j1jAN3QmveWp/p6wyR81v+e3W4aOd07VHYyCFMflpMTG
 rVXJe/qL34UH5tUYiXzbqWX7GS7BLw9PECukBMnMG6wzI4aOE4gPkhGcM
 KxIu9tGrIrTdf/jZCpaGwbs0X7GjF4Cwf9PpnEIU+xeFFQvJLkml4iNNG Q==;
X-IronPort-AV: E=Sophos;i="5.98,259,1673884800"; d="scan'208";a="225576410"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Mar 2023 14:38:25 +0800
IronPort-SDR: zP3SsoUEM02DzZQ4GYJ4je2s1gGqPjBVux+MyFrG2fvQV15UZbQ+PVkcaZQbtdemg2iI4Bby2y
 rbhcNmZjexMf8LJbkkKqtNoNXIHmJS63qKKPkCc1KJ7LzGZYmqPyxFQ3qFMGihVIiOzyBqhG9M
 tRakV0/Ae7RV4Cc3pfF+3wMZmI/hgCRlT+tWB4RHSXgInnYYEb3DvFfNCLAh6puL6XEzGS0fBz
 4tLykZ+NjahxS52rojZP96RwQxU10LFPFomP1D1ZSvMg+RBl3JNiu76C1py5F9W+hBHAU5lSsQ
 Xyk=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 22:54:54 -0700
IronPort-SDR: kDuTnFHw+XqCLlyUHrfdWUrmgYdgkSeKdKkk8k6ynsXHVMnMPwEtueZm+D8E/Qr+m7tN6WsVkN
 liJuX58tkTKcj9PIuBaygmAulqK9YQBhRzgCMOIbuZMv56YgtmuUmtZouDf5Ycmh1Fyfdi+B3V
 PNuv5rulZY0T55xG8NrHoWrkZdp3yXPU+SGEPD1MuNa2NlTkfEqmvHv+gaDFLsmN23V1mKij5f
 7TLekX/BxcMueYsauqknq4+PM7srysTPNYnqcOBQAZ2Q84+vsPsDinU61hRGDbaCL0ZSfSb0lY
 jwM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 23:38:26 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PbP420Bbgz1RtVt
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 23:38:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1678775905; x=1681367906; bh=bClfELwB08urp8CbXA
 JKVnvdagZhKCaDt8ZhtgM4GwQ=; b=QOTpFmVJQlPmA4fzjcptG4MNgFrtxkZbqz
 jOYHHmG7iODhyL1G+DjiOcmIEUyP3AYs0UDLoZLgaDKGHAy6dmCEioMPlf+OhvBi
 SMm2Iff4JyvmF0wIABP1VJItnT/CPrpdTlfO2fw4FxwZ1ZTGmb9CYxWFZIgy/+Zr
 GzFp8BopbhcZHJ8mRQHCqUoeLKEgJ+s7ZdSFv6/wXb1NFz/LYXofaZuEvLkeVNYG
 7yi8WV19bcRjCGCNVGtoDH85XLpbD0p/FCPNG0oQfXd093KcfJuAjdxfvxnkAO2r
 XjZx5vPilcyDasf58E3idKHprle1c4Moh8NhLpedZBR2l84R9CdQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 7DPS99od_d65 for <qemu-devel@nongnu.org>;
 Mon, 13 Mar 2023 23:38:25 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.75])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PbP4029Wgz1RtVp;
 Mon, 13 Mar 2023 23:38:24 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Mikhail Tyutin <m.tyutin@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 2/2] Fix incorrect register name in disassembler for fmv, fabs,
 fneg instructions
Date: Tue, 14 Mar 2023 16:38:12 +1000
Message-Id: <20230314063812.30450-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314063812.30450-1-alistair.francis@opensource.wdc.com>
References: <20230314063812.30450-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=4300ac6ef=alistair.francis@opensource.wdc.com;
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
Reply-to:  Alistair Francis <alistair.francis@opensource.wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mikhail Tyutin <m.tyutin@yadro.com>

Fix incorrect register name in RISC-V disassembler for fmv,fabs,fneg inst=
ructions

Signed-off-by: Mikhail Tyutin <m.tyutin@yadro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <3454991f-7f64-24c3-9a36-f5fa2cc389e1@yadro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 disas/riscv.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index 2aca11b90e..d6b0fbe5e8 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -1014,6 +1014,7 @@ static const char rv_vreg_name_sym[32][4] =3D {
 #define rv_fmt_rd_offset              "O\t0,o"
 #define rv_fmt_rd_rs1_rs2             "O\t0,1,2"
 #define rv_fmt_frd_rs1                "O\t3,1"
+#define rv_fmt_frd_frs1               "O\t3,4"
 #define rv_fmt_rd_frs1                "O\t0,4"
 #define rv_fmt_rd_frs1_frs2           "O\t0,4,5"
 #define rv_fmt_frd_frs1_frs2          "O\t3,4,5"
@@ -1580,15 +1581,15 @@ const rv_opcode_data opcode_data[] =3D {
     { "snez", rv_codec_r, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
     { "sltz", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
     { "sgtz", rv_codec_r, rv_fmt_rd_rs2, NULL, 0, 0, 0 },
-    { "fmv.s", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fabs.s", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fneg.s", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fmv.d", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fabs.d", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fneg.d", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fmv.q", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fabs.q", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
-    { "fneg.q", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
+    { "fmv.s", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fabs.s", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fneg.s", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fmv.d", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fabs.d", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fneg.d", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fmv.q", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fabs.q", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
+    { "fneg.q", rv_codec_r, rv_fmt_frd_frs1, NULL, 0, 0, 0 },
     { "beqz", rv_codec_sb, rv_fmt_rs1_offset, NULL, 0, 0, 0 },
     { "bnez", rv_codec_sb, rv_fmt_rs1_offset, NULL, 0, 0, 0 },
     { "blez", rv_codec_sb, rv_fmt_rs2_offset, NULL, 0, 0, 0 },
--=20
2.39.2


