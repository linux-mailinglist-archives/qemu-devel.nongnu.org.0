Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18142B2D44
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 14:11:28 +0100 (CET)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdvKx-0008Iu-GM
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 08:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kdvJP-0007Yn-0e; Sat, 14 Nov 2020 08:09:51 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kdvJJ-0004NY-Fj; Sat, 14 Nov 2020 08:09:50 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CYFz40P3rz6wHn;
 Sat, 14 Nov 2020 21:09:04 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Sat, 14 Nov 2020
 21:09:09 +0800
From: Xinhao Zhang <zhangxinhao1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] fpu/softfloat.c: add spaces around operator
Date: Sat, 14 Nov 2020 21:07:15 +0800
Message-ID: <20201114130715.1126922-1-zhangxinhao1@huawei.com>
X-Mailer: git-send-email 2.29.0-rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=zhangxinhao1@huawei.com; helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 08:09:16
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-trivial@nongnu.org, alex.chen@huawei.com,
 alex.bennee@linaro.org, aurelien@aurel32.net, dengkai1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix code style. Operator needs spaces both sides.

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
---
 fpu/softfloat.c | 150 ++++++++++++++++++++++++------------------------
 1 file changed, 75 insertions(+), 75 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 67cfa0fd82..9938a20905 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3786,13 +3786,13 @@ static int32_t roundAndPackInt32(bool zSign, uint64_t absZ,
         abort();
     }
     roundBits = absZ & 0x7F;
-    absZ = ( absZ + roundIncrement )>>7;
+    absZ = ( absZ + roundIncrement ) >> 7;
     if (!(roundBits ^ 0x40) && roundNearestEven) {
         absZ &= ~1;
     }
     z = absZ;
     if ( zSign ) z = - z;
-    if ( ( absZ>>32 ) || ( z && ( ( z < 0 ) ^ zSign ) ) ) {
+    if ( ( absZ >> 32 ) || ( z && ( ( z < 0 ) ^ zSign ) ) ) {
         float_raise(float_flag_invalid, status);
         return zSign ? INT32_MIN : INT32_MAX;
     }
@@ -3938,7 +3938,7 @@ static void
     int8_t shiftCount;
 
     shiftCount = clz32(aSig) - 8;
-    *zSigPtr = aSig<<shiftCount;
+    *zSigPtr = aSig << shiftCount;
     *zExpPtr = 1 - shiftCount;
 
 }
@@ -4033,7 +4033,7 @@ static float32 roundAndPackFloat32(bool zSign, int zExp, uint32_t zSig,
     if (roundBits) {
         status->float_exception_flags |= float_flag_inexact;
     }
-    zSig = ( zSig + roundIncrement )>>7;
+    zSig = ( zSig + roundIncrement ) >> 7;
     if (!(roundBits ^ 0x40) && roundNearestEven) {
         zSig &= ~1;
     }
@@ -4058,7 +4058,7 @@ static float32
     int8_t shiftCount;
 
     shiftCount = clz32(zSig) - 1;
-    return roundAndPackFloat32(zSign, zExp - shiftCount, zSig<<shiftCount,
+    return roundAndPackFloat32(zSign, zExp - shiftCount, zSig << shiftCount,
                                status);
 
 }
@@ -4076,7 +4076,7 @@ static void
     int8_t shiftCount;
 
     shiftCount = clz64(aSig) - 11;
-    *zSigPtr = aSig<<shiftCount;
+    *zSigPtr = aSig << shiftCount;
     *zExpPtr = 1 - shiftCount;
 
 }
@@ -4096,7 +4096,7 @@ static inline float64 packFloat64(bool zSign, int zExp, uint64_t zSig)
 {
 
     return make_float64(
-        ( ( (uint64_t) zSign )<<63 ) + ( ( (uint64_t) zExp )<<52 ) + zSig);
+        ( ( (uint64_t) zSign ) << 63 ) + ( ( (uint64_t) zExp ) << 52 ) + zSig);
 
 }
 
@@ -4189,7 +4189,7 @@ static float64 roundAndPackFloat64(bool zSign, int zExp, uint64_t zSig,
     if (roundBits) {
         status->float_exception_flags |= float_flag_inexact;
     }
-    zSig = ( zSig + roundIncrement )>>10;
+    zSig = ( zSig + roundIncrement ) >> 10;
     if (!(roundBits ^ 0x200) && roundNearestEven) {
         zSig &= ~1;
     }
@@ -4214,7 +4214,7 @@ static float64
     int8_t shiftCount;
 
     shiftCount = clz64(zSig) - 1;
-    return roundAndPackFloat64(zSign, zExp - shiftCount, zSig<<shiftCount,
+    return roundAndPackFloat64(zSign, zExp - shiftCount, zSig << shiftCount,
                                status);
 
 }
@@ -4232,7 +4232,7 @@ void normalizeFloatx80Subnormal(uint64_t aSig, int32_t *zExpPtr,
     int8_t shiftCount;
 
     shiftCount = clz64(aSig);
-    *zSigPtr = aSig<<shiftCount;
+    *zSigPtr = aSig << shiftCount;
     *zExpPtr = 1 - shiftCount;
 }
 
@@ -4326,7 +4326,7 @@ floatx80 roundAndPackFloatx80(int8_t roundingPrecision, bool zSign,
             zSig0 += roundIncrement;
             if ( (int64_t) zSig0 < 0 ) zExp = 1;
             roundIncrement = roundMask + 1;
-            if ( roundNearestEven && ( roundBits<<1 == roundIncrement ) ) {
+            if ( roundNearestEven && ( roundBits << 1 == roundIncrement ) ) {
                 roundMask |= roundIncrement;
             }
             zSig0 &= ~ roundMask;
@@ -4342,7 +4342,7 @@ floatx80 roundAndPackFloatx80(int8_t roundingPrecision, bool zSign,
         zSig0 = UINT64_C(0x8000000000000000);
     }
     roundIncrement = roundMask + 1;
-    if ( roundNearestEven && ( roundBits<<1 == roundIncrement ) ) {
+    if ( roundNearestEven && ( roundBits << 1 == roundIncrement ) ) {
         roundMask |= roundIncrement;
     }
     zSig0 &= ~ roundMask;
@@ -4509,7 +4509,7 @@ static inline uint64_t extractFloat128Frac0( float128 a )
 static inline int32_t extractFloat128Exp( float128 a )
 {
 
-    return ( a.high>>48 ) & 0x7FFF;
+    return ( a.high >> 48 ) & 0x7FFF;
 
 }
 
@@ -4546,11 +4546,11 @@ static void
     if ( aSig0 == 0 ) {
         shiftCount = clz64(aSig1) - 15;
         if ( shiftCount < 0 ) {
-            *zSig0Ptr = aSig1>>( - shiftCount );
-            *zSig1Ptr = aSig1<<( shiftCount & 63 );
+            *zSig0Ptr = aSig1 >> ( - shiftCount );
+            *zSig1Ptr = aSig1 << ( shiftCount & 63 );
         }
         else {
-            *zSig0Ptr = aSig1<<shiftCount;
+            *zSig0Ptr = aSig1 << shiftCount;
             *zSig1Ptr = 0;
         }
         *zExpPtr = - shiftCount - 63;
@@ -4775,7 +4775,7 @@ floatx80 int32_to_floatx80(int32_t a, float_status *status)
     absA = zSign ? - a : a;
     shiftCount = clz32(absA) + 32;
     zSig = absA;
-    return packFloatx80( zSign, 0x403E - shiftCount, zSig<<shiftCount );
+    return packFloatx80( zSign, 0x403E - shiftCount, zSig << shiftCount );
 
 }
 
@@ -4797,7 +4797,7 @@ float128 int32_to_float128(int32_t a, float_status *status)
     absA = zSign ? - a : a;
     shiftCount = clz32(absA) + 17;
     zSig0 = absA;
-    return packFloat128( zSign, 0x402E - shiftCount, zSig0<<shiftCount, 0 );
+    return packFloat128( zSign, 0x402E - shiftCount, zSig0 << shiftCount, 0 );
 
 }
 
@@ -4818,7 +4818,7 @@ floatx80 int64_to_floatx80(int64_t a, float_status *status)
     zSign = ( a < 0 );
     absA = zSign ? - a : a;
     shiftCount = clz64(absA);
-    return packFloatx80( zSign, 0x403E - shiftCount, absA<<shiftCount );
+    return packFloatx80( zSign, 0x403E - shiftCount, absA << shiftCount );
 
 }
 
@@ -4901,7 +4901,7 @@ floatx80 float32_to_floatx80(float32 a, float_status *status)
         normalizeFloat32Subnormal( aSig, &aExp, &aSig );
     }
     aSig |= 0x00800000;
-    return packFloatx80( aSign, aExp + 0x3F80, ( (uint64_t) aSig )<<40 );
+    return packFloatx80( aSign, aExp + 0x3F80, ( (uint64_t) aSig ) << 40 );
 
 }
 
@@ -4933,7 +4933,7 @@ float128 float32_to_float128(float32 a, float_status *status)
         normalizeFloat32Subnormal( aSig, &aExp, &aSig );
         --aExp;
     }
-    return packFloat128( aSign, aExp + 0x3F80, ( (uint64_t) aSig )<<25, 0 );
+    return packFloat128( aSign, aExp + 0x3F80, ( (uint64_t) aSig ) << 25, 0 );
 
 }
 
@@ -4997,10 +4997,10 @@ float32 float32_rem(float32 a, float32 b, float_status *status)
         q = ( bSig <= aSig );
         if ( q ) aSig -= bSig;
         if ( 0 < expDiff ) {
-            q = ( ( (uint64_t) aSig )<<32 ) / bSig;
+            q = ( ( (uint64_t) aSig ) << 32 ) / bSig;
             q >>= 32 - expDiff;
             bSig >>= 2;
-            aSig = ( ( aSig>>1 )<<( expDiff - 1 ) ) - bSig * q;
+            aSig = ( ( aSig >> 1 ) << ( expDiff - 1 ) ) - bSig * q;
         }
         else {
             aSig >>= 2;
@@ -5009,21 +5009,21 @@ float32 float32_rem(float32 a, float32 b, float_status *status)
     }
     else {
         if ( bSig <= aSig ) aSig -= bSig;
-        aSig64 = ( (uint64_t) aSig )<<40;
-        bSig64 = ( (uint64_t) bSig )<<40;
+        aSig64 = ( (uint64_t) aSig ) << 40;
+        bSig64 = ( (uint64_t) bSig ) << 40;
         expDiff -= 64;
         while ( 0 < expDiff ) {
             q64 = estimateDiv128To64( aSig64, 0, bSig64 );
             q64 = ( 2 < q64 ) ? q64 - 2 : 0;
-            aSig64 = - ( ( bSig * q64 )<<38 );
+            aSig64 = - ( ( bSig * q64 ) << 38 );
             expDiff -= 62;
         }
         expDiff += 64;
         q64 = estimateDiv128To64( aSig64, 0, bSig64 );
         q64 = ( 2 < q64 ) ? q64 - 2 : 0;
-        q = q64>>( 64 - expDiff );
+        q = q64 >> ( 64 - expDiff );
         bSig <<= 6;
-        aSig = ( ( aSig64>>33 )<<( expDiff - 1 ) ) - bSig * q;
+        aSig = ( ( aSig64 >> 33 ) << ( expDiff - 1 ) ) - bSig * q;
     }
     do {
         alternateASig = aSig;
@@ -5302,7 +5302,7 @@ float64 float64_rem(float64 a, float64 b, float_status *status)
     while ( 0 < expDiff ) {
         q = estimateDiv128To64( aSig, 0, bSig );
         q = ( 2 < q ) ? q - 2 : 0;
-        aSig = - ( ( bSig>>2 ) * q );
+        aSig = - ( ( bSig >> 2 ) * q );
         expDiff -= 62;
     }
     expDiff += 64;
@@ -5311,7 +5311,7 @@ float64 float64_rem(float64 a, float64 b, float_status *status)
         q = ( 2 < q ) ? q - 2 : 0;
         q >>= 64 - expDiff;
         bSig >>= 2;
-        aSig = ( ( aSig>>1 )<<( expDiff - 1 ) ) - bSig * q;
+        aSig = ( ( aSig >> 1 ) << ( expDiff - 1 ) ) - bSig * q;
     }
     else {
         aSig >>= 2;
@@ -5404,7 +5404,7 @@ int32_t floatx80_to_int32(floatx80 a, float_status *status)
     aSig = extractFloatx80Frac( a );
     aExp = extractFloatx80Exp( a );
     aSign = extractFloatx80Sign( a );
-    if ( ( aExp == 0x7FFF ) && (uint64_t) ( aSig<<1 ) ) aSign = 0;
+    if ( ( aExp == 0x7FFF ) && (uint64_t) ( aSig << 1 ) ) aSign = 0;
     shiftCount = 0x4037 - aExp;
     if ( shiftCount <= 0 ) shiftCount = 1;
     shift64RightJamming( aSig, shiftCount, &aSig );
@@ -5437,7 +5437,7 @@ int32_t floatx80_to_int32_round_to_zero(floatx80 a, float_status *status)
     aExp = extractFloatx80Exp( a );
     aSign = extractFloatx80Sign( a );
     if ( 0x401E < aExp ) {
-        if ( ( aExp == 0x7FFF ) && (uint64_t) ( aSig<<1 ) ) aSign = 0;
+        if ( ( aExp == 0x7FFF ) && (uint64_t) ( aSig << 1 ) ) aSign = 0;
         goto invalid;
     }
     else if ( aExp < 0x3FFF ) {
@@ -5456,7 +5456,7 @@ int32_t floatx80_to_int32_round_to_zero(floatx80 a, float_status *status)
         float_raise(float_flag_invalid, status);
         return aSign ? (int32_t) 0x80000000 : 0x7FFFFFFF;
     }
-    if ( ( aSig<<shiftCount ) != savedASig ) {
+    if ( ( aSig << shiftCount ) != savedASig ) {
         status->float_exception_flags |= float_flag_inexact;
     }
     return z;
@@ -5545,8 +5545,8 @@ int64_t floatx80_to_int64_round_to_zero(floatx80 a, float_status *status)
         }
         return 0;
     }
-    z = aSig>>( - shiftCount );
-    if ( (uint64_t) ( aSig<<( shiftCount & 63 ) ) ) {
+    z = aSig >> ( - shiftCount );
+    if ( (uint64_t) ( aSig << ( shiftCount & 63 ) ) ) {
         status->float_exception_flags |= float_flag_inexact;
     }
     if ( aSign ) z = - z;
@@ -5575,7 +5575,7 @@ float32 floatx80_to_float32(floatx80 a, float_status *status)
     aExp = extractFloatx80Exp( a );
     aSign = extractFloatx80Sign( a );
     if ( aExp == 0x7FFF ) {
-        if ( (uint64_t) ( aSig<<1 ) ) {
+        if ( (uint64_t) ( aSig << 1 ) ) {
             float32 res = commonNaNToFloat32(floatx80ToCommonNaN(a, status),
                                              status);
             return float32_silence_nan(res, status);
@@ -5609,7 +5609,7 @@ float64 floatx80_to_float64(floatx80 a, float_status *status)
     aExp = extractFloatx80Exp( a );
     aSign = extractFloatx80Sign( a );
     if ( aExp == 0x7FFF ) {
-        if ( (uint64_t) ( aSig<<1 ) ) {
+        if ( (uint64_t) ( aSig << 1 ) ) {
             float64 res = commonNaNToFloat64(floatx80ToCommonNaN(a, status),
                                              status);
             return float64_silence_nan(res, status);
@@ -5642,12 +5642,12 @@ float128 floatx80_to_float128(floatx80 a, float_status *status)
     aSig = extractFloatx80Frac( a );
     aExp = extractFloatx80Exp( a );
     aSign = extractFloatx80Sign( a );
-    if ( ( aExp == 0x7FFF ) && (uint64_t) ( aSig<<1 ) ) {
+    if ( ( aExp == 0x7FFF ) && (uint64_t) ( aSig << 1 ) ) {
         float128 res = commonNaNToFloat128(floatx80ToCommonNaN(a, status),
                                            status);
         return float128_silence_nan(res, status);
     }
-    shift128Right( aSig<<1, 0, 16, &zSig0, &zSig1 );
+    shift128Right( aSig << 1, 0, 16, &zSig0, &zSig1 );
     return packFloat128( aSign, aExp, zSig0, zSig1 );
 
 }
@@ -5688,7 +5688,7 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
     }
     aExp = extractFloatx80Exp( a );
     if ( 0x403E <= aExp ) {
-        if ( ( aExp == 0x7FFF ) && (uint64_t) ( extractFloatx80Frac( a )<<1 ) ) {
+        if ( ( aExp == 0x7FFF ) && (uint64_t) ( extractFloatx80Frac( a ) << 1 ) ) {
             return propagateFloatx80NaN(a, a, status);
         }
         return a;
@@ -5702,7 +5702,7 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
         aSign = extractFloatx80Sign( a );
         switch (status->float_rounding_mode) {
          case float_round_nearest_even:
-            if ( ( aExp == 0x3FFE ) && (uint64_t) ( extractFloatx80Frac( a )<<1 )
+            if ( ( aExp == 0x3FFE ) && (uint64_t) ( extractFloatx80Frac( a ) << 1 )
                ) {
                 return
                     packFloatx80( aSign, 0x3FFF, UINT64_C(0x8000000000000000));
@@ -5736,7 +5736,7 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
     z = a;
     switch (status->float_rounding_mode) {
     case float_round_nearest_even:
-        z.low += lastBitMask>>1;
+        z.low += lastBitMask >> 1;
         if ((z.low & roundBitsMask) == 0) {
             z.low &= ~lastBitMask;
         }
@@ -5817,7 +5817,7 @@ static floatx80 addFloatx80Sigs(floatx80 a, floatx80 b, bool zSign,
     }
     else {
         if ( aExp == 0x7FFF ) {
-            if ( (uint64_t) ( ( aSig | bSig )<<1 ) ) {
+            if ( (uint64_t) ( ( aSig | bSig ) << 1 ) ) {
                 return propagateFloatx80NaN(a, b, status);
             }
             return a;
@@ -5874,7 +5874,7 @@ static floatx80 subFloatx80Sigs(floatx80 a, floatx80 b, bool zSign,
     if ( 0 < expDiff ) goto aExpBigger;
     if ( expDiff < 0 ) goto bExpBigger;
     if ( aExp == 0x7FFF ) {
-        if ( (uint64_t) ( ( aSig | bSig )<<1 ) ) {
+        if ( (uint64_t) ( ( aSig | bSig ) << 1 ) ) {
             return propagateFloatx80NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
@@ -5994,8 +5994,8 @@ floatx80 floatx80_mul(floatx80 a, floatx80 b, float_status *status)
     bSign = extractFloatx80Sign( b );
     zSign = aSign ^ bSign;
     if ( aExp == 0x7FFF ) {
-        if (    (uint64_t) ( aSig<<1 )
-             || ( ( bExp == 0x7FFF ) && (uint64_t) ( bSig<<1 ) ) ) {
+        if (    (uint64_t) ( aSig << 1 )
+             || ( ( bExp == 0x7FFF ) && (uint64_t) ( bSig << 1 ) ) ) {
             return propagateFloatx80NaN(a, b, status);
         }
         if ( ( bExp | bSig ) == 0 ) goto invalid;
@@ -6106,7 +6106,7 @@ floatx80 floatx80_div(floatx80 a, floatx80 b, float_status *status)
         add128( rem0, rem1, 0, bSig, &rem0, &rem1 );
     }
     zSig1 = estimateDiv128To64( rem1, 0, bSig );
-    if ( (uint64_t) ( zSig1<<1 ) <= 8 ) {
+    if ( (uint64_t) ( zSig1 << 1 ) <= 8 ) {
         mul64To128( bSig, zSig1, &term1, &term2 );
         sub128( rem1, 0, term1, term2, &rem1, &rem2 );
         while ( (int64_t) rem1 < 0 ) {
@@ -6147,8 +6147,8 @@ floatx80 floatx80_modrem(floatx80 a, floatx80 b, bool mod, uint64_t *quotient,
     bSig = extractFloatx80Frac( b );
     bExp = extractFloatx80Exp( b );
     if ( aExp == 0x7FFF ) {
-        if (    (uint64_t) ( aSig0<<1 )
-             || ( ( bExp == 0x7FFF ) && (uint64_t) ( bSig<<1 ) ) ) {
+        if (    (uint64_t) ( aSig0 << 1 )
+             || ( ( bExp == 0x7FFF ) && (uint64_t) ( bSig << 1 ) ) ) {
             return propagateFloatx80NaN(a, b, status);
         }
         goto invalid;
@@ -6213,7 +6213,7 @@ floatx80 floatx80_modrem(floatx80 a, floatx80 b, bool mod, uint64_t *quotient,
         q = estimateDiv128To64( aSig0, aSig1, bSig );
         q = ( 2 < q ) ? q - 2 : 0;
         q >>= 64 - expDiff;
-        mul64To128( bSig, q<<( 64 - expDiff ), &term0, &term1 );
+        mul64To128( bSig, q << ( 64 - expDiff ), &term0, &term1 );
         sub128( aSig0, aSig1, term0, term1, &aSig0, &aSig1 );
         shortShift128Left( 0, bSig, 64 - expDiff, &term0, &term1 );
         while ( le128( term0, term1, aSig0, aSig1 ) ) {
@@ -6310,17 +6310,17 @@ floatx80 floatx80_sqrt(floatx80 a, float_status *status)
         if ( aSig0 == 0 ) return packFloatx80( 0, 0, 0 );
         normalizeFloatx80Subnormal( aSig0, &aExp, &aSig0 );
     }
-    zExp = ( ( aExp - 0x3FFF )>>1 ) + 0x3FFF;
-    zSig0 = estimateSqrt32( aExp, aSig0>>32 );
+    zExp = ( ( aExp - 0x3FFF ) >> 1 ) + 0x3FFF;
+    zSig0 = estimateSqrt32( aExp, aSig0 >> 32 );
     shift128Right( aSig0, 0, 2 + ( aExp & 1 ), &aSig0, &aSig1 );
-    zSig0 = estimateDiv128To64( aSig0, aSig1, zSig0<<32 ) + ( zSig0<<30 );
-    doubleZSig0 = zSig0<<1;
+    zSig0 = estimateDiv128To64( aSig0, aSig1, zSig0 << 32 ) + ( zSig0 << 30 );
+    doubleZSig0 = zSig0 << 1;
     mul64To128( zSig0, zSig0, &term0, &term1 );
     sub128( aSig0, aSig1, term0, term1, &rem0, &rem1 );
     while ( (int64_t) rem0 < 0 ) {
         --zSig0;
         doubleZSig0 -= 2;
-        add128( rem0, rem1, zSig0>>63, doubleZSig0 | 1, &rem0, &rem1 );
+        add128( rem0, rem1, zSig0 >> 63, doubleZSig0 | 1, &rem0, &rem1 );
     }
     zSig1 = estimateDiv128To64( rem1, 0, doubleZSig0 );
     if ( ( zSig1 & UINT64_C(0x3FFFFFFFFFFFFFFF) ) <= 5 ) {
@@ -6416,7 +6416,7 @@ int32_t float128_to_int32_round_to_zero(float128 a, float_status *status)
         float_raise(float_flag_invalid, status);
         return aSign ? INT32_MIN : INT32_MAX;
     }
-    if ( ( aSig0<<shiftCount ) != savedASig ) {
+    if ( ( aSig0 << shiftCount ) != savedASig ) {
         status->float_exception_flags |= float_flag_inexact;
     }
     return z;
@@ -6506,8 +6506,8 @@ int64_t float128_to_int64_round_to_zero(float128 a, float_status *status)
             }
             return INT64_MIN;
         }
-        z = ( aSig0<<shiftCount ) | ( aSig1>>( ( - shiftCount ) & 63 ) );
-        if ( (uint64_t) ( aSig1<<shiftCount ) ) {
+        z = ( aSig0 << shiftCount ) | ( aSig1 >> ( ( - shiftCount ) & 63 ) );
+        if ( (uint64_t) ( aSig1 << shiftCount ) ) {
             status->float_exception_flags |= float_flag_inexact;
         }
     }
@@ -6518,9 +6518,9 @@ int64_t float128_to_int64_round_to_zero(float128 a, float_status *status)
             }
             return 0;
         }
-        z = aSig0>>( - shiftCount );
+        z = aSig0 >> ( - shiftCount );
         if (    aSig1
-             || ( shiftCount && (uint64_t) ( aSig0<<( shiftCount & 63 ) ) ) ) {
+             || ( shiftCount && (uint64_t) ( aSig0 << ( shiftCount & 63 ) ) ) ) {
             status->float_exception_flags |= float_flag_inexact;
         }
     }
@@ -6776,19 +6776,19 @@ float128 float128_round_to_int(float128 a, float_status *status)
             return a;
         }
         lastBitMask = 1;
-        lastBitMask = ( lastBitMask<<( 0x406E - aExp ) )<<1;
+        lastBitMask = ( lastBitMask << ( 0x406E - aExp ) ) << 1;
         roundBitsMask = lastBitMask - 1;
         z = a;
         switch (status->float_rounding_mode) {
         case float_round_nearest_even:
             if ( lastBitMask ) {
-                add128( z.high, z.low, 0, lastBitMask>>1, &z.high, &z.low );
+                add128( z.high, z.low, 0, lastBitMask >> 1, &z.high, &z.low );
                 if ( ( z.low & roundBitsMask ) == 0 ) z.low &= ~ lastBitMask;
             }
             else {
                 if ( (int64_t) z.low < 0 ) {
                     ++z.high;
-                    if ( (uint64_t) ( z.low<<1 ) == 0 ) z.high &= ~1;
+                    if ( (uint64_t) ( z.low << 1 ) == 0 ) z.high &= ~1;
                 }
             }
             break;
@@ -6829,7 +6829,7 @@ float128 float128_round_to_int(float128 a, float_status *status)
     }
     else {
         if ( aExp < 0x3FFF ) {
-            if ( ( ( (uint64_t) ( a.high<<1 ) ) | a.low ) == 0 ) return a;
+            if ( ( ( (uint64_t) ( a.high << 1 ) ) | a.low ) == 0 ) return a;
             status->float_exception_flags |= float_flag_inexact;
             aSign = extractFloat128Sign( a );
             switch (status->float_rounding_mode) {
@@ -6870,13 +6870,13 @@ float128 float128_round_to_int(float128 a, float_status *status)
         z.high = a.high;
         switch (status->float_rounding_mode) {
         case float_round_nearest_even:
-            z.high += lastBitMask>>1;
+            z.high += lastBitMask >> 1;
             if ( ( ( z.high & roundBitsMask ) | a.low ) == 0 ) {
                 z.high &= ~ lastBitMask;
             }
             break;
         case float_round_ties_away:
-            z.high += lastBitMask>>1;
+            z.high += lastBitMask >> 1;
             break;
         case float_round_to_zero:
             break;
@@ -7422,18 +7422,18 @@ float128 float128_sqrt(float128 a, float_status *status)
         if ( ( aSig0 | aSig1 ) == 0 ) return packFloat128( 0, 0, 0, 0 );
         normalizeFloat128Subnormal( aSig0, aSig1, &aExp, &aSig0, &aSig1 );
     }
-    zExp = ( ( aExp - 0x3FFF )>>1 ) + 0x3FFE;
+    zExp = ( ( aExp - 0x3FFF ) >> 1 ) + 0x3FFE;
     aSig0 |= UINT64_C(0x0001000000000000);
-    zSig0 = estimateSqrt32( aExp, aSig0>>17 );
+    zSig0 = estimateSqrt32( aExp, aSig0 >> 17 );
     shortShift128Left( aSig0, aSig1, 13 - ( aExp & 1 ), &aSig0, &aSig1 );
-    zSig0 = estimateDiv128To64( aSig0, aSig1, zSig0<<32 ) + ( zSig0<<30 );
-    doubleZSig0 = zSig0<<1;
+    zSig0 = estimateDiv128To64( aSig0, aSig1, zSig0 << 32 ) + ( zSig0 << 30 );
+    doubleZSig0 = zSig0 << 1;
     mul64To128( zSig0, zSig0, &term0, &term1 );
     sub128( aSig0, aSig1, term0, term1, &rem0, &rem1 );
     while ( (int64_t) rem0 < 0 ) {
         --zSig0;
         doubleZSig0 -= 2;
-        add128( rem0, rem1, zSig0>>63, doubleZSig0 | 1, &rem0, &rem1 );
+        add128( rem0, rem1, zSig0 >> 63, doubleZSig0 | 1, &rem0, &rem1 );
     }
     zSig1 = estimateDiv128To64( rem1, 0, doubleZSig0 );
     if ( ( zSig1 & 0x1FFF ) <= 5 ) {
@@ -7467,9 +7467,9 @@ floatx80_compare_internal(floatx80 a, floatx80 b, bool is_quiet,
         return float_relation_unordered;
     }
     if (( ( extractFloatx80Exp( a ) == 0x7fff ) &&
-          ( extractFloatx80Frac( a )<<1 ) ) ||
+          ( extractFloatx80Frac( a ) << 1 ) ) ||
         ( ( extractFloatx80Exp( b ) == 0x7fff ) &&
-          ( extractFloatx80Frac( b )<<1 ) )) {
+          ( extractFloatx80Frac( b ) << 1 ) )) {
         if (!is_quiet ||
             floatx80_is_signaling_nan(a, status) ||
             floatx80_is_signaling_nan(b, status)) {
@@ -7535,7 +7535,7 @@ float128_compare_internal(float128 a, float128 b, bool is_quiet,
     aSign = extractFloat128Sign( a );
     bSign = extractFloat128Sign( b );
     if ( aSign != bSign ) {
-        if ( ( ( ( a.high | b.high )<<1 ) | a.low | b.low ) == 0 ) {
+        if ( ( ( ( a.high | b.high ) << 1 ) | a.low | b.low ) == 0 ) {
             /* zero case */
             return float_relation_equal;
         } else {
@@ -7576,7 +7576,7 @@ floatx80 floatx80_scalbn(floatx80 a, int n, float_status *status)
     aSign = extractFloatx80Sign( a );
 
     if ( aExp == 0x7FFF ) {
-        if ( aSig<<1 ) {
+        if ( aSig << 1 ) {
             return propagateFloatx80NaN(a, a, status);
         }
         return a;
-- 
2.29.0-rc1


