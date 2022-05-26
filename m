Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7998C534ED1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 14:08:28 +0200 (CEST)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuCHz-0003Xg-7B
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 08:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nuC5G-00011u-F9; Thu, 26 May 2022 07:55:19 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:59096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1nuC58-000415-Is; Thu, 26 May 2022 07:55:14 -0400
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 8606C2E1F44;
 Thu, 26 May 2022 14:54:57 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 AcJbBqlL0n-suJSWTlG; Thu, 26 May 2022 14:54:57 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1653566097; bh=96eOjiNTJYUXfnhpJY0Zvj7pCa4uELXFra1uFDf6WrU=;
 h=Cc:Message-Id:Date:Subject:To:From;
 b=zoSVKGJc55p9Nqpe6U3hNxPPMZxLs2nGyLtYpCQfe0qJGBnZ201gm4XdVZPjwpe9F
 K/iaxuFhMKnpd8ERCN1opOVDba03bNWAamTCPK1F+fgY4IzZVd7omf2wYnpu16Ndqu
 +KkukNGedIjXmk0qzE9RPE2Tpou7ey4p8N0NESyo=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b53f::1:17])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 h3CnA3vyof-suM8GqV0; Thu, 26 May 2022 14:54:56 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, eblake@redhat.com, den@openvz.org, kwolf@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, den-plotnikov@yandex-team.ru,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH] MAINTAINERS: update Vladimir's address and repositories
Date: Thu, 26 May 2022 14:54:32 +0300
Message-Id: <20220526115432.138384-1-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---

Hi all!

Finally, I'm at Yandex, so that's my new address. I don't think .mailmap
or contrib/gitdm/aliases really need to be updated.

I send this patch now, but let me send one-two series from new address
before merging this, to be sure that everything work properly with new
email.

 MAINTAINERS | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dff0200f70..3fd85d392e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2508,7 +2508,7 @@ F: scsi/*
 
 Block Jobs
 M: John Snow <jsnow@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: blockjob.c
@@ -2533,7 +2533,7 @@ F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
 F: include/qemu/co-shared-resource.h
 T: git https://gitlab.com/jsnow/qemu.git jobs
-T: git https://src.openvz.org/scm/~vsementsov/qemu.git jobs
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 Block QAPI, monitor, command line
 M: Markus Armbruster <armbru@redhat.com>
@@ -2554,7 +2554,7 @@ F: include/hw/cxl/
 
 Dirty Bitmaps
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 R: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
@@ -2568,6 +2568,7 @@ F: util/hbitmap.c
 F: tests/unit/test-hbitmap.c
 F: docs/interop/bitmaps.rst
 T: git https://repo.or.cz/qemu/ericb.git bitmaps
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 Character device backends
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
@@ -2778,16 +2779,17 @@ F: scripts/*.py
 F: tests/*.py
 
 Benchmark util
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 S: Maintained
 F: scripts/simplebench/
-T: git https://src.openvz.org/scm/~vsementsov/qemu.git simplebench
+T: git https://gitlab.com/vsementsov/qemu.git simplebench
 
 Transactions helper
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 S: Maintained
 F: include/qemu/transactions.h
 F: util/transactions.c
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 QAPI
 M: Markus Armbruster <armbru@redhat.com>
@@ -3364,7 +3366,7 @@ F: block/iscsi-opts.c
 
 Network Block Device (NBD)
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 L: qemu-block@nongnu.org
 S: Maintained
 F: block/nbd*
@@ -3376,7 +3378,7 @@ F: docs/interop/nbd.txt
 F: docs/tools/qemu-nbd.rst
 F: tests/qemu-iotests/tests/*nbd*
 T: git https://repo.or.cz/qemu/ericb.git nbd
-T: git https://src.openvz.org/scm/~vsementsov/qemu.git nbd
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 NFS
 M: Peter Lieven <pl@kamp.de>
@@ -3461,13 +3463,13 @@ F: block/dmg.c
 parallels
 M: Stefan Hajnoczi <stefanha@redhat.com>
 M: Denis V. Lunev <den@openvz.org>
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
 F: block/parallels-ext.c
 F: docs/interop/parallels.txt
-T: git https://src.openvz.org/scm/~vsementsov/qemu.git parallels
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 qed
 M: Stefan Hajnoczi <stefanha@redhat.com>
-- 
2.25.1


