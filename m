Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368074865A6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:58:51 +0100 (CET)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TI2-0005bs-Am
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:58:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Seh-0005ER-SN
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5See-0000yj-Jn
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kgzqJC25sNjBn6Va784JQ0lgK8k1CWrkfr62QAcjXXk=;
 b=AvoZFaNgz9kcS+0kk1XOlPe+idWzOnpD/dzNWLSWdzBBb8ygd3isc6Jx+U2XMtYGo3QtHs
 S4EWcNtbYkPO71IfFda1qCUJ4pl7+7QyNNN5BbiuvrI3BuHgE9wPgsyVQ4fjO4x0gFrRh1
 yOtp8pWavF0e2iRLIDCGARZxGodvbZI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-8tcRaFtENTm9_pwzR2wg0w-1; Thu, 06 Jan 2022 08:18:00 -0500
X-MC-Unique: 8tcRaFtENTm9_pwzR2wg0w-1
Received: by mail-ed1-f72.google.com with SMTP id
 i5-20020a05640242c500b003f84839a8c3so1939578edc.6
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kgzqJC25sNjBn6Va784JQ0lgK8k1CWrkfr62QAcjXXk=;
 b=kZOuM6BAxsQjX9sz/clovrqqvgBPD4nMXawowXgXAdQuOWy8nU2wM/srj1HhTvIOAi
 OfucBZTnS8YooNW4VUxmiksxn+GAAjmHk32E2gy8Pg5au15e6ps3gLjj3PcfmbZ66bGq
 bblsobz/3u2Gb8PRj0K9KUMogNPY7bzOhLSPOjXHBDKwlLkSiPRSmr8tFGgfK7cCH87Q
 9pNpf9DWtD2za0zCKDSDeQIntu/ZCKor8ZuOeJriK/KRmOWqzB/v7xYykYeZzWGElgC/
 HI4qVDGoIrZeiE1YXp43DOQH9ClUEmIDcaN4Yz4a4tB34lu3niA7qeSzIlZQ3Ou/JZ2j
 0aFg==
X-Gm-Message-State: AOAM532qvQJmh73qHFHe5riyvI/TzLaWTZmiQp35UwsPMR+GMW8iAcT6
 5PEgq+dmt13yMWjmFi5lnsH7+tesmuGHEBDSjwgqGg+e30YLx7AgkMVb8+P6Y9vBURxaD6Ic7nq
 4H0RdCo0VmhLmhmKYu/QztoFWEFxKsc4tqSQkdg2gJOMzK8PDAgsyuTymVSFW
X-Received: by 2002:a05:6402:3d9:: with SMTP id
 t25mr53473508edw.70.1641475079225; 
 Thu, 06 Jan 2022 05:17:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPjMR5AVkYJgRCzkgs/UpOzT+Y5C8c8UQDOdFvfOBAiAVQLeAWYxQvEORf0FD4woHmtGJNQg==
X-Received: by 2002:a05:6402:3d9:: with SMTP id
 t25mr53473480edw.70.1641475078900; 
 Thu, 06 Jan 2022 05:17:58 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id 19sm485624ejv.207.2022.01.06.05.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:58 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/52] util/oslib-posix: Forward SIGBUS to MCE handler under
 Linux
Message-ID: <20220106131534.423671-36-mst@redhat.com>
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
 util/oslib-posix.c | 36 +++++++++++++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 3 deletions(-)

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
index 9829149e4b..5c47aa9cb7 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -95,6 +95,7 @@ typedef struct MemsetThread MemsetThread;
 
 /* used by sigbus_handler() */
 static MemsetContext *sigbus_memset_context;
+struct sigaction sigbus_oldact;
 static QemuMutex sigbus_mutex;
 
 static QemuMutex page_mutex;
@@ -446,7 +447,11 @@ const char *qemu_get_exec_dir(void)
     return exec_dir;
 }
 
+#ifdef CONFIG_LINUX
+static void sigbus_handler(int signal, siginfo_t *siginfo, void *ctx)
+#else /* CONFIG_LINUX */
 static void sigbus_handler(int signal)
+#endif /* CONFIG_LINUX */
 {
     int i;
 
@@ -459,6 +464,26 @@ static void sigbus_handler(int signal)
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
@@ -628,10 +653,10 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
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
@@ -647,10 +672,15 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
 
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
@@ -667,7 +697,7 @@ void os_mem_prealloc(int fd, char *area, size_t memory, int smp_cpus,
     }
 
     if (!use_madv_populate_write) {
-        ret = sigaction(SIGBUS, &oldact, NULL);
+        ret = sigaction(SIGBUS, &sigbus_oldact, NULL);
         if (ret) {
             /* Terminate QEMU since it can't recover from error */
             perror("os_mem_prealloc: failed to reinstall signal handler");
-- 
MST


