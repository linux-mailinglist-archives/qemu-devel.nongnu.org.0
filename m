Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B846650658
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:24:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75id-0008Cm-NT; Sun, 18 Dec 2022 21:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iY-0008Al-HN
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:26 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75iW-00013w-TM
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:17:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416244; x=1702952244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CA4KckVxC2yHEoq4Su2S93cY9ilRgoP8o3uZSJMhlOs=;
 b=Y+P8A1R6loFkuwgluFYLspe5bbiJd6Xc5+xZupUUs/hd0GjDo8lL5eni
 iEubvSrnIHIlk4wOtp49lRGoD/q5wb5pRTOplefsAuz8FASUNMl+2dTuo
 temMScee0bSUpOoq3fmpr/lRfGxtr4+1vTaJ7cmeIr9jTrQcNnFWaw/DY
 +xXsnbpTnc83411xQgH1k34PaxNBeuwEv79PQzbfpyHV7AZyhX+upFdh2
 jl5iTIIAyoF/h4/z3Z/c7PykGM1CuMPT8P5yWElxg2ytCea+yC8GAEN8B
 WrcQdqaI7Sx42EbvCrwCJD1Z16ZQYzBQaGVvRGJGs237lmCDtnwlL/Msx w==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199280"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:23 +0800
IronPort-SDR: aXCWQtB5DYbazHwkr3ewQhmQYwloKWHUOindeTycQ866u3QS3ALUUHZWPqTkaGrq6XldMGAzXj
 nMY8ATupFph4RHt0MWbe2KOj8Ma0hVLtcs3HxgoATeB5H0gc7W7kW+eQY+KTW1BA/ULI+v+laP
 MQ1MZ3Umio/O4OFuIMj7sOB8miw1FJ2lUQPB36Jp8+rEC0ab4XE4hG6s0i+vhS1vTRirYRQkFq
 fITYB9+Asa500eK3LG69gSjvTXdlO44hpqVzQ/bCLj5izNWOf9tRZan72dJ6h2iE8o9yZyZt3T
 geI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:29:56 -0800
IronPort-SDR: jToedMe9jfg62Lw6DWbZH4zX8KERCRAWdZ9+N/+hj7DYQjgyU3WaZU4ThZfV2DhIzZagrR0gIM
 jHhViK5HZICoN/F9/0B6DbYka/tN00K+zuvP9anb6xA9HA2ySmrF0IUkxvBlNIje3iyKVwT76a
 myEJkuR0+SGmnxjR8E6O3Ln+FeSwa6r7ogsLzxUpSZP+Gd2gjzbKEFIDuRJ+E2yCzXUoHhqyxF
 JJPp4nrAgNJ7l27puPAYBToG/yYzAvh5i/2cVrm8eDGlpDEhfovuTpnj0hlbdDWOIVoLRhs4Fz
 Qvk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:23 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3J31Q0qz1Rwt8
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:23 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416242; x=1674008243; bh=CA4KckVxC2yHEoq4Su
 2S93cY9ilRgoP8o3uZSJMhlOs=; b=dmNSHIOhTtHVOcD4a/kEwLvgNGE68ddaXN
 fxuipKXPa9ejvXQ3tLpwQRMSukQ80H01mmEEDn0xbaNHctOeKYCIcqAvWxO9GJBb
 bWyjva63BcBVdhBSt0/BJQ2RGmU3OV2hrRQojEhiHB/yEGvpBSep8By4Q90m7ptk
 ZpEf+eQ5SxW52wDZoWmbD1rucvF1uwtIYh1cugAecQUjFGtH5RmJsvYhOJBMIwaq
 hBDcTpb1iMEbB0R3lrexHadnxej0+3vC4xBxyHMe/giG1/WOPyylyHgQDcK3Crvt
 HWJq7HAdrVXYyYM4ZpmZxqaEfFLRD+vuLZgBDGg/bGsBNbDCJI+g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gKkWB8GkCi8S for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:22 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3J06s8bz1RvLy;
 Sun, 18 Dec 2022 18:17:20 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 04/45] tcg/riscv: Fix range matched by TCG_CT_CONST_M12
Date: Mon, 19 Dec 2022 12:16:22 +1000
Message-Id: <20221219021703.20473-5-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
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

We were matching a signed 13-bit range, not a 12-bit range.
Expand the commentary within the function and be explicit
about all of the ranges.

Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221022095821.2441874-1-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tcg/riscv/tcg-target.c.inc | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 81a83e45b1..191197853f 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -154,13 +154,26 @@ static bool tcg_target_const_match(int64_t val, TCG=
Type type, int ct)
     if ((ct & TCG_CT_CONST_ZERO) && val =3D=3D 0) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_S12) && val =3D=3D sextreg(val, 0, 12)) {
+    /*
+     * Sign extended from 12 bits: [-0x800, 0x7ff].
+     * Used for most arithmetic, as this is the isa field.
+     */
+    if ((ct & TCG_CT_CONST_S12) && val >=3D -0x800 && val <=3D 0x7ff) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_N12) && -val =3D=3D sextreg(-val, 0, 12)) {
+    /*
+     * Sign extended from 12 bits, negated: [-0x7ff, 0x800].
+     * Used for subtraction, where a constant must be handled by ADDI.
+     */
+    if ((ct & TCG_CT_CONST_N12) && val >=3D -0x7ff && val <=3D 0x800) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_M12) && val >=3D -0xfff && val <=3D 0xfff) {
+    /*
+     * Sign extended from 12 bits, +/- matching: [-0x7ff, 0x7ff].
+     * Used by addsub2, which may need the negative operation,
+     * and requires the modified constant to be representable.
+     */
+    if ((ct & TCG_CT_CONST_M12) && val >=3D -0x7ff && val <=3D 0x7ff) {
         return 1;
     }
     return 0;
--=20
2.38.1


