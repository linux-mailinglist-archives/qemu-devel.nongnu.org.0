Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE463533369
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:19:18 +0200 (CEST)
Received: from localhost ([::1]:35612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntcs1-0001lF-Vi
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntcl9-000105-Ts
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntcl5-0005fE-5a
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653430326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvbAo5PYCTf+iNBuQgCvyW6Ivn28f3MYE6qVga4f6Qs=;
 b=aTpYnjkhq1sY82zb/0jsnv1YVs/MOi9YLKZ9mVAdR4L6/XePVAeXzIaJLG5dzP0MMHHhcR
 KZpP711aKndGr6HlmYh03bGQbNQJclseSG2/rsKpsldJHMHrH30GW+DQWEBJqFIRp2JwPL
 ztL9zSHzgQ6ii4NJMAA1aosBeNAO5No=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-56r6wb_kP8-awj-miRJApg-1; Tue, 24 May 2022 18:12:05 -0400
X-MC-Unique: 56r6wb_kP8-awj-miRJApg-1
Received: by mail-il1-f200.google.com with SMTP id
 m9-20020a056e021c2900b002d13627892eso11563969ilh.20
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hvbAo5PYCTf+iNBuQgCvyW6Ivn28f3MYE6qVga4f6Qs=;
 b=wP8tbfjnT4UlTt0ebe4okjFcOc7um+1eEBsNYmswE0s6ZHx8bAGhSBYOs1U9W+bTsY
 5PFzd+iJ/C0H/Px8Y1GKO+NW8IcXP0xnIQ6Uepf/dlh09dnnzACUDO/XGa7C3RTFBkXh
 zypGjhzEC5QpSISZr28mes/eIs/vX72JSPGn+LIse8CalMDhR1YqzV1e48kIszubYhKL
 4QDMFUdZkvNix/SpN1hY+PwatBeLy2YRu7LOJm1LZfX2w+g2GorwuNfqEwn1IuLwRuy9
 BNtF9ZT8BkuUlLyNgijCcjIPpHwrU7zOFTArLyvlocF81fk1CBSEqPfHIZwMsLforBTP
 MQ6A==
X-Gm-Message-State: AOAM531H6T7vgnyz0K7Uo1r8XcGIww/58oZUtmBi4WwA5xhhgkxvYdhf
 XRbkIk4ZLXyua9Vu6wPVz13vbBxf8T9dB0ASG29YDcwhYWzllcasF65OIfLzjVxjY+YMLaqQj1Y
 ufw1xCsKXi8OdLUSVVWEL5nY8eY1juKXI++vjdwODEIV9610hFWx0br0RiX9WgkEI
X-Received: by 2002:a05:6638:264e:b0:32e:bc45:bff0 with SMTP id
 n14-20020a056638264e00b0032ebc45bff0mr7871770jat.282.1653430324280; 
 Tue, 24 May 2022 15:12:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqtvqjNFxm9TULreo9UCIVYokGiSoz9CIIaxDuFSPc6jPc01Q/o4lhMfKCgtmBuc5KT0ZwfQ==
X-Received: by 2002:a05:6638:264e:b0:32e:bc45:bff0 with SMTP id
 n14-20020a056638264e00b0032ebc45bff0mr7871754jat.282.1653430323987; 
 Tue, 24 May 2022 15:12:03 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 6-20020a021d06000000b0032e2d3cc08csm3738045jaj.132.2022.05.24.15.12.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 May 2022 15:12:03 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com
Subject: [PATCH v7 06/14] migration: Add property x-postcopy-preempt-break-huge
Date: Tue, 24 May 2022 18:11:43 -0400
Message-Id: <20220524221151.18225-7-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524221151.18225-1-peterx@redhat.com>
References: <20220524221151.18225-1-peterx@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


