Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFA24CFD59
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:48:52 +0100 (CET)
Received: from localhost ([::1]:42528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBr9-0001Cf-Dn
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:48:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <35b6466459f9234b9cb30296f243a70b6f1b44b7@lizzy.crudebyte.com>)
 id 1nRBnR-0004l0-Kw
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:45:01 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:53379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <35b6466459f9234b9cb30296f243a70b6f1b44b7@lizzy.crudebyte.com>)
 id 1nRBnP-00029D-Vq
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=b0kJJvQRJXiKQl93Iwsx0o6lTjxaRMH0jAe0PwTHfuQ=; b=AVzvI
 KRecvIX0WRvwvVNOHw4cXrYMih3tPbhIJDK50KmMFfgV9dGxQl7Hhghd2Dvm2qCTauTehX5ebjDJQ
 gvo8zx3psS3jtnLDVuZgxXSDjyd9VN/3bxf90gTUJa3cuuA4YRv6B2CzKKdQnK05E4bksxzeCPD/1
 ly+8iQuGwW6p39EB/DFZc/Bpouf5rRpBh10W8hhKTa06ZjGkUkdH4gylKbMdFcWjtsSYif6IX5tII
 HRCtPMiZrt99moq7pC0v+ErygLhTeTF4M1hGVkKKeFDGUTIrKkEVselH0MA0CB5hXe8kG7KPNEP0D
 yuNj1+5TDgHKLTSDHiPp3+p02ppxQ==;
Message-Id: <35b6466459f9234b9cb30296f243a70b6f1b44b7.1646651700.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646651700.git.qemu_oss@crudebyte.com>
References: <cover.1646651700.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 07 Mar 2022 12:15:00 +0100
Subject: [PULL v2 19/19] fsdev/p9array.h: convert Doxygen -> kerneldoc format
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>, Will Cohen <wwcohen@gmail.com>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=35b6466459f9234b9cb30296f243a70b6f1b44b7@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

API doc comments in QEMU are supposed to be in kerneldoc format, so
convert API doc comments from Doxygen format to kerneldoc format.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <2e2d46a402560f155de322d95789ba107d728885.1646314856.git.qemu_oss@crudebyte.com>
---
 fsdev/p9array.h | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/fsdev/p9array.h b/fsdev/p9array.h
index 6aa25327ca..90e83a7c7b 100644
--- a/fsdev/p9array.h
+++ b/fsdev/p9array.h
@@ -81,11 +81,11 @@
  */
 
 /**
- * Declares an array type for the passed @a scalar_type.
+ * P9ARRAY_DECLARE_TYPE() - Declares an array type for the passed @scalar_type.
  *
- * This is typically used from a shared header file.
+ * @scalar_type: type of the individual array elements
  *
- * @param scalar_type - type of the individual array elements
+ * This is typically used from a shared header file.
  */
 #define P9ARRAY_DECLARE_TYPE(scalar_type) \
     typedef struct P9Array##scalar_type { \
@@ -97,14 +97,14 @@
     void p9array_auto_free_##scalar_type(scalar_type **auto_var); \
 
 /**
- * Defines an array type for the passed @a scalar_type and appropriate
- * @a scalar_cleanup_func.
+ * P9ARRAY_DEFINE_TYPE() - Defines an array type for the passed @scalar_type
+ * and appropriate @scalar_cleanup_func.
  *
- * This is typically used from a C unit file.
+ * @scalar_type: type of the individual array elements
+ * @scalar_cleanup_func: appropriate function to free memory dynamically
+ *                       allocated by individual array elements before
  *
- * @param scalar_type - type of the individual array elements
- * @param scalar_cleanup_func - appropriate function to free memory dynamically
- *                              allocated by individual array elements before
+ * This is typically used from a C unit file.
  */
 #define P9ARRAY_DEFINE_TYPE(scalar_type, scalar_cleanup_func) \
     void p9array_new_##scalar_type(scalar_type **auto_var, size_t len) \
@@ -132,23 +132,27 @@
     } \
 
 /**
+ * P9ARRAY_REF() - Declare a reference variable for an array.
+ *
+ * @scalar_type: type of the individual array elements
+ *
  * Used to declare a reference variable (unique pointer) for an array. After
  * leaving the scope of the reference variable, the associated array is
  * automatically freed.
- *
- * @param scalar_type - type of the individual array elements
  */
 #define P9ARRAY_REF(scalar_type) \
     __attribute((__cleanup__(p9array_auto_free_##scalar_type))) scalar_type*
 
 /**
- * Allocates a new array of passed @a scalar_type with @a len number of array
- * elements and assigns the created array to the reference variable
- * @a auto_var.
+ * P9ARRAY_NEW() - Allocate a new array.
  *
- * @param scalar_type - type of the individual array elements
- * @param auto_var - destination reference variable
- * @param len - amount of array elements to be allocated immediately
+ * @scalar_type: type of the individual array elements
+ * @auto_var: destination reference variable
+ * @len: amount of array elements to be allocated immediately
+ *
+ * Allocates a new array of passed @scalar_type with @len number of array
+ * elements and assigns the created array to the reference variable
+ * @auto_var.
  */
 #define P9ARRAY_NEW(scalar_type, auto_var, len) \
     QEMU_BUILD_BUG_MSG( \
-- 
2.20.1


