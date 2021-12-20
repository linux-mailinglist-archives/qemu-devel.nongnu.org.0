Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE847B123
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:33:45 +0100 (CET)
Received: from localhost ([::1]:59978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLbc-0005QO-3f
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:33:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKSK-0002NQ-E2
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:20:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzKSC-000766-2r
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecah2F3ip++NB/Ieyt+yzJHuIzEQ9K69zd4gUhkv1A4=;
 b=WutGfJX82imiYdCghYl2kLRZH02cra+ghUR+fcxSM0n7v7ZSALJaCq4yfOd6gd3yF9T8k6
 GMwT0jL7P4wo1u9+PRNXr6z+mmPBkbbaAHvHE9s2MzPjwU+H+7BfSCJG4yVccEM1ViJzbz
 id7Q8vBVVRwMq3fz6510zuYF/4bMe2Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-U7QJhaRqOhW6UwNm1GcgDA-1; Mon, 20 Dec 2021 03:54:12 -0500
X-MC-Unique: U7QJhaRqOhW6UwNm1GcgDA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l20-20020a05600c1d1400b003458e02cea0so1593243wms.7
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 00:54:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ecah2F3ip++NB/Ieyt+yzJHuIzEQ9K69zd4gUhkv1A4=;
 b=HpHvB2QpBBlhOhXmS1COVhYdvRo/ZepaIYkTy6kk0QF/4RoPMN91MachCSaDV/eAAm
 x3sKnhRTOFNy0U5XaKtSXjVGRgJ6LvpQKNJJu1opo3n3GVwZZSscWqOQAfabnzFItxry
 h/QquBe+Wxm3BEtgThoyI1u2FVvDactHfqMmwuVVCNQ6dCdy+S/cZtJZAoA3zv3AUZcp
 9/8oCxEI+NRJVRlX4TJ3hx6G2swo9Tz0M8f77qEDA94K4VIEc7DFBPdiBkCnUqUkW065
 zlciZWLFYNS7dB3hJWC6Q4zZTw3q+n6wlY7LxHRUEdAtUyfipAgNN3YhVEhUNTPBpno3
 fsWg==
X-Gm-Message-State: AOAM531xAtP4Ib3WpL+gDefANsc+eYSFZi4byTcXi4kU4enGJDRULL1U
 8bVrnDrLlCWAmU6iGo4PEdDbpHD/esItny0Dmg5/iyIdBcUs5SL1iiqTl5wmBxCJdX++YLsWVHw
 Tgz6rrQoZyBqLtts484WI40FuNZ9Vz/s1DPeNfK4qmx7TDOC53WW9PjhsbWbYNL6j
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr19896340wmj.6.1639990450931;
 Mon, 20 Dec 2021 00:54:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyA0tbCTQkTMniaWYaW+fpNosyR5mg9qIwK+BApN1y5w0HzSG2LU9d2wlx+iaPQINDH5ZPZNw==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr19896326wmj.6.1639990450713;
 Mon, 20 Dec 2021 00:54:10 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.164])
 by smtp.gmail.com with ESMTPSA id h2sm14439713wrz.23.2021.12.20.00.54.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Dec 2021 00:54:10 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] migration: Drop dead code of ram_debug_dump_bitmap()
Date: Mon, 20 Dec 2021 16:53:48 +0800
Message-Id: <20211220085355.2284-2-peterx@redhat.com>
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

I planned to add "#ifdef DEBUG_POSTCOPY" around the function too because
otherwise it'll be compiled into qemu binary even if it'll never be used.  Then
I found that maybe it's easier to just drop it for good..

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 39 ---------------------------------------
 migration/ram.h |  2 --
 2 files changed, 41 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 57efa67f20..7d9c8a508b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2408,40 +2408,6 @@ static void ram_state_reset(RAMState *rs)
 
 #define MAX_WAIT 50 /* ms, half buffered_file limit */
 
-/*
- * 'expected' is the value you expect the bitmap mostly to be full
- * of; it won't bother printing lines that are all this value.
- * If 'todump' is null the migration bitmap is dumped.
- */
-void ram_debug_dump_bitmap(unsigned long *todump, bool expected,
-                           unsigned long pages)
-{
-    int64_t cur;
-    int64_t linelen = 128;
-    char linebuf[129];
-
-    for (cur = 0; cur < pages; cur += linelen) {
-        int64_t curb;
-        bool found = false;
-        /*
-         * Last line; catch the case where the line length
-         * is longer than remaining ram
-         */
-        if (cur + linelen > pages) {
-            linelen = pages - cur;
-        }
-        for (curb = 0; curb < linelen; curb++) {
-            bool thisbit = test_bit(cur + curb, todump);
-            linebuf[curb] = thisbit ? '1' : '.';
-            found = found || (thisbit != expected);
-        }
-        if (found) {
-            linebuf[curb] = '\0';
-            fprintf(stderr,  "0x%08" PRIx64 " : %s\n", cur, linebuf);
-        }
-    }
-}
-
 /* **** functions for postcopy ***** */
 
 void ram_postcopy_migrated_memory_release(MigrationState *ms)
@@ -2669,11 +2635,6 @@ int ram_postcopy_send_discard_bitmap(MigrationState *ms)
         if (ret) {
             return ret;
         }
-
-#ifdef DEBUG_POSTCOPY
-        ram_debug_dump_bitmap(block->bmap, true,
-                              block->used_length >> TARGET_PAGE_BITS);
-#endif
     }
     trace_ram_postcopy_send_discard_bitmap();
 
diff --git a/migration/ram.h b/migration/ram.h
index c515396a9a..f543e25765 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -55,8 +55,6 @@ void mig_throttle_counter_reset(void);
 uint64_t ram_pagesize_summary(void);
 int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
 void acct_update_position(QEMUFile *f, size_t size, bool zero);
-void ram_debug_dump_bitmap(unsigned long *todump, bool expected,
-                           unsigned long pages);
 void ram_postcopy_migrated_memory_release(MigrationState *ms);
 /* For outgoing discard bitmap */
 int ram_postcopy_send_discard_bitmap(MigrationState *ms);
-- 
2.32.0


