Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A49495A9B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:23:30 +0100 (CET)
Received: from localhost ([::1]:34140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAoGf-0001gu-N9
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:23:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyV-00070g-N5
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:40 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyG-0004AK-S4
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744824; x=1674280824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WZAO9+Rph4XXyW1b/BH9rX/CC+XJHAVd/x9sAayd6Ao=;
 b=Jl/amEe44NLU2jXgnxMqvRHZuLs7wbkrga6hmslisWyUH86DMiWHQMsZ
 MnBzzjTsw93852YcXXEcQSCWr10NMJF5OUs6x4ZXtbjtIXry7hFdu/TXG
 MMmIHQBLmG9BPSwb9DnbClXCOkj4wBhYXb+QSBsrboVmQs45p7ULrHZUU
 JY2iDjVMjYuUS/xAp6hkjDvlN4fY2bLf/mS3SdknqoC/wkLQiDh81exkD
 MzFZ4EfnZ+zw4smqe8sit7hCrj2ESyUwxqdy70PsIz7k1I6eAsVBlneS3
 Bz9BRyGSDxZDBTwNiJwP7681Bky2ZHW9FBJw/qfmSymLnFVGk2gREjK2w w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082928"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:23 +0800
IronPort-SDR: +FP7zSKcDYGsJjSkIBNYqg5NRWcsOA4qsVXuS2HHIK41CKXwgtgkIyibamLAa5KQyhP/YSk91x
 R7gzRk0/6EAsgbYY/r66/dXKueBKizEsjPJuljnGkg4FpZ0gKRKdbyQUrMSC7uOhXzT/qye+a4
 JAfWzC/3KbQZdKjVriRb/7wp8116ciQIoBeSCBzPBRDNleJiI3OJLvb6IC57YrXm8JGJTa8nP9
 qw463Ff2dX7zHaQG1CFMdtdyp+mwXC1f9HeQOrkVJxIoRYHeTLaDuuPrtSoatSmz1rEV9LvVma
 qyddU2tIr9OgqLHf6FILQ4O1
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:33:51 -0800
IronPort-SDR: yAYty4qT3Hlr9rkYOMX5rr/BNTWpTqM/e+EsC+yDqwseb6qWiTJClrEeFasSbmy5ul4NqpVeV7
 VnvU2HNXTLn7MTzH1ME41273Fz5r3OTnF4RN5ng//IDSQh+t8WtCiDElBmkD9Dn/K8+h1fFJG6
 U6AwWbhWHM/ts5J1BgQD/qv0fWBv9EFv+jRGxlFPOv29ZFk0YHKqLkAb6COgA9xNwuGdtMKdAd
 RN1by9FfytYPhqPLTDX+ZRpeH1zGGubVe7AEWyL1v7xjt7lQ9nk47NtvJR+zzBYSn3bWzvYFqN
 rgk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:23 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7yb2SPYz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:23 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744822; x=1645336823; bh=WZAO9+Rph4XXyW1b/B
 H9rX/CC+XJHAVd/x9sAayd6Ao=; b=p7eCC1OF/QpkEcHR9BxTabUguBkGESdXCE
 wM1iDR4pYU/tMB7fPQ62SLBrBumCj10v8lPlOsIeDbmGTuIHGVsnIjYelxInMuSq
 w7VxF3DlobInK0aDK4CUyrJbkbO3LZ6TnV4VOLGFGu4bq1+uGzyR59KylF8yEErp
 XaOO21tbq3f+AjMmFJMKJ/AzBe+BMXoXQcrtak+cQE5q1EU32fli2z8Ebh1rZYCr
 3VosKY44myAmhaq7TDwLnuaFuUaJ686JLnetqdqpiMkMzsZwEuoYXweNRvkLq+83
 Z3GNzl3LBgFmc148f4fRAtGhVvPqv6jSUCN0c245XnxDNgBa5ZnA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id U3USLOr3t3gD for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:22 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7yX1JgWz1RvlN;
 Thu, 20 Jan 2022 22:00:19 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/61] target/riscv: rvv-1.0: Add Zve64f support for vsmul.vv
 and vsmul.vx insns
Date: Fri, 21 Jan 2022 15:57:52 +1000
Message-Id: <20220121055830.3164408-24-alistair.francis@opensource.wdc.com>
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

From: Frank Chang <frank.chang@sifive.com>

All Zve* extensions support all vector fixed-point arithmetic
instructions, except that vsmul.vv and vsmul.vx are not supported
for EEW=3D64 in Zve64*.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-6-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 27 +++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index e64dddda28..8e493b7933 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2123,8 +2123,31 @@ GEN_OPIVX_TRANS(vasub_vx,  opivx_check)
 GEN_OPIVX_TRANS(vasubu_vx,  opivx_check)
=20
 /* Vector Single-Width Fractional Multiply with Rounding and Saturation =
*/
-GEN_OPIVV_TRANS(vsmul_vv, opivv_check)
-GEN_OPIVX_TRANS(vsmul_vx,  opivx_check)
+
+static bool vsmul_vv_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector fixed-point arithmetic
+     * instructions, except that vsmul.vv and vsmul.vx are not supported
+     * for EEW=3D64 in Zve64*. (Section 18.2)
+     */
+    return opivv_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew !=3D MO_64 : true=
);
+}
+
+static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector fixed-point arithmetic
+     * instructions, except that vsmul.vv and vsmul.vx are not supported
+     * for EEW=3D64 in Zve64*. (Section 18.2)
+     */
+    return opivx_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew !=3D MO_64 : true=
);
+}
+
+GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)
+GEN_OPIVX_TRANS(vsmul_vx,  vsmul_vx_check)
=20
 /* Vector Single-Width Scaling Shift Instructions */
 GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
--=20
2.31.1


