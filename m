Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A1B4876DD
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:53:38 +0100 (CET)
Received: from localhost ([::1]:58998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5noP-0000AI-RL
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:53:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n36-0001B6-SR
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n35-0001yW-3g
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g64Nj4WV+Irx5qvL3Yea9s2X356RYx1CceDWXAsokho=;
 b=E6awFcDA3bS/vPBQF2ZHCasRypl0M7J93bz2vgPDcwKQ4B+L395eBo5Vu5CxQyGpBaq+bR
 g2NT9zIZkB3yvTrGxRzh4Frbb3uphH5vgXYr3zar40vGjRzn336SP18p6Jir18wWhfJSnJ
 fhwd1Bcp13Vwu35PvSWU+W8ZHPgcEVw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-sIvAQtMlOO2t4PAMUbJtLg-1; Fri, 07 Jan 2022 06:04:41 -0500
X-MC-Unique: sIvAQtMlOO2t4PAMUbJtLg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i81-20020a1c3b54000000b003467c58cbddso4119347wma.5
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=g64Nj4WV+Irx5qvL3Yea9s2X356RYx1CceDWXAsokho=;
 b=rehwN86i07xKrMItThN8yEnlHamqXRWw6NeuzJxyEmasz9IeL2b5RusoFv/ctpUwKK
 G6aZ92avGw3hoMIHfBNgil/ukYyqDlHbjwAqAmKB43ga9j3MgZYgDGXk1vG8vLByucxl
 8b+VUsBkw7qhdR3+Lj1iVTzk0HwWDwh2G/HXhOJN0eN1prZMmxMslrXG4++IEb/RDdWh
 YgN5GECA//Je5FvrRXqTf//3sYFXNQ3AIE1f0kHlD9NgI0n9yeOoz7iBOFWXBgKRaE/V
 JawzFr2SpVwtmL9+nPsmY8WgNOA6878hhIf8ZHJ20Di2SI1T1WeX20GBHC4Az073wmcW
 TZ9w==
X-Gm-Message-State: AOAM531tmihywMlm+RM9b7AFJFPs+DRutVYPsiqCz6gCydOc8UB8fAxL
 rwXqEmy3gAXjjjRbKn7x5aoWQh7HNl6NKEN6EJOmMxTY05G40+qpAaMLV27kA1J6sP7Vo/Jl/Xf
 Rf00rFipi37E9rDhL5RLYT9RXcBmPP/tldj4KnKdv7jYPZHWxmkwkyXnpMFHt
X-Received: by 2002:a1c:7214:: with SMTP id n20mr10749058wmc.118.1641553480277; 
 Fri, 07 Jan 2022 03:04:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz94HHCwJCPW/45wgTU2HA6FxxaWZRY6r4M7Bys1SKhrzC9QDNWWjLRQZojV2FYlQTF2RI+TQ==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr10749039wmc.118.1641553480005; 
 Fri, 07 Jan 2022 03:04:40 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id j26sm8517901wms.46.2022.01.07.03.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:39 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 31/55] util/oslib-posix: Introduce and use MemsetContext
 for touch_all_pages()
Message-ID: <20220107102526.39238-32-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michal Privoznik <mprivozn@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's minimize the number of global variables to prepare for
os_mem_prealloc() getting called concurrently and make the code a bit
easier to read.

The only consumer that really needs a global variable is the sigbus
handler, which will require protection via a mutex in the future either way
as we cannot concurrently mess with the SIGBUS handler.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134611.31172-4-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 util/oslib-posix.c | 73 +++++++++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index cb89e07770..cf2ead54ad 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -73,21 +73,30 @@
 
 #define MAX_MEM_PREALLOC_THREAD_COUNT 16
 
+struct MemsetThread;
+
+typedef struct MemsetContext {
+    bool all_threads_created;
+    bool any_thread_failed;
+    struct MemsetThread *threads;
+    int num_threads;
+} MemsetContext;
+
 struct MemsetThread {
     char *addr;
     size_t numpages;
     size_t hpagesize;
     QemuThread pgthread;
     sigjmp_buf env;
+    MemsetContext *context;
 };
 typedef struct MemsetThread MemsetThread;
 
-static MemsetThread *memset_thread;
-static int memset_num_threads;
+/* used by sigbus_handler() */
+static MemsetContext *sigbus_memset_context;
 
 static QemuMutex page_mutex;
 static QemuCond page_cond;
-static bool threads_created_flag;
 
 int qemu_get_thread_id(void)
 {
@@ -438,10 +447,13 @@ const char *qemu_get_exec_dir(void)
 static void sigbus_handler(int signal)
 {
     int i;
-    if (memset_thread) {
-        for (i = 0; i < memset_num_threads; i++) {
-            if (qemu_thread_is_self(&memset_thread[i].pgthread)) {
-                siglongjmp(memset_thread[i].env, 1);
+
+    if (sigbus_memset_context) {
+        for (i = 0; i < sigbus_memset_context->num_threads; i++) {
+            MemsetThread *thread = &sigbus_memset_context->threads[i];
+
+            if (qemu_thread_is_self(&thread->pgthread)) {
+                siglongjmp(thread->env, 1);
             }
         }
     }
@@ -459,7 +471,7 @@ static void *do_touch_pages(void *arg)
      * clearing until all threads have been created.
      */
     qemu_mutex_lock(&page_mutex);
-    while(!threads_created_flag){
+    while (!memset_args->context->all_threads_created) {
         qemu_cond_wait(&page_cond, &page_mutex);
     }
     qemu_mutex_unlock(&page_mutex);
@@ -502,7 +514,7 @@ static void *do_madv_populate_write_pages(void *arg)
 
     /* See do_touch_pages(). */
     qemu_mutex_lock(&page_mutex);
-    while (!threads_created_flag) {
+    while (!memset_args->context->all_threads_created) {
         qemu_cond_wait(&page_cond, &page_mutex);
     }
     qemu_mutex_unlock(&page_mutex);
@@ -529,6 +541,9 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
                            int smp_cpus, bool use_madv_populate_write)
 {
     static gsize initialized = 0;
+    MemsetContext context = {
+        .num_threads = get_memset_num_threads(smp_cpus),
+    };
     size_t numpages_per_thread, leftover;
     void *(*touch_fn)(void *);
     int ret = 0, i = 0;
@@ -546,35 +561,41 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         touch_fn = do_touch_pages;
     }
 
-    threads_created_flag = false;
-    memset_num_threads = get_memset_num_threads(smp_cpus);
-    memset_thread = g_new0(MemsetThread, memset_num_threads);
-    numpages_per_thread = numpages / memset_num_threads;
-    leftover = numpages % memset_num_threads;
-    for (i = 0; i < memset_num_threads; i++) {
-        memset_thread[i].addr = addr;
-        memset_thread[i].numpages = numpages_per_thread + (i < leftover);
-        memset_thread[i].hpagesize = hpagesize;
-        qemu_thread_create(&memset_thread[i].pgthread, "touch_pages",
-                           touch_fn, &memset_thread[i],
+    context.threads = g_new0(MemsetThread, context.num_threads);
+    numpages_per_thread = numpages / context.num_threads;
+    leftover = numpages % context.num_threads;
+    for (i = 0; i < context.num_threads; i++) {
+        context.threads[i].addr = addr;
+        context.threads[i].numpages = numpages_per_thread + (i < leftover);
+        context.threads[i].hpagesize = hpagesize;
+        context.threads[i].context = &context;
+        qemu_thread_create(&context.threads[i].pgthread, "touch_pages",
+                           touch_fn, &context.threads[i],
                            QEMU_THREAD_JOINABLE);
-        addr += memset_thread[i].numpages * hpagesize;
+        addr += context.threads[i].numpages * hpagesize;
+    }
+
+    if (!use_madv_populate_write) {
+        sigbus_memset_context = &context;
     }
 
     qemu_mutex_lock(&page_mutex);
-    threads_created_flag = true;
+    context.all_threads_created = true;
     qemu_cond_broadcast(&page_cond);
     qemu_mutex_unlock(&page_mutex);
 
-    for (i = 0; i < memset_num_threads; i++) {
-        int tmp = (uintptr_t)qemu_thread_join(&memset_thread[i].pgthread);
+    for (i = 0; i < context.num_threads; i++) {
+        int tmp = (uintptr_t)qemu_thread_join(&context.threads[i].pgthread);
 
         if (tmp) {
             ret = tmp;
         }
     }
-    g_free(memset_thread);
-    memset_thread = NULL;
+
+    if (!use_madv_populate_write) {
+        sigbus_memset_context = NULL;
+    }
+    g_free(context.threads);
 
     return ret;
 }
-- 
MST


