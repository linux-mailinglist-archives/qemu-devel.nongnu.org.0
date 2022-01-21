Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE078495B00
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:44:07 +0100 (CET)
Received: from localhost ([::1]:46504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAoac-0002Vw-Si
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 02:44:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1X-0000Hw-Be
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:47 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn1N-0004AK-JT
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:03:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642745017; x=1674281017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6g+KGUBwL4HD76OFEt3Qg98EviIIomgGJzvK44LlZvU=;
 b=gkwBtDKDi/aVyXHl5ssKTQWWjIctQgFtNJNwvqv565TqHVuUKRJ/By45
 ANSAMqEXBHIDbjngP2mbdcF5fqGPl2iR/0uhWHmZonaOowBYeJOjN7z+H
 arWleXjehp0svmLWUpLO7B/7XVOoUrd5aMbcocFHragpNQ9giazGD00Pg
 TEtZg59UG/CpLb1IpY+dBOiYBNSomiC3mjWP8KzOo09pPTUkakt0Sqimf
 4x8nsXGT0tI3ywiiPBkwJ8/fbyBkphPTy8cZU3Zqv7hOJgU7xa9CrdHHt
 C6S8KMts6pYuIH2N60/jW2RlGA89I1QE4crxCawcT0w8nwe3RqRgFKHDH Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083169"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:02:44 +0800
IronPort-SDR: 544rFCcGQg472A15pm/BAVoAr0dUgffZ7CsGRidwJSsj2olLVQEyGVWYxU3z7Sk2cDmIXJTX+u
 CMv7Ey76ufC3m79CqwC2sjUwWsDncO2Z5iPLBsuXXyPOeYAPLbXbinIf7nLevsAhwAqohdOtqz
 adT0L5Fngy5rMds1DATkxejy6qY8ZV+pg0Wc1XZoEz8uoh2fSb65mjiqDmzWktcEqVa/tR3IZr
 c8C97GmtMfubHxYEOnGNWuzx8kgIRWtDeIF5WAmp8Sw8iWKu6eQNbpFvBOUr2RHFfcmvd0Evkx
 u+YD/yrdYubekFG1GSexPmEH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:36:12 -0800
IronPort-SDR: 0VwszwuepN/Aabay+LEK1OKwzm8ltZ04cRDnKwtkOahCTTDe0/f7NBeJ5D8XPVr/gawpOnbJz8
 u77L3So+cooo7J+y4apX0lu4hRm8T30F/LYFG6x/T/sCZyeq0XeVwQ5MHSTNAh5sDp0DGK8GtF
 N+vu9J5rjiJuENs3bKQ+UUf5H/RRn8oOWldJ4PedyAuBGgLButMYFDOXlBOFY+QngMUAVx81tp
 25D3R10PVF+on0yr+pURapZP4krI82aWooG1OVR4e+RTfzAAa1JZGghn9qJWzTt/8VgmfRzdu5
 Aic=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:02:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg81J37TMz1SVp3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:02:44 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744964; x=1645336965; bh=6g+KGUBwL4HD76OFEt
 3Qg98EviIIomgGJzvK44LlZvU=; b=DJGG2V7SfDNvDqiOZTxLJnGKnZaeVVgYbR
 ikN78jOufbI/qX17lVQ9IYgmA53mO98C20e6rjogQSodO6hzSkM8EvcvfLvGO2M/
 h2L8SdvjzrUC/sf/2hhpTtrqOAUNNKzLRxQ3wn/aqTiqHjBR425xucOk0PJ6MDbk
 W5FJ3miMpoPcnr/SOW2JThCkM5w0R4GEN7p5XRSMwGZcpJmz3s0PulHNWTPekQAA
 RLB1kiZs/EnjMu9mZUJ/of1eipaOwvbHFqG+cZ9Zo/yKnTReQMpVbDv6ryLsfMXf
 +OvyqzsHRhPyT8TDcV15rnuaAj5Ds3gjRv7Nzvx6nxyv1KJ911tQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id w13ix5-GMw7D for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:02:44 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg81D6QN8z1RvlN;
 Thu, 20 Jan 2022 22:02:40 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 58/61] target/riscv: Adjust scalar reg in vector with XLEN
Date: Fri, 21 Jan 2022 15:58:27 +1000
Message-Id: <20220121055830.3164408-59-alistair.francis@opensource.wdc.com>
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

When sew <=3D 32bits, not need to extend scalar reg.
When sew > 32bits, if xlen is less that sew, we should sign extend
the scalar register, except explicitly specified by the spec.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220120122050.41546-21-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index e03959c46f..f85a9e83b4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1258,7 +1258,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, =
uint32_t vs2, uint32_t vm,
     dest =3D tcg_temp_new_ptr();
     mask =3D tcg_temp_new_ptr();
     src2 =3D tcg_temp_new_ptr();
-    src1 =3D get_gpr(s, rs1, EXT_NONE);
+    src1 =3D get_gpr(s, rs1, EXT_SIGN);
=20
     data =3D FIELD_DP32(data, VDATA, VM, vm);
     data =3D FIELD_DP32(data, VDATA, LMUL, s->lmul);
--=20
2.31.1


