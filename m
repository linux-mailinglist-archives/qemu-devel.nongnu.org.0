Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70E04B80BB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:33:26 +0100 (CET)
Received: from localhost ([::1]:33468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKDsT-0006mV-Os
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:33:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoN-00048n-73
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoE-0006Dr-NF
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EiC+MAxpNNYzgkQn7CDpdk/XLHjC0Acmh1wcwvYO5Gk=;
 b=a3zK8BqkoPaU2ofuvGhRmJU+dse0YBC4kNrNhK92ew7niWex68eez7SyTk+JQ9nGTUG1+U
 I41CHQNqAZzNEnTWKkdztE103V24AapsdcrXXM7IZdnmW4FeDwLIzlzdDcNRgtORig5gWK
 ibutEM/tcmgBzGgnKKLfDf3T6BFFMUs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-4QIT_ZS2NbyPvfLfn_5H4w-1; Wed, 16 Feb 2022 01:28:43 -0500
X-MC-Unique: 4QIT_ZS2NbyPvfLfn_5H4w-1
Received: by mail-pl1-f200.google.com with SMTP id
 e7-20020a170902ef4700b0014d2b420f1fso691586plx.17
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EiC+MAxpNNYzgkQn7CDpdk/XLHjC0Acmh1wcwvYO5Gk=;
 b=XmlrXF3AMCSzgDhohc5BbFOwRU+uyGSvQpOF9/vZ22iFumiKjnWzlfctSaF/tjgfP6
 khRrtF2ckmP2VlapJSIYn3dWaNT9L8lkBq21bvxkH7j1Si37oqaZt2lFexM3bKQm7ltS
 +ZjcMEiyBosOB+t83vzFmZ+XBUpwXO8Ts6VgrgeaDfXzubaSTTqLXK3Ng23vl9FsjPX5
 9MwuQJP6Prnra5KsOPiJdoS5QtoqB5PBjFm6bzRnR1c57s5DqGuATOVuoYN9h/uy/sfV
 j1jlKTIAhkn+CwrHix0xN8lpQHS3G1UTDEr9qaqyk3jdikNnImbr+Fp2hDixHl7TMZdB
 Gy4A==
X-Gm-Message-State: AOAM533QnUq00MbBa8c22pfh6NzdE+e69sFwjYxjsO2iC1JHiUT2NXDE
 eeRY1M6BcC3QJH0CIynGY+S6y9ES1JVUbJhMPhqQQqtd8cnMF59r5oQu2JcPbdxnc66hcu+uGi4
 5Ux65LJvlxyildfJKcpPAueVru5dZKi6wC++F60PU3bOCPlDzDsOL+GXDhY/w+WZY
X-Received: by 2002:a63:d158:0:b0:341:7eac:74d6 with SMTP id
 c24-20020a63d158000000b003417eac74d6mr1037856pgj.541.1644992921721; 
 Tue, 15 Feb 2022 22:28:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9rlIUQzL6pf/+mw+If5d3wjKFbZ4Ptustfa1HliV2Tcms8sz9Qcxxo7irCedhrEEALFpRWA==
X-Received: by 2002:a63:d158:0:b0:341:7eac:74d6 with SMTP id
 c24-20020a63d158000000b003417eac74d6mr1037832pgj.541.1644992921336; 
 Tue, 15 Feb 2022 22:28:41 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.28.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:28:41 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/20] migration: Finer grained tracepoints for POSTCOPY_LISTEN
Date: Wed, 16 Feb 2022 14:27:51 +0800
Message-Id: <20220216062809.57179-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
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
index 7bb65e1d61..190cc5fc42 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1948,9 +1948,10 @@ static void *postcopy_ram_listen_thread(void *opaque)
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
@@ -1965,6 +1966,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
         }
     }
 
+    trace_loadvm_postcopy_handle_listen("after discard");
+
     /*
      * Sensitise RAM - can now generate requests for blocks that don't exist
      * However, at this point the CPU shouldn't be running, and the IO
@@ -1977,6 +1980,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
         }
     }
 
+    trace_loadvm_postcopy_handle_listen("after uffd");
+
     if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
         error_report_err(local_err);
         return -1;
@@ -1991,6 +1996,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
     qemu_sem_wait(&mis->listen_thread_sem);
     qemu_sem_destroy(&mis->listen_thread_sem);
 
+    trace_loadvm_postcopy_handle_listen("return");
+
     return 0;
 }
 
diff --git a/migration/trace-events b/migration/trace-events
index 123cfe79d7..92596c00d8 100644
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


