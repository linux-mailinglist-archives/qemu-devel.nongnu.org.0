Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3242F4B811C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:12:45 +0100 (CET)
Received: from localhost ([::1]:47686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEUW-0003Bo-8B
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDpD-0005HY-IK
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDpB-0006KI-53
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644993000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CNujgrUfFlsJU63rZmhvcxyCYrwdVvZMAYkK+aH2yQc=;
 b=ExxhKqYSinyxMvNsaTFSLgoF6sQBS2OlkcdTmnvxoXe3j9tFfS2YZ8AppLV2IvwP/TBoHC
 LpFINzFDe8f7n1ugR3oD+VzTHNvJWxx3q93tILrYaJ+o/Fdn4oC4Rx/nYcQsbbQ8nwdrC0
 nvRYfXTAMZg9IECuPYTEZqlL70le88o=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-6smBmgpQP3yStzTjvx8BdQ-1; Wed, 16 Feb 2022 01:29:59 -0500
X-MC-Unique: 6smBmgpQP3yStzTjvx8BdQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 md16-20020a17090b23d000b001b8bd5e35e2so886000pjb.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CNujgrUfFlsJU63rZmhvcxyCYrwdVvZMAYkK+aH2yQc=;
 b=VRT9G4w+O5Fq7lKKDYJimU4LzbEZdkh0cR07dJCr5BZ5JHeBnXxizWe8ceMOn4gyj0
 K8xsiLwmwlMi6yxw1kNMSmWTZ2wEXL3r2JL+El1Uo4dqDkgbSZaoYf6aJjHJfQgPDAQi
 hq9Isa49eft7EdUe+bMRLiGeXXDFDSIRXBIPYBhj0NDVP7hFFmPSTOUIH6HcieV6lbeW
 FMRCOqQLzuWCldN7cP2UmRYzq/LcYSlXPvxb/BgrdzH0QvA77AYJ5KV2i8JoCg4t8Vv6
 afSD/5JrDj2WqPbXgNcy48PRKEsWcgJubXlcfdVtwXXZ3mpoJ1KZpF7cDw4EqKshFlUo
 hDWA==
X-Gm-Message-State: AOAM5335Zrp5cNENUxBBjS7SUqJu1JZGUK+B99npijJBuVhBMrsjPD/e
 SjWjANZzqcyqJOWacEGQ5pSr2X6Ocm3Rnu3/37eBL74hkgMsCCXj+lvNGaZvajepEcK/qF2zhuJ
 lfe5vni3GoXxJ1PIFeD0SeExR1fDDS55IDsHuiVERa/nZDIfmfoJ0Pj0HXfyN3Bb0
X-Received: by 2002:a17:90a:8592:b0:1b9:7e8c:25dc with SMTP id
 m18-20020a17090a859200b001b97e8c25dcmr106872pjn.224.1644992998061; 
 Tue, 15 Feb 2022 22:29:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwr1NCgXRM6r3wuWeI8KDs3T+5Hcz3Da+A4VzfmH2EaJOTY6lKomH87f+DBxnMKutQWdh/r3A==
X-Received: by 2002:a17:90a:8592:b0:1b9:7e8c:25dc with SMTP id
 m18-20020a17090a859200b001b97e8c25dcmr106843pjn.224.1644992997594; 
 Tue, 15 Feb 2022 22:29:57 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.29.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:29:57 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/20] migration: Move channel setup out of
 postcopy_try_recover()
Date: Wed, 16 Feb 2022 14:28:02 +0800
Message-Id: <20220216062809.57179-14-peterx@redhat.com>
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


