Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAF7437831
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:41:34 +0200 (CEST)
Received: from localhost ([::1]:47132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdund-0001VS-Dn
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdukv-0007JP-R1
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:38:46 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:64363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mduks-0000pC-IW
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909922; x=1666445922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H0DxmPXPRGiIWpgCTG3BUTm4GzNm0MlpIqrRajhd3Xk=;
 b=MhrEbVoE37o9S2VdyBstofb8MpUFl9CrCTCM6DjzeSo/xpw4tjSTRQfs
 zc3+1ibzjriiFHw3CTzsOlgp8ZEDe2JbTYU0MFFcQ+8J8FXxi0iBGav3u
 SaOPCOaO4z6823GIe13KxkPSgr3W42LxGLXrylvK/iNWqbdjmjd38vDD4
 ir6L/HTHDECmALF0mTee0LHzCm36cONh9L04gVJt95zbJcqyM4DlgFtds
 opf8qY/cMmHBREqj8C+9Mrba0nRHZtqvUVm+g9aqpsdLQvsBmpV/NBhoH
 HCGIjvKi+GBDSPU+KW3snzqQUJ4ebmmgxf2vzn/lwMsiY2qctAuk9DVTq A==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="182632547"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:38:41 +0800
IronPort-SDR: qJGPd0cCm8FbI9aFhKlCqvCC30onqUyv5IDUsdrP63+Pyo/JKAxEorANtb/Vy15bjWkk8kLEUi
 jvu6+t+xh1M11g3XsOsLxzzCAkg0X/2xjIZR9WtrgAh9ZufbOmBn54elZXmaWsthN8ZN16A3Yh
 Pn+lwVHO3KlSmCa0NJfhaTXQJUVkXQK3Gpm6qlarNvR5pUT53LAf0wPbTQHShcNZh9GwLzakb8
 coxislWQF5r0tmEM7ocE2O0IQsh7JKi7is0bRG0Pwej2HJaAA6PQ2yCpMCxkoi+vuYFIk+n0UT
 jMAXUAdFjJ1f96/ZMNSa7QH3
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:12:43 -0700
IronPort-SDR: JWGfZ1wdLeieIhjndmayH2YOiP4Rq305/x8T63UjdFNNyCXCyVPr0J/LOVcN7kTyiXjfnkdn9/
 HOXArnni7zSh4DlIRXUz1NRV5vjLAalMMcTVWtQBmzC5u0xYTMbTTULSO/cYdk1eB27dZlf5z8
 +z2adHdypwq4Kz3qsNqTRR1T+0esGjPNnDBhkRqKmjboA37mT3p13k8a0Ct28Im6tn1wz3fw8j
 Nh3spAZfvw1tRpkbd3rkqSpVrE0SxECGT7pqDv0Ond2CfOutUXWFMLB33Yn0a2gg0cdpexuYf4
 gyY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:38:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQRP0Rbhz1RtVl
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:38:41 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909920; x=1637501921; bh=H0DxmPXPRGiIWpgCTG
 3BUTm4GzNm0MlpIqrRajhd3Xk=; b=CAeXPHj/nWSPrS4aIoKLkdfZ/WG86nBLJx
 kb7A5FU68OTE7hJuYN8cplWXnDNSzNAqmNcFqqftTe+irXrYKTmXnj8DFEKXK1kb
 LURgke2MX39GRdYDjs3WhWqIbprM0b0tFfMgq+nSSGncR//kg3Hs/c8vcZ7Oi+Yw
 2EpJqc96pcOGB+hDE2QWb/o/NO38ePx2ju3x6cZJBQog8mpDd/lOt7ijhFbuIiSq
 0IHCw3psZtAJlu1aWBjuUe9AaRs3cvMUC5N/FQGmtlBbilf4uO00LouRjaNqU48d
 lLswLeMkQmvfx+XD/BZOwDshvj8XtNJkS3skgCP8u56P7qWDwfnQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Af2-eEOZ7mNS for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:38:40 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQRJ3sM6z1RtVt;
 Fri, 22 Oct 2021 06:38:35 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/33] target/riscv: Pass the same value to oprsz and maxsz for
 vmv.v.v
Date: Fri, 22 Oct 2021 23:37:40 +1000
Message-Id: <20211022133812.3972903-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Frank Chang <frank.chang@sifive.com>

oprsz and maxsz are passed with the same value in commit: eee2d61e202.
However, vmv.v.v was missed in that commit and should pass the same
value as well in its tcg_gen_gvec_2_ptr() call.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211007081803.1705656-1-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 081a5ca34d..45be491ed4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1619,7 +1619,8 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_=
v_v *a)
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
=20
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
-                               cpu_env, 0, s->vlen / 8, data, fns[s->sew=
]);
+                               cpu_env, s->vlen / 8, s->vlen / 8, data,
+                               fns[s->sew]);
             gen_set_label(over);
         }
         return true;
--=20
2.31.1


