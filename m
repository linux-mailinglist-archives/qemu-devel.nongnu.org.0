Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998BF48657B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:46:33 +0100 (CET)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5T68-000658-Nh
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:46:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5See-0005Ct-T1
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SeE-0000xb-Ly
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkGrOZuaN+sKQzXuSFchNjulrxzkzkS5BeUisZ+6J2Q=;
 b=EljeNnqYEBK4HOcft2cQ3j2fsqc/nAZYQJvexfB5h/ZKPxEKAsPGysSnpL/ViYfkkvIZ3N
 abdkBOGTfBCqL9vkRA8OIdM5mCRa3w/oqaMyPhMbjyDSqazaLyipCb/TO0Ho0z4JxCrM60
 m7VT6B7p7+YpZmfFL9+GYP9ILaBxBok=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-7B_UgYl1O92_fQIZw0f-7Q-1; Thu, 06 Jan 2022 08:17:41 -0500
X-MC-Unique: 7B_UgYl1O92_fQIZw0f-7Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 w6-20020a05640234c600b003f916e1b615so1907843edc.17
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BkGrOZuaN+sKQzXuSFchNjulrxzkzkS5BeUisZ+6J2Q=;
 b=V14AICx5T2b2w3Ak5MUSF2iZixVPhzxeHii9UH4xaMv486WlcQJimhxkS/1csyayqZ
 7Gh9rR1VK8Y+i1+vPx1UwRCTByNQDC4suLctUgOcFRVdMDyIbYZYQEH6pmEkdIuyhXSi
 cFYOJwS8SAm4B171GHOCcsyGBl9yOogvM0AYjbI0caM0NYYKtNlgg0cuVXcKQNBSRNa0
 6T1MoZ0JS0+TA1NXli6RFt4Z7Yqzs7hHFDvmPvDiAlnluO9Jbm4zBUGxNvY0HkRMhKBW
 sRV73LNQr4j6bxqnfrvNxuAS9QBOvmg3V1o6OdCYuO+sgU6cJaAD7WTK8CiAzFE2fsLb
 1Ypg==
X-Gm-Message-State: AOAM530+6HbJhTTEOMzncz/rV6izxZE8rQLD26egN/4TuDne3d7kGWix
 nVPSkD8j3sbGi88WBa5DIdm80+bJG0txN46mu8OGTCGbr98/hmbUABWbOXYBAMEZN3nDoI2kHRR
 nWBFrEKMntyao7x0h9ZyPNAKFC+TJe/gTKp4ehin1gwUri5WRfJLLeEVTpt/w
X-Received: by 2002:a17:907:2ce6:: with SMTP id
 hz6mr18344588ejc.768.1641475059367; 
 Thu, 06 Jan 2022 05:17:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQidv4rSnbEST2NRuFl2nxdgNe3FPfAieReUY8UdBEvHyovlvXKB2B46Xn5stAY6UjK+gu/Q==
X-Received: by 2002:a17:907:2ce6:: with SMTP id
 hz6mr18344563ejc.768.1641475059009; 
 Thu, 06 Jan 2022 05:17:39 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id c30sm489068ejj.190.2022.01.06.05.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:38 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/52] util/oslib-posix: Let touch_all_pages() return an error
Message-ID: <20220106131534.423671-30-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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

Let's prepare touch_all_pages() for returning differing errors. Return
an error from the thread and report the last processed error.

Translate SIGBUS to -EFAULT, as a SIGBUS can mean all different kind of
things (memory error, read error, out of memory). When allocating memory
fails via the current SIGBUS-based mechanism, we'll get:
    os_mem_prealloc: preallocating memory failed: Bad address

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134611.31172-2-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 util/oslib-posix.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index e8bdb02e1d..b146beef78 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -84,7 +84,6 @@ typedef struct MemsetThread MemsetThread;
 
 static MemsetThread *memset_thread;
 static int memset_num_threads;
-static bool memset_thread_failed;
 
 static QemuMutex page_mutex;
 static QemuCond page_cond;
@@ -452,6 +451,7 @@ static void *do_touch_pages(void *arg)
 {
     MemsetThread *memset_args = (MemsetThread *)arg;
     sigset_t set, oldset;
+    int ret = 0;
 
     /*
      * On Linux, the page faults from the loop below can cause mmap_sem
@@ -470,7 +470,7 @@ static void *do_touch_pages(void *arg)
     pthread_sigmask(SIG_UNBLOCK, &set, &oldset);
 
     if (sigsetjmp(memset_args->env, 1)) {
-        memset_thread_failed = true;
+        ret = -EFAULT;
     } else {
         char *addr = memset_args->addr;
         size_t numpages = memset_args->numpages;
@@ -494,7 +494,7 @@ static void *do_touch_pages(void *arg)
         }
     }
     pthread_sigmask(SIG_SETMASK, &oldset, NULL);
-    return NULL;
+    return (void *)(uintptr_t)ret;
 }
 
 static inline int get_memset_num_threads(int smp_cpus)
@@ -509,13 +509,13 @@ static inline int get_memset_num_threads(int smp_cpus)
     return ret;
 }
 
-static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
-                            int smp_cpus)
+static int touch_all_pages(char *area, size_t hpagesize, size_t numpages,
+                           int smp_cpus)
 {
     static gsize initialized = 0;
     size_t numpages_per_thread, leftover;
+    int ret = 0, i = 0;
     char *addr = area;
-    int i = 0;
 
     if (g_once_init_enter(&initialized)) {
         qemu_mutex_init(&page_mutex);
@@ -523,7 +523,6 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
         g_once_init_leave(&initialized, 1);
     }
 
-    memset_thread_failed = false;
     threads_created_flag = false;
     memset_num_threads = get_memset_num_threads(smp_cpus);
     memset_thread = g_new0(MemsetThread, memset_num_threads);
@@ -545,12 +544,16 @@ static bool touch_all_pages(char *area, size_t hpagesize, size_t numpages,
     qemu_mutex_unlock(&page_mutex);
 
     for (i = 0; i < memset_num_threads; i++) {
-        qemu_thread_join(&memset_thread[i].pgthread);
+        int tmp = (uintptr_t)qemu_thread_join(&memset_thread[i].pgthread);
+
+        if (tmp) {
+            ret = tmp;
+        }
     }
     g_free(memset_thread);
     memset_thread = NULL;
 
-    return memset_thread_failed;
+    return ret;
 }
 
 void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
@@ -573,9 +576,10 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     }
 
     /* touch pages simultaneously */
-    if (touch_all_pages(area, hpagesize, numpages, smp_cpus)) {
-        error_setg(errp, "os_mem_prealloc: Insufficient free host memory "
-            "pages available to allocate guest RAM");
+    ret = touch_all_pages(area, hpagesize, numpages, smp_cpus);
+    if (ret) {
+        error_setg_errno(errp, -ret,
+                         "os_mem_prealloc: preallocating memory failed");
     }
 
     ret = sigaction(SIGBUS, &oldact, NULL);
-- 
MST


