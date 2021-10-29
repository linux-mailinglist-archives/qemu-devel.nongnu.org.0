Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6970743F7EA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:37:01 +0200 (CEST)
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMRg-00079H-G0
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7g-00077Q-GM
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:16:24 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:18206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7c-0002y7-OA
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491774; x=1667027774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MGzPqOjQD7Bt9gblaX8nXto+xms0VoU5Wd5s138rTY4=;
 b=IYz6tEMJCUYGkBEWFsvyKcK8EAdBKjHJxhYGJDUW1P/2L84938bYbVpQ
 l/mrEN9YuRi2dd+59DAJH+SywTLsXnVNZaV2yTB8IOCvBTjNJ25aVcGDX
 V04fOTMC7GFCfpxMgRvzPyjNS0/NY88gOwbI2re/QmTcxKNtqCw+sbxky
 JWgTM16aCRWMew0q8dKTv8pvmSI6bg9b7cXWIEj+6GBT2vzb9bkk7Im5m
 QFwhXQP/BwBug3hs5B9t+sj/dy87z4a0w0S/hzZk7qaTvscQNvaEM26Hy
 PDrWJM9DS28ozGDiXykT2IysRdP/KB5exfC7ZQv2y9GWmcUeUhHiV2MQd g==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="188934354"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:16:14 +0800
IronPort-SDR: NDKoE3+b+35qW38EVTe4Qy7OU+volUZO3gV42uoifwRJl1azx7kYXltvSKlqlSN4/M2+iWI4Vh
 px2RTbfvabOdj+B9P3j7gFVOVkKc44UrE5owrDQINWWDec8Gm5+66exqN6xFa2y+ogkjp4sWxh
 Yv+jyTthJRwxTVKeP5V/kZ5rRKlZTN7+FAmHQ9as7MlthOpycNnerHoNd+VE/bAYIf1lQReETl
 C9SGXFyyDnUFKZuEgRjE2NqTt3kwzRnymMEEJzSOhGQl1gxO7T34IGX2BRHh289FGMShgwEWqw
 zzw0jvGzn8mlfchRa+GyMsAR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:51:40 -0700
IronPort-SDR: 2A4D+KGSeLeQPOPkmkchZORnhN4ubePrFVtlwt6dSdCaZlPoMMER4nmWnki3WSBW+E31yOntW+
 LaZpPyY+HktWbXd8ZiWpWFS0NojJIF3sIsIHOrikmrbhsPRYpOWoGQ8mcrl3623jhbZ4dH9YAX
 CdpcYDOvgzvpor0X8vequ2qXhmv5IUu7VdPbvzqF2sb6hlYx3ItnFdslc+eQjPkAqF8fxubgbY
 MpooL4xEtCz1W8I9HZcDK6X70d6YPECpB0vBMbjTbKW0MMkPlHqmBHoc8r3pBupVSPXHQ4iE5i
 YpI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:16:15 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYcs75mxz1RtVt
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:16:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491773; x=1638083774; bh=MGzPqOjQD7Bt9gblaX
 8nXto+xms0VoU5Wd5s138rTY4=; b=Tgqy0jso6Vl+07lwNtdrfukwsMM1qJ9MaI
 3uyih/kXO+/+f3RZ0LSEhSx/ujFjLAaLgeYWGjS84YzVVH72NmikrHDnaJbyxxKt
 RPm9Wzukv9138qX0g7/TROXlx2Zb2hdOYXUTmFW6Hd/pQj4sPwHv0uR7MSlMJZeN
 4cTWsOX/2sL4ohmvZNmEfibB293zjyuw3ncQzQ+LuO2roixy0optCKQhWvP9awUk
 VVpP673Ugy8gR82K/mFHFYuCUtpCqSZxPFdzXnl4iHtG29GLrdDOuljNHBDYYzVP
 uoWpkTyO1lHca2lhZbRmZGImt7B/KaCQq8zRIVILMo868YqliskQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QNyYqHFVXzvl for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:16:13 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYck23Fqz1RtVl;
 Fri, 29 Oct 2021 00:16:05 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Chih-Min Chao <chihmin.chao@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 17/18] softfloat: add APIs to handle alternative sNaN
 propagation for fmax/fmin
Date: Fri, 29 Oct 2021 17:08:16 +1000
Message-Id: <20211029070817.100529-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Chih-Min Chao <chihmin.chao@sifive.com>

For "fmax/fmin ft0, ft1, ft2" and if one of the inputs is sNaN,

  The original logic:
    Return NaN and set invalid flag if ft1 =3D=3D sNaN || ft2 =3D=3D sNan=
.

  The alternative path:
    Set invalid flag if ft1 =3D=3D sNaN || ft2 =3D=3D sNaN.
    Return NaN only if ft1 =3D=3D NaN && ft2 =3D=3D NaN.

The IEEE 754 spec allows both implementation and some architecture such
as riscv choose different defintions in two spec versions.
(riscv-spec-v2.2 use original version, riscv-spec-20191213 changes to
 alternative)

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211021160847.2748577-2-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/fpu/softfloat.h   | 10 ++++++++++
 fpu/softfloat.c           | 19 +++++++++++++------
 fpu/softfloat-parts.c.inc | 25 +++++++++++++++++++++++--
 3 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index ec7dca0960..a249991e61 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -243,6 +243,8 @@ float16 float16_minnum(float16, float16, float_status=
 *status);
 float16 float16_maxnum(float16, float16, float_status *status);
 float16 float16_minnummag(float16, float16, float_status *status);
 float16 float16_maxnummag(float16, float16, float_status *status);
+float16 float16_minimum_number(float16, float16, float_status *status);
+float16 float16_maximum_number(float16, float16, float_status *status);
 float16 float16_sqrt(float16, float_status *status);
 FloatRelation float16_compare(float16, float16, float_status *status);
 FloatRelation float16_compare_quiet(float16, float16, float_status *stat=
us);
@@ -422,6 +424,8 @@ bfloat16 bfloat16_minnum(bfloat16, bfloat16, float_st=
atus *status);
 bfloat16 bfloat16_maxnum(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_minnummag(bfloat16, bfloat16, float_status *status);
 bfloat16 bfloat16_maxnummag(bfloat16, bfloat16, float_status *status);
+bfloat16 bfloat16_minimum_number(bfloat16, bfloat16, float_status *statu=
s);
+bfloat16 bfloat16_maximum_number(bfloat16, bfloat16, float_status *statu=
s);
 bfloat16 bfloat16_sqrt(bfloat16, float_status *status);
 FloatRelation bfloat16_compare(bfloat16, bfloat16, float_status *status)=
;
 FloatRelation bfloat16_compare_quiet(bfloat16, bfloat16, float_status *s=
tatus);
@@ -589,6 +593,8 @@ float32 float32_minnum(float32, float32, float_status=
 *status);
 float32 float32_maxnum(float32, float32, float_status *status);
 float32 float32_minnummag(float32, float32, float_status *status);
 float32 float32_maxnummag(float32, float32, float_status *status);
+float32 float32_minimum_number(float32, float32, float_status *status);
+float32 float32_maximum_number(float32, float32, float_status *status);
 bool float32_is_quiet_nan(float32, float_status *status);
 bool float32_is_signaling_nan(float32, float_status *status);
 float32 float32_silence_nan(float32, float_status *status);
@@ -778,6 +784,8 @@ float64 float64_minnum(float64, float64, float_status=
 *status);
 float64 float64_maxnum(float64, float64, float_status *status);
 float64 float64_minnummag(float64, float64, float_status *status);
 float64 float64_maxnummag(float64, float64, float_status *status);
+float64 float64_minimum_number(float64, float64, float_status *status);
+float64 float64_maximum_number(float64, float64, float_status *status);
 bool float64_is_quiet_nan(float64 a, float_status *status);
 bool float64_is_signaling_nan(float64, float_status *status);
 float64 float64_silence_nan(float64, float_status *status);
@@ -1210,6 +1218,8 @@ float128 float128_minnum(float128, float128, float_=
status *status);
 float128 float128_maxnum(float128, float128, float_status *status);
 float128 float128_minnummag(float128, float128, float_status *status);
 float128 float128_maxnummag(float128, float128, float_status *status);
+float128 float128_minimum_number(float128, float128, float_status *statu=
s);
+float128 float128_maximum_number(float128, float128, float_status *statu=
s);
 bool float128_is_quiet_nan(float128, float_status *status);
 bool float128_is_signaling_nan(float128, float_status *status);
 float128 float128_silence_nan(float128, float_status *status);
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6e769f990c..9a28720d82 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -436,6 +436,11 @@ enum {
     minmax_isnum =3D 2,
     /* Set for the IEEE 754-2008 minNumMag() and minNumMag() operations.=
 */
     minmax_ismag =3D 4,
+    /*
+     * Set for the IEEE 754-2019 minimumNumber() and maximumNumber()
+     * operations.
+     */
+    minmax_isnumber =3D 8,
 };
=20
 /* Simple helpers for checking if, or what kind of, NaN we have */
@@ -3927,12 +3932,14 @@ static float128 float128_minmax(float128 a, float=
128 b,
     { return type##_minmax(a, b, s, flags); }
=20
 #define MINMAX_2(type) \
-    MINMAX_1(type, max, 0)                                      \
-    MINMAX_1(type, maxnum, minmax_isnum)                        \
-    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)      \
-    MINMAX_1(type, min, minmax_ismin)                           \
-    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)         \
-    MINMAX_1(type, minnummag, minmax_ismin | minmax_isnum | minmax_ismag=
)
+    MINMAX_1(type, max, 0)                                              =
  \
+    MINMAX_1(type, maxnum, minmax_isnum)                                =
  \
+    MINMAX_1(type, maxnummag, minmax_isnum | minmax_ismag)              =
  \
+    MINMAX_1(type, maximum_number, minmax_isnumber)                     =
  \
+    MINMAX_1(type, min, minmax_ismin)                                   =
  \
+    MINMAX_1(type, minnum, minmax_ismin | minmax_isnum)                 =
  \
+    MINMAX_1(type, minnummag, minmax_ismin | minmax_isnum | minmax_ismag=
) \
+    MINMAX_1(type, minimum_number, minmax_ismin | minmax_isnumber)      =
  \
=20
 MINMAX_2(float16)
 MINMAX_2(bfloat16)
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index dddee92d6e..41d4b17e41 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1219,14 +1219,35 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a=
, FloatPartsN *b,
=20
     if (unlikely(ab_mask & float_cmask_anynan)) {
         /*
-         * For minnum/maxnum, if one operand is a QNaN, and the other
+         * For minNum/maxNum (IEEE 754-2008)
+         * or minimumNumber/maximumNumber (IEEE 754-2019),
+         * if one operand is a QNaN, and the other
          * operand is numerical, then return numerical argument.
          */
-        if ((flags & minmax_isnum)
+        if ((flags & (minmax_isnum | minmax_isnumber))
             && !(ab_mask & float_cmask_snan)
             && (ab_mask & ~float_cmask_qnan)) {
             return is_nan(a->cls) ? b : a;
         }
+
+        /*
+         * In IEEE 754-2019, minNum, maxNum, minNumMag and maxNumMag
+         * are removed and replaced with minimum, minimumNumber, maximum
+         * and maximumNumber.
+         * minimumNumber/maximumNumber behavior for SNaN is changed to:
+         *   If both operands are NaNs, a QNaN is returned.
+         *   If either operand is a SNaN,
+         *   an invalid operation exception is signaled,
+         *   but unless both operands are NaNs,
+         *   the SNaN is otherwise ignored and not converted to a QNaN.
+         */
+        if ((flags & minmax_isnumber)
+            && (ab_mask & float_cmask_snan)
+            && (ab_mask & ~float_cmask_anynan)) {
+            float_raise(float_flag_invalid, s);
+            return is_nan(a->cls) ? b : a;
+        }
+
         return parts_pick_nan(a, b, s);
     }
=20
--=20
2.31.1


