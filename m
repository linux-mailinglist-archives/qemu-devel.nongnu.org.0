Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16929437839
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:41:50 +0200 (CEST)
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdunt-0001wB-3O
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdul5-0007TZ-Ti
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:38:55 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:47438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdul3-0000sy-Cq
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909934; x=1666445934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=szAfsi9iOOnmaHfqJoFbbAAQvYUhSU363U/hFVz8fHc=;
 b=Q4Ki8afJAqFFISOTxvl5zV6tjzWNriBtSwWZq2Y+D8ZBIoJ7GbfoFzo3
 Xz5ilcSaVxa07LMOFT/gf8B/YtTgCDROZcLqWHSZ4d6JQQDOyoOr8zdp2
 ky99rZlSSKi5k6MednsLRYG7CII0XsqLTKcJhnCromXeOx7mEGv3i1pl4
 Vp/K4iVANsMNRTxDr1UlfVp9vw7vSB0mmrIBrgfWtH6Gsyi00gXOuJ9S6
 h8xJM21TVy4jcZzTUO/hr58qcN33si5BwUI+35qaZRSSj7ODi+8N3GtS0
 l7T6/fA4UIR4vWNZ9wJsaM/V09y0psKqe/A4zNubiFjdf3Ax0OtuYhjx0 Q==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="184556244"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:38:52 +0800
IronPort-SDR: lBstfdQV8zGvcWbO/9CUw0YeEJ/krlAtM99U8ETDqGutUNBDCqODT+4HUjzHJfmvNytg5PL1JT
 4mx77KZKxsc8A2NYgrtSXnh1ALe7Avh83/VaBD9tl7U3upLfWVnTJyZGDeg/TIsdnYDPWkgorz
 pVdJ2MDCTn7yiYE2Gal/vx6BEvrKLlJP/OBH3giNUAkvruHx6Cu8WACcnGLZ2y3mbDYACd8OlF
 YVYAWZDVTOSdVfuM81epT1KS60x/rC6Q5K9RN8HyYoKHJfNqnVpvH687AO7JeaHC3y3sDACXLa
 EpoT91/I9sLGbJSW4M0HEdoQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:14:26 -0700
IronPort-SDR: faXr2qzr+DjSv5LG5YFw+8rMHIQLKylrogDpzzipHMt7MU37h0dWh2CMGCJYMu/WKW2RfwQAKH
 e5B73woe5qjmGZMDjYhifRCLQKGv0ATU6d4auCBpLkr6MBkRhAgO6qMMgSCfZGOMFt5Z0L7M27
 4EZx/qDwki0bihZUBhLI/8cQKROKYoenHWdbUOVgDQhc0DBWvb/Y8HLaxKThYrgVc2xfO7AdBU
 aJW1t2Pkfn6ATkRVBWVm41qTCm8sEZzYEL8uyEg14kg0FZz5uRnZa3K6U93wYM1hDGIxXKA1d8
 rxY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:38:51 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQRb2xXKz1RtVv
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:38:51 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909930; x=1637501931; bh=szAfsi9iOOnmaHfqJo
 FbbAAQvYUhSU363U/hFVz8fHc=; b=Fr/CIzMbr6JKGLkhpA38hEni5rI3jhl+H6
 D3jG0otIdwej9M7C7ZkbGqf/n/TCfH4WI1/wOUcx8I9OSVZpe0zg1zlMPWhrkJSs
 ZNkiVosv+zjjuQs+8sN+sabyDA0CTh3fIN3Msxz7XrfTuapc/sn6Ja7mbIL1ndqh
 +Q+3oJSEKg22TWdG03zQXiCZmLZqTVHHU4NKkqPCMq27hAXQ6hf3aAoOA0jJ34BF
 Up3hnoht9m+tLTDh0DDre8UK5C9KeP6bjVkhJGuYaB7vn2MtsVAJkOOk6IeBTm/X
 NXGT3sRmN2XwWJQL0CsOGDDB8UA3ZgzfOzq8h5948vTbZhpm3ZMg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HC-I0MPKuThU for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:38:50 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQRV2W1Mz1RtVl;
 Fri, 22 Oct 2021 06:38:45 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vincent Palatin <vpalatin@rivosinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/33] target/riscv: Fix orc.b implementation
Date: Fri, 22 Oct 2021 23:37:42 +1000
Message-Id: <20211022133812.3972903-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The earlier implementation fell into a corner case for bytes that were
0x01, giving a wrong result (but not affecting our application test
cases for strings, as an ASCII value 0x01 is rare in those...).

This changes the algorithm to:
 1. Mask out the high-bit of each bytes (so that each byte is <=3D 127).
 2. Add 127 to each byte (i.e. if the low 7 bits are not 0, this will ove=
rflow
    into the highest bit of each byte).
 3. Bitwise-or the original value back in (to cover those cases where the
    source byte was exactly 128) to saturate the high-bit.
 4. Shift-and-mask (implemented as a mask-and-shift) to extract the MSB o=
f
    each byte into its LSB.
 5. Multiply with 0xff to fan out the LSB to all bits of each byte.

Fixes: d7a4fcb034 ("target/riscv: Add orc.b instruction for Zbb, removing=
 gorc/gorci")

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reported-by: Vincent Palatin <vpalatin@rivosinc.com>
Tested-by: Vincent Palatin <vpalatin@rivosinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211013184125.2010897-1-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvb.c.inc | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index 185c3e9a60..3095624f32 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -249,13 +249,16 @@ static bool trans_rev8_64(DisasContext *ctx, arg_re=
v8_64 *a)
 static void gen_orc_b(TCGv ret, TCGv source1)
 {
     TCGv  tmp =3D tcg_temp_new();
-    TCGv  ones =3D tcg_constant_tl(dup_const_tl(MO_8, 0x01));
+    TCGv  low7 =3D tcg_constant_tl(dup_const_tl(MO_8, 0x7f));
=20
-    /* Set lsb in each byte if the byte was zero. */
-    tcg_gen_sub_tl(tmp, source1, ones);
-    tcg_gen_andc_tl(tmp, tmp, source1);
+    /* Set msb in each byte if the byte was non-zero. */
+    tcg_gen_and_tl(tmp, source1, low7);
+    tcg_gen_add_tl(tmp, tmp, low7);
+    tcg_gen_or_tl(tmp, tmp, source1);
+
+    /* Extract the msb to the lsb in each byte */
+    tcg_gen_andc_tl(tmp, tmp, low7);
     tcg_gen_shri_tl(tmp, tmp, 7);
-    tcg_gen_andc_tl(tmp, ones, tmp);
=20
     /* Replicate the lsb of each byte across the byte. */
     tcg_gen_muli_tl(ret, tmp, 0xff);
--=20
2.31.1


