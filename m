Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61B9555581
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 22:51:59 +0200 (CEST)
Received: from localhost ([::1]:46678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47KQ-00054E-TC
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 16:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47I8-0002Hj-4T
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47I6-0004FT-Hw
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655930974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YxCFGQpsPF0Md1s0YwkgD2Yx24BquXhMGvMjqKwffmE=;
 b=KJKJxLyLnvgJwJVvb08Ef4XzsaPVM9+XTjKrNeey32fxAmLdPZO4YGeoCW63WucJAamxKK
 Sqq6hF+qSnlzTo48AHu2FpkLkDLFB2GklRztIxtHlKiblDUO7tnQbrhMPYzQyzPV2+xP8I
 FxHfMRuE/4n+qSMW3mRtxQxWVJP1MgM=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-jehxjqV4P_mWHnfMSCY4hA-1; Wed, 22 Jun 2022 16:49:32 -0400
X-MC-Unique: jehxjqV4P_mWHnfMSCY4hA-1
Received: by mail-io1-f71.google.com with SMTP id
 m3-20020a6bbc03000000b0067277968473so809161iof.19
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YxCFGQpsPF0Md1s0YwkgD2Yx24BquXhMGvMjqKwffmE=;
 b=hYvGgYo3l7Y+8dCLFn8HX+v20s/5SNfNChbEzvkRwQPUrEX+jEL6jcco3ytvU0AYdA
 vOx8TQAPlgmisL76bBW38E1GP5quk24dqfM99B9397evp5T8WgTinHbxeU+Yx0cTgtUe
 1oOl/afqJbh6rRvWfxhZj+REOuwxzymqn8cu6edvq3yNGPQsoU0OdJGhgPWIlibGHlad
 VInWSY1OpChPp3FI5z1+lxYWPKKThk2wydtYyNSlZoUEMNiwvGF7QwMfttRyeOu8xvNZ
 1hobgOFPwqq9uIFgRN+5Gq80h9U7SQe0OGUVVYucyE2MNuOZb8wcQvM02G+MtpgNSsf0
 gnOg==
X-Gm-Message-State: AJIora+S/FJKjDaXcPNshD/YmL6CY9ST9Yavr2Ye2Mb/2myfA48f7bL+
 68WyNAJOKNFPt5uzLeB6Nj1ZvAAV3VXj0M8kraypebpH8jVqGN9mvqKPsYzIotwAwRtRXwrqEpF
 u2vPHz8CGJ2/TBpuqNsAB5ZJzuU46eW/6B0F6BLjfmQGyg7Otn3pZ54+7Ubvp41Ls
X-Received: by 2002:a92:a041:0:b0:2d7:7935:effa with SMTP id
 b1-20020a92a041000000b002d77935effamr3136362ilm.222.1655930971640; 
 Wed, 22 Jun 2022 13:49:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXXB6/QfUk/8IHfO1u3MFzDBCv1SKZDMqr3HT4gqhQg1NgRucwOJP/IRQ2SNcu3aBKP4PsUg==
X-Received: by 2002:a92:a041:0:b0:2d7:7935:effa with SMTP id
 b1-20020a92a041000000b002d77935effamr3136350ilm.222.1655930971386; 
 Wed, 22 Jun 2022 13:49:31 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.49.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:49:30 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 02/15] migration: Add postcopy-preempt capability
Date: Wed, 22 Jun 2022 16:49:07 -0400
Message-Id: <20220622204920.79061-3-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622204920.79061-1-peterx@redhat.com>
References: <20220622204920.79061-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 18 ++++++++++++++++++
 migration/migration.h |  1 +
 qapi/migration.json   |  7 ++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 78f5057373..ce7bb68cdc 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1297,6 +1297,13 @@ static bool migrate_caps_check(bool *cap_list,
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
 
@@ -2663,6 +2670,15 @@ bool migrate_background_snapshot(void)
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
@@ -4274,6 +4290,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-compress", MIGRATION_CAPABILITY_COMPRESS),
     DEFINE_PROP_MIG_CAP("x-events", MIGRATION_CAPABILITY_EVENTS),
     DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
+    DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
+                        MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
     DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
     DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
     DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
diff --git a/migration/migration.h b/migration/migration.h
index 485d58b95f..d2269c826c 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -400,6 +400,7 @@ int migrate_decompress_threads(void);
 bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
+bool migrate_postcopy_preempt(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/qapi/migration.json b/qapi/migration.json
index e552ee4f43..7586df3dea 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -467,6 +467,11 @@
 #                  Requires that QEMU be permitted to use locked memory
 #                  for guest RAM pages.
 #                  (since 7.1)
+# @postcopy-preempt: If enabled, the migration process will allow postcopy
+#                    requests to preempt precopy stream, so postcopy requests
+#                    will be handled faster.  This is a performance feature and
+#                    should not affect the correctness of postcopy migration.
+#                    (since 7.1)
 #
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
@@ -482,7 +487,7 @@
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
            'validate-uuid', 'background-snapshot',
-           'zero-copy-send'] }
+           'zero-copy-send', 'postcopy-preempt'] }
 
 ##
 # @MigrationCapabilityStatus:
-- 
2.32.0


