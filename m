Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122DA5333C7
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:06:35 +0200 (CEST)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdbm-0007ap-5C
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHX-00005T-BT
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:39 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHT-0002Yx-Ez
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432335; x=1684968335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jnl2HtZnNmgFrBR2MT4hFh8QF2tgzWiVwAm6MaBeh6g=;
 b=LL6FBYpyAHtKqjamz4aP9EG4CziJeXvuLCvsa3Zxpq7c6qO2Yra7/VIA
 IA3VfrZwZwrIytsxnyaFLR1NWtjoWtTDcaR6WXMIbIQB5Dp++O6ep6P4T
 BU6z1KwpfPogNwt0o+jNZlcj+FPQunZCYulAt6XWXOfwg54EQQ38lVFSE
 mdipcfeyXfpg1z9ztNNhID4c5UBbB+2DNvtWcHjCbXOc2lmGnMTu9bi6W
 nuZoStB8orBOQmc7aHoiIsCsesEqhYdlFwphbDD+QIO3RRFVONjGHXDVV
 uWHeuj+uoWIx44v6VouLbjbGKVb0zYjIk/2nUwfRqTC23AtDoZA7sVCMn g==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566702"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:20 +0800
IronPort-SDR: 22eHD0rkJVTwS7ZD2gI4UpDSs89Ph4gZpqIKRZSrkHAEa0u/0zWYkgOAYrMZBfXyu/xqsogBy0
 jDFR8pyYgL1zPfmpieT+7fShNhl+xe3dsVLcbLCDxHNR149Uzn0EaAi6TeSYf0NY5KtJLXexug
 5+a7xHk+QhfnIch24pq8Kje+b0xN4S3KeRzCK0TvYxzmfrlCXreykjaD4Wf1EMQqQRK/pLyoaQ
 xTH+P2SLji/kJ/vU9q87WB34bYzP8Mu4e96wpwoceu0pEUW5wX0yAK5NtKdBW+NpHOtdmRa3Qt
 V6UzTLBbBVUGY0Mj7OOkA973
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:52 -0700
IronPort-SDR: /xKv0QHO1wVN+0NCuuj46in5VBWjzbhGwYpuw65IfurAuW2q1Apu4GfraZPhwAOgypu0AKTsTS
 v8Ch2Xbq4+ZV/HtePupvxCWsF22HccoaZkEBnMzwpoeAIFLP/x7RyECWUIMT0hXQmfskNDLQlr
 dp7hEXTnmjz2AHaeBN/UFgdq4tvYtASGg9dBcT3jABYeyeijl4NZqMAD2WPq1/GX4sAkhoDUfq
 h0aAmB3iWznxhI9xb6clgE9EKLUhON/sGQZz14x+u1nSUpEZVtGB9oPaUatSkihDF491P/X5GZ
 ocM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78RN2s4Xz1SVp1
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432320; x=1656024321; bh=Jnl2HtZnNmgFrBR2MT
 4hFh8QF2tgzWiVwAm6MaBeh6g=; b=arCDp6US0Sv/RRiKbHWAPy+4dkeV7s6rE+
 /AzQY+U13RksFHKPJ5PUs63aQcMNciJGd3Rgjzm1N3c6NshgeBUzqV5XoippGgKs
 qZ8bYvqrjYf8R+It9mgZ46u7GGbCLlMmm1LnCwL3yViB3HIPKQYoztHAXLFq60+U
 Lp97GgXSUhTqua0Fc5LsoJMC49Mid/oA5wghJSoFZPdPpj10E6wcYeHDYRFMsMbU
 TXloRmiub8ddPLVdXWqHpVjBawidr71YeRz27481vUwAYE7vjg2+CZ+VYgNQx5DF
 YmN9apP//meaYWQRfwMnk+/rqTyZvrCTu+85GG1/mtLVYn69fMfQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id CpZhvwdbyOsQ for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:20 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78RK682Dz1Rvlc;
 Tue, 24 May 2022 15:45:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 17/23] target/riscv: Fix csr number based privilege checking
Date: Wed, 25 May 2022 08:44:22 +1000
Message-Id: <20220524224428.552334-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

When hypervisor and VS CSRs are accessed from VS-mode or VU-mode,
the riscv_csrrw_check() function should generate virtual instruction
trap instead illegal instruction trap.

Fixes: 0a42f4c44088 (" target/riscv: Fix CSR perm checking for HS mode")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-Id: <20220511144528.393530-2-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0d5bc2f41d..6dbe9b541f 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3139,7 +3139,7 @@ static inline RISCVException riscv_csrrw_check(CPUR=
ISCVState *env,
     int read_only =3D get_field(csrno, 0xC00) =3D=3D 3;
     int csr_min_priv =3D csr_ops[csrno].min_priv_ver;
 #if !defined(CONFIG_USER_ONLY)
-    int effective_priv =3D env->priv;
+    int csr_priv, effective_priv =3D env->priv;
=20
     if (riscv_has_ext(env, RVH) && env->priv =3D=3D PRV_S) {
         /*
@@ -3152,7 +3152,11 @@ static inline RISCVException riscv_csrrw_check(CPU=
RISCVState *env,
         effective_priv++;
     }
=20
-    if (!env->debugger && (effective_priv < get_field(csrno, 0x300))) {
+    csr_priv =3D get_field(csrno, 0x300);
+    if (!env->debugger && (effective_priv < csr_priv)) {
+        if (csr_priv =3D=3D (PRV_S + 1) && riscv_cpu_virt_enabled(env)) =
{
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         return RISCV_EXCP_ILLEGAL_INST;
     }
 #endif
--=20
2.35.3


