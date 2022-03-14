Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8984D86EA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:24:54 +0100 (CET)
Received: from localhost ([::1]:58518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlcy-0003Ct-U5
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:24:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTiVQ-0005zw-BK; Mon, 14 Mar 2022 07:04:52 -0400
Received: from forward105j.mail.yandex.net ([5.45.198.248]:58008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTiVN-0006rd-CW; Mon, 14 Mar 2022 07:04:51 -0400
Received: from sas1-8a23c9b94e43.qloud-c.yandex.net
 (sas1-8a23c9b94e43.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2f2a:0:640:8a23:c9b9])
 by forward105j.mail.yandex.net (Yandex) with ESMTP id E58284EC7D5F;
 Mon, 14 Mar 2022 14:04:23 +0300 (MSK)
Received: from sas1-7a2c1d25dbfc.qloud-c.yandex.net
 (sas1-7a2c1d25dbfc.qloud-c.yandex.net [2a02:6b8:c08:c9f:0:640:7a2c:1d25])
 by sas1-8a23c9b94e43.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 igmqWUaDKn-4Neqs21i; Mon, 14 Mar 2022 14:04:23 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1647255863; bh=LjuqOYX2g8THNlGPnkJZsysT+y+IEix4OVp3Odze1yQ=;
 h=Date:Subject:Cc:To:From:Message-Id;
 b=oUEustM3YL4GRL4CqLe+JELAUDiDClrlhg5FIL/JO9w3nlFag4TtDEZ2Hz+Bopwdg
 /28gygXUwFmeAvrkBxjKmBjdqyqAGpPETOv1+x/tZ46YrRX8sXEXOWhpOKLn1ekGbH
 8Mg5QQRfjVWpBjD7jx1vDFG0UZcRt46Lxq2GIYFk=
Authentication-Results: sas1-8a23c9b94e43.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
Received: by sas1-7a2c1d25dbfc.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id TJ391JcsCb-4NKeVOPP; Mon, 14 Mar 2022 14:04:23 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: change Vladimir's email address
Date: Mon, 14 Mar 2022 14:04:15 +0300
Message-Id: <20220314110415.222496-1-v.sementsov-og@ya.ru>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.198.248; envelope-from=v.sementsov-og@ya.ru;
 helo=forward105j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Mar 2022 10:11:08 -0400
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
Cc: peter.maydell@linaro.org, v.sementsov-og@ya.ru, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Old vsementsov@virtuozzo.com is not accessible anymore.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
---

Hi all!

That's my new address: v.sementsov-og@ya.ru , the old one is not
available anymore.

I've also subscribed this new address for qemu-devel mailing list, but
not yet get any message from it :(

The patch is also available as pgp-signed tag at:

  https://src.openvz.org/scm/~vsementsov/qemu.git tags/change-address


 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2e9ce1da2..8488de5c0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2500,7 +2500,7 @@ F: scsi/*
 
 Block Jobs
 M: John Snow <jsnow@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: blockjob.c
@@ -2539,7 +2539,7 @@ T: git https://repo.or.cz/qemu/armbru.git block-next
 
 Dirty Bitmaps
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
 R: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
@@ -2762,13 +2762,13 @@ F: scripts/*.py
 F: tests/*.py
 
 Benchmark util
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
 S: Maintained
 F: scripts/simplebench/
 T: git https://src.openvz.org/scm/~vsementsov/qemu.git simplebench
 
 Transactions helper
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
 S: Maintained
 F: include/qemu/transactions.h
 F: util/transactions.c
@@ -3352,7 +3352,7 @@ F: block/iscsi-opts.c
 
 Network Block Device (NBD)
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
 L: qemu-block@nongnu.org
 S: Maintained
 F: block/nbd*
@@ -3448,7 +3448,7 @@ F: block/dmg.c
 parallels
 M: Stefan Hajnoczi <stefanha@redhat.com>
 M: Denis V. Lunev <den@openvz.org>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
-- 
2.35.1


