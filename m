Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D6647B1ED
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:14:21 +0100 (CET)
Received: from localhost ([::1]:36012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMEu-0007pj-28
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:14:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKSK-0002NR-FM
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:20:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKSC-0006u3-2Y
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:20:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sN7W53wSKdSW7/EO825rGSschix/KpNiUHAV/bcBZA=;
 b=VNJafoDWrpOyCBjwq9juExzNrhjzwwqSfEgGO0D1nmCPqJpHYOYJm5SaE5/z3NJamMVIH4
 RTAU/SAqbaw6RudtSw0sWpB1/O0xnyzlR5jq9jTPfFFIitFCUyFcK4lUL9qIvsTbBSKt/m
 pWLNTyFdgynpNNqZoGQpNyy7yBRFJq8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-O9Jn6OSyNL2QQeCs3kFatQ-1; Mon, 20 Dec 2021 03:54:40 -0500
X-MC-Unique: O9Jn6OSyNL2QQeCs3kFatQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z200-20020a1c7ed1000000b0034574ef8356so1683785wmc.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 00:54:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+sN7W53wSKdSW7/EO825rGSschix/KpNiUHAV/bcBZA=;
 b=J1k3bYIk4jaKUwgDcvDzPFmb1mK5tfUbyoBZUb4pVMUqTLe09mSRAdMaJkiVmrpBnW
 fEKFHk3UzeWXl0V0tlMujm+lUPxHEO+vA40VGOHJeVVCebhneYkPq/Auw0JlUVMhYwvd
 CMe3S0MjycppqhXCefHP6Ary0syup8c6TXo45dXpUGSyAsPvSCd8Tdaq09b2EpXgaSXO
 Fki982ItvS7n451m9nTU39iA81ZJJG0qIbt0gISStvQpvRZPV2A4YAFsFX/WhZB8Ac/g
 MYJhyPy5DE2uUosbp62CbdFkYQGgWGMErb2c91WAv4ryjYyhVZ9wzgiPaY5LQkxLvFbQ
 ygEg==
X-Gm-Message-State: AOAM532coiw4rve9XmxxT4+vlUOQ2JfNe4I5XUQYd0bxWYALLnFLqAOj
 jA+fhzUt3Tg9v0x+3HxEDqqXh9RsGwYXN7WatomtT76XIo2zNPMHoeOilGNUcYtfWutqKGEcAV1
 N9RppoH/M94i5ImzUIl1mkdGCc0X4uorDh3CHutdgPJ8z2hMlOEPwWuzYRxo7Pbqw
X-Received: by 2002:adf:d841:: with SMTP id k1mr10340023wrl.396.1639990479199; 
 Mon, 20 Dec 2021 00:54:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2XCTvpAyB6n8OBSGXQBVmI52qgg0I/tyHoGwDui0lngR5L7M+Tgc8iinQwwBG8hzvRgDbGw==
X-Received: by 2002:adf:d841:: with SMTP id k1mr10340003wrl.396.1639990479010; 
 Mon, 20 Dec 2021 00:54:39 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.164])
 by smtp.gmail.com with ESMTPSA id h2sm14439713wrz.23.2021.12.20.00.54.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Dec 2021 00:54:38 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] migration: Finer grained tracepoints for
 POSTCOPY_LISTEN
Date: Mon, 20 Dec 2021 16:53:54 +0800
Message-Id: <20211220085355.2284-8-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The enablement of postcopy listening has a few steps, add a few tracepoints to
be there ready for some basic measurements for them.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/savevm.c     | 9 ++++++++-
 migration/trace-events | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 7f7af6f750..25face6de0 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1947,9 +1947,10 @@ static void *postcopy_ram_listen_thread(void *opaque)
 static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
 {
     PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
-    trace_loadvm_postcopy_handle_listen();
     Error *local_err = NULL;
 
+    trace_loadvm_postcopy_handle_listen("enter");
+
     if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
         error_report("CMD_POSTCOPY_LISTEN in wrong postcopy state (%d)", ps);
         return -1;
@@ -1964,6 +1965,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
         }
     }
 
+    trace_loadvm_postcopy_handle_listen("after disgard");
+
     /*
      * Sensitise RAM - can now generate requests for blocks that don't exist
      * However, at this point the CPU shouldn't be running, and the IO
@@ -1976,6 +1979,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
         }
     }
 
+    trace_loadvm_postcopy_handle_listen("after uffd");
+
     if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
         error_report_err(local_err);
         return -1;
@@ -1990,6 +1995,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
     qemu_sem_wait(&mis->listen_thread_sem);
     qemu_sem_destroy(&mis->listen_thread_sem);
 
+    trace_loadvm_postcopy_handle_listen("exit");
+
     return 0;
 }
 
diff --git a/migration/trace-events b/migration/trace-events
index d63a5915f5..77d1237d89 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -14,7 +14,7 @@ loadvm_handle_cmd_packaged_main(int ret) "%d"
 loadvm_handle_cmd_packaged_received(int ret) "%d"
 loadvm_handle_recv_bitmap(char *s) "%s"
 loadvm_postcopy_handle_advise(void) ""
-loadvm_postcopy_handle_listen(void) ""
+loadvm_postcopy_handle_listen(const char *str) "%s"
 loadvm_postcopy_handle_run(void) ""
 loadvm_postcopy_handle_run_cpu_sync(void) ""
 loadvm_postcopy_handle_run_vmstart(void) ""
-- 
2.32.0


