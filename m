Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4795F29923D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 17:22:48 +0100 (CET)
Received: from localhost ([::1]:53752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX5Gg-0005sS-Pf
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 12:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5E9-00041e-LA
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:20:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5E7-0008UM-44
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603729205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5xaHCq17iNYCwX5xwZ/x4WrzmZ7UADqx3uFxpQLlfc=;
 b=Fr74ZzCBgdRjQhOwBpZIyy47aB8jrNZejfXPpiry4pgD2kk6XWayLl0bk8Z2SLl042yfCb
 GkZpbRF3XQnBkFtZoGyv9E6zVOGczVeOJ2YqMtbrF6oMAugYRSTzs2D506Ukd9lBTSMBv6
 gCwnmNgqgCpmK7efbU02zKDWAvF7f+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-7CDGDqMeOI-i5SmuwMfYtA-1; Mon, 26 Oct 2020 12:20:01 -0400
X-MC-Unique: 7CDGDqMeOI-i5SmuwMfYtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BB9080364B;
 Mon, 26 Oct 2020 16:20:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-208.ams2.redhat.com
 [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B08B5D9E8;
 Mon, 26 Oct 2020 16:19:58 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, yubihong@huawei.com, peterx@redhat.com,
 peter.maydell@linaro.org
Subject: [PULL 01/16] migration: Drop unused VMSTATE_FLOAT64 support
Date: Mon, 26 Oct 2020 16:19:37 +0000
Message-Id: <20201026161952.149188-2-dgilbert@redhat.com>
In-Reply-To: <20201026161952.149188-1-dgilbert@redhat.com>
References: <20201026161952.149188-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Commit ef96e3ae9698d6 in January 2019 removed the last user of the
VMSTATE_FLOAT64* macros. These were used by targets which defined
their floating point register file as an array of 'float64'.

We used to try to maintain a stricter distinction between
'float64' (a type for holding an integer representing an IEEE float)
and 'uint64_t', including having a debug option for 'float64' being
a struct and supposedly mandatory macros for converting between
float64 and uint64_t. We no longer think that's a usefully
strong distinction to draw and we allow ourselves to freely
assume that float64 really is just a 64-bit integer type, so
for new targets we would simply recommend use of the uint64_t type
for a floating point register file. The float64 type remains
as a useful way of documenting in the type signature of helper
functions and the like that they expect to receive an IEEE float
from the TCG generated code rather than an arbitrary integer.

Since the VMSTATE_FLOAT64* macros have no remaining users and
we don't recommend new code uses them, delete them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201022120830.5938-1-peter.maydell@linaro.org>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/vmstate.h | 13 -------------
 migration/vmstate-types.c   | 26 --------------------------
 2 files changed, 39 deletions(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index f68ed7db13..4d71dc8fba 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -219,7 +219,6 @@ extern const VMStateInfo vmstate_info_uint64;
 #define VMS_NULLPTR_MARKER (0x30U) /* '0' */
 extern const VMStateInfo vmstate_info_nullptr;
 
-extern const VMStateInfo vmstate_info_float64;
 extern const VMStateInfo vmstate_info_cpudouble;
 
 extern const VMStateInfo vmstate_info_timer;
@@ -997,12 +996,6 @@ extern const VMStateInfo vmstate_info_qlist;
     VMSTATE_SINGLE_TEST(_f, _s, _t, 0, vmstate_info_uint64, uint64_t)
 
 
-#define VMSTATE_FLOAT64_V(_f, _s, _v)                                 \
-    VMSTATE_SINGLE(_f, _s, _v, vmstate_info_float64, float64)
-
-#define VMSTATE_FLOAT64(_f, _s)                                       \
-    VMSTATE_FLOAT64_V(_f, _s, 0)
-
 #define VMSTATE_TIMER_PTR_TEST(_f, _s, _test)                             \
     VMSTATE_POINTER_TEST(_f, _s, _test, vmstate_info_timer, QEMUTimer *)
 
@@ -1114,12 +1107,6 @@ extern const VMStateInfo vmstate_info_qlist;
 #define VMSTATE_INT64_ARRAY(_f, _s, _n)                               \
     VMSTATE_INT64_ARRAY_V(_f, _s, _n, 0)
 
-#define VMSTATE_FLOAT64_ARRAY_V(_f, _s, _n, _v)                       \
-    VMSTATE_ARRAY(_f, _s, _n, _v, vmstate_info_float64, float64)
-
-#define VMSTATE_FLOAT64_ARRAY(_f, _s, _n)                             \
-    VMSTATE_FLOAT64_ARRAY_V(_f, _s, _n, 0)
-
 #define VMSTATE_CPUDOUBLE_ARRAY_V(_f, _s, _n, _v)                     \
     VMSTATE_ARRAY(_f, _s, _n, _v, vmstate_info_cpudouble, CPU_DoubleU)
 
diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
index 35e784c9d9..e22d41d73d 100644
--- a/migration/vmstate-types.c
+++ b/migration/vmstate-types.c
@@ -420,32 +420,6 @@ const VMStateInfo vmstate_info_uint16_equal = {
     .put  = put_uint16,
 };
 
-/* floating point */
-
-static int get_float64(QEMUFile *f, void *pv, size_t size,
-                       const VMStateField *field)
-{
-    float64 *v = pv;
-
-    *v = make_float64(qemu_get_be64(f));
-    return 0;
-}
-
-static int put_float64(QEMUFile *f, void *pv, size_t size,
-                       const VMStateField *field, QJSON *vmdesc)
-{
-    uint64_t *v = pv;
-
-    qemu_put_be64(f, float64_val(*v));
-    return 0;
-}
-
-const VMStateInfo vmstate_info_float64 = {
-    .name = "float64",
-    .get  = get_float64,
-    .put  = put_float64,
-};
-
 /* CPU_DoubleU type */
 
 static int get_cpudouble(QEMUFile *f, void *pv, size_t size,
-- 
2.28.0


