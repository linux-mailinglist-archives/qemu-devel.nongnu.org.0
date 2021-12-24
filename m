Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F42847EC9F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 08:17:59 +0100 (CET)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0epy-0002h3-29
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 02:17:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePW-0001HR-Mj
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n0ePU-0005rn-Kn
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 01:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640328636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hO2VHwlCtcwC9haiRz47Ykb5e10MbUd3MeIMMTeaYZE=;
 b=cZgGNqeelV6jP7BvvrZ/uPLGrK9S6CWLv6XwP6IHtUwKZo0B19o5mKUiJF8lfgxwm74LCb
 vzSnyiuwcFF5BEvv9bQWq6bnRuhSfnUEXjTIMeaKTGXGjlHt/GZzvdoHPWqFpVO1TZB3JZ
 XBn/95UznBWT2BKhWX0TtK7MiyjC8xI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-ZH_6N2crN9Wc3ELJYNMgdg-1; Fri, 24 Dec 2021 01:50:35 -0500
X-MC-Unique: ZH_6N2crN9Wc3ELJYNMgdg-1
Received: by mail-wr1-f71.google.com with SMTP id
 g6-20020adfbc86000000b001a2d62be244so198138wrh.23
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 22:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hO2VHwlCtcwC9haiRz47Ykb5e10MbUd3MeIMMTeaYZE=;
 b=TMNMcCYU9VM+cKufLSyZ1+ejh6y1R/nexVfcwyzKpQCqztggZiu9Y5xmjhtFKV5fCo
 zzxH+KEtFRDFC1nJHTwViJrhqc+b1jOwDusa5aGm3e+8KzDS3fkySiTcccd0CtCW/+Ky
 eWx+RxditZC+6wPvl8fV/xhNnD42J9aJ+bcXbFAHruQdgduf8zZ0dMf51Dh7AS2gOugi
 Mxatxpei2FOou2T+8/wX7lC2VEfTRZmf3jlAKrgmXlY+YKQn9Eh8M3bhV9QF0Va0Efz4
 UwBN4r66J5/eq81JqEj58S25+TgXaQ8daDi91imcIARzER8vDGmvPKf/9j4BeKXF1n07
 686g==
X-Gm-Message-State: AOAM532hpQrZGOwujKBfR3gBnumTt/EWFjUwJ4AJT2ybsi+szUlCRBFp
 QW1P0Dez9iFQNL1LPLAO5jBOkpdb/zR51fwAyh7q13LV6j6DLL2+DNgXXvY+sox5BLh59POZm/U
 EY1XS7l3wbLgSWIRR3WcXfZiQX7uO5/zz6PY9NSUJq0laxa+1YxjcclUxbsXe+JDN
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr3686801wrq.273.1640328632687; 
 Thu, 23 Dec 2021 22:50:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRRE7FEFbYJNiczObfajq/dsyoLBSeiXltAAyvN9QAzCW3sEMoIk/xxjE7KiU8xwd0NJquyQ==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr3686791wrq.273.1640328632480; 
 Thu, 23 Dec 2021 22:50:32 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.8])
 by smtp.gmail.com with ESMTPSA id h14sm2174425wmq.16.2021.12.23.22.50.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Dec 2021 22:50:32 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/8] migration: Finer grained tracepoints for
 POSTCOPY_LISTEN
Date: Fri, 24 Dec 2021 14:49:59 +0800
Message-Id: <20211224065000.97572-8-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211224065000.97572-1-peterx@redhat.com>
References: <20211224065000.97572-1-peterx@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
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
index 7f7af6f750..592d550a2f 100644
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
 
+    trace_loadvm_postcopy_handle_listen("after discard");
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
 
+    trace_loadvm_postcopy_handle_listen("return");
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


