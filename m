Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AF650ECD9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:51:19 +0200 (CEST)
Received: from localhost ([::1]:44212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8UB-0001hp-1y
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IM-00079C-3h
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IK-0007kQ-A2
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bmwBWn3HuKl7CinqBKqF4WztBjlQylQ6C2I873h1Ezo=;
 b=eRxEwrm6Uw6XWJkX3BNACDZPYcWfwvNsa7TwK2obOoUGTTSor8RyGapxK/aFJMAVb9RqEt
 bOkWZWfj8czoLzN1JsL5j1f3aWHPPcGwcr1JdgifTiz1ZZ9N3c4M1iK4L8jDrAgEyOSm5L
 zXpbSyBr3LDJM/DwxkJA6uhhp4Q7BFs=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-GeevIfcPNUW_gO0yLtfQmw-1; Mon, 25 Apr 2022 19:39:02 -0400
X-MC-Unique: GeevIfcPNUW_gO0yLtfQmw-1
Received: by mail-io1-f71.google.com with SMTP id
 g16-20020a05660203d000b005f7b3b0642eso102713iov.16
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bmwBWn3HuKl7CinqBKqF4WztBjlQylQ6C2I873h1Ezo=;
 b=DOpmHPxBjPhHzSJCXL6FKBxrRtZUSmXj2F0okYIzPs5/jwY72QA+XOpVFK/U6JYbQ5
 TaR8KCWfJ6v3FS2jdpZUPRAW8pQmn/kwhg020zJQoTZZ8KnENtddM3T8zOkPVcspIvAH
 Xs9GgcvXCWXIKNcrhRQPTRfBsnH7/12Hrk22wFxB5mBNtDaubat6BBctFkpBEd0AYDy1
 junB5r37b1ABfEqafU2eojWExLldoXcch8pw6ZPrmnXs0cGNkgnxjeZsGDrLtXMVH3BA
 emAIUiCPirXeQIa2vjcQyL/er05tJkTiTBQWt5k1pKQV1uQp4dELD2GXz/KNRFki6/fz
 hWCg==
X-Gm-Message-State: AOAM530YigwukYcb1oEBn00A6stkLnSEVFGK8JdMjYm8hF3tgqRT1Rms
 xP60zQidNRskXl7Nb2xQ9uaSp2Ce4UfsU2ueXu+DHo6bllE/7JVrMKnnd+YHjEy7MsdXXaSIH2B
 3pUrODKn+geNmGQ4/PJThmCa0IuIvyqZf6OzLOMzCdZMPYOWXl5JDmGU58gpWN+Of
X-Received: by 2002:a6b:f80b:0:b0:649:a265:bcc3 with SMTP id
 o11-20020a6bf80b000000b00649a265bcc3mr7912726ioh.18.1650929941445; 
 Mon, 25 Apr 2022 16:39:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyECpnK6ddeNh5+kQ1J2twdrDb74QaptrJnY0j/Jjd30DIoR/lIxD8MIPnt9yyYEYtriERszw==
X-Received: by 2002:a6b:f80b:0:b0:649:a265:bcc3 with SMTP id
 o11-20020a6bf80b000000b00649a265bcc3mr7912710ioh.18.1650929941129; 
 Mon, 25 Apr 2022 16:39:01 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.39.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:39:00 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/21] migration: Add postcopy-preempt capability
Date: Mon, 25 Apr 2022 19:38:36 -0400
Message-Id: <20220425233847.10393-11-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Firstly, postcopy already preempts precopy due to the fact that we do
unqueue_page() first before looking into dirty bits.

However that's not enough, e.g., when there're host huge page enabled, when
sending a precopy huge page, a postcopy request needs to wait until the whole
huge page that is sending to finish.  That could introduce quite some delay,
the bigger the huge page is the larger delay it'll bring.

This patch adds a new capability to allow postcopy requests to preempt existing
precopy page during sending a huge page, so that postcopy requests can be
serviced even faster.

Meanwhile to send it even faster, bypass the precopy stream by providing a
standalone postcopy socket for sending requested pages.

Since the new behavior will not be compatible with the old behavior, this will
not be the default, it's enabled only when the new capability is set on both
src/dst QEMUs.

This patch only adds the capability itself, the logic will be added in follow
up patches.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 23 +++++++++++++++++++++++
 migration/migration.h |  1 +
 qapi/migration.json   |  8 +++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 5a31b23bd6..75d9185c3a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1236,6 +1236,11 @@ static bool migrate_caps_check(bool *cap_list,
             error_setg(errp, "Postcopy is not compatible with ignore-shared");
             return false;
         }
+
+        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+            error_setg(errp, "Multifd is not supported in postcopy");
+            return false;
+        }
     }
 
     if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
@@ -1279,6 +1284,13 @@ static bool migrate_caps_check(bool *cap_list,
         return false;
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
+        if (!cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
+            error_setg(errp, "Postcopy preempt requires postcopy-ram");
+            return false;
+        }
+    }
+
     return true;
 }
 
@@ -2626,6 +2638,15 @@ bool migrate_background_snapshot(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
+bool migrate_postcopy_preempt(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
+}
+
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
@@ -4236,6 +4257,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-compress", MIGRATION_CAPABILITY_COMPRESS),
     DEFINE_PROP_MIG_CAP("x-events", MIGRATION_CAPABILITY_EVENTS),
     DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
+    DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
+                        MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
     DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
     DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
     DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
diff --git a/migration/migration.h b/migration/migration.h
index a863032b71..af4bcb19c2 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -394,6 +394,7 @@ int migrate_decompress_threads(void);
 bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
+bool migrate_postcopy_preempt(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/qapi/migration.json b/qapi/migration.json
index 409eb086a2..f381a94c98 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -463,6 +463,12 @@
 #                       procedure starts. The VM RAM is saved with running VM.
 #                       (since 6.0)
 #
+# @postcopy-preempt: If enabled, the migration process will allow postcopy
+#                    requests to preempt precopy stream, so postcopy requests
+#                    will be handled faster.  This is a performance feature and
+#                    should not affect the correctness of postcopy migration.
+#                    (since 7.1)
+#
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
@@ -476,7 +482,7 @@
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
-           'validate-uuid', 'background-snapshot'] }
+           'validate-uuid', 'background-snapshot', 'postcopy-preempt'] }
 
 ##
 # @MigrationCapabilityStatus:
-- 
2.32.0


