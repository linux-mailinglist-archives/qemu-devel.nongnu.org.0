Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 755907542C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 18:37:50 +0200 (CEST)
Received: from localhost ([::1]:33922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqgkX-000618-Co
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 12:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48407)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqgk1-0004bv-S7
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 12:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqgk0-0007GX-Jm
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 12:37:17 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38907)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqgk0-0007FA-Af
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 12:37:16 -0400
Received: by mail-wm1-x341.google.com with SMTP id s15so23961600wmj.3
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vYIyeQ8tMXnaOwO0DQZAfFrr4L+yvHcwOrLW+5bk0zY=;
 b=BIIE0CQgSuzQhD5JHhS+DUvDX58ZBtNd/3IMydrGj9GMl5erOtSqeUQiDgup9G7f7H
 jZPsrsDgzOQsBRMSk0u64vW8VoEfiw44RoMj2h9u/sx1SPMTd9VRCoSvbHopi2OSyCOS
 8ob7cBKA8ZlJe++dzY9xH8y3lMi8IY+74u2NAfrQWPiSiX6ewS3XzE8TW3uT9Xm5l8Ta
 e2oea7RgQHsYdJWuTDCCJJd6fHhlMWuHTtq8QOxk/0q+sIaSBBPenVsAVj/tk0aTdenj
 KixokBmtWXSFayPuuXM6cQfMlkHOjz0UgPvEq2zoVJtA6eNIPtFunUIoPTJioiZGb9mI
 wDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vYIyeQ8tMXnaOwO0DQZAfFrr4L+yvHcwOrLW+5bk0zY=;
 b=LejxTIXt0M2+u+GMd5TNZ8F7KLEZP4I5LS7x032E+LH0w42k9hRqZ3Nq0EMYL/8y0K
 64bhbkiWCtWOg2ffeg3jo6g+/53v65xrxv2hI3g7eEqY4bgSLMXWTf+lA0bqA8R+E+4x
 Jdztm26LOeMpxJC7AxWaWTGS07mcaaubaboG6u4wEkAXWWbeKMmidEOQOUX5qjC5LmNU
 mJepdkflXd2Tm2WQEvn0m9NxSYnto1aA1CmnPXYsYzu6799d2pV1jhBC9GsDFe4wtsy6
 FcZE7jlbyZP+gRvGTd/Wzr0279UFuggT/6MfBicMd4D6BWhu8/KB6UuBNixalV8bBAOv
 wd9Q==
X-Gm-Message-State: APjAAAX8JSEPP+pANMa1g4L9PDiV4MPi0sTbpB9rVRakgspAkXuLwl3Q
 loC1wvwjjwi8TXb0kd4650eHdQ==
X-Google-Smtp-Source: APXvYqzl/s5DNtM4udnBAIIshRg4xUpgXXVcC5QkqsUdPjJyVN7fJkdQr6bM0BPzooQoccCCx9nDfQ==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr79395234wma.58.1564072635360; 
 Thu, 25 Jul 2019 09:37:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c7sm44125140wro.70.2019.07.25.09.37.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:37:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 25 Jul 2019 17:37:10 +0100
Message-Id: <20190725163710.11703-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725163710.11703-1-peter.maydell@linaro.org>
References: <20190725163710.11703-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH for-4.1? 2/2] vmstate.h: Type check
 VMSTATE_STRUCT_VARRAY macros
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VMSTATE_STRUCT_VARRAY_UINT32 macro is intended to handle
migrating a field which is an array of structs, but where instead of
migrating the entire array we only migrate a variable number of
elements of it.

The VMSTATE_STRUCT_VARRAY_POINTER_UINT32 macro is intended to handle
migrating a field which is of pointer type, and points to a
dynamically allocated array of structs of variable size.

We weren't actually checking that the field passed to
VMSTATE_STRUCT_VARRAY_UINT32 really is an array, with the result that
accidentally using it where the _POINTER_ macro was intended would
compile but silently corrupt memory on migration.

Add type-checking that enforces that the field passed in is
really of the right array type. This applies to all the VMSTATE
macros which use flags including VMS_VARRAY_* but not VMS_POINTER.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/migration/vmstate.h | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index ca68584eba4..2df333c3612 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -227,8 +227,19 @@ extern const VMStateInfo vmstate_info_bitmap;
 extern const VMStateInfo vmstate_info_qtailq;
 
 #define type_check_2darray(t1,t2,n,m) ((t1(*)[n][m])0 - (t2*)0)
+/* Check that t2 is an array of t1 of size n */
 #define type_check_array(t1,t2,n) ((t1(*)[n])0 - (t2*)0)
 #define type_check_pointer(t1,t2) ((t1**)0 - (t2*)0)
+/*
+ * type of element 0 of the specified (array) field of the type.
+ * Note that if the field is a pointer then this will return the
+ * pointed-to type rather than complaining.
+ */
+#define typeof_elt_of_field(type, field) typeof(((type *)0)->field[0])
+/* Check that field f in struct type t2 is an array of t1, of any size */
+#define type_check_varray(t1, t2, f)                                 \
+    (type_check(t1, typeof_elt_of_field(t2, f))                      \
+     + QEMU_BUILD_BUG_ON_ZERO(!QEMU_IS_ARRAY(((t2 *)0)->f)))
 
 #define vmstate_offset_value(_state, _field, _type)                  \
     (offsetof(_state, _field) +                                      \
@@ -253,6 +264,10 @@ extern const VMStateInfo vmstate_info_qtailq;
     vmstate_offset_array(_state, _field, uint8_t,                    \
                          sizeof(typeof_field(_state, _field)))
 
+#define vmstate_offset_varray(_state, _field, _type)                 \
+    (offsetof(_state, _field) +                                      \
+     type_check_varray(_type, _state, _field))
+
 /* In the macros below, if there is a _version, that means the macro's
  * field will be processed only if the version being received is >=
  * the _version specified.  In general, if you add a new field, you
@@ -347,7 +362,7 @@ extern const VMStateInfo vmstate_info_qtailq;
     .info       = &(_info),                                          \
     .size       = sizeof(_type),                                     \
     .flags      = VMS_VARRAY_UINT32|VMS_MULTIPLY_ELEMENTS,           \
-    .offset     = offsetof(_state, _field),                          \
+    .offset     = vmstate_offset_varray(_state, _field, _type),      \
 }
 
 #define VMSTATE_ARRAY_TEST(_field, _state, _num, _test, _info, _type) {\
@@ -376,7 +391,7 @@ extern const VMStateInfo vmstate_info_qtailq;
     .info       = &(_info),                                          \
     .size       = sizeof(_type),                                     \
     .flags      = VMS_VARRAY_INT32,                                  \
-    .offset     = offsetof(_state, _field),                          \
+    .offset     = vmstate_offset_varray(_state, _field, _type),      \
 }
 
 #define VMSTATE_VARRAY_INT32(_field, _state, _field_num, _version, _info, _type) {\
@@ -416,7 +431,7 @@ extern const VMStateInfo vmstate_info_qtailq;
     .info       = &(_info),                                          \
     .size       = sizeof(_type),                                     \
     .flags      = VMS_VARRAY_UINT16,                                 \
-    .offset     = offsetof(_state, _field),                          \
+    .offset     = vmstate_offset_varray(_state, _field, _type),      \
 }
 
 #define VMSTATE_VSTRUCT_TEST(_field, _state, _test, _version, _vmsd, _type, _struct_version) { \
@@ -520,7 +535,7 @@ extern const VMStateInfo vmstate_info_qtailq;
     .vmsd       = &(_vmsd),                                          \
     .size       = sizeof(_type),                                     \
     .flags      = VMS_STRUCT|VMS_VARRAY_UINT8,                       \
-    .offset     = offsetof(_state, _field),                          \
+    .offset     = vmstate_offset_varray(_state, _field, _type),      \
 }
 
 /* a variable length array (i.e. _type *_field) but we know the
@@ -573,7 +588,7 @@ extern const VMStateInfo vmstate_info_qtailq;
     .vmsd       = &(_vmsd),                                          \
     .size       = sizeof(_type),                                     \
     .flags      = VMS_STRUCT|VMS_VARRAY_INT32,                       \
-    .offset     = offsetof(_state, _field),                          \
+    .offset     = vmstate_offset_varray(_state, _field, _type),      \
 }
 
 #define VMSTATE_STRUCT_VARRAY_UINT32(_field, _state, _field_num, _version, _vmsd, _type) { \
@@ -583,7 +598,7 @@ extern const VMStateInfo vmstate_info_qtailq;
     .vmsd       = &(_vmsd),                                          \
     .size       = sizeof(_type),                                     \
     .flags      = VMS_STRUCT|VMS_VARRAY_UINT32,                      \
-    .offset     = offsetof(_state, _field),                          \
+    .offset     = vmstate_offset_varray(_state, _field, _type),      \
 }
 
 #define VMSTATE_STRUCT_VARRAY_ALLOC(_field, _state, _field_num, _version, _vmsd, _type) {\
-- 
2.20.1


