Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4781237A25B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:41:56 +0200 (CEST)
Received: from localhost ([::1]:39368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNxj-0000bq-Cn
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNXF-000281-5h
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWp-0000ok-S1
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KhBZ86844q/yeMTRkskGkQJG2tY0n33REh0o2Uw/rdQ=;
 b=eLOa159XZg+/2PeSNWZzFYfmQVsalZg1I+hLsKNHDVjIh0S4hX/6DPOUJQAGThSX9ZMyYG
 GQc8ycxjymxLN5aUfxgcEQe9EgwUmnEScdT+5h2JCHxZ3nFkajVbU80rkpwn7L4IMkdvs5
 Qddz3RnAZZbGwITQyySoubaPXEYvaWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-XN82yAZDMdqF2FUvGRGJtA-1; Tue, 11 May 2021 04:14:05 -0400
X-MC-Unique: XN82yAZDMdqF2FUvGRGJtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 984C81854E24
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:04 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 678636E51B
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:14:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/33] main-loop: remove dead code
Date: Tue, 11 May 2021 04:13:46 -0400
Message-Id: <20210511081350.419428-30-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_add_child_watch is not called anywhere since commit 2bdb920ece
("slirp: simplify fork_exec()", 2019-01-14), remove it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/main-loop.h | 18 ------------
 util/main-loop.c         | 61 ----------------------------------------
 2 files changed, 79 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index d6892fd208..98aef5647c 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -234,24 +234,6 @@ void event_notifier_set_handler(EventNotifier *e,
 
 GSource *iohandler_get_g_source(void);
 AioContext *iohandler_get_aio_context(void);
-#ifdef CONFIG_POSIX
-/**
- * qemu_add_child_watch: Register a child process for reaping.
- *
- * Under POSIX systems, a parent process must read the exit status of
- * its child processes using waitpid, or the operating system will not
- * free some of the resources attached to that process.
- *
- * This function directs the QEMU main loop to observe a child process
- * and call waitpid as soon as it exits; the watch is then removed
- * automatically.  It is useful whenever QEMU forks a child process
- * but will find out about its termination by other means such as a
- * "broken pipe".
- *
- * @pid: The pid that QEMU should observe.
- */
-int qemu_add_child_watch(pid_t pid);
-#endif
 
 /**
  * qemu_mutex_iothread_locked: Return lock status of the main loop mutex.
diff --git a/util/main-loop.c b/util/main-loop.c
index 5188ff6540..d9c55df6f5 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -591,64 +591,3 @@ void event_notifier_set_handler(EventNotifier *e,
     aio_set_event_notifier(iohandler_ctx, e, false,
                            handler, NULL);
 }
-
-/* reaping of zombies.  right now we're not passing the status to
-   anyone, but it would be possible to add a callback.  */
-#ifndef _WIN32
-typedef struct ChildProcessRecord {
-    int pid;
-    QLIST_ENTRY(ChildProcessRecord) next;
-} ChildProcessRecord;
-
-static QLIST_HEAD(, ChildProcessRecord) child_watches =
-    QLIST_HEAD_INITIALIZER(child_watches);
-
-static QEMUBH *sigchld_bh;
-
-static void sigchld_handler(int signal)
-{
-    qemu_bh_schedule(sigchld_bh);
-}
-
-static void sigchld_bh_handler(void *opaque)
-{
-    ChildProcessRecord *rec, *next;
-
-    QLIST_FOREACH_SAFE(rec, &child_watches, next, next) {
-        if (waitpid(rec->pid, NULL, WNOHANG) == rec->pid) {
-            QLIST_REMOVE(rec, next);
-            g_free(rec);
-        }
-    }
-}
-
-static void qemu_init_child_watch(void)
-{
-    struct sigaction act;
-    sigchld_bh = qemu_bh_new(sigchld_bh_handler, NULL);
-
-    memset(&act, 0, sizeof(act));
-    act.sa_handler = sigchld_handler;
-    act.sa_flags = SA_NOCLDSTOP;
-    sigaction(SIGCHLD, &act, NULL);
-}
-
-int qemu_add_child_watch(pid_t pid)
-{
-    ChildProcessRecord *rec;
-
-    if (!sigchld_bh) {
-        qemu_init_child_watch();
-    }
-
-    QLIST_FOREACH(rec, &child_watches, next) {
-        if (rec->pid == pid) {
-            return 1;
-        }
-    }
-    rec = g_malloc0(sizeof(ChildProcessRecord));
-    rec->pid = pid;
-    QLIST_INSERT_HEAD(&child_watches, rec, next);
-    return 0;
-}
-#endif
-- 
2.26.2



