Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDCC4ECEE9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:41:34 +0200 (CEST)
Received: from localhost ([::1]:58396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZg4L-0000GY-Cu
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:41:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2E-0005kE-2d
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2C-0005Ep-Fu
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muISGSqC4VLW6KPUHb9CY6sFKOFruXP+msv79+xlWRw=;
 b=aYL35VbgcRcZlrWvDc7OBukyqTap5mvDKiHnM8M5ws/noPY91utavQc4MIBDm4vFCdPWfo
 h/NwQBkknoxqHyx5n0VF0qVGyU5uHUpLjtTIufJI8iADdN1/q+w3ziHY0cU+OnaZJQsXf1
 70ETW4EzWxy7XxiAvamLUyd2GhcMK8I=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-Z1YEPGNEOPeyKfcAV33rSA-1; Wed, 30 Mar 2022 17:39:18 -0400
X-MC-Unique: Z1YEPGNEOPeyKfcAV33rSA-1
Received: by mail-qv1-f69.google.com with SMTP id
 z1-20020ad44781000000b00440ded04b09so17030102qvy.22
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=muISGSqC4VLW6KPUHb9CY6sFKOFruXP+msv79+xlWRw=;
 b=5zxZnElnWCvLtC6g53kP52gAL6kDdeUAHDNNcp5aSTqV/1ejGSKDVVuFxPGi3IwQAV
 IacGDiZJxz7ykWg8O0Z2lOW7d1s7YR8KISsiECAPGuh2kdODZPoNnLmai6vlAsNHQ+eq
 y/VTc16SDyVuSpxBfR85aAh5BBsEmnJ6buO6Xnlb2HV7MOIQnLhKgoPnCibVJY/NVrxC
 /Vc76Jp3OaFMibQNxQBITS18Tv4U2fI0St2yEn2CtmcOfMxNr+/ibzHYQm9hNl/CP9W7
 zb2MeLnxXnKolR84AyV9gjSCvx0Ti6u96NUqP2uKXlrhpLKGVAmfnfe2C6vlq5I5u9VP
 e3cQ==
X-Gm-Message-State: AOAM532kzf6HVDVcSUlxUXw/g/0XIaAWZMU7arT8MAIj+4N8BiEVC217
 bR6ZMN9iIF3GyQkaPbH8Zm8Go2PXr4bLeX2LBLUI2sACqZ2XBThy7k3hmiEw+s3gzr5WAi0TM7s
 5mf6/Gi3G3n8skhUbUvT1aejV+PQg1gj6fok0vPq8kv6T9LtGx4iEvkw76d00wHvz
X-Received: by 2002:a05:620a:2443:b0:67d:fb40:310e with SMTP id
 h3-20020a05620a244300b0067dfb40310emr1276369qkn.241.1648676357787; 
 Wed, 30 Mar 2022 14:39:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeAzQAqBGJc7yQhbPLMuj60txd9EIq0dlYPjAe+RUZcfiNPPOF0h8pC5ZedR4Xviyh32EjTw==
X-Received: by 2002:a05:620a:2443:b0:67d:fb40:310e with SMTP id
 h3-20020a05620a244300b0067dfb40310emr1276351qkn.241.1648676357506; 
 Wed, 30 Mar 2022 14:39:17 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:17 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/19] migration: Move channel setup out of
 postcopy_try_recover()
Date: Wed, 30 Mar 2022 17:38:55 -0400
Message-Id: <20220330213908.26608-7-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330213908.26608-1-peterx@redhat.com>
References: <20220330213908.26608-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 596d3d30b4..8ecf78f2c7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -671,19 +671,20 @@ void migration_incoming_process(void)
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
@@ -704,11 +705,10 @@ static bool postcopy_try_recover(QEMUFile *f)
 
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
@@ -724,11 +724,6 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
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
@@ -749,6 +744,10 @@ void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp)
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


