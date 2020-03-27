Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B421952AA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 09:14:05 +0100 (CET)
Received: from localhost ([::1]:38322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHk7w-0002EU-3t
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 04:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHk78-0001oi-CE
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 04:13:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHk76-00038B-Ou
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 04:13:13 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:2591)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHk75-0002tl-Jo
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 04:13:12 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35e7db56dccc-d6c1d;
 Fri, 27 Mar 2020 16:12:29 +0800 (CST)
X-RM-TRANSID: 2ee35e7db56dccc-d6c1d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee55e7db568752-9bf3b;
 Fri, 27 Mar 2020 16:12:28 +0800 (CST)
X-RM-TRANSID: 2ee55e7db568752-9bf3b
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] migration: fix bad indentation in error_report()
Date: Fri, 27 Mar 2020 16:12:21 +0800
Message-Id: <20200327081221.201520-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: dgilbert@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bad indentation conflicts with CODING_STYLE doc.

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 migration/migration.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index c4c9aee15e..aa43137bd2 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1203,15 +1203,15 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
 
     if (params->has_max_bandwidth && (params->max_bandwidth > SIZE_MAX)) {
         error_setg(errp, "Parameter 'max_bandwidth' expects an integer in the"
-                         " range of 0 to %zu bytes/second", SIZE_MAX);
+                   " range of 0 to %zu bytes/second", SIZE_MAX);
         return false;
     }
 
     if (params->has_downtime_limit &&
         (params->downtime_limit > MAX_MIGRATE_DOWNTIME)) {
         error_setg(errp, "Parameter 'downtime_limit' expects an integer in "
-                         "the range of 0 to %d milliseconds",
-                         MAX_MIGRATE_DOWNTIME);
+                   "the range of 0 to %d milliseconds",
+                   MAX_MIGRATE_DOWNTIME);
         return false;
     }
 
@@ -2109,8 +2109,8 @@ void qmp_migrate_set_downtime(double value, Error **errp)
 {
     if (value < 0 || value > MAX_MIGRATE_DOWNTIME_SECONDS) {
         error_setg(errp, "Parameter 'downtime_limit' expects an integer in "
-                         "the range of 0 to %d seconds",
-                         MAX_MIGRATE_DOWNTIME_SECONDS);
+                   "the range of 0 to %d seconds",
+                   MAX_MIGRATE_DOWNTIME_SECONDS);
         return;
     }
 
@@ -2495,7 +2495,7 @@ retry:
         if (header_type >= MIG_RP_MSG_MAX ||
             header_type == MIG_RP_MSG_INVALID) {
             error_report("RP: Received invalid message 0x%04x length 0x%04x",
-                    header_type, header_len);
+                         header_type, header_len);
             mark_source_rp_bad(ms);
             goto out;
         }
@@ -2504,9 +2504,9 @@ retry:
             header_len != rp_cmd_args[header_type].len) ||
             header_len > sizeof(buf)) {
             error_report("RP: Received '%s' message (0x%04x) with"
-                    "incorrect length %d expecting %zu",
-                    rp_cmd_args[header_type].name, header_type, header_len,
-                    (size_t)rp_cmd_args[header_type].len);
+                         "incorrect length %d expecting %zu",
+                         rp_cmd_args[header_type].name, header_type, header_len,
+                         (size_t)rp_cmd_args[header_type].len);
             mark_source_rp_bad(ms);
             goto out;
         }
@@ -2561,7 +2561,7 @@ retry:
             }
             if (header_len != expected_len) {
                 error_report("RP: Req_Page_id with length %d expecting %zd",
-                        header_len, expected_len);
+                             header_len, expected_len);
                 mark_source_rp_bad(ms);
                 goto out;
             }
-- 
2.17.1




