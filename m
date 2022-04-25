Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA350ECDE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:52:24 +0200 (CEST)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8VD-00044U-4K
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IR-0007S6-KU
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IQ-0007lW-12
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gtNv1DxIePLTzveSRj6tKkTCkAbWSCUPFKNOY6OzAIg=;
 b=METkfk96rNUsfUbsqk+c+gZNTVuctFUHhdzjn/nfuNR2RUYEGMKYHM2C6KXr5ZIylfGfoY
 GDhJ9o6ZmQWkemM7Tzf+/W7HEsn7Ku6gS/nFK/LE5XPPhX/7xkjWTCVnww+vbhs+10/H0H
 VQLcNMh4XiOKHcPN2bQ7xLYZ0H6vmDk=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-nn9xTvJzNkSbee9Pmd-d4w-1; Mon, 25 Apr 2022 19:39:08 -0400
X-MC-Unique: nn9xTvJzNkSbee9Pmd-d4w-1
Received: by mail-io1-f72.google.com with SMTP id
 x8-20020a056602160800b00654b3a46b66so12501734iow.19
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtNv1DxIePLTzveSRj6tKkTCkAbWSCUPFKNOY6OzAIg=;
 b=I5bTC6ZZfDLiGgRCjqGpgwueE937JfTJxuVh378ynPrwyxL/unzZybr6nPrq58FSa8
 JgSPmGME52A5hf1+wWH48suATu9bBX6UqMuzBhUCbEsYXLhupeFi6rHHRXFq6ev7f1eV
 CzcCIJjz2ds76SSS751AW1UWbrcisOegFdBJf2L9hbfUP5iflW6gMI+n+NuPJwFBYKer
 DNBtEe0L67jrxAGKDAsQrj+ul1IRb03mZmaYCDwq1aSQch9609Ydn+lnOQvyBoeEThwe
 rdVkogYtGybskvZt6J01/H0GufbC4lYby/lXLK3uT5vOhk25BqXFgr2FaUqE8w9ope+8
 e51g==
X-Gm-Message-State: AOAM533qBmqUYMex82kdbZui5jqagVCYQITrGswcbuML7nxGxj59urMn
 E4PIL+APHDYkQ9F7iJ/uoqbmkR09AMfUggOCCv4URukWZ+/nUli8Fq7LsB78tpNzlHKOgmfv/2L
 cRDpJ0TezoEUxGDfzilIwIz9cWbufvfS08xRhdrJEvJrD7y8vO8Go6s7YMKxukgam
X-Received: by 2002:a05:6602:2d06:b0:655:3324:4cc8 with SMTP id
 c6-20020a0566022d0600b0065533244cc8mr8596283iow.74.1650929947409; 
 Mon, 25 Apr 2022 16:39:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnKIJRW7V+59IEcEwI2vPvoO9DZXWCZfl+yEAmh33fTim1XAJffdhEzg4jkvIQ3Fx4uZraIA==
X-Received: by 2002:a05:6602:2d06:b0:655:3324:4cc8 with SMTP id
 c6-20020a0566022d0600b0065533244cc8mr8596270iow.74.1650929947127; 
 Mon, 25 Apr 2022 16:39:07 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.39.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:39:06 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/21] migration: Parameter x-postcopy-preempt-break-huge
Date: Mon, 25 Apr 2022 19:38:41 -0400
Message-Id: <20220425233847.10393-16-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
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
index cce741e20e..cd9650f2e2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4329,6 +4329,8 @@ static Property migration_properties[] = {
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
index a4b39e3675..f3a79c8556 100644
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


