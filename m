Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD647B1A1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:50:54 +0100 (CET)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLsC-0001sY-T8
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:50:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKQJ-0001wn-R5
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKPm-0005xS-3I
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:17:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vvt65GNMhXWNnjoGzsAV1uOCUvMNn6K3raOIWgUMeGU=;
 b=Pz850oS7Edr/yF5ER+u3m/i1aVQNmjKlVaz0/2/koS2IFxhXyeKEV4dIS5sN0A+IhEnO/n
 k7XK5W/RWHXPfiY0w9uADZoyUwMRLfqJduVHzps3BFNSVjDJ2SbVUyykPHi854acLFaA0B
 rPOfoNV6tSp4iFS4MIqszIikFHYyDs8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-DK7jrdjXO8eLeZ1AITsk1g-1; Mon, 20 Dec 2021 03:54:45 -0500
X-MC-Unique: DK7jrdjXO8eLeZ1AITsk1g-1
Received: by mail-wm1-f69.google.com with SMTP id
 j71-20020a1c234a000000b00342f418ae7cso6173680wmj.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 00:54:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vvt65GNMhXWNnjoGzsAV1uOCUvMNn6K3raOIWgUMeGU=;
 b=XXd1AG+VeHZEt5ghRztlQSvfP8tmICZjNw8mPnGfuIw+FiHGO/ZL8d+k7DelnOpYaj
 o7wSr0NRgSlOrGMcfO1ojy9dyWEAz6OwLPtVDx9j/TZIA5QdyGWuMSUFiMDxr+XFUMJ8
 unpPBlupWxM9ED/yoPfpl/U3nBCGgH67yVGTJwugEeJyTcWbfEALOCkboZ76g3ZYX2EG
 6HyERcwYk4guBKXsjtC8XX575oKWJxecSyMww+ZsO6h2IyKjFS97M/uswivNgkYWTrxB
 rF330E5AHgYfHGi8VBtVAwJsYnDPfMdwP0x5kAMY8rGT/d+kNMyIlDDHfmYGTDatBk0B
 PRkA==
X-Gm-Message-State: AOAM532gjUSePpuzJIwUGiRshTDIMuZNmSwCXDFKhUV4bNUbXrtpVgQT
 l86cu6slzaiaGtK+xbkF2VRMCfQRbmr33wtntbY+TmmL4jLhCvOY7uP82Pb3AsGlGgUTjG1mpgG
 y+sI4bWTJJ+ADMjMX43Gyrygfm3I+GR+6huXfBoiJ8PJ+pP1K+r5UP4sD0s6T/TVW
X-Received: by 2002:adf:804f:: with SMTP id 73mr11919546wrk.476.1639990484010; 
 Mon, 20 Dec 2021 00:54:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxmcmnHxpwHoX6aw6Yp3xNKhlU2xhFj1r50ALe+GqoJAOUXLIFJ2qw3EVcgWw9eCegXIdzrA==
X-Received: by 2002:adf:804f:: with SMTP id 73mr11919525wrk.476.1639990483713; 
 Mon, 20 Dec 2021 00:54:43 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.164])
 by smtp.gmail.com with ESMTPSA id h2sm14439713wrz.23.2021.12.20.00.54.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Dec 2021 00:54:43 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] migration: Tracepoint change in postcopy-run bottom
 half
Date: Mon, 20 Dec 2021 16:53:55 +0800
Message-Id: <20211220085355.2284-9-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211220085355.2284-1-peterx@redhat.com>
References: <20211220085355.2284-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.209, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the old two tracepoints and they're even near each other:

    trace_loadvm_postcopy_handle_run_cpu_sync()
    trace_loadvm_postcopy_handle_run_vmstart()

Add trace_loadvm_postcopy_handle_run_bh() with a finer granule trace.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/savevm.c     | 12 +++++++++---
 migration/trace-events |  3 +--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 25face6de0..de2577c251 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2005,13 +2005,19 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
     Error *local_err = NULL;
     MigrationIncomingState *mis = opaque;
 
+    trace_loadvm_postcopy_handle_run_bh("enter");
+
     /* TODO we should move all of this lot into postcopy_ram.c or a shared code
      * in migration.c
      */
     cpu_synchronize_all_post_init();
 
+    trace_loadvm_postcopy_handle_run_bh("after cpu sync");
+
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
+    trace_loadvm_postcopy_handle_run_bh("after announce");
+
     /* Make sure all file formats flush their mutable metadata.
      * If we get an error here, just don't restart the VM yet. */
     bdrv_invalidate_cache_all(&local_err);
@@ -2021,9 +2027,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
         autostart = false;
     }
 
-    trace_loadvm_postcopy_handle_run_cpu_sync();
-
-    trace_loadvm_postcopy_handle_run_vmstart();
+    trace_loadvm_postcopy_handle_run_bh("after invalidate cache");
 
     dirty_bitmap_mig_before_vm_start();
 
@@ -2036,6 +2040,8 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
     }
 
     qemu_bh_delete(mis->bh);
+
+    trace_loadvm_postcopy_handle_run_bh("exit");
 }
 
 /* After all discards we can start running and asking for pages */
diff --git a/migration/trace-events b/migration/trace-events
index 77d1237d89..e165687af2 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -16,8 +16,7 @@ loadvm_handle_recv_bitmap(char *s) "%s"
 loadvm_postcopy_handle_advise(void) ""
 loadvm_postcopy_handle_listen(const char *str) "%s"
 loadvm_postcopy_handle_run(void) ""
-loadvm_postcopy_handle_run_cpu_sync(void) ""
-loadvm_postcopy_handle_run_vmstart(void) ""
+loadvm_postcopy_handle_run_bh(const char *str) "%s"
 loadvm_postcopy_handle_resume(void) ""
 loadvm_postcopy_ram_handle_discard(void) ""
 loadvm_postcopy_ram_handle_discard_end(void) ""
-- 
2.32.0


