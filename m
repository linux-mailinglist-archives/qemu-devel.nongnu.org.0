Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CB26BE60B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 10:58:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd6qM-00053n-P7; Fri, 17 Mar 2023 05:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a_lijiejun@163.com>)
 id 1pd6qK-00053P-Ep
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 05:57:48 -0400
Received: from m12.mail.163.com ([220.181.12.215])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <a_lijiejun@163.com>) id 1pd6qG-0004rB-Le
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 05:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=y0bAwDgEqfgSryRZH225O/2EPGxCX3YNKX5eqLi8Dm4=;
 b=JQDmjnpQuSvopsmaPLKvH2PH62PSxyOYTvewRAWHe3yyeTXqzOjHrvvptrlljs
 YvMW1QJ9OZiTgqt8u0gwlr70ittg8UtjvyXoM0Ebm131WVoB9UB/o8AMlVrglUcw
 ctZ8P09LqNvlIbpBJGeK9XRC+QKSr8Vfs4yvVOrBnkQj0=
Received: from ovirt45-3.com.com (unknown [183.62.127.91])
 by zwqz-smtp-mta-g2-4 (Coremail) with SMTP id _____wDX3R57ORRkBx3NAA--.11767S2;
 Fri, 17 Mar 2023 17:57:27 +0800 (CST)
From: =?UTF-8?q?=E6=9D=8E=E7=9A=86=E4=BF=8A?= <a_lijiejun@163.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?=E6=9D=8E=E7=9A=86=E4=BF=8A?= <a_lijiejun@163.com>
Subject: [PATCH] migration: remove extra whitespace character for code style
Date: Fri, 17 Mar 2023 09:57:13 +0000
Message-Id: <20230317095713.1539556-1-a_lijiejun@163.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDX3R57ORRkBx3NAA--.11767S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4R6c_6DUUUU
X-Originating-IP: [183.62.127.91]
X-CM-SenderInfo: pdboxyplhm30i6rwjhhfrp/1tbiKAg1FF7WMWUq9QAAsC
Received-SPF: pass client-ip=220.181.12.215; envelope-from=a_lijiejun@163.com;
 helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix code style.

Signed-off-by: 李皆俊 <a_lijiejun@163.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 96e8a19a58..46c0c8dbb9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3295,7 +3295,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
 
     migration_ops = g_malloc0(sizeof(MigrationOps));
     migration_ops->ram_save_target_page = ram_save_target_page_legacy;
-    ret =  multifd_send_sync_main(f);
+    ret = multifd_send_sync_main(f);
     if (ret < 0) {
         return ret;
     }
-- 
2.39.1


