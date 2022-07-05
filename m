Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A83566873
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:47:08 +0200 (CEST)
Received: from localhost ([::1]:37738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8g5E-0004kE-1Y
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fxB-0006ry-67
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fx9-00060z-9o
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZUpvwF/94x5M7x5QtGDP75yBTaxZ4FbtD+jMCeqrfA=;
 b=h4UcvzI7CKf6slor+ACMzvFfmChyxgdNyOkzmvSDRmxTsD2OzxHGueCWcy5MA3D9kQ7r3i
 r/+ewl2E1xqrOOGBHDuPXTsC/VtUSj6QeFQSstdx8MD0ym0D+eBRWiD7BkvUkrt4HqlrC4
 MryyeIAtKPINZIIuW5iSkULpE00aaTY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-m330jQe1NO6b42ytSwmvYQ-1; Tue, 05 Jul 2022 06:38:43 -0400
X-MC-Unique: m330jQe1NO6b42ytSwmvYQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60DB83800C2C;
 Tue,  5 Jul 2022 10:38:43 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98120492C3B;
 Tue,  5 Jul 2022 10:38:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 14/14] include/qemu/host-utils: Remove unused code in the
 *_overflow wrappers
Date: Tue,  5 Jul 2022 12:38:16 +0200
Message-Id: <20220705103816.608166-15-thuth@redhat.com>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
References: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

According to commit cec07c0b612975 the code in the #else paths was required
for GCC < 5.0 and Clang < 3.8. We don't support such old compilers
at all anymore, so we can remove these lines now. We keep the wrapper
function, though, since they are easier to read and help to make sure that
the parameters have the right types.

Message-Id: <20220701025132.303469-1-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/host-utils.h | 65 ---------------------------------------
 1 file changed, 65 deletions(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index bc743f5e32..29f3a99878 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -376,12 +376,7 @@ static inline uint64_t uabs64(int64_t v)
  */
 static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
 {
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
     return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return ((*ret ^ x) & ~(x ^ y)) < 0;
-#endif
 }
 
 /**
@@ -394,12 +389,7 @@ static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
  */
 static inline bool sadd64_overflow(int64_t x, int64_t y, int64_t *ret)
 {
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
     return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return ((*ret ^ x) & ~(x ^ y)) < 0;
-#endif
 }
 
 /**
@@ -412,12 +402,7 @@ static inline bool sadd64_overflow(int64_t x, int64_t y, int64_t *ret)
  */
 static inline bool uadd32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
 {
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
     return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return *ret < x;
-#endif
 }
 
 /**
@@ -430,12 +415,7 @@ static inline bool uadd32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
  */
 static inline bool uadd64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
 {
-#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
     return __builtin_add_overflow(x, y, ret);
-#else
-    *ret = x + y;
-    return *ret < x;
-#endif
 }
 
 /**
@@ -449,12 +429,7 @@ static inline bool uadd64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
  */
 static inline bool ssub32_overflow(int32_t x, int32_t y, int32_t *ret)
 {
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
     return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return ((*ret ^ x) & (x ^ y)) < 0;
-#endif
 }
 
 /**
@@ -468,12 +443,7 @@ static inline bool ssub32_overflow(int32_t x, int32_t y, int32_t *ret)
  */
 static inline bool ssub64_overflow(int64_t x, int64_t y, int64_t *ret)
 {
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
     return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return ((*ret ^ x) & (x ^ y)) < 0;
-#endif
 }
 
 /**
@@ -487,12 +457,7 @@ static inline bool ssub64_overflow(int64_t x, int64_t y, int64_t *ret)
  */
 static inline bool usub32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
 {
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
     return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return x < y;
-#endif
 }
 
 /**
@@ -506,12 +471,7 @@ static inline bool usub32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
  */
 static inline bool usub64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
 {
-#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
     return __builtin_sub_overflow(x, y, ret);
-#else
-    *ret = x - y;
-    return x < y;
-#endif
 }
 
 /**
@@ -524,13 +484,7 @@ static inline bool usub64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
  */
 static inline bool smul32_overflow(int32_t x, int32_t y, int32_t *ret)
 {
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
     return __builtin_mul_overflow(x, y, ret);
-#else
-    int64_t z = (int64_t)x * y;
-    *ret = z;
-    return *ret != z;
-#endif
 }
 
 /**
@@ -543,14 +497,7 @@ static inline bool smul32_overflow(int32_t x, int32_t y, int32_t *ret)
  */
 static inline bool smul64_overflow(int64_t x, int64_t y, int64_t *ret)
 {
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
     return __builtin_mul_overflow(x, y, ret);
-#else
-    uint64_t hi, lo;
-    muls64(&lo, &hi, x, y);
-    *ret = lo;
-    return hi != ((int64_t)lo >> 63);
-#endif
 }
 
 /**
@@ -563,13 +510,7 @@ static inline bool smul64_overflow(int64_t x, int64_t y, int64_t *ret)
  */
 static inline bool umul32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
 {
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
     return __builtin_mul_overflow(x, y, ret);
-#else
-    uint64_t z = (uint64_t)x * y;
-    *ret = z;
-    return z > UINT32_MAX;
-#endif
 }
 
 /**
@@ -582,13 +523,7 @@ static inline bool umul32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
  */
 static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
 {
-#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
     return __builtin_mul_overflow(x, y, ret);
-#else
-    uint64_t hi;
-    mulu64(ret, &hi, x, y);
-    return hi != 0;
-#endif
 }
 
 /*
-- 
2.31.1


