Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DF64B80C4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:36:38 +0100 (CET)
Received: from localhost ([::1]:41672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKDvZ-00046b-9n
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:36:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDo5-000414-La
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:28:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDo3-0006D1-VM
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fPP+80ZrJlA9hpl1s0Dn0wrbNF8DS14P9IUBr0cEZn8=;
 b=PNEgDCGfMZwmcJ6RCzoxdYbzBwmGod8TmG83kFHGQxJEI6ArKgFqf3er+rUoLB2d1hbkga
 jZFeudVss9P6MkQqFg2PEOLqipRBE1F1AZJlNnXFYOyAFFTY5XJTR43aLR9czcM36FbOcC
 uI/tpoBIx7B37MEgekQicdsEBiDJTlE=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-PyGS6uZlOGCLeIEcchPDJw-1; Wed, 16 Feb 2022 01:28:49 -0500
X-MC-Unique: PyGS6uZlOGCLeIEcchPDJw-1
Received: by mail-pg1-f198.google.com with SMTP id
 r8-20020a638f48000000b0036c6a881088so734593pgn.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fPP+80ZrJlA9hpl1s0Dn0wrbNF8DS14P9IUBr0cEZn8=;
 b=trvMfL2wqwS+93VNXlVX6ljQJb9BMSRgee8lIBnlFAi8rLH/aAk/2okscTFbKVw8DP
 59tlcs3bh28WwSXqKXyL53G2XJ3Ht5RwxraAhVPUBNlFfiRyhsjfWTCIx9qfT0uly9er
 rEcNkDXh0Fzs4LV2SUCe8R1IL8DHPRF3KABsw5xxXOD4pMTxf9T3UZAtbGAqkk8DNJBt
 Mj/BwlKKDzfz1dUVe6mBu1wsZbwGWEagWS6I4KRPgm5T75UJ/IP6du9u/EuXcLinw/6l
 qRFPByhd8akVHH9o3L378jGm1AXu+nWRnIawNHo9t0TdOuNWmaQcZjYP2bdha0a9OONS
 LCLw==
X-Gm-Message-State: AOAM533nhGSnt6QmS5cSWO6gRcWG4AgbAzTflIjC+jlIDPpy18xONRMa
 ezCIn61zPUs9hD5JPjsTsax5pBFYLRKSpzCxbqNh1DkUt1g3oMAhM0zWNSv9jYBTZ6/Lc7lT8jb
 JCkSHIyCPUhui2pEiyOAmZeiwUjYeHn3XPkk3yMwPsFZVkfISOfP0/mOmU2fjVH3G
X-Received: by 2002:a17:90b:4a12:b0:1b8:d015:66db with SMTP id
 kk18-20020a17090b4a1200b001b8d01566dbmr117344pjb.66.1644992928533; 
 Tue, 15 Feb 2022 22:28:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMGpOwRBoOwykO9z3xhLYmoSuKWxOn+rCzuQtqz3UF8u1vRrGkSKuPazDzndc2KTDTL2hv7w==
X-Received: by 2002:a17:90b:4a12:b0:1b8:d015:66db with SMTP id
 kk18-20020a17090b4a1200b001b8d01566dbmr117320pjb.66.1644992928145; 
 Tue, 15 Feb 2022 22:28:48 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.28.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:28:47 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/20] migration: Tracepoint change in postcopy-run bottom half
Date: Wed, 16 Feb 2022 14:27:52 +0800
Message-Id: <20220216062809.57179-4-peterx@redhat.com>
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
index 190cc5fc42..41e3238798 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2006,13 +2006,19 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
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
@@ -2022,9 +2028,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
         autostart = false;
     }
 
-    trace_loadvm_postcopy_handle_run_cpu_sync();
-
-    trace_loadvm_postcopy_handle_run_vmstart();
+    trace_loadvm_postcopy_handle_run_bh("after invalidate cache");
 
     dirty_bitmap_mig_before_vm_start();
 
@@ -2037,6 +2041,8 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
     }
 
     qemu_bh_delete(mis->bh);
+
+    trace_loadvm_postcopy_handle_run_bh("return");
 }
 
 /* After all discards we can start running and asking for pages */
diff --git a/migration/trace-events b/migration/trace-events
index 92596c00d8..1aec580e92 100644
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


