Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114C656AB24
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 20:59:06 +0200 (CEST)
Received: from localhost ([::1]:57744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9WiP-0002kQ-4T
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 14:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9WdS-0003ix-0Y
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9WdP-0001JB-FE
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657220034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrQNsnOt0GL31c1Ffe1xenzH8imMc9r+IpySVUxLVb4=;
 b=HdpuqMYFsPeTsuJJ5LW0ib0dskRnnZggFJQ3lX+JjDBiw/eQy8AY0DFwkRg6CcEROXXOF/
 YtXHM0pskcOUIa01hr6tXm6Zl2jJj4q6bxml5gBVNugW0tQFKxLNsDqxd+VmXKJnCimOhn
 qglE3ZgM/GyEeoUue7xrCl7NMdD2GB4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-9Uhsrd-XPvqNh7ybV9Cqig-1; Thu, 07 Jul 2022 14:53:47 -0400
X-MC-Unique: 9Uhsrd-XPvqNh7ybV9Cqig-1
Received: by mail-qt1-f200.google.com with SMTP id
 q21-20020ac84115000000b0031bf60d9b35so16147974qtl.4
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 11:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LrQNsnOt0GL31c1Ffe1xenzH8imMc9r+IpySVUxLVb4=;
 b=PCLjdIkFPCMBeeQHY+ZbBZt0cM/2ATg0KlnE6Qu80Ovww8Yx6nKT2nA72R1daHnTcv
 kMsgp7iQAhScxCviIwDvnmsC2SyoBmA+hgQuNjGaaJ32Db517cMII5g15nBJ7d/l/vkC
 rfApBF6xMpRzTjT/yK0RL43wvpr65CqsKesuIrhYlUAx1BiRS9sESnt/SIYiNW7wBQN+
 Qs9Y0LPJcwCCDGz8nlaTIurAdkkYtGhlU4pui8Pi2Fn4vnJJoUjrfiGEE2LHEHSA7Moc
 gGs30XjyNrqp5tTR3c0IgUqJv12V6r+ZwGmYezD9wVgE58w1SCjvUVKjPznWA2cj8POT
 f/pA==
X-Gm-Message-State: AJIora8qSk7eFmfOfdkqMVwm/E1FZB/3DJhfMpeYk/L8Ezu6NyWd9QuV
 lSsG825nWUg6QTOWvIKL18Ofw41KFTGTubpRxOYtdNvN5lmvvPpIbIKFNKrvX0xwauweFo4Vnb3
 nYtq6Xx8Zd8IbpC0jZAPC4C5QTUwee13foLa1k21UsCg9LUIXn+tN8Ya6O/o1xVpo
X-Received: by 2002:a05:620a:280d:b0:67d:2480:fdea with SMTP id
 f13-20020a05620a280d00b0067d2480fdeamr32702940qkp.157.1657220026455; 
 Thu, 07 Jul 2022 11:53:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sotHg+bYtwIDMxMmVXvlOLdx43jrJUAkmxvdtSAi3K72E9gQBRs/rEqZDDf1vyRxo9lX2VnA==
X-Received: by 2002:a05:620a:280d:b0:67d:2480:fdea with SMTP id
 f13-20020a05620a280d00b0067d2480fdeamr32702917qkp.157.1657220026145; 
 Thu, 07 Jul 2022 11:53:46 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 dm15-20020a05620a1d4f00b006b555509398sm1476087qkb.136.2022.07.07.11.53.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Jul 2022 11:53:45 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v9 01/14] migration: Add postcopy-preempt capability
Date: Thu,  7 Jul 2022 14:53:29 -0400
Message-Id: <20220707185342.26794-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707185342.26794-1-peterx@redhat.com>
References: <20220707185342.26794-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
index 7102e474a6..7c60917675 100644
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


