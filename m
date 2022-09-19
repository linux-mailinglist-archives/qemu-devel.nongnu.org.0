Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA35BD40B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:48:04 +0200 (CEST)
Received: from localhost ([::1]:44446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKsF-00005u-79
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfo-0002yE-FQ
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKfm-00034e-Kb
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:35:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4sOfPYdJOgX/UoVLZiCeuB7rB3LlGkb4x+fHLyYXsA=;
 b=IsZkSzgiAPLvB/eQ+Jwq4OQqzIENUsJNJGoozLkV4FbD/BByPJ8V1uaSWNR10WfOQtjSl+
 tnlxtyfLhPkziwIVNBD1UyfPEth3EeICfoCWBnOPvePqqX+pHEIn2PSDKcak+wtETbyAqa
 KkKbt/xToLoev038VLYwaqpQnUKBZuE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-551-ZvYvw1K7PMWr8LTVWDRwDQ-1; Mon, 19 Sep 2022 13:35:08 -0400
X-MC-Unique: ZvYvw1K7PMWr8LTVWDRwDQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 185-20020a1c02c2000000b003b4be28d7e3so4333728wmc.0
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=h4sOfPYdJOgX/UoVLZiCeuB7rB3LlGkb4x+fHLyYXsA=;
 b=6Dd8RpU+peju1pq89wRlbE627n+kPeYZkKsAfmsEaPwxnAkSZAg/gFX5WSUGfVqEfR
 mtIgyM2eZp/fx28hf0BVmq48V7B+lS39tn0jqcl0du4npVeF1YD+5SidBD/7hodU9nnM
 viGm13287l3DTQ1zLLxmqPZg9+3j2K7pttLFsqo7eoztXtYsRFQ4Q/HLI6dJ6zq3VmWy
 eyj9QCf7C2/An1vYzxWQkrnYEPBp3VbWkqNx/Wb9J3FXv45jTK66ybTjQ5CWzCGaVDZV
 phCu9geCfLRDmTJC2z2nSnwX/YUdfoknHi7TiGLcrrWduI9P3n0jIDYchPnqOYPMgraL
 qQWw==
X-Gm-Message-State: ACgBeo15+gECnfthiogHtZcWzAs+SPk7yTxya+k1YEt6wWgvIDPJnRgz
 tmo4kdh6CmJzFNo3cB+nfJDf552Y6EO8ShW7njO3ZFWKy+o5L07cS7aGurw31Gph1r9EKawNLYj
 ZaHMLfqfgqRX3+AoCyKCrmRwfUIJXgDnVLuDfGzRSMfBEIGsaIbYKIHYstHKJ1TZ/HeI=
X-Received: by 2002:a05:600c:548b:b0:3b4:61f4:804e with SMTP id
 iv11-20020a05600c548b00b003b461f4804emr19040494wmb.188.1663608906813; 
 Mon, 19 Sep 2022 10:35:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR63VvYDPD5zpzmG0cER++bPzcBmYrahmcv5y3eMK6mgWKQjYz9uT9xUJn7rWiEaw09zFrgnqQ==
X-Received: by 2002:a05:600c:548b:b0:3b4:61f4:804e with SMTP id
 iv11-20020a05600c548b00b003b461f4804emr19040466wmb.188.1663608906297; 
 Mon, 19 Sep 2022 10:35:06 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 s4-20020adff804000000b0022ac61ebb14sm14082977wrp.22.2022.09.19.10.35.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:35:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/21] tests: unit: simplify test-visitor-serialization list
 tests
Date: Mon, 19 Sep 2022 19:34:36 +0200
Message-Id: <20220919173449.5864-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919173449.5864-1-pbonzini@redhat.com>
References: <20220919173449.5864-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


