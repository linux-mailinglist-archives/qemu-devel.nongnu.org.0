Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E886B563788
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:14:28 +0200 (CEST)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JHn-0003Uc-HS
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o7J3v-0005uJ-NU
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o7J3t-00029p-Pj
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656691203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weEDhLP+HkUUeHkBQT4/dm1FL8tAWysBJWcUYF2yEL0=;
 b=aebmPbap0q1jYVFh7hgHll/6yfDZdC6mXvwKU4TF1jTnCjgxeKGv/HCsLh5kTNliGhp1yJ
 5Ecyj/FjvZW2dqMHXSXW9xNh/kKShBDMbv7UU9Bj6XxDDF6wvBn1huawctC0T7hU0/bFfm
 6fRWTv6XVLf2a6H6bg1oOxfwKfYZYAU=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-Yxxvy4UVMX2E-KCQZAwx_Q-1; Fri, 01 Jul 2022 12:00:00 -0400
X-MC-Unique: Yxxvy4UVMX2E-KCQZAwx_Q-1
Received: by mail-oi1-f198.google.com with SMTP id
 bd1-20020a056808220100b0032ed33d656cso1557998oib.21
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 09:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=weEDhLP+HkUUeHkBQT4/dm1FL8tAWysBJWcUYF2yEL0=;
 b=lM6J45Ab38Du8jkq57Y4YeyUKq9lX7AY7CHu/SYBnMRgrorcttnRHVeW4q8mHk7Gx4
 j9iYS3DG/+Hgi/+htYoABDZsJuWz4JFcIq/ecWPQcoO4w8fAUkIMoZ7he9hF+fba3878
 5SSBZ1iqbGQC1N5ySeovPI/W8/So3Tx50q0q9SCZrDiSyJw/Y2eg7eJbkU8KpmS1xr3B
 IwDy3+PF9MEWif5f8EFOHUo1Pk2wP6dpZotSFsYQ5O9D0j7wRYXh9QlApaULLjn4ozk/
 YbvbZq9xoixxUmQ98F6HfDS3o1DyUjpyjt5IGqNyNa5moTj6tnYCa/4CGZR6bNYyNJWX
 Odag==
X-Gm-Message-State: AJIora9yVKh7qBMQ/JMVPoWPLPBwfuvMaRuxrg3mDSdNMA9BAdJ2KSb4
 SUnAj+62//3wiWxqVrUiffTCpLhih26+L8WptnT5qqObM+I5QucGeEsN83FRHuUCiH5+1z3rvdk
 o1goIBo8qb8CWMnU=
X-Received: by 2002:a05:6870:f719:b0:d6:e0c0:af42 with SMTP id
 ej25-20020a056870f71900b000d6e0c0af42mr8779595oab.165.1656691199638; 
 Fri, 01 Jul 2022 08:59:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sSFZPRSHW60RG8x4MeJby40AwE36tYdd67RWijH1dsC8YJ/l3YSZ7OxKb9SkBC20D4CV8avw==
X-Received: by 2002:a05:6870:f719:b0:d6:e0c0:af42 with SMTP id
 ej25-20020a056870f71900b000d6e0c0af42mr8779576oab.165.1656691199422; 
 Fri, 01 Jul 2022 08:59:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f1:da6a:610c:873d:4fe2:e6ce])
 by smtp.gmail.com with ESMTPSA id
 n39-20020a056870972700b000f333ac991fsm14884274oaq.27.2022.07.01.08.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 08:59:58 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] Add zero-copy-copied migration stat
Date: Fri,  1 Jul 2022 12:59:35 -0300
Message-Id: <20220701155935.482503-3-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701155935.482503-1-leobras@redhat.com>
References: <20220701155935.482503-1-leobras@redhat.com>
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
 qapi/migration.json   | 5 ++++-
 migration/migration.c | 1 +
 monitor/hmp-cmds.c    | 4 ++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 7102e474a6..925f009868 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -55,6 +55,9 @@
 # @postcopy-bytes: The number of bytes sent during the post-copy phase
 #                  (since 7.0).
 #
+# @zero-copy-copied: The number of zero-copy flushes that reported data sent
+#                    using zero-copy that ended up being copied. (since 7.2)
+#
 # Since: 0.14
 ##
 { 'struct': 'MigrationStats',
@@ -65,7 +68,7 @@
            'postcopy-requests' : 'int', 'page-size' : 'int',
            'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64',
            'precopy-bytes' : 'uint64', 'downtime-bytes' : 'uint64',
-           'postcopy-bytes' : 'uint64' } }
+           'postcopy-bytes' : 'uint64', 'zero-copy-copied' : 'uint64' } }
 
 ##
 # @XBZRLECacheStats:
diff --git a/migration/migration.c b/migration/migration.c
index 78f5057373..68fc3894ba 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1034,6 +1034,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->precopy_bytes = ram_counters.precopy_bytes;
     info->ram->downtime_bytes = ram_counters.downtime_bytes;
     info->ram->postcopy_bytes = ram_counters.postcopy_bytes;
+    info->ram->zero_copy_copied = ram_counters.zero_copy_copied;
 
     if (migrate_use_xbzrle()) {
         info->has_xbzrle_cache = true;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index ca98df0495..bcb1799543 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -307,6 +307,10 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
                            info->ram->postcopy_bytes >> 10);
         }
+        if (info->ram->zero_copy_copied) {
+            monitor_printf(mon, "zero-copy copied: %" PRIu64 " iterations\n",
+                           info->ram->zero_copy_copied);
+        }
     }
 
     if (info->has_disk) {
-- 
2.36.1


