Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8C647B0AC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:51:54 +0100 (CET)
Received: from localhost ([::1]:51128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzKx7-00085S-CK
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:51:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUK-0006sT-BD
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:49:38 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:22091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzCUI-0002OG-T2
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 01:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639982973; x=1671518973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=szLf4+H6loGSUBXV3yvtyEKTqnWeINnnQTOWKG5HXYo=;
 b=qj90ywKlvBb/EPforXhXvfbhAO2Z1YSm1Ul9oazvGVcWKzV77GLxEPnZ
 uy7+cY+o77BPijjtL/bA2wLjwKjzXS8LXZA8meXchdbiE0jGnfFvJb1in
 3sqsCj1ADlJpQwLhvE2S0BuRci0e9ytf56q+kOTk36CcYXKRZy7+sJCV3
 1ajEXu3YHyI6Q47e3ckpiHLQ3xolnAFATll3TMOEgBFReOnRTo04+ywrw
 3lVw2i4/bM+n/KSrfGlzJrasgkBwzr3xuYHT+6Xqc32a39pG+4541uhO/
 cg0VdgEeLUIz+4Hx+/9r8EFHFjgPA/Ar7Fuw/JLiNhLAlLhXPlvlQZGiv Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="188654143"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 14:49:32 +0800
IronPort-SDR: WH1QJJX6k65QBSMSsnEfqgpleOQUt4PhkWVJLFnveq4bCofOQBbTxlb5DOT1bfU/ARmz6RsnBM
 b3xiXRtOCJXNAiknKUODUGoqK8/fkg9XHcW72IkutHLXON5snFkDCwg89KNSFfNdl7jLXcO2n5
 Yz1pgTsSJ90wrmfpahmI5G1gS5UMnEG8N7SWN3l+HcRw5QL9Ge4K4hJBamdAmkrecvYrjkaBet
 +u33S6/TJHCoywkSjer0HPWlXlJ82hbL0qYxyRSQnH7EhS9/mwAd9QkO/CCh8FjxO+MdHXDpYk
 I95yKrIaIBjlwD04Vm+VT3cD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:23:50 -0800
IronPort-SDR: Cxzh7+ayH1q6by59RugRsNV9cc8uRrhLNtf7KpOUxAlu+nneePOYuiR5tjtdQTtf2YhzxF5VOB
 ck5bmLBCNd+Po/jQ6drCmRS7mkB7CkgGDzmBZxyGp0amGYDZ+RYKxzKNcXFYyVpWlLnXRfJinr
 cN31jpaf9FMYPo6SuLvTi3Fyc1D21jLBKbg/Dz7hDXSqpFU/4oryne5OW/Endgs/JfPWfgbMtA
 t7soIIYtzabavrof8ZQswV4lKg3dFR57RzGBRtvBpfc2Wf9L2VYPj6480clOxKJCFpq48PZjuw
 cgw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 22:49:34 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHVZ50B5Gz1Rwnv
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 22:49:33 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639982972; x=1642574973; bh=szLf4+H6loGSUBXV3y
 vtyEKTqnWeINnnQTOWKG5HXYo=; b=HJb09PaCbU4usWT/QXoHNJMBoStNM4ZybS
 uuGovr+zIuT3dgmKhuu3iINpqYPPIlAq4by5WsOdbedPZbpbwEsdiUChIX+q8xT5
 hc8zcjmlJAHESX48385mN603zB4J4EXcatUJT0AURv07FF3PfQ1uqyaee+PJbhr2
 S1CxWpfPrsiZSz4uHoHFxYF7tKjKN1xqQID/ofsl1e0pEgt/ZPtYHSz6THo5zUO6
 fe+VOtcEKDrkRMVbA1rtBbDOS/YeR4oYmDhXt+cALZE7lO1rJC8IF9t+OkauB8wI
 D8+zlcnrmPks8ZXZe6R72xsAWmmsp+/sfW877z0tGypUhb85ACGw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Iqjmzg_8Z1tg for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 22:49:32 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHVYz4ZF8z1Rwvd;
 Sun, 19 Dec 2021 22:49:27 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 1/3] target/riscv: Set the opcode in DisasContext
Date: Mon, 20 Dec 2021 16:49:14 +1000
Message-Id: <20211220064916.107241-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
References: <20211220064916.107241-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 1d57bc97b5..24251bc8cc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -586,6 +586,7 @@ static void decode_opc(CPURISCVState *env, DisasConte=
xt *ctx, uint16_t opcode)
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
+            ctx->opcode =3D opcode;
             ctx->pc_succ_insn =3D ctx->base.pc_next + 2;
             if (!decode_insn16(ctx, opcode)) {
                 gen_exception_illegal(ctx);
@@ -596,6 +597,7 @@ static void decode_opc(CPURISCVState *env, DisasConte=
xt *ctx, uint16_t opcode)
         opcode32 =3D deposit32(opcode32, 16, 16,
                              translator_lduw(env, &ctx->base,
                                              ctx->base.pc_next + 2));
+        ctx->opcode =3D opcode32;
         ctx->pc_succ_insn =3D ctx->base.pc_next + 4;
         if (!decode_insn32(ctx, opcode32)) {
             gen_exception_illegal(ctx);
--=20
2.31.1


