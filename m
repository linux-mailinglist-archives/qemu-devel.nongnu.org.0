Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E60D565E6C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 22:28:18 +0200 (CEST)
Received: from localhost ([::1]:34786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Sg5-0001EL-FK
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 16:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o8Sbk-0005LV-13
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o8Sbg-0004W6-Uq
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 16:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656966224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N3mn6fl/G/32+BvijXaoxWngCqJnaEpKVDQ1U6JB3Z8=;
 b=V4bHmaUfi2PsGV1tPjIC70e0PBWzL4Rs1MxfBjFtEVY6bfTovKa0pvTlv1+M1EvNo2q3Mz
 Ielh0heDwGHdSXpsBp5pKXetjo/5pj4/4fgpWXlpPsFx3vW2vqn7MO+y8RF8/u2YGB4GPp
 mYX3wHgBkgqRLVZGNXu9xc4GCVWH/9I=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-FiTrYU6QOACGJyX1Xfc7lA-1; Mon, 04 Jul 2022 16:23:43 -0400
X-MC-Unique: FiTrYU6QOACGJyX1Xfc7lA-1
Received: by mail-qk1-f200.google.com with SMTP id
 bp10-20020a05620a458a00b006b265587a17so7770137qkb.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 13:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N3mn6fl/G/32+BvijXaoxWngCqJnaEpKVDQ1U6JB3Z8=;
 b=x+id7tZsJcFEbzVgkN2bQdCs1zLoRF4//wxdfhuGoMbpFvz0NuSj8j3C9mPASYggst
 JChgxaEjT6XYKFmF0XS75CW3nymizP5qX3fCLh9xxTdArszasEh/MHPeREzX7peiQx+/
 IzFXIwKXK+2IFIEDjGo81wmBb4GtOZEIjtyGC+OFmr23n6XxDCwrXbHbuM7PFF6By6p9
 4PZJJhhx3aHlJFOnlzchtUK/FatLRbmuKyt8HuDfu4JUp5St4C2nERavXoG4/vc9qxZg
 US9xcH0S9bzV+wjURNiVR0nCDHkGXrpXszMwUgoz+1ON+/SMuxrNj3BvyhsQ2LFA4zad
 zsKQ==
X-Gm-Message-State: AJIora9o+FWkP1yzODLHcMIDvy1P47j4y0qj2vhVmK7FlLgLPXwHmUr5
 CqVMPVokm6yhyOlshkNoYyzwFsUbOnaOAgImyiDuRw6YyokrDMSzpECvt7EZtxXiHhnOGPwF6kH
 8ycDgGph6eZU750U=
X-Received: by 2002:a05:620a:cda:b0:6a6:8e47:8901 with SMTP id
 b26-20020a05620a0cda00b006a68e478901mr20842480qkj.231.1656966222616; 
 Mon, 04 Jul 2022 13:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tdzXsNZ9mFyIMxeiyPcPhx/R4gveMUCnp62gXCXDXzDeNhHQ4Jw/2biTSCEfOF33/zWUYuoA==
X-Received: by 2002:a05:620a:cda:b0:6a6:8e47:8901 with SMTP id
 b26-20020a05620a0cda00b006a68e478901mr20842462qkj.231.1656966222248; 
 Mon, 04 Jul 2022 13:23:42 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7ed:cb75:d392:178:9101:5763])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05620a0b8b00b006b25570d1c2sm9180127qkh.12.2022.07.04.13.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 13:23:41 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] Add dirty-sync-missed-zero-copy migration stat
Date: Mon,  4 Jul 2022 17:23:14 -0300
Message-Id: <20220704202315.507145-3-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220704202315.507145-1-leobras@redhat.com>
References: <20220704202315.507145-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 qapi/migration.json   | 7 ++++++-
 migration/migration.c | 2 ++
 monitor/hmp-cmds.c    | 4 ++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 7102e474a6..fed08b9b88 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -55,6 +55,10 @@
 # @postcopy-bytes: The number of bytes sent during the post-copy phase
 #                  (since 7.0).
 #
+# @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
+#                               not avoid copying zero pages.  This is between 0
+#                               and @dirty-sync-count * @multifd-channels.
+#                               (since 7.1)
 # Since: 0.14
 ##
 { 'struct': 'MigrationStats',
@@ -65,7 +69,8 @@
            'postcopy-requests' : 'int', 'page-size' : 'int',
            'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64',
            'precopy-bytes' : 'uint64', 'downtime-bytes' : 'uint64',
-           'postcopy-bytes' : 'uint64' } }
+           'postcopy-bytes' : 'uint64',
+           'dirty-sync-missed-zero-copy' : 'uint64' } }
 
 ##
 # @XBZRLECacheStats:
diff --git a/migration/migration.c b/migration/migration.c
index 78f5057373..048f7f8bdb 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1027,6 +1027,8 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->normal_bytes = ram_counters.normal * page_size;
     info->ram->mbps = s->mbps;
     info->ram->dirty_sync_count = ram_counters.dirty_sync_count;
+    info->ram->dirty_sync_missed_zero_copy =
+            ram_counters.dirty_sync_missed_zero_copy;
     info->ram->postcopy_requests = ram_counters.postcopy_requests;
     info->ram->page_size = page_size;
     info->ram->multifd_bytes = ram_counters.multifd_bytes;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index ca98df0495..5f3be9e405 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -307,6 +307,10 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
                            info->ram->postcopy_bytes >> 10);
         }
+        if (info->ram->dirty_sync_missed_zero_copy) {
+            monitor_printf(mon, "missed zero-copy on: %" PRIu64 " iterations\n",
+                           info->ram->dirty_sync_missed_zero_copy);
+        }
     }
 
     if (info->has_disk) {
-- 
2.36.1


