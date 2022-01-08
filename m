Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B694880A8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:45:05 +0100 (CET)
Received: from localhost ([::1]:51562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60n3-0000Ie-08
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:45:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Ar-0004sg-R6
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Aq-0002iE-4J
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtweE++pD1JA2SQ5oLSRHh8djSnLz4ps92bNpiYK0Ok=;
 b=fAK+sZvzYRd+C5H1dKuWF/kPE7Eurp3ONJBu0WhTLcbwwtop7qvaEDbBew2u1lXbayr+X7
 NM6LfWcnt8wV22JbYKW8YYJL1o09aLRqSaNXGeonH3jzU0M+L3dr/hRS/lHjRKS3hOdkaZ
 kNlEYQ3wnss52MCJV+AcJS8roHmbJ88=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-peujMgplNzCYpiiIY5q45A-1; Fri, 07 Jan 2022 20:05:32 -0500
X-MC-Unique: peujMgplNzCYpiiIY5q45A-1
Received: by mail-wm1-f72.google.com with SMTP id
 b9-20020a7bc249000000b00347c5699809so1587855wmj.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:05:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XtweE++pD1JA2SQ5oLSRHh8djSnLz4ps92bNpiYK0Ok=;
 b=IIckd4CPJRDTjopxMq9951BjNnND7ItMCjARWBiWpgLXSJls+AGNbkuW3ng0ZGyNPO
 hKNL/bHzLg669wnKg/xVWWTr1cTTavSbkP2cAzjYyILyp0e6nMT7XNYSqDzmRgkuoD26
 +k0uy7Yc/A5L2B3VvTgQzlzBeMd7VEXzjPjXE9poHPZB10fZ7FQMKjQhSnrlgccjI6Iw
 +EnXHQ0oNqB2Um2Oj2xTs9ieLDZyykNLiZ8Z5hPVkKP1uwh5qRLDGOLdYoFPwTw9AcHx
 X6+UCnnDjOS1ijiXEThNWPWxbkHLLbmwVIN3Nm1M1DYmI0paFL86E2rfpZ1KySKu1XBd
 Rrvg==
X-Gm-Message-State: AOAM530S1ahdUhQzR4dgbnfeH/VdHpCwIUWzBB8BG7Z0CgXisMzYIrUD
 V7IvlAxGymWu8zggECIRXiEG4Y9dE4KRLGMJOis75rf3oAlVemuwpQOrgjn5l9Yta26xrplhGTv
 5HR9u9BT1BCXWRnWpagCIBRJ8hb8iAG/V7Sl1tHwVcBOFotGrr546zLNqoDMa
X-Received: by 2002:adf:f390:: with SMTP id m16mr54885794wro.589.1641603930826; 
 Fri, 07 Jan 2022 17:05:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzz42ZIQ+H54/XSoh3sL5NPaYgtieFgEujxk8OZZrm/nOVP9dE9LvYhydnPKDtyaHzwx6y5CA==
X-Received: by 2002:adf:f390:: with SMTP id m16mr54885777wro.589.1641603930526; 
 Fri, 07 Jan 2022 17:05:30 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id o9sm214959wri.97.2022.01.07.17.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:30 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 35/55] util/oslib-posix: Forward SIGBUS to MCE handler
 under Linux
Message-ID: <20220108003423.15830-36-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Temporarily modifying the SIGBUS handler is really nasty, as we might be
unlucky and receive an MCE SIGBUS while having our handler registered.
Unfortunately, there is no way around messing with SIGBUS when
MADV_POPULATE_WRITE is not applicable or not around.

Let's forward SIGBUS that don't belong to us to the already registered
handler and document the situation.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20211217134611.31172-8-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 softmmu/cpus.c     |  4 ++++
 util/oslib-posix.c | 37 ++++++++++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840..23bca46b07 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -352,6 +352,10 @@ static void qemu_init_sigbus(void)
 {
     struct sigaction action;
 
+    /*
+     * ALERT: when modifying this, take care that SIGBUS forwarding in
+     * os_mem_prealloc() will continue working as expected.
+     */
     memset(&action, 0, sizeof(action));
     action.sa_flags = SA_SIGINFO;
     action.sa_sigaction = sigbus_handler;
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 9829149e4b..9efdc74bba 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -35,6 +35,7 @@
 #include "sysemu/sysemu.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/sockets.h"
 #include "qemu/thread.h"
 #include <libgen.h>
@@ -95,6 +96,7 @@ typedef struct MemsetThread MemsetThread;
 
 /* used by sigbus_handler() */
 static MemsetContext *sigbus_memset_context;
+struct sigaction sigbus_oldact;
 static QemuMutex sigbus_mutex;
 
 static QemuMutex page_mutex;
@@ -446,7 +448,11 @@ const char *qemu_get_exec_dir(void)
     return exec_dir;
 }
 
+#ifdef CONFIG_LINUX
+static void sigbus_handler(int signal, siginfo_t *siginfo, void *ctx)
+#else /* CONFIG_LINUX */
 static void sigbus_handler(int signal)
+#endif /* CONFIG_LINUX */
 {
     int i;
 
@@ -459,6 +465,26 @@ static void sigbus_handler(int signal)
             }
         }
     }
+
+#ifdef CONFIG_LINUX
+    /*
+     * We assume that the MCE SIGBUS handler could have been registered. We
+     * should never receive BUS_MCEERR_AO on any of our threads, but only on
+     * the main thread registered for PR_MCE_KILL_EARLY. Further, we should not
+     * receive BUS_MCEERR_AR triggered by action of other threads on one of
+     * our threads. So, no need to check for unrelated SIGBUS when seeing one
+     * for our threads.
+     *
+     * We will forward to the MCE handler, which will either handle the SIGBUS
+     * or reinstall the default SIGBUS handler and reraise the SIGBUS. The
+     * default SIGBUS handler will crash the process, so we don't care.
+     */
+    if (sigbus_oldact.sa_flags & SA_SIGINFO) {
+        sigbus_oldact.sa_sigaction(signal, siginfo, ctx);
+        return;
+    }
+#endif /* CONFIG_LINUX */
+    warn_report("os_mem_prealloc: unrelated SIGBUS detected and ignored");
 }
 
 static void *do_touch_pages(void *arg)
@@ -628,10 +654,10 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
 {
     static gsize initialized;
     int ret;
-    struct sigaction act, oldact;
     size_t hpagesize = qemu_fd_getpagesize(fd);
     size_t numpages = DIV_ROUND_UP(memory, hpagesize);
     bool use_madv_populate_write;
+    struct sigaction act;
 
     /*
      * Sense on every invocation, as MADV_POPULATE_WRITE cannot be used for
@@ -647,10 +673,15 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
 
         qemu_mutex_lock(&sigbus_mutex);
         memset(&act, 0, sizeof(act));
+#ifdef CONFIG_LINUX
+        act.sa_sigaction = &sigbus_handler;
+        act.sa_flags = SA_SIGINFO;
+#else /* CONFIG_LINUX */
         act.sa_handler = &sigbus_handler;
         act.sa_flags = 0;
+#endif /* CONFIG_LINUX */
 
-        ret = sigaction(SIGBUS, &act, &oldact);
+        ret = sigaction(SIGBUS, &act, &sigbus_oldact);
         if (ret) {
             error_setg_errno(errp, errno,
                 "os_mem_prealloc: failed to install signal handler");
@@ -667,7 +698,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     }
 
     if (!use_madv_populate_write) {
-        ret = sigaction(SIGBUS, &oldact, NULL);
+        ret = sigaction(SIGBUS, &sigbus_oldact, NULL);
         if (ret) {
             /* Terminate QEMU since it can't recover from error */
             perror("os_mem_prealloc: failed to reinstall signal handler");
-- 
MST


