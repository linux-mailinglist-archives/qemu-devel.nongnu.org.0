Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28673F8E62
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:01:04 +0200 (CEST)
Received: from localhost ([::1]:58326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJKcP-0004qt-U5
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJKZz-0002ov-IL
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJKZy-00019r-58
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 14:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630004301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nu2lN1o02zB4SS5XpgBl+iZRy4+/xMk8bEFWb+JPULI=;
 b=O0gGSZMzB/Fa95AQS4DEkJ8CJ6CdFYOYXI6MvJgY1mOBOzokDxaaZf8o6jg2R/hpBmftMW
 0SPN5WQAZFApmfHfTzBY6WlddXCx6Uxwpizf5NUez0ie9/Zc9yv/3Mj8YZNscNdNYOY9oj
 vknM3caVaHYmFmvxkjsqFeTPvSpeMfA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-fntFecaxNRKd9fOs-WBdRg-1; Thu, 26 Aug 2021 14:58:20 -0400
X-MC-Unique: fntFecaxNRKd9fOs-WBdRg-1
Received: by mail-qv1-f69.google.com with SMTP id
 ib9-20020a0562141c8900b003671c3a1243so1086859qvb.21
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 11:58:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nu2lN1o02zB4SS5XpgBl+iZRy4+/xMk8bEFWb+JPULI=;
 b=mtaMrrbc1fqEOmDWNUjYSyIUsMEY+mvgp05TY6lQW0NrsH3fEfU0+OLsqLg7yXHaF0
 a4+yd/YOGicpUINy05phZalSvtHBJH6stYEaXqFzFR4d1ZDkUxaWBS/Ct8Of16nwXGHO
 4215k7v+0ZcoYPdb6cpfV2xCpYFpKhHeH6Ysnb/zx79l32NHzFkHEjJFqF8TE8hKUAEZ
 RkBfTme78qsXLv0ojJXomqvF9m8qWS3qeyxorqslsZF9vfW1ONv1UE9W33Gz24YWhMI+
 1JHUTaHC3boi0FhUIYYiG8PuMlcObjU7WEHfVe4nYkXVYy+hNF2SqVk9PFTF/xMHDJ0b
 FJjA==
X-Gm-Message-State: AOAM531AAWr/jbnhy6GF90FHtahzcepRsKmn0BtgJlSWxTNsuEfEqrpd
 gZtW6aOO+oCf8iGC9K/fawvY3OYMgMgT3/oOf+7Xvv+k1xPJMdNIBl45xfC9gjp6M0qcpvXbTIb
 sBs+I5j0V5fm7o23uJxzX6irzoPIkZvmZEMVzvu7zFoXLWukp3205sAaX8zUJf+9e
X-Received: by 2002:a05:622a:c1:: with SMTP id
 p1mr4774570qtw.365.1630004299705; 
 Thu, 26 Aug 2021 11:58:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0eQkpR0PpH5rq2Zewl/FmICoiN2mgu43xwE4zMJT7Zp6lFl18qzH7oO+VcXt11VxlffI1IQ==
X-Received: by 2002:a05:622a:c1:: with SMTP id
 p1mr4774544qtw.365.1630004299425; 
 Thu, 26 Aug 2021 11:58:19 -0700 (PDT)
Received: from t490s.phub.net.cable.rogers.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id t8sm2328195qtn.37.2021.08.26.11.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 11:58:18 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] migration: Add migrate_add_blocker_internal()
Date: Thu, 26 Aug 2021 14:58:12 -0400
Message-Id: <20210826185813.248441-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826185813.248441-1-peterx@redhat.com>
References: <20210826185813.248441-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An internal version that removes -only-migratable implications.  It can be used
for temporary migration blockers like dump-guest-memory.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/migration/blocker.h | 16 ++++++++++++++++
 migration/migration.c       | 21 +++++++++++++--------
 2 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/include/migration/blocker.h b/include/migration/blocker.h
index acd27018e9..9cebe2ba06 100644
--- a/include/migration/blocker.h
+++ b/include/migration/blocker.h
@@ -25,6 +25,22 @@
  */
 int migrate_add_blocker(Error *reason, Error **errp);
 
+/**
+ * @migrate_add_blocker_internal - prevent migration from proceeding without
+ *                                 only-migrate implications
+ *
+ * @reason - an error to be returned whenever migration is attempted
+ *
+ * @errp - [out] The reason (if any) we cannot block migration right now.
+ *
+ * @returns - 0 on success, -EBUSY on failure, with errp set.
+ *
+ * Some of the migration blockers can be temporary (e.g., for a few seconds),
+ * so it shouldn't need to conflict with "-only-migratable".  For those cases,
+ * we can call this function rather than @migrate_add_blocker().
+ */
+int migrate_add_blocker_internal(Error *reason, Error **errp);
+
 /**
  * @migrate_del_blocker - remove a blocking error from migration
  *
diff --git a/migration/migration.c b/migration/migration.c
index f476e2101e..2aaf2fd449 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2053,15 +2053,8 @@ void migrate_init(MigrationState *s)
     s->threshold_size = 0;
 }
 
-int migrate_add_blocker(Error *reason, Error **errp)
+int migrate_add_blocker_internal(Error *reason, Error **errp)
 {
-    if (only_migratable) {
-        error_propagate_prepend(errp, error_copy(reason),
-                                "disallowing migration blocker "
-                                "(--only-migratable) for: ");
-        return -EACCES;
-    }
-
     /* Snapshots are similar to migrations, so check RUN_STATE_SAVE_VM too. */
     if (runstate_check(RUN_STATE_SAVE_VM) || !migration_is_idle()) {
         error_propagate_prepend(errp, error_copy(reason),
@@ -2074,6 +2067,18 @@ int migrate_add_blocker(Error *reason, Error **errp)
     return 0;
 }
 
+int migrate_add_blocker(Error *reason, Error **errp)
+{
+    if (only_migratable) {
+        error_propagate_prepend(errp, error_copy(reason),
+                                "disallowing migration blocker "
+                                "(--only-migratable) for: ");
+        return -EACCES;
+    }
+
+    return migrate_add_blocker_internal(reason, errp);
+}
+
 void migrate_del_blocker(Error *reason)
 {
     migration_blockers = g_slist_remove(migration_blockers, reason);
-- 
2.31.1


