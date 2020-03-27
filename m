Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADC0195C6E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 18:20:28 +0100 (CET)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHseh-0008Ql-Ok
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 13:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56723)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHsdd-0007fi-UG
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 13:19:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHsdc-000704-Ve
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 13:19:21 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:2392)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1jHsdc-0006yA-DN
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 13:19:20 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id 2eea5e7e3593603-df559;
 Sat, 28 Mar 2020 01:19:15 +0800 (CST)
X-RM-TRANSID: 2eea5e7e3593603-df559
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.localdomain (unknown[117.136.46.213])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65e7e358e8fc-5fce9;
 Sat, 28 Mar 2020 01:19:15 +0800 (CST)
X-RM-TRANSID: 2ee65e7e358e8fc-5fce9
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] migration: fix bad indentation in error_report()
Date: Sat, 28 Mar 2020 01:19:08 +0800
Message-Id: <09f7529c665cac0c6a5e032ac6fdb6ca701f7e37.1585329482.git.maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.81
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
 migration/migration.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index c4c9aee15e..2b7b5bccfa 100644
--- a/migration/migration.c
+++ b/migration/migration.c
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




