Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD38533368
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:19:08 +0200 (CEST)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntcrr-0001Zz-HU
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntclA-00011Y-Cr
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntcl8-0005fi-Ln
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653430330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8pxhCYa30XOex2HmHfdmjM7m7+OLOb/u65J4ITJJZk=;
 b=Hmi4cnbNCWVpFv5TheAdM0Iqp2x+zFBzih5Jjdrwb6UWi+GLwZ+I9lKAXNnBaZZ99a3W16
 ypANDWt84XWUbzN8iYcczVpFHNOhktsWxSh9jPDMGlTSHJfx0JDVlGdUU4JDK9bsfcuRSQ
 Jde8guRtEzOJ7ANcI27tlxFmJd/y0Pg=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-7r2j9J2MNsuPpv423BjOMw-1; Tue, 24 May 2022 18:12:08 -0400
X-MC-Unique: 7r2j9J2MNsuPpv423BjOMw-1
Received: by mail-io1-f71.google.com with SMTP id
 y13-20020a056602164d00b0065a9dec1ef2so10590140iow.23
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t8pxhCYa30XOex2HmHfdmjM7m7+OLOb/u65J4ITJJZk=;
 b=cBNnU97+n9d59LFZ578ZEggjroYBirxeIapN6gogmcsHfZz8BRzlsqAeqaSJe37UPN
 Hq5cfwRC215nwJB3Qj8xzVjROXUDwB2P/nOkyAJqMl+MVlLFR12blOamhPZVbP3K9rfQ
 /3K+kS+4sg6pXULZJ/lRfCYkbcojQgnm+ydLUxtvSB1ZRhw13utFqcpo222Vzl8vZ0UV
 Ya2U/+/jm6kf8g4YmERZtQ+RXGNAGXpM6EG+IBYOlcagE6L44VbZ0xgnFwV6taeSNroc
 U4ofSx3xpl3VNl7KIr2G9oQSxecojD5/Fb7Xdnrb4GbD9dbs6mzXXWKGeUwOuO4sPQhk
 FqBw==
X-Gm-Message-State: AOAM532pO7MakdiN0UzfhoB2L4Jv+f4Bs7veL2lRnKJKeG7iuvtlqHbv
 ASxwPcSDnMbwwlDbFzNXc8JHWO/qdt4ygT5943Z0/qRlj+ED9Yln+baZPnHV3CXmtrP/hMPpbMG
 Y3i+HnBFj4/tLtsE6PFxoN8wsjwEKzGvp47EpuO1rYNwOHaocqzDeAw5qrVpbiZ4M
X-Received: by 2002:a92:d642:0:b0:2d1:b243:422a with SMTP id
 x2-20020a92d642000000b002d1b243422amr5523848ilp.315.1653430327481; 
 Tue, 24 May 2022 15:12:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnpy2T2R/+bH+GMNiWUEUA4QSMMDE5O66HlPnr5r4iMVtCkq/q2qfxL2zXID1GiZ0U7uLHqw==
X-Received: by 2002:a92:d642:0:b0:2d1:b243:422a with SMTP id
 x2-20020a92d642000000b002d1b243422amr5523828ilp.315.1653430327058; 
 Tue, 24 May 2022 15:12:07 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 6-20020a021d06000000b0032e2d3cc08csm3738045jaj.132.2022.05.24.15.12.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 May 2022 15:12:06 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com
Subject: [PATCH v7 08/14] migration: Export tls-[creds|hostname|authz] params
 to cmdline too
Date: Tue, 24 May 2022 18:11:45 -0400
Message-Id: <20220524221151.18225-9-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524221151.18225-1-peterx@redhat.com>
References: <20220524221151.18225-1-peterx@redhat.com>
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

It's useful for specifying tls credentials all in the cmdline (along with
the -object tls-creds-*), especially for debugging purpose.

The trick here is we must remember to not free these fields again in the
finalize() function of migration object, otherwise it'll cause double-free.

The thing is when destroying an object, we'll first destroy the properties
that bound to the object, then the object itself.  To be explicit, when
destroy the object in object_finalize() we have such sequence of
operations:

    object_property_del_all(obj);
    object_deinit(obj, ti);

So after this change the two fields are properly released already even
before reaching the finalize() function but in object_property_del_all(),
hence we don't need to free them anymore in finalize() or it's double-free.

This also fixes a trivial memory leak for tls-authz as we forgot to free it
before this patch.

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index d17f435d08..aa4185148c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4379,6 +4379,9 @@ static Property migration_properties[] = {
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
     DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
                       postcopy_preempt_break_huge, true),
+    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
+    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
+    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
@@ -4412,12 +4415,9 @@ static void migration_class_init(ObjectClass *klass, void *data)
 static void migration_instance_finalize(Object *obj)
 {
     MigrationState *ms = MIGRATION_OBJ(obj);
-    MigrationParameters *params = &ms->parameters;
 
     qemu_mutex_destroy(&ms->error_mutex);
     qemu_mutex_destroy(&ms->qemu_file_lock);
-    g_free(params->tls_hostname);
-    g_free(params->tls_creds);
     qemu_sem_destroy(&ms->wait_unplug_sem);
     qemu_sem_destroy(&ms->rate_limit_sem);
     qemu_sem_destroy(&ms->pause_sem);
-- 
2.32.0


