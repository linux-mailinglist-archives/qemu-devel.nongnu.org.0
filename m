Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8DC4C86C9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:43:12 +0100 (CET)
Received: from localhost ([::1]:39698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOy6A-0006TX-5r
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:43:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy2s-0003QT-55
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy2p-0007rT-79
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646123981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0fllUttO/wJ4RRPewl/b4FdObxc5ST7EKpTLC+RNJ4I=;
 b=YnvoegB6yllM6D3CfEeeCiAwWLV+OCsDgSHfLKLlwkYJsZaCh1nq5diGnIqTPeVYPcZPBO
 MjGskTMgYg0Uo1AwDVdspAu/4uiF+rhv4KPLbGKtVTDOOGvhvWUTegQtxg31cT/WFVo33u
 RmlIjecwWJSIUH17jEMlJRxNt6ub+vU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-gWaJIurOOtCPgKzOpdy5Fg-1; Tue, 01 Mar 2022 03:39:40 -0500
X-MC-Unique: gWaJIurOOtCPgKzOpdy5Fg-1
Received: by mail-pf1-f197.google.com with SMTP id
 t184-20020a6281c1000000b004e103c5f726so880850pfd.8
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0fllUttO/wJ4RRPewl/b4FdObxc5ST7EKpTLC+RNJ4I=;
 b=f53WlxQ/+SHUWJCj58YmQ9IBzbqNoZYdiiCankDp8D6a90By9dWIYcO6Q+4gwQfyQl
 spmDZTVTsuQ4RabR5aZdhWXge5U/7QR998an6LCiR/h+TaF8H76PrFOXron0v0r9HDWg
 pc6HXQcajKP7d414fET8hOBcfEcR7JKBqQjL5GC8c41ZoRZLM8q7ullLA6NPQlwfXesv
 2zUhBMmoLvMPEerbMShBeYi9U9ZwUjk8kQgpn16Wr2hdv72huOjAylwU5ekj/SO/MoCV
 utHYEAYrXXL4WUYqENU4ymT56P5To1Z8NwBteggD2ZL+/RxMb7ss7z9/4k6+k8K4zwPh
 osvQ==
X-Gm-Message-State: AOAM530t7Ky9eX+v8FZ/mR6u+5PjP3+ZhwqyuPJO4fTw24IoqsK9qGJF
 rh2Yos2o8r1+mDz+m/ShNhjWI3msHBg0P9X/SM7WHxT2vFombJTj2ywqFLwTb+FBd4WpF/Qxcaf
 CSVidFVvFUDJlc0BA22nGcQyFKuUTuWng1Hhmg84eB2srYQg7auWTZ4uMesMUoQ4X
X-Received: by 2002:a17:902:ccca:b0:150:406:6236 with SMTP id
 z10-20020a170902ccca00b0015004066236mr24732461ple.67.1646123979276; 
 Tue, 01 Mar 2022 00:39:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvOklBL3FPFWExxD+jwXY5ryVCuHSg7F28gu7zBhUiKmi7DQSJf/OAXkr209UnfZD4mb4rRQ==
X-Received: by 2002:a17:902:ccca:b0:150:406:6236 with SMTP id
 z10-20020a170902ccca00b0015004066236mr24732444ple.67.1646123978874; 
 Tue, 01 Mar 2022 00:39:38 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.39.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:39:38 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/25] migration: Finer grained tracepoints for
 POSTCOPY_LISTEN
Date: Tue,  1 Mar 2022 16:39:02 +0800
Message-Id: <20220301083925.33483-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The enablement of postcopy listening has a few steps, add a few tracepoints to
be there ready for some basic measurements for them.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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


