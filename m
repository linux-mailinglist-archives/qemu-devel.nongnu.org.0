Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B684ECF2D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:53:30 +0200 (CEST)
Received: from localhost ([::1]:36686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgFu-0006vt-2C
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:53:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2L-00060u-Uq
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2K-0005GT-D4
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjWWDJmru+q4d2CmT6YENR08AaXC5qZccuUY2hfeQGw=;
 b=axEBivPwaXG3uiRvfgZCBPprQ5HGRFAHcfEuXho65gVdmArpKQIv+29upVx+lIgCCf4SOG
 VsrrqhPKWoUMKWQWl6m9u7vgQCvLnSJWjVLBlQ3TqmJYHorh62NsIVvxPyo/r68BRay9N9
 l6tveEnALiUNdq/uv4LGzlxV8w+XrRU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-QFJyOdPSPri5s4nBZwibpA-1; Wed, 30 Mar 2022 17:39:26 -0400
X-MC-Unique: QFJyOdPSPri5s4nBZwibpA-1
Received: by mail-qv1-f69.google.com with SMTP id
 cl19-20020a05621404f300b0044103143211so17067002qvb.10
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AjWWDJmru+q4d2CmT6YENR08AaXC5qZccuUY2hfeQGw=;
 b=bMgteb3Xup4cZLpY5rLkrYvo6hR55H1wPjnlhm/wdu4V2zKFadE6iwm0tXl7TTOKW6
 buEZVc6XRSclvoaLTQ584XH6lAAGPVn0a4r1/SLS8SpayHk1Dqktcq2toZzRuQPb84s5
 fOHvODvUGkfbkpA7rMq3tjtczBE+iyuqO6P5URg5WQfK7NLolXTQRQzSQe4g/ycAarY+
 +dK/1eJptWG9gnEzcGTtG2rCiDt9LF1h2jCwoBwfrG441hUPipe2XQOJG4IHHrHsAtqQ
 gNmmQHFmbPUSBZfALy//BWLCiiWevOfdvr17H7GegI7JfQXsSzPMJeOEISlVRfOI7/LW
 YRcQ==
X-Gm-Message-State: AOAM532oSd2dbzuAH8uBD3bELRf/OuRKFmj/Fd90yU8lOBXfuXo+M6Ag
 i9eRY5HGIhhhOX4SDtMTJ+85K4QU+hB62/nSHJPEF0krRt8w3uUZXf1N17iBAYXCy73q6NB5VRI
 HdRQzr1tG911D4DyblkpFZoS+XjqBCrFBYTCZxuemOS0fjfbBs4pGbK9PGu6EIPwp
X-Received: by 2002:a05:6214:27c5:b0:441:1ce6:a172 with SMTP id
 ge5-20020a05621427c500b004411ce6a172mr1166141qvb.88.1648676365747; 
 Wed, 30 Mar 2022 14:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF2MvhamFZzNyoucETOpu4XQ9PQc7sWx5x6AWD5aNfMtHihY0IHz87UfH6j71aglLrvASiLg==
X-Received: by 2002:a05:6214:27c5:b0:441:1ce6:a172 with SMTP id
 ge5-20020a05621427c500b004411ce6a172mr1166122qvb.88.1648676365436; 
 Wed, 30 Mar 2022 14:39:25 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:25 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/19] migration: Parameter x-postcopy-preempt-break-huge
Date: Wed, 30 Mar 2022 17:39:03 -0400
Message-Id: <20220330213908.26608-15-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a parameter that can conditionally disable the "break sending huge
page" behavior in postcopy preemption.  By default it's enabled.

It should only be used for debugging purposes, and we should never remove
the "x-" prefix.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 2 ++
 migration/migration.h | 7 +++++++
 migration/ram.c       | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 33faa0ff6e..ee3df9e229 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4330,6 +4330,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_SIZE("announce-step", MigrationState,
                       parameters.announce_step,
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
+    DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
+                      postcopy_preempt_break_huge, true),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
diff --git a/migration/migration.h b/migration/migration.h
index f898b8547a..6ee520642f 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -340,6 +340,13 @@ struct MigrationState {
     bool send_configuration;
     /* Whether we send section footer during migration */
     bool send_section_footer;
+    /*
+     * Whether we allow break sending huge pages when postcopy preempt is
+     * enabled.  When disabled, we won't interrupt precopy within sending a
+     * host huge page, which is the old behavior of vanilla postcopy.
+     * NOTE: this parameter is ignored if postcopy preempt is not enabled.
+     */
+    bool postcopy_preempt_break_huge;
 
     /* Needed by postcopy-pause state */
     QemuSemaphore postcopy_pause_sem;
diff --git a/migration/ram.c b/migration/ram.c
index 518d511874..3400cde6e9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2266,11 +2266,18 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
 
 static bool postcopy_needs_preempt(RAMState *rs, PageSearchStatus *pss)
 {
+    MigrationState *ms = migrate_get_current();
+
     /* Not enabled eager preempt?  Then never do that. */
     if (!migrate_postcopy_preempt()) {
         return false;
     }
 
+    /* If the user explicitly disabled breaking of huge page, skip */
+    if (!ms->postcopy_preempt_break_huge) {
+        return false;
+    }
+
     /* If the ramblock we're sending is a small page?  Never bother. */
     if (qemu_ram_pagesize(pss->block) == TARGET_PAGE_SIZE) {
         return false;
-- 
2.32.0


