Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E312F5AD143
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:16:23 +0200 (CEST)
Received: from localhost ([::1]:52628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVA5W-0003Kq-Kd
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9q1-0003yP-9i
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:00:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV9py-0003GQ-AN
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662375617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h4sOfPYdJOgX/UoVLZiCeuB7rB3LlGkb4x+fHLyYXsA=;
 b=IpZA544NJHsgEisbl4r021dPqVD8Zt3VKXB40FnBdNotIFwnHPXHxEWfYPPW31UGQuyfw8
 PCTCe81Jxnx7Dk7RpKMipJsiObvr3Sm7TDI2jJ4ROxB7NDVUAABd5PMj7PzFp4TZf6sCQ5
 PZOcaMyvFdqI52XNDkW8vorLKWk/ra8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-455-rPPjtDeZPnqXCC4WdsCxFQ-1; Mon, 05 Sep 2022 07:00:16 -0400
X-MC-Unique: rPPjtDeZPnqXCC4WdsCxFQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 sb14-20020a1709076d8e00b0073d48a10e10so2193730ejc.16
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=h4sOfPYdJOgX/UoVLZiCeuB7rB3LlGkb4x+fHLyYXsA=;
 b=vrkK2JW5X8Xni4F1YZcV+/5kIuh/ToeZzGLao9xfpUEK7lfaXk3vtCZOM5R40VPsSs
 qS0qaC7SvCwr3J0nwWTATPeIS5XQsFk8jQYNOEJ8RXKZTnLNtRL9Tcg6lRAyY92+D5cp
 zyPQlQsbKF/+2QC0tw1Fb7f30q09iDRdxvGHrQXQUct50AZ+m4tspYzGbzuhhXuNIv4f
 +bE7v1JM4/qGLHRLf8/ClXTGZPCwNdZGQR+3jT09Z3vpAoVAEqG8NNGJW/jAWfocfrze
 COxYK27UYh10OT4WagBbdUBumHFgf0Y3n1/+WaZkllhXwnuZJmc+zPw79QPtTR6VxfFW
 nzOA==
X-Gm-Message-State: ACgBeo3zKf14H0BQYhi/W4sm0vj4NcTtY8Pda6MQeEjF7n2LAx6RpFJd
 RU4cbSHOnIfz5U4le6tEiepm4mpplMjTlFnndykDRPrUt6E6f0C3A44p22CMBuIk5KWNUcvtfH+
 pWN6lmScLJg+85kGSQRU1OnVsVikD9bKjAOIQld1Zd2wwQ1vb8JsWl0l7tJ5VlMr+rz4=
X-Received: by 2002:a05:6402:378f:b0:43a:d3f5:79f2 with SMTP id
 et15-20020a056402378f00b0043ad3f579f2mr43334861edb.338.1662375614842; 
 Mon, 05 Sep 2022 04:00:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR46BGJq5k8KCFThgjly8a9fO7O3ht4LX4c6WEqLSn05S57sS9Fu8esNdZ+K2DWWPS2Zh/65oQ==
X-Received: by 2002:a05:6402:378f:b0:43a:d3f5:79f2 with SMTP id
 et15-20020a056402378f00b0043ad3f579f2mr43334840edb.338.1662375614505; 
 Mon, 05 Sep 2022 04:00:14 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 i23-20020aa7c9d7000000b0044e7d69091asm2059841edt.85.2022.09.05.04.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 04:00:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com
Subject: [PATCH] tests: unit: simplify test-visitor-serialization list tests
Date: Mon,  5 Sep 2022 13:00:13 +0200
Message-Id: <20220905110013.31308-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

test-visitor-serialization list tests is using an "if" to pick either the first
element of the list or the next one.  This was done presumably to mimic the
code that creates the list, which has to fill in either the head pointer
or the next pointer of the last element.  However, the code in the insert
phase is a pretty standard singly-linked list insertion, while the one
in the visit phase looks weird and even looks at the first item twice:
this is confusing because the test puts in 32 items and finishes with
an assertion that i == 33.

So, move the "else" step in a separate switch statement, and change
the do...while loop to a while, because cur_head has already been
initialized beforehand.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-visitor-serialization.c | 157 +++++++++++-------------
 1 file changed, 69 insertions(+), 88 deletions(-)

diff --git a/tests/unit/test-visitor-serialization.c b/tests/unit/test-visitor-serialization.c
index 907263d030..667e8fed82 100644
--- a/tests/unit/test-visitor-serialization.c
+++ b/tests/unit/test-visitor-serialization.c
@@ -427,131 +427,117 @@ static void test_primitive_lists(gconstpointer opaque)
     ops->deserialize((void **)&pl_copy_ptr, serialize_data,
                      visit_primitive_list, &error_abort);
 
-    i = 0;
+
+    switch (pl_copy.type) {
+    case PTYPE_STRING:
+        cur_head = pl_copy.value.strings;
+        break;
+    case PTYPE_INTEGER:
+        cur_head = pl_copy.value.integers;
+        break;
+    case PTYPE_S8:
+        cur_head = pl_copy.value.s8_integers;
+        break;
+    case PTYPE_S16:
+        cur_head = pl_copy.value.s16_integers;
+        break;
+    case PTYPE_S32:
+        cur_head = pl_copy.value.s32_integers;
+        break;
+    case PTYPE_S64:
+        cur_head = pl_copy.value.s64_integers;
+        break;
+    case PTYPE_U8:
+        cur_head = pl_copy.value.u8_integers;
+        break;
+    case PTYPE_U16:
+        cur_head = pl_copy.value.u16_integers;
+        break;
+    case PTYPE_U32:
+        cur_head = pl_copy.value.u32_integers;
+        break;
+    case PTYPE_U64:
+        cur_head = pl_copy.value.u64_integers;
+        break;
+    case PTYPE_NUMBER:
+        cur_head = pl_copy.value.numbers;
+        break;
+    case PTYPE_BOOLEAN:
+        cur_head = pl_copy.value.booleans;
+        break;
+    default:
+        g_assert_not_reached();
+    }
 
     /* compare our deserialized list of primitives to the original */
-    do {
+    i = 0;
+    while (cur_head) {
         switch (pl_copy.type) {
         case PTYPE_STRING: {
-            strList *ptr;
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.strings;
-            }
+            strList *ptr = cur_head;
+            cur_head = ptr->next;
             g_assert_cmpstr(pt->value.string, ==, ptr->value);
             break;
         }
         case PTYPE_INTEGER: {
-            intList *ptr;
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.integers;
-            }
+            intList *ptr = cur_head;
+            cur_head = ptr->next;
             g_assert_cmpint(pt->value.integer, ==, ptr->value);
             break;
         }
         case PTYPE_S8: {
-            int8List *ptr;
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.s8_integers;
-            }
+            int8List *ptr = cur_head;
+            cur_head = ptr->next;
             g_assert_cmpint(pt->value.s8, ==, ptr->value);
             break;
         }
         case PTYPE_S16: {
-            int16List *ptr;
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.s16_integers;
-            }
+            int16List *ptr = cur_head;
+            cur_head = ptr->next;
             g_assert_cmpint(pt->value.s16, ==, ptr->value);
             break;
         }
         case PTYPE_S32: {
-            int32List *ptr;
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.s32_integers;
-            }
+            int32List *ptr = cur_head;
+            cur_head = ptr->next;
             g_assert_cmpint(pt->value.s32, ==, ptr->value);
             break;
         }
         case PTYPE_S64: {
-            int64List *ptr;
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.s64_integers;
-            }
+            int64List *ptr = cur_head;
+            cur_head = ptr->next;
             g_assert_cmpint(pt->value.s64, ==, ptr->value);
             break;
         }
         case PTYPE_U8: {
-            uint8List *ptr;
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.u8_integers;
-            }
+            uint8List *ptr = cur_head;
+            cur_head = ptr->next;
             g_assert_cmpint(pt->value.u8, ==, ptr->value);
             break;
         }
         case PTYPE_U16: {
-            uint16List *ptr;
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.u16_integers;
-            }
+            uint16List *ptr = cur_head;
+            cur_head = ptr->next;
             g_assert_cmpint(pt->value.u16, ==, ptr->value);
             break;
         }
         case PTYPE_U32: {
-            uint32List *ptr;
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.u32_integers;
-            }
+            uint32List *ptr = cur_head;
+            cur_head = ptr->next;
             g_assert_cmpint(pt->value.u32, ==, ptr->value);
             break;
         }
         case PTYPE_U64: {
-            uint64List *ptr;
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.u64_integers;
-            }
+            uint64List *ptr = cur_head;
+            cur_head = ptr->next;
             g_assert_cmpint(pt->value.u64, ==, ptr->value);
             break;
         }
         case PTYPE_NUMBER: {
-            numberList *ptr;
             GString *double_expected = g_string_new("");
             GString *double_actual = g_string_new("");
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.numbers;
-            }
+            numberList *ptr = cur_head;
+            cur_head = ptr->next;
             /* we serialize with %f for our reference visitors, so rather than
              * fuzzy floating math to test "equality", just compare the
              * formatted values
@@ -564,13 +550,8 @@ static void test_primitive_lists(gconstpointer opaque)
             break;
         }
         case PTYPE_BOOLEAN: {
-            boolList *ptr;
-            if (cur_head) {
-                ptr = cur_head;
-                cur_head = ptr->next;
-            } else {
-                cur_head = ptr = pl_copy.value.booleans;
-            }
+            boolList *ptr = cur_head;
+            cur_head = ptr->next;
             g_assert_cmpint(!!pt->value.boolean, ==, !!ptr->value);
             break;
         }
@@ -578,9 +559,9 @@ static void test_primitive_lists(gconstpointer opaque)
             g_assert_not_reached();
         }
         i++;
-    } while (cur_head);
+    }
 
-    g_assert_cmpint(i, ==, 33);
+    g_assert_cmpint(i, ==, 32);
 
     ops->cleanup(serialize_data);
     dealloc_helper(&pl, visit_primitive_list, &error_abort);
-- 
2.37.2


