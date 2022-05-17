Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5204252AC54
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:00:05 +0200 (CEST)
Received: from localhost ([::1]:33718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3MM-0005kT-Nq
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3K9-00031n-OU
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3K6-0002Kl-Mm
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlxP3mzG79FvL1utUjQMn5yT8ZTiCbWippa7BQ3pxe4=;
 b=EWqr4VRI7wMT3D8j3Ifsa/XjsAfR+44jzNqYhwpIMZN9OHdnY33PGrHV430BXWWmg+4yWK
 Ex37jeC/kP5MC/C1waFV+LsyN0p/6Yrj34oRqLfTgbX95fyNEFA+Z3trd0vsSBp197bt3x
 8TsB28gLhahgxl98v27B/1FaNWLeCLk=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-3gfJwBKXP3qAXPvoGlCzLg-1; Tue, 17 May 2022 15:57:37 -0400
X-MC-Unique: 3gfJwBKXP3qAXPvoGlCzLg-1
Received: by mail-il1-f199.google.com with SMTP id
 i15-20020a056e0212cf00b002cf3463ed24so89427ilm.0
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WlxP3mzG79FvL1utUjQMn5yT8ZTiCbWippa7BQ3pxe4=;
 b=ZM3z59olM9l2qzxP8rTgJOWQcRCbtJKCSj6yduxSSRN41jG9mdv/wCQ04LmD2LR0ab
 P96eKS4wSn0QjVYfBy2z4M5Xrjuxd9H1qtJD0X34rhqSliMJaTS7emSUTAYbxYH7Bbrb
 j778ahcg/PpIkFYC3E592jlClfM8+lcG/lLnU7BhLO2MbKRquCHIkp4+qauQR8eLGbzx
 iWLzuGbZ4vjaQ4PhCUF1spsIFtzDtVLBjDoEDI/3BO6dQRxXDCbAeGpDpoLgk0if1e/B
 GOzUHsk/Voqoi1K+obAC4eL79Vq4SmVt/I/6zqiTT0h7Mn5N6LbzhFk9FDUt51e3l1G/
 23MA==
X-Gm-Message-State: AOAM533yBB2O1o13KpJ9Svwa4eznY+MxxyWQi0YFi3DGUh37QOtya0cW
 saTbzJ+ukotzddXan8KtscimnVzNSY3sPgaM41cXG2AQVpvLRYY8ptv96xNXDTkaffwkryTGXDF
 wT8JAcAja1CkCFqh+NM6SedqVGe1vCfsr1nu6Ejzg/0L4p2uQloLvzO79ZaAabmyp
X-Received: by 2002:a05:6602:2f06:b0:65d:fd3a:96cc with SMTP id
 q6-20020a0566022f0600b0065dfd3a96ccmr6648220iow.14.1652817455622; 
 Tue, 17 May 2022 12:57:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5QM36zwwB+/6r+n3OWSabhtTuHfKw00MGfjAE++WeYv7refELCibMzFelj5uBr2o1LxSctw==
X-Received: by 2002:a05:6602:2f06:b0:65d:fd3a:96cc with SMTP id
 q6-20020a0566022f0600b0065dfd3a96ccmr6648207iow.14.1652817455293; 
 Tue, 17 May 2022 12:57:35 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020b4f00b002d125725709sm59575ilu.28.2022.05.17.12.57.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 May 2022 12:57:34 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 01/13] migration: Add postcopy-preempt capability
Date: Tue, 17 May 2022 15:57:18 -0400
Message-Id: <20220517195730.32312-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517195730.32312-1-peterx@redhat.com>
References: <20220517195730.32312-1-peterx@redhat.com>
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
index 31739b2af9..f15e1593ac 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1240,6 +1240,11 @@ static bool migrate_caps_check(bool *cap_list,
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
@@ -1283,6 +1288,13 @@ static bool migrate_caps_check(bool *cap_list,
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
 
@@ -2669,6 +2681,15 @@ bool migrate_background_snapshot(void)
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
@@ -4283,6 +4304,8 @@ static Property migration_properties[] = {
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
index 6130cd9fae..d8c3810ba2 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -461,6 +461,12 @@
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
@@ -474,7 +480,7 @@
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
-           'validate-uuid', 'background-snapshot'] }
+           'validate-uuid', 'background-snapshot', 'postcopy-preempt'] }
 
 ##
 # @MigrationCapabilityStatus:
-- 
2.32.0


