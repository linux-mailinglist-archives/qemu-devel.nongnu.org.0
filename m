Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFA856AB8E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:12:17 +0200 (CEST)
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9WvA-0004TC-FW
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Weq-0005vV-I6
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wel-0001d4-Rz
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657220118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3btWgwqdjZi9Z7WYTcj4UpiN3YkzVWNlwPq6/1+kKWg=;
 b=e8gBRjSdsdOMwYCNJ45jKwEnEfMjzXAz80mZJJMfW/YYQCyz0VSrsdpFD+LR1vDjIS+1AA
 y25pjOwlfBuwrtVEi8ayw7C/WIwYRaiL5XD6E2iFT/a0JleVAEIUyD/Dpkcb3Q8aVyemfn
 7JO4LxUwmHq65+jSkrOfOELkEwczooI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-PB8LLBFXPJqjbDcVFwNzGg-1; Thu, 07 Jul 2022 14:55:14 -0400
X-MC-Unique: PB8LLBFXPJqjbDcVFwNzGg-1
Received: by mail-qk1-f198.google.com with SMTP id
 bk12-20020a05620a1a0c00b006b194656099so18613442qkb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 11:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3btWgwqdjZi9Z7WYTcj4UpiN3YkzVWNlwPq6/1+kKWg=;
 b=ZpmbmlaySYcWW2s5D8iunQBXg3TsMoxiyCq3Y2qj/ZKprtUr6BYYcxb3J5JjSCDyhd
 FDSkL4Oc9X7olrNpq2Eg0CeEUG4k0qkoh54YBIJf33VXxoBQQIXC+efvi9dtNJfODJYn
 kdvRGco6bhORw+WL/HzKDk91wXjYwcmb72m4FYMtMyreQg3Gi8WeW8PRK/ElhmIib6ir
 /a7TXNW4dc5uXepSLNRwiwch35DDMEYHUC5X+WcT6a0TtGwcS6qISV3UMorRGNDBWTsl
 88gWi0dsPI3HmhHs9aD3xx4akc5yJ9tDaxBwPz9zzHLQKj9mM5LhAtBPbV4WW9FQG5pt
 nsyA==
X-Gm-Message-State: AJIora9K6OtL7MAYB6Z6tAc7N5WRpdbhosV/4ZFFKUo4f+4Q9j7IUDZ3
 zv7TxX6ut4zY7ozdbRQHdTTzXjCLdHw7qjIEj8IBXdrPxeRBy/aKSVzaCxPzC2adajACOkLAk5V
 OXzorKl4MggbKxEw1IQURb2f5Ep6iPiaMQUNxrMY+lhsdN+8WKEdkFuvyHlJmDyvg
X-Received: by 2002:a05:622a:592:b0:31d:3fe0:55d8 with SMTP id
 c18-20020a05622a059200b0031d3fe055d8mr24372025qtb.461.1657220113793; 
 Thu, 07 Jul 2022 11:55:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v96CtoJNsGGbe/VazpJr4Qo1eZ8Uk0MaxYmFkZDq0TPUHmuisYAzScFQ81sAdfYAWPPgxbjg==
X-Received: by 2002:a05:622a:592:b0:31d:3fe0:55d8 with SMTP id
 c18-20020a05622a059200b0031d3fe055d8mr24371993qtb.461.1657220113411; 
 Thu, 07 Jul 2022 11:55:13 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 194-20020a370acb000000b006a8b6848556sm32195803qkk.7.2022.07.07.11.55.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Jul 2022 11:55:12 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v9 06/14] migration: Add property x-postcopy-preempt-break-huge
Date: Thu,  7 Jul 2022 14:55:11 -0400
Message-Id: <20220707185511.27366-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707185342.26794-1-peterx@redhat.com>
References: <20220707185342.26794-1-peterx@redhat.com>
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
index 5d113bd5cc..e10f0400ef 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4362,6 +4362,8 @@ static Property migration_properties[] = {
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
index 65b08c4edb..7cbe9c310d 100644
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


