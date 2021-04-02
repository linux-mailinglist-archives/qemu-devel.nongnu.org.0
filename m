Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED41352750
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 10:17:31 +0200 (CEST)
Received: from localhost ([::1]:46630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSEzi-0004jz-AJ
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 04:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSExw-000362-Hv
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:15:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lSExr-0003wz-H9
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 04:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617351334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uL3j2+N4N+UvXp0kuBHUVAUVqrWl9jyOW8n98+K4kNY=;
 b=BF3R1oO5zZyhAgRqOw+v1w22WTnFj2lBx5vV6U5sDsfQViXycMasO8zLzyIlO7Y699HSpE
 W8SiwZfcvQ17kKD21AewDG2JEKxxucwgTU5hzyDJCbN9lXwhXn5IHIP9C5m96s2mPbWkr1
 GUv7WnWiKAy8V1/YQ+ufZNq2N1rcmZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-2tZYck6APXu6yE-yxEUXFg-1; Fri, 02 Apr 2021 04:15:32 -0400
X-MC-Unique: 2tZYck6APXu6yE-yxEUXFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A88771009E2D;
 Fri,  2 Apr 2021 08:15:31 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-26.pek2.redhat.com [10.72.12.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 328676267F;
 Fri,  2 Apr 2021 08:15:29 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	lekiravi@yandex-team.ru
Subject: [PATCH 2/5] Revert "hmp: Use QAPI NetdevInfo in hmp_info_network"
Date: Fri,  2 Apr 2021 16:15:16 +0800
Message-Id: <20210402081519.78878-3-jasowang@redhat.com>
In-Reply-To: <20210402081519.78878-1-jasowang@redhat.com>
References: <20210402081519.78878-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several issues has been reported for query-netdev info
series. Consider it's late in the rc, this reverts commit
a0724776c5a98a08fc946bb5a4ad16410ca64c0e.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/qapi/hmp-output-visitor.h |  30 -----
 net/net.c                         |  31 +----
 qapi/hmp-output-visitor.c         | 193 ------------------------------
 qapi/meson.build                  |   1 -
 4 files changed, 1 insertion(+), 254 deletions(-)
 delete mode 100644 include/qapi/hmp-output-visitor.h
 delete mode 100644 qapi/hmp-output-visitor.c

diff --git a/include/qapi/hmp-output-visitor.h b/include/qapi/hmp-output-visitor.h
deleted file mode 100644
index 541e4002e3..0000000000
--- a/include/qapi/hmp-output-visitor.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- * HMP string output Visitor
- *
- * Copyright Yandex N.V., 2021
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#ifndef HMP_OUTPUT_VISITOR_H
-#define HMP_OUTPUT_VISITOR_H
-
-#include "qapi/visitor.h"
-
-typedef struct HMPOutputVisitor HMPOutputVisitor;
-
-/**
- * Create a HMP string output visitor for @obj
- *
- * Flattens dicts/structures, only shows arrays borders.
- *
- * Errors are not expected to happen.
- *
- * The caller is responsible for freeing the visitor with
- * visit_free().
- */
-Visitor *hmp_output_visitor_new(char **result);
-
-#endif
diff --git a/net/net.c b/net/net.c
index 725a4e1450..277da712eb 100644
--- a/net/net.c
+++ b/net/net.c
@@ -55,7 +55,6 @@
 #include "sysemu/sysemu.h"
 #include "net/filter.h"
 #include "qapi/string-output-visitor.h"
-#include "qapi/hmp-output-visitor.h"
 
 /* Net bridge is currently not supported for W32. */
 #if !defined(_WIN32)
@@ -1222,42 +1221,14 @@ static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
     monitor_printf(mon, "\n");
 }
 
-static char *generate_info_str(NetClientState *nc)
-{
-    NetdevInfo *ni = nc->stored_config;
-    char *ret_out = NULL;
-    Visitor *v;
-
-    /* Use legacy field info_str for NIC and hubports */
-    if ((nc->info->type == NET_CLIENT_DRIVER_NIC) ||
-        (nc->info->type == NET_CLIENT_DRIVER_HUBPORT)) {
-        return g_strdup(nc->info_str ? nc->info_str : "");
-    }
-
-    if (!ni) {
-        return g_malloc0(1);
-    }
-
-    v = hmp_output_visitor_new(&ret_out);
-    if (visit_type_NetdevInfo(v, "", &ni, NULL)) {
-        visit_complete(v, &ret_out);
-    }
-    visit_free(v);
-
-    return ret_out;
-}
-
 void print_net_client(Monitor *mon, NetClientState *nc)
 {
     NetFilterState *nf;
-    char *info_str = generate_info_str(nc);
 
     monitor_printf(mon, "%s: index=%d,type=%s,%s\n", nc->name,
                    nc->queue_index,
                    NetClientDriver_str(nc->info->type),
-                   info_str);
-    g_free(info_str);
-
+                   nc->info_str ? nc->info_str : "");
     if (!QTAILQ_EMPTY(&nc->filters)) {
         monitor_printf(mon, "filters:\n");
     }
diff --git a/qapi/hmp-output-visitor.c b/qapi/hmp-output-visitor.c
deleted file mode 100644
index 8036605f97..0000000000
--- a/qapi/hmp-output-visitor.c
+++ /dev/null
@@ -1,193 +0,0 @@
-/*
- * HMP string output Visitor
- *
- * Copyright Yandex N.V., 2021
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#include "qemu/osdep.h"
-#include "qemu/cutils.h"
-#include "qapi/hmp-output-visitor.h"
-#include "qapi/visitor-impl.h"
-
-struct HMPOutputVisitor {
-    Visitor visitor;
-    char **result;
-    GString *buffer;
-    bool is_continue;
-};
-
-static HMPOutputVisitor *to_hov(Visitor *v)
-{
-    return container_of(v, HMPOutputVisitor, visitor);
-}
-
-static void hmp_output_append_formatted(Visitor *v, const char *fmt, ...)
-{
-    HMPOutputVisitor *ov = to_hov(v);
-    va_list args;
-
-    if (ov->is_continue) {
-        g_string_append(ov->buffer, ",");
-    } else {
-        ov->is_continue = true;
-    }
-
-    va_start(args, fmt);
-    g_string_append_vprintf(ov->buffer, fmt, args);
-    va_end(args);
-}
-
-static void hmp_output_skip_comma(Visitor *v)
-{
-    HMPOutputVisitor *ov = to_hov(v);
-
-    ov->is_continue = false;
-}
-
-static bool hmp_output_start_struct(Visitor *v, const char *name,
-                                    void **obj, size_t unused, Error **errp)
-{
-    return true;
-}
-
-static void hmp_output_end_struct(Visitor *v, void **obj) {}
-
-static bool hmp_output_start_list(Visitor *v, const char *name,
-                                  GenericList **listp, size_t size,
-                                  Error **errp)
-{
-    hmp_output_append_formatted(v, "%s=[", name);
-    /* First element in array without comma before it */
-    hmp_output_skip_comma(v);
-
-    return true;
-}
-
-static GenericList *hmp_output_next_list(Visitor *v, GenericList *tail,
-                                         size_t size)
-{
-    return tail->next;
-}
-
-static void hmp_output_end_list(Visitor *v, void **obj)
-{
-    /* Don't need comma after last array element */
-    hmp_output_skip_comma(v);
-    hmp_output_append_formatted(v, "]");
-}
-
-static bool hmp_output_type_int64(Visitor *v, const char *name,
-                                  int64_t *obj, Error **errp)
-{
-    hmp_output_append_formatted(v, "%s=%" PRId64, name, *obj);
-
-    return true;
-}
-
-static bool hmp_output_type_uint64(Visitor *v, const char *name,
-                                   uint64_t *obj, Error **errp)
-{
-    hmp_output_append_formatted(v, "%s=%" PRIu64, name, *obj);
-
-    return true;
-}
-
-static bool hmp_output_type_bool(Visitor *v, const char *name, bool *obj,
-                                 Error **errp)
-{
-    hmp_output_append_formatted(v, "%s=%s", name, *obj ? "true" : "false");
-
-    return true;
-}
-
-static bool hmp_output_type_str(Visitor *v, const char *name, char **obj,
-                                Error **errp)
-{
-    /* Skip already printed or unused fields */
-    if (!*obj || g_str_equal(name, "id") || g_str_equal(name, "type")) {
-        return true;
-    }
-
-    /* Do not print stub name for StringList elements */
-    if (g_str_equal(name, "str")) {
-        hmp_output_append_formatted(v, "%s", *obj);
-    } else {
-        hmp_output_append_formatted(v, "%s=%s", name, *obj);
-    }
-
-    return true;
-}
-
-static bool hmp_output_type_number(Visitor *v, const char *name,
-                                   double *obj, Error **errp)
-{
-    hmp_output_append_formatted(v, "%s=%.17g", name, *obj);
-
-    return true;
-}
-
-/* TODO: remove this function? */
-static bool hmp_output_type_any(Visitor *v, const char *name,
-                                QObject **obj, Error **errp)
-{
-    return true;
-}
-
-static bool hmp_output_type_null(Visitor *v, const char *name,
-                                 QNull **obj, Error **errp)
-{
-    hmp_output_append_formatted(v, "%s=NULL", name);
-
-    return true;
-}
-
-static void hmp_output_complete(Visitor *v, void *opaque)
-{
-    HMPOutputVisitor *ov = to_hov(v);
-
-    *ov->result = g_string_free(ov->buffer, false);
-    ov->buffer = NULL;
-}
-
-static void hmp_output_free(Visitor *v)
-{
-    HMPOutputVisitor *ov = to_hov(v);
-
-    if (ov->buffer) {
-        g_string_free(ov->buffer, true);
-    }
-    g_free(v);
-}
-
-Visitor *hmp_output_visitor_new(char **result)
-{
-    HMPOutputVisitor *v;
-
-    v = g_malloc0(sizeof(*v));
-
-    v->visitor.type = VISITOR_OUTPUT;
-    v->visitor.start_struct = hmp_output_start_struct;
-    v->visitor.end_struct = hmp_output_end_struct;
-    v->visitor.start_list = hmp_output_start_list;
-    v->visitor.next_list = hmp_output_next_list;
-    v->visitor.end_list = hmp_output_end_list;
-    v->visitor.type_int64 = hmp_output_type_int64;
-    v->visitor.type_uint64 = hmp_output_type_uint64;
-    v->visitor.type_bool = hmp_output_type_bool;
-    v->visitor.type_str = hmp_output_type_str;
-    v->visitor.type_number = hmp_output_type_number;
-    v->visitor.type_any = hmp_output_type_any;
-    v->visitor.type_null = hmp_output_type_null;
-    v->visitor.complete = hmp_output_complete;
-    v->visitor.free = hmp_output_free;
-
-    v->result = result;
-    v->buffer = g_string_new("");
-    v->is_continue = false;
-
-    return &v->visitor;
-}
diff --git a/qapi/meson.build b/qapi/meson.build
index 0d20226fa3..376f4ceafe 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -8,7 +8,6 @@ util_ss.add(files(
   'qobject-output-visitor.c',
   'string-input-visitor.c',
   'string-output-visitor.c',
-  'hmp-output-visitor.c',
 ))
 if have_system or have_tools
   util_ss.add(files(
-- 
2.24.3 (Apple Git-128)


