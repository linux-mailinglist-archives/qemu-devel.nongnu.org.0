Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E472DEB3A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 22:44:06 +0100 (CET)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqNXh-0002Qc-Q1
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 16:44:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HCLdXwMKCtkN7RBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--scw.bounces.google.com>)
 id 1kqNVZ-0001H5-Cb
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 16:41:53 -0500
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:38840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HCLdXwMKCtkN7RBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--scw.bounces.google.com>)
 id 1kqNVW-0002a2-NI
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 16:41:52 -0500
Received: by mail-qv1-xf4a.google.com with SMTP id u8so2959970qvm.5
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 13:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=F9ij6hk39jR3TiX6rDaamQjpgRj/1PFdAYOdk/a8OeU=;
 b=q8g/RPzXYLzuOMAQHxmiw5Q+AEHXDTnGDJI0g8wV3t6OrtD2L0Aat56LFgdIyco3Nu
 CVr8s6cJA8hBv2EuPeB0ReKFUJcfTJMzPJIunZfLb3TxbRxz0WFPNSUQZe1ukuJOMYMm
 qsxDTCRvizZ0Btc/bdY2Kp7N+bSMUkZs6FOK6u4hMQ4fYAL7AQCxewRJNHdfGC7SAZaG
 qLSQDLOxUtPXhwRft7/2wVY4R3s+j/N3B5XinLI4BoJjt+nK89CWwlgWRamQy7FWmzUg
 rPkEa+EwlWEU6Rj4dGku1IT3Bvo8R8LusJC6OEVnt1/qf1Yj39JqLT1meKeM3MBEJ5+H
 VcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=F9ij6hk39jR3TiX6rDaamQjpgRj/1PFdAYOdk/a8OeU=;
 b=HK8y2bfBY4viytdHGui2DgQqq02KrM94aksgEtRofX97idaIVRZ6S7SUgTwfqytt1T
 WtXG9ICNMiN3HIeaFSKr1Ipbqv3XCgnInvhl7sUJ8K2DYQiHBIaKexghpgYBjJLAF+p3
 EAt1QuuRdABMqEXj9p7DlsuVGfR6hhIlp8C2WjF2lUfXjh2c3Ts1droVa9EW2GMezUQM
 vRGeKQVGkzP2IqMcIOxk5eFfIMMtySw06CUAO9jgjtsmZZfa+jzSakrTH4Surr1peT5T
 vZriPLiTS+DzRsO5t9HjTapmzU99Oi/A3XdTD4Cgj7RqEfEnJjWxSa/LcUo0ytk3zHLe
 x9nA==
X-Gm-Message-State: AOAM532fLMjunAV2m2QiemN92CYzDgUfxsDxVZtnlR9y6Ukw7yxsq2QE
 2ArtQOmq7lrcULNcFy4TU7Jp6QDMMQSIR1ho4WNc5BojdLezd1Dj0MXslrIljFvmz4noElZpVma
 x1VDpo/yaD8M3VYq++USCgtchGxUjHJW/+v+TVGRo5PjRY2FcfjnH
X-Google-Smtp-Source: ABdhPJxoxXZG+RIwPW/qsW8nKiTLQoT9hM++Ufbw2L4G2hY2SgrgqybxNaK40KaTjy05P+ny1wjrBq4=
X-Received: from scw-glinux.svl.corp.google.com
 ([2620:15c:2ce:200:f693:9fff:fef4:29b5])
 (user=scw job=sendgmr) by 2002:a0c:b990:: with SMTP id
 v16mr2964028qvf.16.1608327708650; 
 Fri, 18 Dec 2020 13:41:48 -0800 (PST)
Date: Fri, 18 Dec 2020 13:41:41 -0800
In-Reply-To: <20201218214142.3673709-1-scw@google.com>
Message-Id: <20201218214142.3673709-2-scw@google.com>
Mime-Version: 1.0
References: <20201218214142.3673709-1-scw@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 1/2] thunk: supports flexible arrays
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=3HCLdXwMKCtkN7RBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--scw.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Shu-Chun Weng <scw@google.com>
From: Shu-Chun Weng via <qemu-devel@nongnu.org>

Flexible arrays may appear in the last field of a struct and are heavily
used in the ioctl(SIOCETHTOOL) system call on Linux. E.g.

  struct ethtool_regs {
      __u32   cmd;
      __u32   version; /* driver-specific, indicates different chips/revs */
      __u32   len; /* bytes */
      __u8    data[0];
  };

where number of elements in `data` is specified in `len`. It is translated
into:

  STRUCT(ethtool_regs,
         TYPE_INT, /* cmd */
         TYPE_INT, /* version */
         TYPE_INT, /* len */
         MK_FLEXIBLE_ARRAY(TYPE_CHAR, 2)) /* data[0]: len */

where the "2" passed to `MK_FLEXIBLE_ARRAY` means the number of element
is specified by field number 2 (0-index).

Signed-off-by: Shu-Chun Weng <scw@google.com>
---
 include/exec/user/thunk.h |  24 ++++++
 thunk.c                   | 152 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 174 insertions(+), 2 deletions(-)

diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h
index 300a840d58..42c58db7f0 100644
--- a/include/exec/user/thunk.h
+++ b/include/exec/user/thunk.h
@@ -39,12 +39,21 @@ typedef enum argtype {
     TYPE_ARRAY,
     TYPE_STRUCT,
     TYPE_OLDDEVT,
+    TYPE_FLEXIBLE_ARRAY,
 } argtype;
 
 #define MK_PTR(type) TYPE_PTR, type
 #define MK_ARRAY(type, size) TYPE_ARRAY, (int)(size), type
 #define MK_STRUCT(id) TYPE_STRUCT, id
 
+/*
+ * Should only appear as the last element of a TYPE_STRUCT. `len_field_idx` is
+ * the index into the fields in the enclosing struct that specify the length of
+ * the flexibly array. The length field MUST be a TYPE_INT field.
+ */
+#define MK_FLEXIBLE_ARRAY(type, len_field_idx) \
+    TYPE_FLEXIBLE_ARRAY, (len_field_idx), type
+
 #define THUNK_TARGET 0
 #define THUNK_HOST   1
 
@@ -56,6 +65,8 @@ typedef struct {
     /* special handling */
     void (*convert[2])(void *dst, const void *src);
     void (*print)(void *arg);
+    int (*thunk_size[2])(const void *src);
+
     int size[2];
     int align[2];
     const char *name;
@@ -76,6 +87,11 @@ const argtype *thunk_convert(void *dst, const void *src,
                              const argtype *type_ptr, int to_host);
 const argtype *thunk_print(void *arg, const argtype *type_ptr);
 
+bool thunk_type_has_flexible_array(const argtype *type_ptr);
+/* thunk_type_size but can handle TYPE_FLEXIBLE_ARRAY */
+int thunk_type_size_with_src(const void *src, const argtype *type_ptr,
+                             int is_host);
+
 extern StructEntry *struct_entries;
 
 int thunk_type_size_array(const argtype *type_ptr, int is_host);
@@ -138,6 +154,12 @@ static inline int thunk_type_size(const argtype *type_ptr, int is_host)
     case TYPE_STRUCT:
         se = struct_entries + type_ptr[1];
         return se->size[is_host];
+    case TYPE_FLEXIBLE_ARRAY:
+        /*
+         * Flexible arrays do not count toward sizeof(). Users of structures
+         * containing them need to calculate it themselves.
+         */
+        return 0;
     default:
         g_assert_not_reached();
     }
@@ -188,6 +210,8 @@ static inline int thunk_type_align(const argtype *type_ptr, int is_host)
     case TYPE_STRUCT:
         se = struct_entries + type_ptr[1];
         return se->align[is_host];
+    case TYPE_FLEXIBLE_ARRAY:
+        return thunk_type_align_array(type_ptr + 2, is_host);
     default:
         g_assert_not_reached();
     }
diff --git a/thunk.c b/thunk.c
index fc5be1a502..f13e96cc4f 100644
--- a/thunk.c
+++ b/thunk.c
@@ -50,6 +50,8 @@ static inline const argtype *thunk_type_next(const argtype *type_ptr)
         return thunk_type_next_ptr(type_ptr + 1);
     case TYPE_STRUCT:
         return type_ptr + 1;
+    case TYPE_FLEXIBLE_ARRAY:
+        return thunk_type_next_ptr(type_ptr + 1);
     default:
         return NULL;
     }
@@ -122,6 +124,34 @@ void thunk_register_struct_direct(int id, const char *name,
     se->name = name;
 }
 
+static const argtype *
+thunk_convert_flexible_array(void *dst, const void *src,
+                             const uint8_t *dst_struct,
+                             const uint8_t *src_struct, const argtype *type_ptr,
+                             const StructEntry *se, int to_host) {
+    int len_field_idx, dst_size, src_size, i;
+    uint32_t array_length;
+    uint8_t *d;
+    const uint8_t *s;
+
+    assert(*type_ptr == TYPE_FLEXIBLE_ARRAY);
+    type_ptr++;
+    len_field_idx = *type_ptr++;
+    array_length =
+        *(const uint32_t *)(to_host ?
+                            dst_struct + se->field_offsets[1][len_field_idx] :
+                            src_struct + se->field_offsets[0][len_field_idx]);
+    dst_size = thunk_type_size(type_ptr, to_host);
+    src_size = thunk_type_size(type_ptr, to_host);
+    d = dst;
+    s = src;
+    for (i = 0; i < array_length; i++) {
+        thunk_convert(d, s, type_ptr, to_host);
+        d += dst_size;
+        s += src_size;
+    }
+    return thunk_type_next(type_ptr);
+}
 
 /* now we can define the main conversion functions */
 const argtype *thunk_convert(void *dst, const void *src,
@@ -246,7 +276,7 @@ const argtype *thunk_convert(void *dst, const void *src,
 
             assert(*type_ptr < max_struct_entries);
             se = struct_entries + *type_ptr++;
-            if (se->convert[0] != NULL) {
+            if (se->convert[to_host] != NULL) {
                 /* specific conversion is needed */
                 (*se->convert[to_host])(dst, src);
             } else {
@@ -256,7 +286,18 @@ const argtype *thunk_convert(void *dst, const void *src,
                 src_offsets = se->field_offsets[1 - to_host];
                 d = dst;
                 s = src;
-                for(i = 0;i < se->nb_fields; i++) {
+                for (i = 0; i < se->nb_fields; i++) {
+                    if (*field_types == TYPE_FLEXIBLE_ARRAY) {
+                        field_types = thunk_convert_flexible_array(
+                            d + dst_offsets[i],
+                            s + src_offsets[i],
+                            d,
+                            s,
+                            field_types,
+                            se,
+                            to_host);
+                        continue;
+                    }
                     field_types = thunk_convert(d + dst_offsets[i],
                                                 s + src_offsets[i],
                                                 field_types, to_host);
@@ -264,6 +305,11 @@ const argtype *thunk_convert(void *dst, const void *src,
             }
         }
         break;
+    case TYPE_FLEXIBLE_ARRAY:
+        fprintf(stderr,
+                "Invalid flexible array (type 0x%x) outside of a structure\n",
+                type);
+        break;
     default:
         fprintf(stderr, "Invalid type 0x%x\n", type);
         break;
@@ -271,6 +317,45 @@ const argtype *thunk_convert(void *dst, const void *src,
     return type_ptr;
 }
 
+static const argtype *
+thunk_print_flexible_array(void *arg, const uint8_t *arg_struct,
+                           const argtype *type_ptr, const StructEntry *se) {
+    int array_length, len_field_idx, arg_size, i;
+    uint8_t *a;
+    int is_string = 0;
+
+    assert(*type_ptr == TYPE_FLEXIBLE_ARRAY);
+    type_ptr++;
+    len_field_idx = *type_ptr++;
+
+    array_length = tswap32(
+        *(const uint32_t *)(arg_struct + se->field_offsets[0][len_field_idx]));
+    arg_size = thunk_type_size(type_ptr, 0);
+    a = arg;
+
+    if (*type_ptr == TYPE_CHAR) {
+        qemu_log("\"");
+        is_string = 1;
+    } else {
+        qemu_log("[");
+    }
+
+    for (i = 0; i < array_length; i++) {
+        if (i > 0 && !is_string) {
+            qemu_log(",");
+        }
+        thunk_print(a, type_ptr);
+        a += arg_size;
+    }
+
+    if (is_string) {
+        qemu_log("\"");
+    } else {
+        qemu_log("]");
+    }
+    return thunk_type_next(type_ptr);
+}
+
 const argtype *thunk_print(void *arg, const argtype *type_ptr)
 {
     int type;
@@ -418,18 +503,81 @@ const argtype *thunk_print(void *arg, const argtype *type_ptr)
                     if (i > 0) {
                         qemu_log(",");
                     }
+                    if (*field_types == TYPE_FLEXIBLE_ARRAY) {
+                        field_types = thunk_print_flexible_array(
+                            a + arg_offsets[i], a, field_types, se);
+                      continue;
+                    }
                     field_types = thunk_print(a + arg_offsets[i], field_types);
                 }
                 qemu_log("}");
             }
         }
         break;
+    case TYPE_FLEXIBLE_ARRAY:
+        fprintf(stderr,
+                "Invalid flexible array (type 0x%x) outside of a structure\n",
+                type);
+        break;
     default:
         g_assert_not_reached();
     }
     return type_ptr;
 }
 
+bool thunk_type_has_flexible_array(const argtype *type_ptr)
+{
+  int i;
+  const StructEntry *se;
+  const argtype *field_types;
+    if (*type_ptr != TYPE_STRUCT) {
+        return false;
+    }
+    se = struct_entries + type_ptr[1];
+    field_types = se->field_types;
+    for (i = 0; i < se->nb_fields; i++) {
+        if (*field_types == TYPE_FLEXIBLE_ARRAY) {
+            return true;
+        }
+        field_types = thunk_type_next(type_ptr);
+    }
+    return false;
+}
+
+int thunk_type_size_with_src(const void *src, const argtype *type_ptr,
+                             int is_host)
+{
+    switch (*type_ptr) {
+    case TYPE_STRUCT: {
+        int i;
+        const StructEntry *se = struct_entries + type_ptr[1];
+        const argtype *field_types;
+        if (se->thunk_size[is_host] != NULL) {
+            return (*se->thunk_size[is_host])(src);
+        }
+
+        field_types = se->field_types;
+        for (i = 0; i < se->nb_fields; i++) {
+            if (*field_types == TYPE_FLEXIBLE_ARRAY) {
+                uint32_t array_length = *(const uint32_t *)(
+                    (const uint8_t *)src +
+                    se->field_offsets[is_host][field_types[1]]);
+                if (!is_host) {
+                    array_length = tswap32(array_length);
+                }
+                return se->size[is_host] +
+                    array_length *
+                    thunk_type_size(field_types + 2, is_host);
+            }
+            field_types = thunk_type_next(type_ptr);
+        }
+        return se->size[is_host];
+    }
+    default:
+        return thunk_type_size(type_ptr, is_host);
+    }
+}
+
 /* from em86 */
 
 /* Utility function: Table-driven functions to translate bitmasks
-- 
2.29.2.684.gfbc64c5ab5-goog


