Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325194C8752
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:04:33 +0100 (CET)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyQq-0000jd-7a
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:04:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3i-0004UR-Ca
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3f-0008M3-DH
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UApSsKIRKkSZ48pbdKt2A0O84YoHKmN0sdhMzMfmg3k=;
 b=VkJVgEBZq9DCBms3dZbUedz41iU02a8Kgkp4/tJmlJgCPn3PCZKO+Dfpw+DWTzc2UqpPls
 ZOGmAvMHoSK/RHcRsJ6H4RLOt2ApCYcQzrJreurYrdLpE9dGe1Wz9Qlh/vMBy4pdkcsoJG
 mTzz2ydyUS4IfayEG5CB8V6EBF09ne4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-yrVb9k40MzyIktwuapXW9g-1; Tue, 01 Mar 2022 03:40:33 -0500
X-MC-Unique: yrVb9k40MzyIktwuapXW9g-1
Received: by mail-pl1-f199.google.com with SMTP id
 c12-20020a170902848c00b0015025f53e9cso4545630plo.7
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UApSsKIRKkSZ48pbdKt2A0O84YoHKmN0sdhMzMfmg3k=;
 b=XnqOMyTL6Nv/vJT21Mv1J++tXdZ3+/XJ5ZOd/5HWKZNfZY+Petx+7sXCDs29c4geET
 5oTqlilXJwH0fvWorqdW59pcKZyjmcRqFRidK1TIL6uMXrzTXT4ylLGoYfFI0Mt+mRJb
 Qqwamt1+4/qi/lre+X/e9n8oxSFF6WAswGWvEGwhr3v2UtBoSvB2Cn+ywXTNbbRilgsr
 Wr90ANujFwtJ/KDczMXcmx+6bLBcqu7sjJ/EWGTqZ/8i+6VA43ovIn9F9Gz/nQmAvdm2
 WeEh4ovbXi4RTiArcIOZQRwSVl6nYHCUBaz2K9wNXAJQIKCbyOW2zrOXuiBCa7lyVQPh
 nuxQ==
X-Gm-Message-State: AOAM53078kLUzMJ+o0YwrxolGBsbKgTjTflX6+HViu8QJPonhU+XQZGK
 3CbzVv1+lhqdlHYhve/b5IGsUtTjCftCsvwxGLqBSAGy7e7j06fbMPOIv9X23uXY04eLBQNVzc3
 dJw7FgCfb0v2SOeuTIYawoZTdS2FlnfARiPicREHqysGi74NqqRibklTBQAL8Evyr
X-Received: by 2002:a63:e543:0:b0:373:efe3:6f46 with SMTP id
 z3-20020a63e543000000b00373efe36f46mr21052856pgj.183.1646124032567; 
 Tue, 01 Mar 2022 00:40:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnHBnzGV3M7F/woRV0OD3df33i693Nj7v4rkONr7iDlD7UB7PSlAzE4xKS+4ZHTvHlW/ILjA==
X-Received: by 2002:a63:e543:0:b0:373:efe3:6f46 with SMTP id
 z3-20020a63e543000000b00373efe36f46mr21052831pgj.183.1646124032201; 
 Tue, 01 Mar 2022 00:40:32 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:31 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/25] migration: Parameter x-postcopy-preempt-break-huge
Date: Tue,  1 Mar 2022 16:39:21 +0800
Message-Id: <20220301083925.33483-22-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
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
index 78e1e6bfb9..cd4a150202 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4325,6 +4325,8 @@ static Property migration_properties[] = {
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
index 53dfd9be38..ede8aaac01 100644
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


