Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12FD514179
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:37:57 +0200 (CEST)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIOC-0006H6-Sy
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIP-0006Ou-6V
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:57 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIN-0002SM-9M
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206713; x=1682742713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VURepcAOTAzycSzxqqWJ5CQtVfgADkoq8MKmy7945Vw=;
 b=obVI1jXsYwHBccnv2DvIHSp694S+J3SqT2xynmLWmoti9HfzecIBN9Q8
 1WYRV+SAyiOujwKQaUIalRy35Igexe775gkBAfmMqSgTdzVIFpnzsH5LD
 /39l+J9hHxgMq07kjCyGdNIeY0czLLaPo16yb6NVsd7HcbRDF6BwYDUOd
 jBLl+H0aJylUmCQOgY5bVyKhI5DfKczhuCC5liQIpGyt+d6p6R8tPyN41
 8kWuZ2g0pBly/G0Ho+Aa7cKIz24PwVPAoG5fZxbK4/z33TR4gC8YkZBMF
 HIRSIA16JvKRjJ2HAbfECiBiGjCAxOE36CFdVvb+Yav4R+j9INbsRuXXN w==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995914"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:31:52 +0800
IronPort-SDR: pAtRF+d80tAlXCR02VowIx279cuDLQ2mZJSdicU937e1hbHtBHVsN3BJNXnI63PqSZ69tAYhPc
 B/K2s6MQGcnRWARpm0x3F4T50/oPsQvTL66rI2W3iu/4g5cNF1zkKyPdkEa3kh8AKZ86QlzNZ2
 UDtK3kFT5XjEDrL//vKQcsFKfgc+RhXug6maOM9TuQFaTbAaB180oCXAqHDxwo3lZQUGsxcK9o
 i1Cp7O2AO+OJtoTEDywxNwrAKAdbWq3Tt6bW+i/fiAFI1y1vwzaENGMqrib8kTSfGFy6fGGa0Q
 htCRItD2HwSt5istHtQ4R0RG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:02:02 -0700
IronPort-SDR: 6oX9FFB1xRgHRYRQCIr1fq067nyOQ4AIuJKw3hKrQ3FdENxNla82aHtAvSSHOW5f++dqqBqvGm
 mrcDFBG0KHBTBOX7dASH58GB8ezUX75sjDIjvOEjsAAB/BMUK+HUoaX9bCqK4RWysmcxKEXKTP
 RScF4TfBQiaLYhKgZAAG6doacJb8p3A3Kv68l2rf3PhnCRkJ2Q9oggKiN2CdZlrrZOcemmvxjV
 dh7bxXsN2YEulJJcj0SPAclVRBVVaOYiiilWPqAKdJOqfGMfWMH6yt8u2o0THsJBR0/brsU3s0
 Nu8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:31:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKMG0sTtz1SVp0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:31:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206713; x=1653798714; bh=VURepcAOTAzycSzxqq
 WJ5CQtVfgADkoq8MKmy7945Vw=; b=nxKsbFxJ5RxWU/nCcorUQpaUU+oDyyX642
 Bnux+xiAR6GiBwEtS7jrLij9QmoEm6VpauBaDIR0I/I5mj+5kaUoQny9WcmGtbjS
 JHgH8ik28o9Q3EXYOtRjTywUVUmdyfNc+7UFQUu/uck0MEe6EvvOLcebRiP4WXaf
 Z82D64UDIwshX4aBc0bEHoxLO8KDQNa93SO1YbThrtitzHzDKrHW07t2hU1fgiMS
 CqvDfjRTQK2sKnlKdphjohi/zpA+eLkE0gsmy6N5TDOH4tuKjJDucIh7TjLyekvv
 OO7tbr3UcOJ/qWQ1C9UOrH56absVVEGrySoL2XJAbfe1cvz9UMPw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qUXXNFtA0O02 for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:31:53 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKMB2wv9z1Rvlc;
 Thu, 28 Apr 2022 21:31:49 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 06/25] target/riscv: rvk: add support for zbkc extension
Date: Fri, 29 Apr 2022 14:31:00 +1000
Message-Id: <20220429043119.1478881-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

 - reuse partial instructions of zbc extension, update extension check fo=
r them

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220423023510.30794-4-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              | 3 ++-
 target/riscv/insn_trans/trans_rvb.c.inc | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fdceaf621a..3a49acab37 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -770,9 +770,10 @@ clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
 cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
=20
-# *** RV32 Zbc Standard Extension ***
+# *** RV32 Zbc/Zbkc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
 clmulh     0000101 .......... 011 ..... 0110011 @r
+# *** RV32 extra Zbc Standard Extension ***
 clmulr     0000101 .......... 010 ..... 0110011 @r
=20
 # *** RV32 Zbs Standard Extension ***
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_=
trans/trans_rvb.c.inc
index f36577579d..5a5751557d 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -489,7 +489,7 @@ static bool trans_slli_uw(DisasContext *ctx, arg_slli=
_uw *a)
=20
 static bool trans_clmul(DisasContext *ctx, arg_clmul *a)
 {
-    REQUIRE_ZBC(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbc, zbkc);
     return gen_arith(ctx, a, EXT_NONE, gen_helper_clmul, NULL);
 }
=20
@@ -501,7 +501,7 @@ static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2=
)
=20
 static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
 {
-    REQUIRE_ZBC(ctx);
+    REQUIRE_EITHER_EXT(ctx, zbc, zbkc);
     return gen_arith(ctx, a, EXT_NONE, gen_clmulh, NULL);
 }
=20
--=20
2.35.1


