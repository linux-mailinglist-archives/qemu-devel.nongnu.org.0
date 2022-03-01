Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BCB4C8749
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:03:19 +0100 (CET)
Received: from localhost ([::1]:37122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyPe-0007g7-4l
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:03:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3L-0004F6-RG
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3J-0008Ca-GV
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ioPo/zq9TaQigYCLhmNX8dwsBWn+7+sCdTwob7NMCP8=;
 b=W68wJ0Qpuo/8gROwekATurEcwYRe4WOkwyCEtLk0RF9s+eBp8WQmTWn16xJMIoOTPrJsrt
 zkoBahw039jpwt5Yz4RaoItzB0vj0hHPe75uWvWu4554/+cTa4xcUa6qT4tQV4qRNzkomY
 331KxjgUrdPletpTvZ26k96bkIliHwo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-O-MkCPZqP82XlNnBU6e33w-1; Tue, 01 Mar 2022 03:40:12 -0500
X-MC-Unique: O-MkCPZqP82XlNnBU6e33w-1
Received: by mail-pj1-f72.google.com with SMTP id
 j22-20020a17090aeb1600b001bc32977e07so1055439pjz.7
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ioPo/zq9TaQigYCLhmNX8dwsBWn+7+sCdTwob7NMCP8=;
 b=h8lJs4GZxZGyUds6xPXK8SjRmguFxj338ADcqNxtLABmHGI7AneJFqlQ39R2nZqCUn
 aG7JJBzLEoLI55bycqTKiw6NDOpT2kIronC0apHyJUnc3ws1Ax47zQ9gEyznv4s5/LO4
 SKPr6En9ComdpzwqfUnT4BzFv5tmh2S1K8PvgtKdtWaYO6EyKhgShw+JwZoXtu1MuLtP
 znnXSf06Hw4BTelSSneKIBgs7QdEuXfUBVOdd3j9j9YS+XOx/uJrlcc6b1fglExi7rwa
 KYyQ/85SMlaxKmUccqBPVaWHsAqoAt8Gz7vjoY1xC3jebgKgLWQFavJSAovDCDpPn8mr
 qnXA==
X-Gm-Message-State: AOAM532q9Po+kovQ0a3JdXawA3TKaxUQZxe2WK83J8LhhMQYzZeYjJRe
 wGdVZ/l+Nrpzzu5cyyIkTjOG8NcL0I1KOW74a+ztHz2Eni/GJqbj+tqR2kASAW9O3v9FqJnc6rW
 SZ/c0GdSeHu3VDHY20oeyQManCOEaCHBaqs9bLMLiGA3Q3elYoXwoAWRvlhiML6Hz
X-Received: by 2002:a63:1f42:0:b0:378:7fb4:6491 with SMTP id
 q2-20020a631f42000000b003787fb46491mr10427700pgm.478.1646124010791; 
 Tue, 01 Mar 2022 00:40:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweRKUqjGDhbe/G2rxVkYPgXhmbGz7fWkMIEfMZa9DCDEBHwlWrbYgiHg7clUi4JBr0BDxzgQ==
X-Received: by 2002:a63:1f42:0:b0:378:7fb4:6491 with SMTP id
 q2-20020a631f42000000b003787fb46491mr10427678pgm.478.1646124010425; 
 Tue, 01 Mar 2022 00:40:10 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:10 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/25] migration: Move channel setup out of
 postcopy_try_recover()
Date: Tue,  1 Mar 2022 16:39:13 +0800
Message-Id: <20220301083925.33483-14-peterx@redhat.com>
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

We used to use postcopy_try_recover() to replace migration_incoming_setup() to
setup incoming channels.  That's fine for the old world, but in the new world
there can be more than one channels that need setup.  Better move the channel
setup out of it so that postcopy_try_recover() only handles the last phase of
switching to the recovery phase.

To do that in migration_fd_process_incoming(), move the postcopy_try_recover()
call to be after migration_incoming_setup(), which will setup the channels.
While in migration_ioc_process_incoming(), postpone the recover() routine right
before we'll jump into migration_incoming_process().

A side benefit is we don't need to pass in QEMUFile* to postcopy_try_recover()
anymore.  Remove it.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 67520d3105..b2e6446457 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -665,19 +665,20 @@ void migration_incoming_process(void)
 }
 
 /* Returns true if recovered from a paused migration, otherwise false */
-static bool postcopy_try_recover(QEMUFile *f)
+static bool postcopy_try_recover(void)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
 
     if (mis->state == MIGRATION_STATUS_POSTCOPY_PAUSED) {
         /* Resumed from a paused postcopy migration */
 
-        mis->from_src_file = f;
+        /* This should be set already in migration_incoming_setup() */
+        assert(mis->from_src_file);
         /* Postcopy has standalone thread to do vm load */
-        qemu_file_set_blocking(f, true);
+        qemu_file_set_blocking(mis->from_src_file, true);
 
         /* Re-configure the return path */
-        mis->to_src_file = qemu_file_get_return_path(f);
+        mis->to_src_file = qemu_file_get_return_path(mis->from_src_file);
 
         migrate_set_state(&mis->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
                           MIGRATION_STATUS_POSTCOPY_RECOVER);
@@ -698,11 +699,10 @@ static bool postcopy_try_recover(QEMUFile *f)
 
 void migration_fd_process_incoming(QEMUFile *f, Error **errp)
 {
-    if (postcopy_try_recover(f)) {
+    if (!migration_incoming_setup(f, errp)) {
         return;
     }
-
-    if (!migration_incoming_setup(f, errp)) {
+    if (postcopy_try_recover()) {
         return;
     }
     migration_incoming_process();
@@ -718,11 +718,6 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
         /* The first connection (multifd may have multiple) */
         QEMUFile *f = qemu_fopen_channel_input(ioc);
 
-        /* If it's a recovery, we're done */
-        if (postcopy_try_recover(f)) {
-            return;
-        }
-
         if (!migration_incoming_setup(f, errp)) {
             return;
         }
@@ -743,6 +738,10 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
     }
 
     if (start_migration) {
+        /* If it's a recovery, we're done */
+        if (postcopy_try_recover()) {
+            return;
+        }
         migration_incoming_process();
     }
 }
-- 
2.32.0


