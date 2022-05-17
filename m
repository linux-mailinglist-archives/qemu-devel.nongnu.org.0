Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C167E52AC65
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:03:43 +0200 (CEST)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3Pr-0002xj-6B
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 16:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KM-0003B7-Dk
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KK-0002Le-KN
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvbAo5PYCTf+iNBuQgCvyW6Ivn28f3MYE6qVga4f6Qs=;
 b=eJ7O5xNQxdNMMAgiZ5ofCo82iVhja5s4XFLRQ951UBwdAPh8XsfumJ+hNiT6rvl4e7WO2d
 6YgVNXbQa7WyNkCrXwQsjjVdY+qgryk66S8tNIFRbxPspcGJDG39igwd9vBF2fJXMNZAwB
 Aym4fsCEIUkuDYIY+R36y/muZ2iGDbI=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-o3G_FsuQOEiLr1WoPxz0iQ-1; Tue, 17 May 2022 15:57:45 -0400
X-MC-Unique: o3G_FsuQOEiLr1WoPxz0iQ-1
Received: by mail-il1-f199.google.com with SMTP id
 i4-20020a056e021b0400b002d14f2abad7so61389ilv.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hvbAo5PYCTf+iNBuQgCvyW6Ivn28f3MYE6qVga4f6Qs=;
 b=Kq3/wYMnQ923CbLE78353ImAxRTYO5H/7PLBecQCYYL4X1NM6CwYbN5ohVZ2hCZ6C+
 HTB7bsS/GKpR8I12JCHzgCBGNbiyIt7NlxYOhyzxNqIK1UT6AHKjVZNaI5oRrp/iTKE0
 QHl+XYHF/JCohJwkpklVRziy5ziVL7ax17UY9zFaXll/428YlAihckPRly+6zxaUL9bI
 zhxtebaGYfKHdxwjlLITyp3vcaQqLRlPicr+Gep/0Knioct07IhgS/dt9u2Xg30w0DlK
 nV4bpv/3xumHyBpzJFFi6LPQPGf3CJ0MkAXktOopthEE8KesgleMmqFfs/VcnV5z/NNa
 c0FA==
X-Gm-Message-State: AOAM530kyyVCFEGp/u9QfolEzSXzvgsDLDn1zfm6Ilyrgx74oZIj3LAN
 bydorp9QyYgwI4MmF9Itrv5pB4NQMWO81kcXgV1Cc0ye2hrVmkttSiynxa/pP5Ik7ARWy3E3Tz1
 als/kEZQP0zRYtr8+zbK3Q2oO7v66UXtuPuriWs2jCLUUDBmbespgfGVhLSgj98H9
X-Received: by 2002:a92:509:0:b0:2d1:2766:1820 with SMTP id
 q9-20020a920509000000b002d127661820mr5260279ile.6.1652817464721; 
 Tue, 17 May 2022 12:57:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+rRVziEL5tQkGBCvpB7mOY/0k+JFvqAT6YLKdatVQxIl/k7pK+/veb1+d8OZIf53QGwcjkw==
X-Received: by 2002:a92:509:0:b0:2d1:2766:1820 with SMTP id
 q9-20020a920509000000b002d127661820mr5260250ile.6.1652817464016; 
 Tue, 17 May 2022 12:57:44 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020b4f00b002d125725709sm59575ilu.28.2022.05.17.12.57.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 May 2022 12:57:43 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 06/13] migration: Add property x-postcopy-preempt-break-huge
Date: Tue, 17 May 2022 15:57:23 -0400
Message-Id: <20220517195730.32312-7-peterx@redhat.com>
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

Add a property field that can conditionally disable the "break sending huge
page" behavior in postcopy preemption.  By default it's enabled.

It should only be used for debugging purposes, and we should never remove
the "x-" prefix.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Manish Mishra <manish.mishra@nutanix.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 2 ++
 migration/migration.h | 7 +++++++
 migration/ram.c       | 7 +++++++
 3 files changed, 16 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index e8ab876c8d..f5f7a0f91f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4376,6 +4376,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_SIZE("announce-step", MigrationState,
                       parameters.announce_step,
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
+    DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
+                      postcopy_preempt_break_huge, true),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
diff --git a/migration/migration.h b/migration/migration.h
index ae4ffd3454..cdad8aceaa 100644
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
index 344c20f56f..9d76db8491 100644
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


