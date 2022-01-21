Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C938495A70
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:13:53 +0100 (CET)
Received: from localhost ([::1]:56912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAo7M-00068r-8x
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:13:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyN-0006yk-Gv
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:32 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyC-0004B6-Ii
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744820; x=1674280820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CwqZRS63jly+7oXNlZgQeFSepPZUNPK7myVpe15Dmh8=;
 b=hxUuh3yOkI4NNGTza9b9DXI+c8XCrckyqqY2Gc6eKBW7EhkT75nU+kqC
 tOuLoJz1haG+43CQjasC1JBxwwykjJd+bkD26W5dMUyCcG3RCYYEe2urj
 mz7VhA/bpd0TVeq1FgxskG3QOt4Arj2NpgM5bN21h5gN9uqRNDZ1Z49HU
 y+GaJUohrrEJoK8vVCBTYqN2Y6vzxBn9T/l0Qu8oSHTB3A/zGTmJQpti3
 KRiplT3gYHyQtADjPZw3Q0DhRmcpAjt121XkL8Q7tSlPwNRbjQpJzrVXm
 H38ti1iF9Fb8iqBeDM8Dx3KvVrCfgflTOIQH/DCnW3UkbCWSRPNs03SJV A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082921"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:19 +0800
IronPort-SDR: mEMSkJ6CoXtpgfX+haLcZdmwF3cH27F3yxlbBLst/snHQ27JiK3CoybbTIntj+uSRvQU25X22n
 ebZToEI7lksyol3V0dOBZIkwZgbRWyhsvrkurkYm06UVL7E5R4T/76KqroulVIujqEZbPCqdX4
 y9d3e+Hgy/TLSaee3Prbme3ufYspPlZ6JlPCkhQmt0WCbYK3R0kNw5j3pG0K57MAXM4UgSmKSy
 A91+uKrKcF1XoTxWVjUl083dbd0Tk2tS6bBPBI9RAnxTemKRLXwBH3TJdxXDwEG52x/scPbPHC
 Iwf3oBhxFjYetWKkMiQj9HrB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:33:47 -0800
IronPort-SDR: 21ENmzl9jrjG1f/7m8MG09YKbkmnmideW5WJlbvoqbp3F7EVGw8i3dFh0dZh/KgMsMfY2PPWjm
 AOpCfTSdC9VsIW5cM2sdIqMC1Vt9j7EiZPZS+sDZOYrRqZPNdApqrzrBLw1RH5BXxX3mcCCZNd
 aON6hNkcgGF516wMLfd704NQjQyJl2M+pktsIi8frwgP9u3GjwMLy9l1gu0lkggLL2kc+ZQ2kE
 b2L43/iuRRYgMWEQe7hyBSWiX/RjTDPLbxIpz6KgIYwVmLCqRWmyIjjAT/1OVFYtQFUhxHL7Fo
 EHk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7yW3NPSz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:19 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744819; x=1645336820; bh=CwqZRS63jly+7oXNlZ
 gQeFSepPZUNPK7myVpe15Dmh8=; b=t39pPr8SP2kS89ibCeKAdDSaIQ6h+Suipw
 d8KIZEKOx3KSQdMp4QfGy6QWj16pYytiAI6WqAsnuATrLpmEhVu3uqUwTt290o3K
 Q7+xbEa0zFE3+soOYRwdShYwSlXAsVNUWSyKztXOrxruPFQ4DtaQYln4P6ZaU+B2
 YNPZXceUyvfK0HqfUU2/q7Yw0zfg6XdIZfdrX52t9Z3/03N0e3O0x8PXT2iDP7P8
 CDWApJxeYK3BTS65cqGRlDWfa8Tg3h1o12zdLdk9NGeiiKBnGvaTqDqUKj88jNJ9
 0MzuFyHhLpDOKPXG6TePcoLxVmCQgCKDoCoTgz/eqAuN4hhgqUfA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id akirQpDZFkpF for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:19 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7yS3HBxz1RvlN;
 Thu, 20 Jan 2022 22:00:15 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 22/61] target/riscv: rvv-1.0: Add Zve64f support for vmulh
 variant insns
Date: Fri, 21 Jan 2022 15:57:51 +1000
Message-Id: <20220121055830.3164408-23-alistair.francis@opensource.wdc.com>
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

All Zve* extensions support all vector integer instructions,
except that the vmulh integer multiply variants that return the
high word of the product (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx,
vmulhsu.vv, vmulhsu.vx) are not included for EEW=3D64 in Zve64*.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-5-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 39 +++++++++++++++++++++----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 0bf41aaa1e..e64dddda28 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1908,14 +1908,41 @@ GEN_OPIVX_TRANS(vmaxu_vx, opivx_check)
 GEN_OPIVX_TRANS(vmax_vx,  opivx_check)
=20
 /* Vector Single-Width Integer Multiply Instructions */
+
+static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector integer instructions,
+     * except that the vmulh integer multiply variants
+     * that return the high word of the product
+     * (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx, vmulhsu.vv, vmulhsu.vx=
)
+     * are not included for EEW=3D64 in Zve64*. (Section 18.2)
+     */
+    return opivv_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew !=3D MO_64 : true=
);
+}
+
+static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
+{
+    /*
+     * All Zve* extensions support all vector integer instructions,
+     * except that the vmulh integer multiply variants
+     * that return the high word of the product
+     * (vmulh.vv, vmulh.vx, vmulhu.vv, vmulhu.vx, vmulhsu.vv, vmulhsu.vx=
)
+     * are not included for EEW=3D64 in Zve64*. (Section 18.2)
+     */
+    return opivx_check(s, a) &&
+           (!has_ext(s, RVV) && s->ext_zve64f ? s->sew !=3D MO_64 : true=
);
+}
+
 GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
-GEN_OPIVV_TRANS(vmulh_vv, opivv_check)
-GEN_OPIVV_TRANS(vmulhu_vv, opivv_check)
-GEN_OPIVV_TRANS(vmulhsu_vv, opivv_check)
+GEN_OPIVV_TRANS(vmulh_vv, vmulh_vv_check)
+GEN_OPIVV_TRANS(vmulhu_vv, vmulh_vv_check)
+GEN_OPIVV_TRANS(vmulhsu_vv, vmulh_vv_check)
 GEN_OPIVX_GVEC_TRANS(vmul_vx,  muls)
-GEN_OPIVX_TRANS(vmulh_vx, opivx_check)
-GEN_OPIVX_TRANS(vmulhu_vx, opivx_check)
-GEN_OPIVX_TRANS(vmulhsu_vx, opivx_check)
+GEN_OPIVX_TRANS(vmulh_vx, vmulh_vx_check)
+GEN_OPIVX_TRANS(vmulhu_vx, vmulh_vx_check)
+GEN_OPIVX_TRANS(vmulhsu_vx, vmulh_vx_check)
=20
 /* Vector Integer Divide Instructions */
 GEN_OPIVV_TRANS(vdivu_vv, opivv_check)
--=20
2.31.1


