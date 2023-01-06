Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82D65FA06
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:17:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBX-00018f-Fm; Thu, 05 Jan 2023 22:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBR-00016G-Ec
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:17 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBP-000892-Ju
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974855; x=1704510855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ito8i8eds9po426QmEHGlsoNFwhx+se4nYLCYXclgw4=;
 b=g2WCqfWi5a3qVQ9dvkAx9GrdfcJhVNFFnymEaX5EgORcclTatcM9ao2A
 ElGTNjPDk2idQeSfFCm5E8b7sJq6Djy6zZ9efQYFAGrpeZeSopBbSYhvu
 aasIYJcXDby+B93V6hG8i1eFwmYkJko7qLv9K7ZPnm40muN1HJAN5X3zF
 MipSI5l2k1OOM97dlmRE6yMNxsbnDZA+juatVGnFn2tmSc5NoJ9nj17V8
 gMpfmD7AoLMNYw/kyirf3bl1vZ1lHUWWbgSeXPRizLBGjdYYCNp2cbwXv
 Zdo9Jl1zphwUI+h/X79UKMX/c0LZ0l9Wql5EFuRfkj3kXoPgsTg5POCsY g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254746"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:09 +0800
IronPort-SDR: uYGqXh/DQIrsECODC44xf6oC04ui8dX/YuJqQeP/CXWEYti4QebtSrV42/8jrSKvrRN2LRqVLT
 Rs/I3OlwKsCmIf23p7OiSwxOYxQojE6WnaRlZQHFqv4FAelRTlZKj+t2T3j/ioMm/lQDxwhieC
 zZPA41YR/FPdQlCIXgwq31aQl3oMBTmOKy1yUuS3IL9d6d0uTsvZphlZ64k6GD3GFDAtiWkYdU
 JUQ+cTyyPx9KcPi6NXMxLzM4/qIioeUfw40e6Mo6RjiW/VNFWaEloU4+66DJWLWNs3YwomB69d
 X80=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:20 -0800
IronPort-SDR: CYE7o459hWEMLvq735KgoTdQ2WaYz6MQPUzNOXJu3fG+my/PePaLqfch+uU6NKt86oiX7tYp7r
 GP8ZxCqViLJmKgARQrIDHF0onBUQeGANyiKY+ifOSePiT1YH2xEIXq2SHha47czQW1w1/vUqQq
 x1c++t4LVxaTil4XudLu1YH8Yoh6IvyMQAoHVC0bH32BP7w4KLK7nQYWghHzZVkgqBSq76M4qS
 1zUkE9jSJ94L8HOjpy7DSqzQUoQbp/lydeWA4uop0+ANLLxJ+46b4Zayl1RuqOXVGl8N2Ge8Cu
 3lo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:10 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jF0DW4z1RwqL
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:09 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974848; x=1675566849; bh=ito8i8eds9po426QmE
 HGlsoNFwhx+se4nYLCYXclgw4=; b=cAy1nbxOLIzOfw9jTSfDzWZ3ewJ9KNSJLS
 GlbSlTo27rOGtUS2vD+hb1clHIDO/HP2r75364/5zHw9iYbplnB5Yqb9nr5zl7ja
 x9QDMbB5JG0DCBgQFZdtH3wX8RK3MuIQs4yGvXER2aE9YlKbWvVjq6i9rHyR03aS
 bOsSFZZE5BKujlPjDhykrg71p7C+6oluQTQDcB8lw+u8rUh5p9geRui69mHmcN78
 EcwQ+wSG1on5co0SEdrUxS19bayggt9jvrTSPU376mQ5h7k61KLxEeYJel8WiWls
 hBp0+YZBRWMVoBhDjuHvGNh/tk4i2NmPcCG3cd8CGdQIEtnZvN3A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WQmVIoGAAnUO for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:08 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jC1Tr9z1RvTp;
 Thu,  5 Jan 2023 19:14:07 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 03/43] tcg/riscv: Fix reg overlap case in tcg_out_addsub2
Date: Fri,  6 Jan 2023 13:13:17 +1000
Message-Id: <20230106031357.777790-4-alistair.francis@opensource.wdc.com>
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

From: Richard Henderson <richard.henderson@linaro.org>

There was a typo using opc_addi instead of opc_add with the
two registers.  While we're at it, simplify the gating test
to al =3D=3D bl to improve dynamic scheduling even when the
output register does not overlap the inputs.

Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221020233836.2341671-1-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tcg/riscv/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 191197853f..2a84c57bec 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -700,9 +700,15 @@ static void tcg_out_addsub2(TCGContext *s,
         if (cbl) {
             tcg_out_opc_imm(s, opc_addi, rl, al, bl);
             tcg_out_opc_imm(s, OPC_SLTIU, TCG_REG_TMP0, rl, bl);
-        } else if (rl =3D=3D al && rl =3D=3D bl) {
+        } else if (al =3D=3D bl) {
+            /*
+             * If the input regs overlap, this is a simple doubling
+             * and carry-out is the input msb.  This special case is
+             * required when the output reg overlaps the input,
+             * but we might as well use it always.
+             */
             tcg_out_opc_imm(s, OPC_SLTI, TCG_REG_TMP0, al, 0);
-            tcg_out_opc_reg(s, opc_addi, rl, al, bl);
+            tcg_out_opc_reg(s, opc_add, rl, al, al);
         } else {
             tcg_out_opc_reg(s, opc_add, rl, al, bl);
             tcg_out_opc_reg(s, OPC_SLTU, TCG_REG_TMP0,
--=20
2.39.0


