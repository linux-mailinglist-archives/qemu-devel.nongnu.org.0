Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F4495A3A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 08:00:00 +0100 (CET)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAntu-0007li-UF
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:59:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyN-0006ys-NQ
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:33 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyC-0004KU-5s
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744820; x=1674280820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kAXRuOXq4UmXktQ8rpqKoY1MfNLvcU1m17jNyFcSY54=;
 b=HlJK2PE7jVS7OEM9CwpIvxT8MnEoao8F/PgWYAeb0DLsAQ8SGqAndlFq
 hPhch+zWZk7Y3OwHFfbUp/JEmp5GuNLgnRZFEkjI10dlLq2LHYj1G3Fzj
 VJb3OQFocrAomaSuUgkYYydEb2SqHU/o+89vR3MjyDYjeYYx9oUwCzUmg
 KIDSVSdPOKaV2xiJ4TR0cNr0Ld9Z8VZwZd43In3ryJondKtwQc4r7+Efu
 fAcrhbXKfqb8Hd97LpSCCUg3zK2zQz1zZ0KuI7b9e9oPslz7MYKdYS9JF
 sTmB+VunchVx2/nyTkTYOFV4DDbp6PNQ1Bbiq8iUt7kxmAgnbfYrPsBeN Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082913"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:16 +0800
IronPort-SDR: pgmr5Ss2Q19o4YlvT/+8Hep4AFHinwfJoFMEk/aL+1sCxlKtNtvO4lvdE0avQWse54EczMfL8a
 anGuag+TeOa4dKHwgqlkhFp9RMfKtOiaCEFoB9nLEBLvxXeRBvVsixfL50Q/IRwOjqZ/ArV+/+
 A8C2XCqrBoAsQRV2LfqqA6qFHLHmR3m15ppWQD2XYEjwMDUOZhGrg9+GmKjc+ZZ1KdpUKrrj6+
 JyTFdlEvHVbLgZcvVQ5wXTiyTNLIGtEa2a451AMtu1zlFz4JUru9UmyaQz82EBMCUSK0d+pAG4
 CaCw9XdTK6G8zzYkoS875v6/
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:33:43 -0800
IronPort-SDR: Vp3H08hudypbo5UbNHRix8xbSTMtHTTBj5pqScxYF+e1q/6EAgRRAfLHY0Fz/kl4AXbloS02cy
 FFwhs8ZqjV6nZcQj5JLxPGpryrRyDuvBg6HrTN1MWT7HPgdf4wF3AFLNgtMoms8oK42pwRKTlQ
 QKWy1LDB9QUiju2gcWdiT6DI8b5Vmw6zKGPCQlN8aV54byne7yBYBC9j+wY28NfV4hxQXXm7C1
 EzkpC/WhVrdO0ajqB2B6iA1IoQoagf00d8pFbYw4gvprbAjcVeiL/zyAGW3+Nn/vMOvAznNU8a
 G9o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7yR6ZQcz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:15 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744815; x=1645336816; bh=kAXRuOXq4UmXktQ8rp
 qKoY1MfNLvcU1m17jNyFcSY54=; b=XMVZQkNjfvVtt86aF+qkoAvgOv2M52UnEi
 pzjFQBrtUdrf0bHMx7kMTC7iSpQ5mQqv95T7ZprUVdRtU81MLmfbps2VEtDBnnAd
 hLkBmy0rAHE45PdGRo3Sl48nWM+ixM33Uo2XZ2vvfM2G8qfW67+Pts5m+fSDqOBv
 XmICmqavDznZEURUDPSc8aNhhuS0M2BmfKeynftP2bBgmsJ84wH9VdDju+YXgw1C
 BkRcCGLeRx50Jg/Wvr9NckskL/v3tz10wZVyJC68LN7++ekzWUtE9CMIr42Fy76N
 Z02TfNgZQs41o0p9p2A1vTXTTZAyhtSAnaDGaAfiL0hk4XO84cwA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 1hnh6lWbRHa4 for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:15 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7yP07Lnz1RvlN;
 Thu, 20 Jan 2022 22:00:12 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/61] target/riscv: rvv-1.0: Add Zve64f support for load and
 store insns
Date: Fri, 21 Jan 2022 15:57:50 +1000
Message-Id: <20220121055830.3164408-22-alistair.francis@opensource.wdc.com>
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

All Zve* extensions support all vector load and store instructions,
except Zve64* extensions do not support EEW=3D64 for index values when
XLEN=3D32.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-4-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 5b47729a21..0bf41aaa1e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -263,10 +263,21 @@ static bool vext_check_st_index(DisasContext *s, in=
t vd, int vs2, int nf,
                                 uint8_t eew)
 {
     int8_t emul =3D eew - s->sew + s->lmul;
-    return (emul >=3D -3 && emul <=3D 3) &&
-            require_align(vs2, emul) &&
-            require_align(vd, s->lmul) &&
-            require_nf(vd, nf, s->lmul);
+    bool ret =3D (emul >=3D -3 && emul <=3D 3) &&
+               require_align(vs2, emul) &&
+               require_align(vd, s->lmul) &&
+               require_nf(vd, nf, s->lmul);
+
+    /*
+     * All Zve* extensions support all vector load and store instruction=
s,
+     * except Zve64* extensions do not support EEW=3D64 for index values
+     * when XLEN=3D32. (Section 18.2)
+     */
+    if (get_xl(s) =3D=3D MXL_RV32) {
+        ret &=3D (!has_ext(s, RVV) && s->ext_zve64f ? eew !=3D MO_64 : t=
rue);
+    }
+
+    return ret;
 }
=20
 /*
--=20
2.31.1


