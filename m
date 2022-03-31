Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A994EDC9A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:19:26 +0200 (CEST)
Received: from localhost ([::1]:43984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwa5-0001cv-Ih
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:19:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQV-0002eD-Jp
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQU-0001Pg-21
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AjWWDJmru+q4d2CmT6YENR08AaXC5qZccuUY2hfeQGw=;
 b=EXYVLetTyViPY8KlSOuH7bUYLIAVd0sNZ9IBWOXn8f5dc1ckrH4NHp2XRDdGy9T+Ii2tEP
 SQ80nIE0jb6bvwVfnGy92q2E4wXz9ae6lkIxOsaQU0mea49+Z2LN4cpLC11fOGnPrOhS6s
 JFCzM8fPox0klVbmWulBKKao3dGYPRE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-1PtLvYqkMkGuA0DnIYrwUg-1; Thu, 31 Mar 2022 11:09:28 -0400
X-MC-Unique: 1PtLvYqkMkGuA0DnIYrwUg-1
Received: by mail-qv1-f69.google.com with SMTP id
 94-20020a0c8167000000b004411702e935so18769226qvc.7
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AjWWDJmru+q4d2CmT6YENR08AaXC5qZccuUY2hfeQGw=;
 b=AIvw3DcvaYDkc4TXIBRxbbk8nBLlsEPFMRouwchXDbZY0jcr4MG0c6CDGjkSkyq21b
 nB8PZEyIktbeoxa5yQex0LyoXjrNucE3pAbuX72n3UR2bcLs1tf2f3lqtZPgnBRnw+N7
 mEOU+JNWCzdFZBdtR2uHdiMVPxGVvUlZZJ5UMnXXlrHeAH0vYNUoJoUjuY0yDuoQ2XiK
 2gWBfhJGtjw8r8OE+NI9HPusOLWypODPKvkTJCy5jnOFlAeH5MlqVy+gB3ZA5fyIWXLs
 uWYWC3UQvnUj/E+B+pbZZphkU+fZAQqA0+hdhHVFL+8HvxyqcH3brJ67on4GZKe3MAZY
 u3Jg==
X-Gm-Message-State: AOAM533LbpnnoChqcbgSll7Q5Imyn82WnW+da0nI0IOZ8kWZFmxugqWD
 oyhKizVm9WCFWIYyEK/+p3QIYZ/m/yRWkjE//CI0bfamKHvLr+DGOmm61iPIcWtxJDnso829flD
 OSRjcAxU8n7KddY+7M8VyppMQz19xq+txMmb9xQfChTNF0nEnSCehrbkoU+Ks5xBe
X-Received: by 2002:ad4:5941:0:b0:433:75f:8627 with SMTP id
 eo1-20020ad45941000000b00433075f8627mr36879189qvb.122.1648739353207; 
 Thu, 31 Mar 2022 08:09:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJmbapVSQvnTEp3vY1tF039e9RuKvChJ+4I8V9YUB8pU/d12UAnKIByFXXYiRuxzVKiHGYlQ==
X-Received: by 2002:ad4:5941:0:b0:433:75f:8627 with SMTP id
 eo1-20020ad45941000000b00433075f8627mr36879154qvb.122.1648739352868; 
 Thu, 31 Mar 2022 08:09:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.09.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:09:12 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/19] migration: Parameter x-postcopy-preempt-break-huge
Date: Thu, 31 Mar 2022 11:08:51 -0400
Message-Id: <20220331150857.74406-14-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331150857.74406-1-peterx@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
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


