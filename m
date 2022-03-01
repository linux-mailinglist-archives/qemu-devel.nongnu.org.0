Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FEA4C872F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:56:24 +0100 (CET)
Received: from localhost ([::1]:56828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyIx-0001jd-IJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:56:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy34-0003yF-Fc
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy32-0007wE-Ok
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646123996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PhXk+S58P3eb4DnKsbjdNHFaBnOZp2LgpOZHkR2wIBo=;
 b=FhBqOMPrNNHzj19hJPvezOK1vEfSVCyfmLBvgPNEObivPUup2pLyUButci4BZQ6KgbB7dI
 7cIbyNJ0VbSOBlA5DpNSfwLT8wUGXXSm7q0q9mlp752ladSACsKCsZTObz9+lJpS+g6Bx+
 mtMu+4/cHO1m7Cc9s0IXV8qQIFMhM6M=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-NeL7EI1hMNiA6l6GwRmFZw-1; Tue, 01 Mar 2022 03:39:55 -0500
X-MC-Unique: NeL7EI1hMNiA6l6GwRmFZw-1
Received: by mail-pf1-f197.google.com with SMTP id
 d132-20020a621d8a000000b004f41f34db96so1930322pfd.2
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:39:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhXk+S58P3eb4DnKsbjdNHFaBnOZp2LgpOZHkR2wIBo=;
 b=PAhXrSL6ALGY0OiQwOwR2u4WzKL8K4fusRVN2geakwa/AQT5iB3DLtoNtvcLUZ+f/p
 EqJwJlAjpgBFXK1loQY+xmQtA3MjjHfHn5VF0hyxPzD9YvxCMip29771YkGGNlz5QhwD
 ChMnnOqfpGZUvOHzgGyyPYrwW1VsxSsdllrbT9sIDIQx/awSnhhstBCduvQAWIWa4CP4
 +PzodyUlX+qQu0lSaHkNxEEok/25nV8oSPrR1+GGmoPm4JSCerizLk8RqMMGII1Gtbtr
 maLSiR5nWlQmMCX0RIL9HikLTMhn7+KyIyOGoOzdfN882asNe5nWsrMzLsPCVTmh1q2W
 n7Og==
X-Gm-Message-State: AOAM53099vdVxMp1oLgNb9eqJjFQSZAwBg2i3S95+Cc9UKPxawBk8LCi
 qzIYtclXcRMef7exqShcAoyX8TJkbax4nkj5kBM/vroQg3HjmiqU+b6CoZidptOhGZfIaWGI69w
 DD0D0k19jTWzqFdL+gMqQAcC4o2CuO8KSTzFsmKtl0/NkMkJrwqYh5WLIrPbhA6Kk
X-Received: by 2002:a05:6a02:193:b0:375:65a5:2fcd with SMTP id
 bj19-20020a056a02019300b0037565a52fcdmr20706691pgb.288.1646123994068; 
 Tue, 01 Mar 2022 00:39:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxh7+8QOo8K0IW9pJbtjcnZJHfhEmUCQcY1DEwwQPvMX7J5tHVt0vFLGqCaBOHsfgTM0eGxg==
X-Received: by 2002:a05:6a02:193:b0:375:65a5:2fcd with SMTP id
 bj19-20020a056a02019300b0037565a52fcdmr20706663pgb.288.1646123993652; 
 Tue, 01 Mar 2022 00:39:53 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.39.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:39:53 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/25] migration: Move static var in
 ram_block_from_stream() into global
Date: Tue,  1 Mar 2022 16:39:07 +0800
Message-Id: <20220301083925.33483-8-peterx@redhat.com>
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

Static variable is very unfriendly to threading of ram_block_from_stream().
Move it into MigrationIncomingState.

Make the incoming state pointer to be passed over to ram_block_from_stream() on
both caller sites.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.h |  3 ++-
 migration/ram.c       | 13 +++++++++----
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/migration/migration.h b/migration/migration.h
index 8445e1d14a..d8b9850eae 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -66,7 +66,8 @@ typedef struct {
 /* State for the incoming migration */
 struct MigrationIncomingState {
     QEMUFile *from_src_file;
-
+    /* Previously received RAM's RAMBlock pointer */
+    RAMBlock *last_recv_block;
     /* A hook to allow cleanup at the end of incoming migration */
     void *transport_data;
     void (*transport_cleanup)(void *data);
diff --git a/migration/ram.c b/migration/ram.c
index 3a216c2340..9516dd655a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3185,12 +3185,14 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
  *
  * Returns a pointer from within the RCU-protected ram_list.
  *
+ * @mis: the migration incoming state pointer
  * @f: QEMUFile where to read the data from
  * @flags: Page flags (mostly to see if it's a continuation of previous block)
  */
-static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
+static inline RAMBlock *ram_block_from_stream(MigrationIncomingState *mis,
+                                              QEMUFile *f, int flags)
 {
-    static RAMBlock *block;
+    RAMBlock *block = mis->last_recv_block;
     char id[256];
     uint8_t len;
 
@@ -3217,6 +3219,8 @@ static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
         return NULL;
     }
 
+    mis->last_recv_block = block;
+
     return block;
 }
 
@@ -3669,7 +3673,7 @@ static int ram_load_postcopy(QEMUFile *f)
         trace_ram_load_postcopy_loop((uint64_t)addr, flags);
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE)) {
-            block = ram_block_from_stream(f, flags);
+            block = ram_block_from_stream(mis, f, flags);
             if (!block) {
                 ret = -EINVAL;
                 break;
@@ -3881,6 +3885,7 @@ void colo_flush_ram_cache(void)
  */
 static int ram_load_precopy(QEMUFile *f)
 {
+    MigrationIncomingState *mis = migration_incoming_get_current();
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
     /* ADVISE is earlier, it shows the source has the postcopy capability on */
     bool postcopy_advised = postcopy_is_advised();
@@ -3919,7 +3924,7 @@ static int ram_load_precopy(QEMUFile *f)
 
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
-            RAMBlock *block = ram_block_from_stream(f, flags);
+            RAMBlock *block = ram_block_from_stream(mis, f, flags);
 
             host = host_from_ram_block_offset(block, addr);
             /*
-- 
2.32.0


