Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503B147A4E3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:15:08 +0100 (CET)
Received: from localhost ([::1]:48666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBww-0000Mp-A1
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:15:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoc-0004cM-Vv
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:27 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAoR-0008MN-UJ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976536; x=1671512536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k29mEPd8zm8+mtoib1UD/B9g7snNqRQYSbM0WcHvwaY=;
 b=epN9e2vjzxUBUKTInz+nBd4B999PQ25qoL9LeBSWIXAmRCKPlBdxMJbm
 Z/q3f1dyjwEBSpxzHjdBPvDFyTZU1LWOwiehSD4seVCXThfMCYF3wJtfT
 SP867IeTjw6k7Ikq7Aa0p/eksszbszs3E2rqosJsJ3Np98tuqbK4/HKm1
 9d+vMchm02wkeYLxPILJIdKi2QYVpRBrifZi2p5nC+dL6PPSCE4++DjdF
 Hg1ZcW6qFkDpUJlOUoLyMCyIDEcD3mkTVML2DCfuPtwIyIJ9hNY2AoUmP
 nYgypBPIKUtNgCDPeTzWeqzuJ72bxqe57UnYVcxFbysalBuhjX/A6EPY2 g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680233"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:01:25 +0800
IronPort-SDR: PMClCUR5tPXlGHrx0ynjHqkjkFxGFr8KGG+mz9964pqs2rCYiREKoHEa+z95zKOabUpdyATVYa
 1/yRD360phwIagb2N8Es2rMo7qTGxyZeMqXRv2ASeQ6j6Tn1R/onHh6kyji/YkCjz7YI/DZ8pL
 cOWnpCF/lepIHv/O7+wQOe/7+WVwmFQQakFHQT8QuCcPhEF+VpED1L2/L1bVHhnJzNtCqqaI4e
 aTRIMNUgw1/IWDmIwgLTGFx/w/Dh9cLxBxydeyhWcomFYLQsRxHamr/yWFDRM5N8vsOaZ70deZ
 gnq2t6IMtExMH5gn7pb8mBbE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:34:14 -0800
IronPort-SDR: d+NGpwI3uLN0G7RU6DPFlMburck1XaV+5qPkLxIhWHba1ADAV7GI+mde0Bk6hkwAlCbbAkMOVp
 tycNxUxeLDIkvqx2fIk9EE0VPF8KH2oqEU4m68yus0gAnSw7VsMkuOt9SOHNPO9YCfQn7hj7YY
 hr6y+iOuxZ1m7PXH4Q9Xe5EMWuCBrbqQYbnUqGMBYroOBkl/g/16DcdgzeLqON83MAFAm9tuO2
 cqdy2jLXliNEU25jHRXP/9QoHskSIHA0QIqsCD+G9jAL9Zcz7IMElksmc8yVYveKZ4DUGrxrk3
 wiI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:01:24 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS9J331Tz1Rwns
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:01:24 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976483; x=1642568484; bh=k29mEPd8zm8+mtoib1
 UD/B9g7snNqRQYSbM0WcHvwaY=; b=Yn56RilzZ3GIlS6j9DOM/I/Xc5Gj229DWj
 FJGs66D06w1MNuaoXiFwK+zFYUmGe5TL66ZAXqfUavDLjUWqXpSrVhh4qY9BzL9g
 U1P0nkgSh8iyB9eUSbAGqaeV8tZ81cE+uK8d3b52rTa/WOm1wxLvXWyVd9wiXtl9
 3wG3gTIQeZ5znXSMA8rAgy5DAABzTXXQE6Kl9QD319dr7sXpCtL/4nMD5mKXEraw
 acN3MweY+FoRbbEybk0zeW0gGD5JVd1pIwrR6qbhF1jOr7ptUr8cB9XJhmsUGwWu
 6ghofqWL01ea9uL+2oaCPXDMPs5k+au/Y2IhjGQ7+UrK1Kj4+AuA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id p1R0pcgJaLQs for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:01:23 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS9D6yJpz1RtVG;
 Sun, 19 Dec 2021 21:01:20 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 61/88] target/riscv: rvv-1.0: single-width floating-point
 reduction
Date: Mon, 20 Dec 2021 14:56:38 +1000
Message-Id: <20211220045705.62174-62-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211210075704.23951-54-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 12 ++++++------
 target/riscv/insn_trans/trans_rvv.c.inc | 12 +++++++++---
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index c95c8bd9db..79a2c3ff3a 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4173,14 +4173,14 @@ GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, =
H4, H4, float32_add)
 GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
=20
 /* Maximum value */
-GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maxnum)
-GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maxnum)
+GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maximum=
_number)
+GEN_VEXT_FRED(vfredmax_vs_w, uint32_t, uint32_t, H4, H4, float32_maximum=
_number)
+GEN_VEXT_FRED(vfredmax_vs_d, uint64_t, uint64_t, H8, H8, float64_maximum=
_number)
=20
 /* Minimum value */
-GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minnum)
-GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minnum)
-GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minnum)
+GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minimum=
_number)
+GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minimum=
_number)
+GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minimum=
_number)
=20
 /* Vector Widening Floating-Point Reduction Instructions */
 /* Unordered reduce 2*SEW =3D 2*SEW + sum(promote(SEW)) */
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index f5588d9832..998247d71d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2637,9 +2637,15 @@ GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_widen=
_check)
 GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_widen_check)
=20
 /* Vector Single-Width Floating-Point Reduction Instructions */
-GEN_OPFVV_TRANS(vfredsum_vs, reduction_check)
-GEN_OPFVV_TRANS(vfredmax_vs, reduction_check)
-GEN_OPFVV_TRANS(vfredmin_vs, reduction_check)
+static bool freduction_check(DisasContext *s, arg_rmrr *a)
+{
+    return reduction_check(s, a) &&
+           require_rvf(s);
+}
+
+GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
+GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
=20
 /* Vector Widening Floating-Point Reduction Instructions */
 GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, reduction_check)
--=20
2.31.1


