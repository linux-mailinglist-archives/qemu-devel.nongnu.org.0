Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF134C871A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:50:56 +0100 (CET)
Received: from localhost ([::1]:47948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyDf-0003zn-SB
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:50:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy2t-0003RG-93
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy2r-0007s7-7b
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646123984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWAN/28atpuNSo2Qw825H0Y0k4mf5B5fhGEWjBM5WYE=;
 b=h3yL+bcQUF9h9qvvSiZvr9zNWYJ+GiS2KhO0XyIErCCdsqGr55hLnVKbXGKwQzsOsALYH3
 XWoc1D2ecIfwvJVIG3NWYlUYWeO1Dphp2sKdlNeHdlDI1dGbpxrqxxQKRePdhj+pUOyRYk
 b8gJ6D1Kflcux3mUyJ/rIM7x+yLUR6s=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-7ozWoVi0N9KLb_oet4chWg-1; Tue, 01 Mar 2022 03:39:43 -0500
X-MC-Unique: 7ozWoVi0N9KLb_oet4chWg-1
Received: by mail-pf1-f198.google.com with SMTP id
 x27-20020aa79a5b000000b004f3f7c2981eso4677990pfj.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:39:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWAN/28atpuNSo2Qw825H0Y0k4mf5B5fhGEWjBM5WYE=;
 b=p0TuRfcInITfhXsavoVtabBE62pJqxmj3ew3zrF62u/1QkYFHDRlZizBXmcSJrit5l
 mrJLOs32RqSfk/d4yCsfm1XjSfq5gJKt6dkRnEbCDMc5wbDu9Bq7dxzRbJiI03Z8sPVL
 gWCnDjZcyhxHhllYZOcZ2RYDKAGfs5wzjbsOZcvbt5ABkIpRgYWJLw5Pmgnro16xSi7J
 Ua+vZyR3EwX1GlhwW2jHfbfxw1zpQ4Zm0/y1pgOnc3qjfMqAmFB8wSMoovvIks0Gc1jQ
 /T9zul0X+aiA81tWwqrUIq8E639MDb9xR3+p7bieFtnp0mAFFj0vehJZm8wcb3T0++yt
 aNsw==
X-Gm-Message-State: AOAM5307VoB5+ddiDnDSYSsCVvB/zy0cawGRa7av1+qgyYggw5kuBoBr
 i9t4esROzV216A2LrJVDBhip047YDe9u9ND256KsVVhy+/pHjRubpRGUy3eYOuFFBhDKbwGiNS4
 UqbF2RCNk6F900ZubwIyBwFrUUymKsy74zhLTvFFRV8PwPuacAjDF3bqZzToGevzf
X-Received: by 2002:a63:d348:0:b0:342:3bc2:9b29 with SMTP id
 u8-20020a63d348000000b003423bc29b29mr20393179pgi.584.1646123982423; 
 Tue, 01 Mar 2022 00:39:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfJy4x3ZRzVa55RwrNDta9vJX/y9u21R8cKsqr4r8H1DAsw0v/rCh4KXl1eWIRdlRpGLUK0Q==
X-Received: by 2002:a63:d348:0:b0:342:3bc2:9b29 with SMTP id
 u8-20020a63d348000000b003423bc29b29mr20393153pgi.584.1646123981865; 
 Tue, 01 Mar 2022 00:39:41 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.39.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:39:41 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/25] migration: Tracepoint change in postcopy-run bottom
 half
Date: Tue,  1 Mar 2022 16:39:03 +0800
Message-Id: <20220301083925.33483-4-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Remove the old two tracepoints and they're even near each other:

    trace_loadvm_postcopy_handle_run_cpu_sync()
    trace_loadvm_postcopy_handle_run_vmstart()

Add trace_loadvm_postcopy_handle_run_bh() with a finer granule trace.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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


