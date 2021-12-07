Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF53D46BA74
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 12:54:29 +0100 (CET)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muZ3F-00052d-02
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 06:54:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYze-0005U2-Fe
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1muYzc-0004nN-57
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638877843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMsW81eHVdDwi81RlGTDlPytpvgOEcWCkpJFVmQ/AtA=;
 b=NfS8n06hk6AJMMuxXwy95McjLdThdM8n9G9/irZ6qg+4YerapBLaOCTMZ1XHlka6bvyqo4
 xtixK4hncHOvf35dn1JAcQs1vduaxIEYlq7Acxc5NEuyiC+SBuBB8CcpY9Szq4C33rKgVm
 FxwdxTLpSKOaCz9JXYxus+c8O87pEKk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-jnJcOcdbNsu0cWdKJg6tLQ-1; Tue, 07 Dec 2021 06:50:42 -0500
X-MC-Unique: jnJcOcdbNsu0cWdKJg6tLQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso1245753wms.5
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 03:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jMsW81eHVdDwi81RlGTDlPytpvgOEcWCkpJFVmQ/AtA=;
 b=6LaGzS21vq6iYz1yPDK9/28pZ1bihMyK5/67Y8FxeTnqtiKKH9n+Q5dJv81HKOa3QQ
 p56OVvFqc/fpv5nJD5iOlxbojptRowDtpBTFqBVpfe9xj3B+9V67GKnDquU/Me2DP1Gm
 +DpQDbyhXxiChXx1qclhu5pFrWAQ4brrXmj49d3r6dhiq6b1EAah7aUJavh/ykpPlJ39
 PzMLzGcPEMO7/zGEFsZN8tDP+AUwHYKzWoK5FJneHGe+E1UGYHA6L+NtHND9vGMVf1/M
 r6LPJ3fRmsGNTJfI+7Mafz61FKbYl8knC6soPMj9iWEx6UgDvDYMg8jJpWR2bHQlvESx
 5IBw==
X-Gm-Message-State: AOAM5304nlNxDjsGKDw+yk401tAiucNV3ZaQo7HssI9oXHn0rAGx52MZ
 bQcrLGcHjIMzEi7yVFtYFCgog2l7OOeY5PtQO87TaDi3ZB8OpT0DymwpcVqwoxiQbzIDn4OkdTa
 lnseipZPZu0x0qYV9kUb3Fmu0N9/U3DRJtkCQn1weleaQI8U1oea1t4a5enJR6kxT
X-Received: by 2002:a5d:424c:: with SMTP id s12mr50107038wrr.370.1638877840925; 
 Tue, 07 Dec 2021 03:50:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYULnR0sVvSTYBCIH1u/yiSMXNORcwuXFonw2VQmE61uZ9TSdRC1jTzDgLZXE1e3LvjfmgrQ==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr50107010wrr.370.1638877840664; 
 Tue, 07 Dec 2021 03:50:40 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.177])
 by smtp.gmail.com with ESMTPSA id g18sm3023551wmq.4.2021.12.07.03.50.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 03:50:40 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] migration: Drop return code for disgard ram process
Date: Tue,  7 Dec 2021 19:50:14 +0800
Message-Id: <20211207115016.73195-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211207115016.73195-1-peterx@redhat.com>
References: <20211207115016.73195-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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

It will just never fail.  Drop those return values where they're constantly
zeros.

A tiny touch-up on the tracepoint so trace_ram_postcopy_send_discard_bitmap()
is called after the logic itself (which sounds more reasonable).

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c |  5 +----
 migration/ram.c       | 20 +++++---------------
 migration/ram.h       |  2 +-
 3 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index abaf6f9e3d..c2e5539721 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2983,10 +2983,7 @@ static int postcopy_start(MigrationState *ms)
      * that are dirty
      */
     if (migrate_postcopy_ram()) {
-        if (ram_postcopy_send_discard_bitmap(ms)) {
-            error_report("postcopy send discard bitmap failed");
-            goto fail;
-        }
+        ram_postcopy_send_discard_bitmap(ms);
     }
 
     /*
diff --git a/migration/ram.c b/migration/ram.c
index ecc744d54d..28f1ace0f7 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2478,8 +2478,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
 /**
  * postcopy_each_ram_send_discard: discard all RAMBlocks
  *
- * Returns 0 for success or negative for error
- *
  * Utility for the outgoing postcopy code.
  *   Calls postcopy_send_discard_bm_ram for each RAMBlock
  *   passing it bitmap indexes and name.
@@ -2488,10 +2486,9 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block);
  *
  * @ms: current migration state
  */
-static int postcopy_each_ram_send_discard(MigrationState *ms)
+static void postcopy_each_ram_send_discard(MigrationState *ms)
 {
     struct RAMBlock *block;
-    int ret;
 
     RAMBLOCK_FOREACH_NOT_IGNORED(block) {
         postcopy_discard_send_init(ms, block->idstr);
@@ -2509,14 +2506,9 @@ static int postcopy_each_ram_send_discard(MigrationState *ms)
          * just needs indexes at this point, avoids it having
          * target page specific code.
          */
-        ret = postcopy_send_discard_bm_ram(ms, block);
+        postcopy_send_discard_bm_ram(ms, block);
         postcopy_discard_send_finish(ms);
-        if (ret) {
-            return ret;
-        }
     }
-
-    return 0;
 }
 
 /**
@@ -2589,8 +2581,6 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
 /**
  * ram_postcopy_send_discard_bitmap: transmit the discard bitmap
  *
- * Returns zero on success
- *
  * Transmit the set of pages to be discarded after precopy to the target
  * these are pages that:
  *     a) Have been previously transmitted but are now dirty again
@@ -2601,7 +2591,7 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, RAMBlock *block)
  *
  * @ms: current migration state
  */
-int ram_postcopy_send_discard_bitmap(MigrationState *ms)
+void ram_postcopy_send_discard_bitmap(MigrationState *ms)
 {
     RAMState *rs = ram_state;
 
@@ -2615,9 +2605,9 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
     rs->last_sent_block = NULL;
     rs->last_page = 0;
 
-    trace_ram_postcopy_send_discard_bitmap();
+    postcopy_each_ram_send_discard(ms);
 
-    return postcopy_each_ram_send_discard(ms);
+    trace_ram_postcopy_send_discard_bitmap();
 }
 
 /**
diff --git a/migration/ram.h b/migration/ram.h
index f543e25765..2c6dc3675d 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -57,7 +57,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
 void acct_update_position(QEMUFile *f, size_t size, bool zero);
 void ram_postcopy_migrated_memory_release(MigrationState *ms);
 /* For outgoing discard bitmap */
-int ram_postcopy_send_discard_bitmap(MigrationState *ms);
+void ram_postcopy_send_discard_bitmap(MigrationState *ms);
 /* For incoming postcopy discard */
 int ram_discard_range(const char *block_name, uint64_t start, size_t length);
 int ram_postcopy_incoming_init(MigrationIncomingState *mis);
-- 
2.32.0


