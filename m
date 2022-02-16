Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4592F4B80DC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:58:12 +0100 (CET)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEGR-0008Ua-BL
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:58:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoX-0004Cr-4d
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDoV-0006G5-F7
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644992958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Uuc2E+EfBukjB/OnF38Q+6+6JPtsSsK8uR7HjiUeUk=;
 b=D+qb+21PI1uwBqf5gF1pVfVI9nbYndp4UU/3XrAq/WHQIv4u/cqd6ov62gLt9elynrSAFN
 O8zzhuHVxZ63yhb4X2xQrZl4BhMDDszWI9BQFw/TG0UsZ9rs4OrIlJl+UqLsKFIL2141gJ
 jOwz0fYSyHK8DLjQ5zFB88YnjcZd2eE=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-NAHlIRsEPQCax3Ye7WhBCg-1; Wed, 16 Feb 2022 01:29:16 -0500
X-MC-Unique: NAHlIRsEPQCax3Ye7WhBCg-1
Received: by mail-pl1-f197.google.com with SMTP id
 a9-20020a170902710900b0014c8132e8b8so692190pll.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Uuc2E+EfBukjB/OnF38Q+6+6JPtsSsK8uR7HjiUeUk=;
 b=3On6q8F1dEYrRofrbJOaXSoLK2uJkPVngYdvsV3W2M6YWoIUbU6IoPepjYgHWy4Zv1
 rwp4PNt2b20GIchgBhQ2F5WyAQDoxBX4tCbGLr6uY3ldRGQjbzxFDlUxUwvQCtAjP684
 +bH24w38+wXhpcEbrF4iAGbV0H3GgOqjPBCfru9FJKhRWF6OkIbwgEZDxXLeUolLXa1A
 wl2cNMOu8/Cfrej5i8W2evw+es1dBQvtWDKmMnWzLqvDHNZGV+/Nd8/P0CyPheZ104sH
 LgLWhwyIRRUOoDfrf0gZnsahre0KcYY2t7rfRieCx2NqxywNv/iQJwCe5zwjr+gMYJG+
 r1kA==
X-Gm-Message-State: AOAM532gEjY2foKj+X0aPQbj+tRjDmLGBReAMt2WbdMOI4GUUICsNVm2
 OWBqnBe8LORvrF/KhjL613/6h1p8P5b4LsCKaaXJw0mpds36/jO2RrFyry3asl+/F8LoIIlWNMo
 rLc/pz6+MdbRBp3Mr2qfPc8JVudk+1ehx+hAd/nyaXOdTULbbCX1YqBzvAQZaZKK0
X-Received: by 2002:a17:902:dace:b0:14e:e471:a9c3 with SMTP id
 q14-20020a170902dace00b0014ee471a9c3mr1421561plx.49.1644992955567; 
 Tue, 15 Feb 2022 22:29:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/OlJT5yRwQfYcUWN1GIn5VZDYnBGrVxOgEY+rNL9zJk151AOZ/4UruV/vGbOGY543JMAOxQ==
X-Received: by 2002:a17:902:dace:b0:14e:e471:a9c3 with SMTP id
 q14-20020a170902dace00b0014ee471a9c3mr1421538plx.49.1644992955193; 
 Tue, 15 Feb 2022 22:29:15 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.29.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:29:14 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/20] migration: Move static var in ram_block_from_stream()
 into global
Date: Wed, 16 Feb 2022 14:27:56 +0800
Message-Id: <20220216062809.57179-8-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
index 87bcb704d4..25a3ab5150 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3184,12 +3184,14 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
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
 
@@ -3216,6 +3218,8 @@ static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
         return NULL;
     }
 
+    mis->last_recv_block = block;
+
     return block;
 }
 
@@ -3668,7 +3672,7 @@ static int ram_load_postcopy(QEMUFile *f)
         trace_ram_load_postcopy_loop((uint64_t)addr, flags);
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE)) {
-            block = ram_block_from_stream(f, flags);
+            block = ram_block_from_stream(mis, f, flags);
             if (!block) {
                 ret = -EINVAL;
                 break;
@@ -3880,6 +3884,7 @@ void colo_flush_ram_cache(void)
  */
 static int ram_load_precopy(QEMUFile *f)
 {
+    MigrationIncomingState *mis = migration_incoming_get_current();
     int flags = 0, ret = 0, invalid_flags = 0, len = 0, i = 0;
     /* ADVISE is earlier, it shows the source has the postcopy capability on */
     bool postcopy_advised = postcopy_is_advised();
@@ -3918,7 +3923,7 @@ static int ram_load_precopy(QEMUFile *f)
 
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE | RAM_SAVE_FLAG_XBZRLE)) {
-            RAMBlock *block = ram_block_from_stream(f, flags);
+            RAMBlock *block = ram_block_from_stream(mis, f, flags);
 
             host = host_from_ram_block_offset(block, addr);
             /*
-- 
2.32.0


