Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C548769C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:36:53 +0100 (CET)
Received: from localhost ([::1]:46414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nYC-0003SI-89
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:36:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n35-00019g-BC
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n33-0001y1-4e
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVxkk8Uxdp5ILdib1v4tCfXPzG0FgwtRAVmrjfHU5Bg=;
 b=NNdYrJZ+Ulvd+9KQvOmBHe0BfPkhJzicwgaysuBe1xkxKdxgW6vBmOHyAWYV1m2UMPr6MU
 7SDHcibtDaLFcD3gJxs/QjaDkKsPaIh7dvl8x0qml8rfJhHxiA2lC2Nglptl1ioJthe3zd
 LUZeQ8MDMaynXCxiQ4ma3lMOx+PSh14=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-0ZHKOlsYPemrlvGrShiqvw-1; Fri, 07 Jan 2022 06:04:39 -0500
X-MC-Unique: 0ZHKOlsYPemrlvGrShiqvw-1
Received: by mail-wr1-f69.google.com with SMTP id
 i23-20020adfaad7000000b001a6320b66b9so263242wrc.15
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KVxkk8Uxdp5ILdib1v4tCfXPzG0FgwtRAVmrjfHU5Bg=;
 b=auE8W+t7v4aAzPIdisdcaT7XlOml5Lcb/cP+3GHPI7QEb9WITP0M2y1t89ZvgPZtf2
 TiEDsTl+1gEo9jh0tn74qRI9KymWhlgT/ZiOG/MyXD9hLqbJ3WMgJPtJ7xCXJzZLJKIZ
 XHZAOyAHMzFaQCOGw4x/1/hiZk1GGROH+yiEFfUip2eL9qsVCktqDSQ6+iDJHa4JzmSY
 Ddaf6zA3Bwj7ZePkNiVjpZZKQActtzW8Cmi8MHTYtc/R1lQT4cMPaxdes0G2R0+nNhBB
 lF0RpDP3QIxXVR2GPgRRaB6GN/kEoBuVyt+3IkX3IvSERnj1EUNXiVD1mcupjY6BiHfL
 3evQ==
X-Gm-Message-State: AOAM530s0jEKJeuiR8uBN2ay4ORzw+M+a/nGgquXOf2JSIVeFuUaTuHN
 hfgXXV3dKRUI1mD4uYNruUCjVK2zaUrnEm3TrVx4+R0Zsdj+/wLJAFhCTmDbimUhouaI3X5VUM7
 t3MXEVli/NfocokWfu/kxQTiX770z5D4HEHd/OXdOSyAjGo6Fd+jvHjBruv3b
X-Received: by 2002:a05:600c:4f49:: with SMTP id
 m9mr10633642wmq.8.1641553477153; 
 Fri, 07 Jan 2022 03:04:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygTYI9gBXld0VUFNtgZSKGqBEMUAC81pD8SR8m3fdC5wLKUX9Z0tcktT2mXpFLPCYScmiQhQ==
X-Received: by 2002:a05:600c:4f49:: with SMTP id
 m9mr10633619wmq.8.1641553476853; 
 Fri, 07 Jan 2022 03:04:36 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id p18sm8151869wmq.23.2022.01.07.03.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:36 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 30/55] util/oslib-posix: Support MADV_POPULATE_WRITE for
 os_mem_prealloc()
Message-ID: <20220107102526.39238-31-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's sense support and use it for preallocation. MADV_POPULATE_WRITE
does not require a SIGBUS handler, doesn't actually touch page content,
and avoids context switches; it is, therefore, faster and easier to handle
than our current approach.

While MADV_POPULATE_WRITE is, in general, faster than manual
prefaulting, and especially faster with 4k pages, there is still value in
prefaulting using multiple threads to speed up preallocation.

More details on MADV_POPULATE_WRITE can be found in the Linux commits
4ca9b3859dac ("mm/madvise: introduce MADV_POPULATE_(READ|WRITE) to prefault
page tables") and eb2faa513c24 ("mm/madvise: report SIGBUS as -EFAULT for
MADV_POPULATE_(READ|WRITE)"), and in the man page proposal [1].

This resolves the TODO in do_touch_pages().

In the future, we might want to look into using fallocate(), eventually
combined with MADV_POPULATE_READ, when dealing with shared file/fd
mappings and not caring about memory bindings.

[1] https://lkml.kernel.org/r/20210816081922.5155-1-david@redhat.com

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134611.31172-3-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/qemu/osdep.h |  7 ++++
 util/oslib-posix.c   | 81 +++++++++++++++++++++++++++++++++-----------
 2 files changed, 68 insertions(+), 20 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 60718fc342..d1660d67fa 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -471,6 +471,11 @@ static inline void qemu_cleanup_generic_vfree(void *p)
 #else
 #define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
 #endif
+#ifdef MADV_POPULATE_WRITE
+#define QEMU_MADV_POPULATE_WRITE MADV_POPULATE_WRITE
+#else
+#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
+#endif
 
 #elif defined(CONFIG_POSIX_MADVISE)
 
@@ -484,6 +489,7 @@ static inline void qemu_cleanup_generic_vfree(void *p)
 #define QEMU_MADV_HUGEPAGE  QEMU_MADV_INVALID
 #define QEMU_MADV_NOHUGEPAGE  QEMU_MADV_INVALID
 #define QEMU_MADV_REMOVE QEMU_MADV_DONTNEED
+#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
 
 #else /* no-op */
 
@@ -497,6 +503,7 @@ static inline void qemu_cleanup_generic_vfree(void *p)
 #define QEMU_MADV_HUGEPAGE  QEMU_MADV_INVALID
 #define QEMU_MADV_NOHUGEPAGE  QEMU_MADV_INVALID
 #define QEMU_MADV_REMOVE QEMU_MADV_INVALID
+#define QEMU_MADV_POPULATE_WRITE QEMU_MADV_INVALID
 
 #endif
 
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index b146beef78..cb89e07770 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -484,10 +484,6 @@ static void *do_touch_pages(void *arg)
              *
              * 'volatile' to stop compiler optimizing this away
              * to a no-op
-             *
-             * TODO: get a better solution from kernel so we
-             * don't need to write at all so we don't cause
-             * wear on the storage backing the region...
              */
             *(volatile char *)addr = *addr;
             addr += hpagesize;
@@ -497,6 +493,26 @@ static void *do_touch_pages(void *arg)
     return (void *)(uintptr_t)ret;
 }
 
+static void *do_madv_populate_write_pages(void *arg)
+{
+    MemsetThread *memset_args = (MemsetThread *)arg;
+    const size_t size = memset_args->numpages * memset_args->hpagesize;
+    char * const addr = memset_args->addr;
+    int ret = 0;
+
+    /* See do_touch_pages(). */
+    qemu_mutex_lock(&page_mutex);
+    while (!threads_created_flag) {
+        qemu_cond_wait(&page_cond, &page_mutex);
+    }
+    qemu_mutex_unlock(&page_mutex);
+
+    if (size && qemu_madvise(addr, size, QEMU_MADV_POPULATE_WRITE)) {
+        ret = -errno;
+    }
+    return (void *)(uintptr_t)ret;
+}
+
 static inline int get_memset_num_threads(int smp_cpus)
 {
     long host_procs = sysconf(_SC_NPROCESSORS_ONLN);
@@ -510,10 +526,11 @@ static inline int get_memset_num_threads(int smp_cpus)
 }
 
 static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
-                           int smp_cpus)
+                           int smp_cpus, bool use_madv_populate_write)
 {
     static gsize initialized = 0;
     size_t numpages_per_thread, leftover;
+    void *(*touch_fn)(void *);
     int ret = 0, i = 0;
     char *addr = area;
 
@@ -523,6 +540,12 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         g_once_init_leave(&initialized, 1);
     }
 
+    if (use_madv_populate_write) {
+        touch_fn = do_madv_populate_write_pages;
+    } else {
+        touch_fn = do_touch_pages;
+    }
+
     threads_created_flag = false;
     memset_num_threads = get_memset_num_threads(smp_cpus);
     memset_thread = g_new0(MemsetThread, memset_num_threads);
@@ -533,7 +556,7 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         memset_thread[i].numpages = numpages_per_thread + (i < leftover);
         memset_thread[i].hpagesize = hpagesize;
         qemu_thread_create(&memset_thread[i].pgthread, "touch_pages",
-                           do_touch_pages, &memset_thread[i],
+                           touch_fn, &memset_thread[i],
                            QEMU_THREAD_JOINABLE);
         addr += memset_thread[i].numpages * hpagesize;
     }
@@ -556,6 +579,12 @@ static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
     return ret;
 }
 
+static bool madv_populate_write_possible(char *area, size_t pagesize)
+{
+    return !qemu_madvise(area, pagesize, QEMU_MADV_POPULATE_WRITE) ||
+           errno != EINVAL;
+}
+
 void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
                      Error **errp)
 {
@@ -563,30 +592,42 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     struct sigaction act, oldact;
     size_t hpagesize = qemu_fd_getpagesize(fd);
     size_t numpages = DIV_ROUND_UP(memory, hpagesize);
+    bool use_madv_populate_write;
 
-    memset(&act, 0, sizeof(act));
-    act.sa_handler = &sigbus_handler;
-    act.sa_flags = 0;
+    /*
+     * Sense on every invocation, as MADV_POPULATE_WRITE cannot be used for
+     * some special mappings, such as mapping /dev/mem.
+     */
+    use_madv_populate_write = madv_populate_write_possible(area, hpagesize);
 
-    ret = sigaction(SIGBUS, &act, &oldact);
-    if (ret) {
-        error_setg_errno(errp, errno,
-            "os_mem_prealloc: failed to install signal handler");
-        return;
+    if (!use_madv_populate_write) {
+        memset(&act, 0, sizeof(act));
+        act.sa_handler = &sigbus_handler;
+        act.sa_flags = 0;
+
+        ret = sigaction(SIGBUS, &act, &oldact);
+        if (ret) {
+            error_setg_errno(errp, errno,
+                "os_mem_prealloc: failed to install signal handler");
+            return;
+        }
     }
 
     /* touch pages simultaneously */
-    ret = touch_all_pages(area, hpagesize, numpages, smp_cpus);
+    ret = touch_all_pages(area, hpagesize, numpages, smp_cpus,
+                          use_madv_populate_write);
     if (ret) {
         error_setg_errno(errp, -ret,
                          "os_mem_prealloc: preallocating memory failed");
     }
 
-    ret = sigaction(SIGBUS, &oldact, NULL);
-    if (ret) {
-        /* Terminate QEMU since it can't recover from error */
-        perror("os_mem_prealloc: failed to reinstall signal handler");
-        exit(1);
+    if (!use_madv_populate_write) {
+        ret = sigaction(SIGBUS, &oldact, NULL);
+        if (ret) {
+            /* Terminate QEMU since it can't recover from error */
+            perror("os_mem_prealloc: failed to reinstall signal handler");
+            exit(1);
+        }
     }
 }
 
-- 
MST


