Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE7968F8D4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:29:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPr3O-0003TG-Gi; Wed, 08 Feb 2023 15:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPr3M-0003Sa-Sz
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:28:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pPr3L-0004AG-7H
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675888106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kL5OJw/kTWW9OVoIT/FKhECSOQQPWNF0MruWa3VEjgY=;
 b=I65AZgCEE0VpMWv459eipMpSjCbT6Gygbr2o0qk7STzPo1937ltBriWQqlm5rMqgv0oLGL
 swU+ofCVnfqq1S8Kp+HV3sTSO8rhyghC+dAjjIDkr6Ip0xVzYGQ+zHYfdCluvD58tWy9mv
 kz3Rh8y/x1QlXuSA2GpymySQ+4mMXM0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-421-ePcC67iVNPKG0QfzNkabYQ-1; Wed, 08 Feb 2023 15:28:21 -0500
X-MC-Unique: ePcC67iVNPKG0QfzNkabYQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 s4-20020ac85284000000b003b849aa2cd6so11372287qtn.15
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 12:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kL5OJw/kTWW9OVoIT/FKhECSOQQPWNF0MruWa3VEjgY=;
 b=uz0XURSKQxYGQSAi+/Ez7Zh707xJ5qwjnAdQKfH87qHTrmT0+PF29YrKHGOy7Wpbmr
 xxTJBmYAWnIDmnIWYtB9IyItneB++DYssSAQJpAvLWiTNcstS7oNPVvg6nWgyppCD1s+
 11pDuKeLiTRIwj3mN+Yr5JHCkCXV6aO6IIbEP3pEn7C9FrhXen+XYcFy661vkUx+ZBr8
 XHtZJ4cqp5dNyFLXoyBP+T395uuUDWp4VXljUCqi7XUpTYKvSBEL66t5qiHQQe4+o3+B
 CAGshbQUIa4uK1maGXRxxu7GvfAyHGiBWpWLU/PU2LCJNbC3BTAEc1IN+JDpC6OiqrJy
 qG+w==
X-Gm-Message-State: AO0yUKXcVNxrtoXQtf2qEYVjR6SRSuyQvfvhRo5fhzv2XNNrOjYh0vM1
 6PO4hHnwY0Is1XC+kUwXDiTgh8tS9DPQR174qyedfT+keYfHdK/RCs4aRsdJW0SpyfkbUyVD98v
 SUwGg89l007Xomzl53nehvFzPvTI2Iy+23VbANMOLf6G4QSGyACkB79RoRZ73ErvLUNeECw==
X-Received: by 2002:a05:622a:ce:b0:39c:da22:47b8 with SMTP id
 p14-20020a05622a00ce00b0039cda2247b8mr17587799qtw.1.1675888100242; 
 Wed, 08 Feb 2023 12:28:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+ycU6P1l1oOcgueKik20t1yaZF5TGGU4tr6vUcLh+mzow2FBIWtR8XAkZ2Vy7dqwttigxLjg==
X-Received: by 2002:a05:622a:ce:b0:39c:da22:47b8 with SMTP id
 p14-20020a05622a00ce00b0039cda2247b8mr17587751qtw.1.1675888099866; 
 Wed, 08 Feb 2023 12:28:19 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a37e204000000b0070d11191e91sm12287144qki.44.2023.02.08.12.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 12:28:18 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: [PATCH v3 2/4] migration: Cleanup postcopy_preempt_setup()
Date: Wed,  8 Feb 2023 15:28:11 -0500
Message-Id: <20230208202813.1363225-3-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230208202813.1363225-1-peterx@redhat.com>
References: <20230208202813.1363225-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since we just dropped the only case where postcopy_preempt_setup() can
return an error, it doesn't need a retval anymore because it never fails.
Move the preempt check to the caller, preparing it to be used elsewhere to
do nothing but as simple as kicking the async connection.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c    | 8 ++------
 migration/postcopy-ram.c | 8 +-------
 migration/postcopy-ram.h | 2 +-
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index f242d657e8..fb0ecf5649 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4347,12 +4347,8 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
     }
 
     /* This needs to be done before resuming a postcopy */
-    if (postcopy_preempt_setup(s, &local_err)) {
-        error_report_err(local_err);
-        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
-                          MIGRATION_STATUS_FAILED);
-        migrate_fd_cleanup(s);
-        return;
+    if (migrate_postcopy_preempt()) {
+        postcopy_preempt_setup(s);
     }
 
     if (resume) {
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 9a9d0ecf49..de6d4a3fd4 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1629,16 +1629,10 @@ int postcopy_preempt_wait_channel(MigrationState *s)
     return s->postcopy_qemufile_src ? 0 : -1;
 }
 
-int postcopy_preempt_setup(MigrationState *s, Error **errp)
+void postcopy_preempt_setup(MigrationState *s)
 {
-    if (!migrate_postcopy_preempt()) {
-        return 0;
-    }
-
     /* Kick an async task to connect */
     socket_send_channel_create(postcopy_preempt_send_channel_new, s);
-
-    return 0;
 }
 
 static void postcopy_pause_ram_fast_load(MigrationIncomingState *mis)
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 25881c4127..d5604cbcf1 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -191,7 +191,7 @@ enum PostcopyChannels {
 };
 
 void postcopy_preempt_new_channel(MigrationIncomingState *mis, QEMUFile *file);
-int postcopy_preempt_setup(MigrationState *s, Error **errp);
+void postcopy_preempt_setup(MigrationState *s);
 int postcopy_preempt_wait_channel(MigrationState *s);
 
 #endif
-- 
2.37.3


