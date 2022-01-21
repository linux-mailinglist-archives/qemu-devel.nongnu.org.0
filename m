Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB61495C13
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 09:39:24 +0100 (CET)
Received: from localhost ([::1]:58958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nApS7-00077C-EB
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 03:39:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn0T-00083N-GR
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:41 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAn03-0004B6-81
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744935; x=1674280935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hWEN4sC0pqSX1eg+ExD7OHzG6ssU2OOASQgEHYHSkJ8=;
 b=G59nHhTHO1R7lfZMt5nGca3W9eDVOGLrcZUQNtifOByD9Pqfs85uqaFJ
 0Z2iAC9N5DiQlRDUmCTsqthjs7PsIA1zNSFF4jvuHUfOFf03GgF8RMxOF
 Kmg/mNb9ocqnT+TlS/cTY/XDvjT9tZVhEoirL5f/3LLy7azRccHjMJWY6
 6Wjx5FYYQNZwPUdUreJM0pMin6Fq9ib+vdjnJEn1mZdAZHP2mUyrXbG5O
 cGuLnGS2LatT8Ss/JBMDeoh2waAyIFZq1JBUnAhIWaJdA5kj8GMmVQwaH
 f/uDB6Z1G41e+IWLLwuUZrlHbFTQt3+GJUpgNPZjiW+Jjh2s7LoIrHUjA A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295083000"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:59 +0800
IronPort-SDR: /oXp3puZRn471+g1UG5pC9AYtkytjQRcCwbaEjttMaiMUOTsPYPNQ0Vf0KI/tCLXFG/cOIlLeX
 WfHC08i9w4xkqWj9M+5ya3Txa808EUQNP717Ho1cqU3kjjdSXn5mOV2hC17AkF1yiKUjt0/shR
 AwWXc90rmmM5mQv0pJYh8PpmK+Ka+KavKFRP+BKvKj0aMwLfSswCKET0RC2Q1JlNplroBdngT8
 BIuotJ8fMif+or2FF4FFPeyB3N1uMXyiHDm693oUHLgBsVdMVVqtx9JVlg7K6+7C1hrLyFpANz
 0krKMfAFJuoyiUYcbmcRbkXd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:34:27 -0800
IronPort-SDR: dQOFOVuxYJvTZAkeRH+AXs5iBMxsYzP9XSVGqcnkUXq/TxXEirhfLWg5mYy3kfcm5eEt0AIA7q
 Xulk03x5Jp1x4ppHGImpLHvRG608XT/iDWpD6LsFoM9ZETMeU0fiUSZUIdEbL/9bqre2Hw2zz5
 V3/DRRVSvKa4fiv/gurfjjs0eImc1mqLlrpGdsTQR0Ya/z9HxNBWgBU8dMXCFJ779ZiIIlVgt5
 getz8wSdUNygPo/fjRB6T6pNUe4sOozs34Kpmn8LEwFD3X+M6OItX86ZoSOTkdSzFCtwfV+8nv
 IPo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:59 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7zH2M3sz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744858; x=1645336859; bh=hWEN4sC0pqSX1eg+Ex
 D7OHzG6ssU2OOASQgEHYHSkJ8=; b=t8sojie2YTIr5374cDADiao65hmPOKtQNg
 LunGWnpXFoAfHk5acTs/sz+vbG87u6iDzU/4PWB3+Ol71vIyj54A4KxvInE1EMfT
 0N41hLUwxKd9lJbxFt2bg2siMX/RP86cbCHpElatWWXNKgN2vCwEiclbUMINABk1
 U4qx+rVTivBxOXGvNFVW2bKpyXmEAZyDcKp7WAYMb8pbj/6bbF32l8CWJskkbyna
 PeqOmM7qWnQ52OrdwWGej5+dqDnElFZ2UNb5I0v9KvyNFeV1r6VqaztA1kPF/wIJ
 6YxSRccPDs45DdEMLIOjFvWDUFafyppv6QdgA9aGILN705GfS3WA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id fQOhyYQAWuY3 for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:58 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7zD24mkz1RvlN;
 Thu, 20 Jan 2022 22:00:55 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 33/61] target/riscv: rvv-1.0: Add Zve32f support for widening
 type-convert insns
Date: Fri, 21 Jan 2022 15:58:02 +1000
Message-Id: <20220121055830.3164408-34-alistair.francis@opensource.wdc.com>
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

Vector widening conversion instructions are provided to and from all
supported integer EEWs for Zve32f extension.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-16-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index b02bb555a6..f2d3c9e8b9 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -77,6 +77,17 @@ static bool require_zve32f(DisasContext *s)
     return s->ext_zve32f ? s->sew <=3D MO_32 : true;
 }
=20
+static bool require_scale_zve32f(DisasContext *s)
+{
+    /* RVV + Zve32f =3D RVV. */
+    if (has_ext(s, RVV)) {
+        return true;
+    }
+
+    /* Zve32f doesn't support FP64. (Section 18.2) */
+    return s->ext_zve64f ? s->sew <=3D MO_16 : true;
+}
+
 static bool require_zve64f(DisasContext *s)
 {
     /* RVV + Zve64f =3D RVV. */
@@ -2358,6 +2369,7 @@ static bool opfvv_widen_check(DisasContext *s, arg_=
rmrr *a)
            (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
=20
@@ -2398,6 +2410,7 @@ static bool opfvf_widen_check(DisasContext *s, arg_=
rmrr *a)
            (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
=20
@@ -2429,6 +2442,7 @@ static bool opfwv_widen_check(DisasContext *s, arg_=
rmrr *a)
            (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
=20
@@ -2469,6 +2483,7 @@ static bool opfwf_widen_check(DisasContext *s, arg_=
rmrr *a)
            (s->sew !=3D MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dd(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
=20
@@ -2733,6 +2748,7 @@ static bool opxfv_widen_check(DisasContext *s, arg_=
rmr *a)
 {
     return opfv_widen_check(s, a) &&
            require_rvf(s) &&
+           require_zve32f(s) &&
            require_zve64f(s);
 }
=20
@@ -2741,6 +2757,7 @@ static bool opffv_widen_check(DisasContext *s, arg_=
rmr *a)
     return opfv_widen_check(s, a) &&
            require_scale_rvf(s) &&
            (s->sew !=3D MO_8) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
=20
@@ -2793,6 +2810,7 @@ static bool opfxv_widen_check(DisasContext *s, arg_=
rmr *a)
            vext_check_isa_ill(s) &&
            /* OPFV widening instructions ignore vs1 check */
            vext_check_ds(s, a->rd, a->rs2, a->vm) &&
+           require_scale_zve32f(s) &&
            require_scale_zve64f(s);
 }
=20
--=20
2.31.1


