Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D0454AEE1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:57:48 +0200 (CEST)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o14F1-0001oG-Gi
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13o6-0001Tz-2q; Tue, 14 Jun 2022 06:29:58 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:36768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nm-0000lN-T8; Tue, 14 Jun 2022 06:29:56 -0400
Received: from sas1-9c28cd37d27b.qloud-c.yandex.net
 (sas1-9c28cd37d27b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:309b:0:640:9c28:cd37])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id BFF672E1255;
 Tue, 14 Jun 2022 13:29:30 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas1-9c28cd37d27b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 VyNQx1hCXU-TUJOctTb; Tue, 14 Jun 2022 13:29:30 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655202570; bh=ku8ALIX79cuIuWCmpiM0B9OceimAuKaWvZg7Px4M9uU=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=ELZs6FN7+BxdpF9zQti6YJ28Obcc6eSjoddVeD7uUC/yvqRX5ith4Jw5k6W76XNae
 WyUZkKTuHo7mmi7gMWnlELMylxTY5RUIwbTH6C9JmOJjtEigVRYNi/yf0UD+GMSUbX
 YHzbZFFxGIzxu4nsrYHoejFYCVMUvaczqeSgqqFQ=
Authentication-Results: sas1-9c28cd37d27b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 15x97ivcvu-TUMmC2L6; Tue, 14 Jun 2022 13:29:30 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru, peter.maydell@linaro.org
Subject: [PULL 10/10] MAINTAINERS: update Vladimir's address and repositories
Date: Tue, 14 Jun 2022 13:29:10 +0300
Message-Id: <20220614102910.1431380-11-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
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
 MAINTAINERS | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0df25ed4b0..9e37bfe279 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2538,7 +2538,7 @@ F: scsi/*
 
 Block Jobs
 M: John Snow <jsnow@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: blockjob.c
@@ -2563,7 +2563,7 @@ F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
 F: include/qemu/co-shared-resource.h
 T: git https://gitlab.com/jsnow/qemu.git jobs
-T: git https://src.openvz.org/scm/~vsementsov/qemu.git jobs
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 Block QAPI, monitor, command line
 M: Markus Armbruster <armbru@redhat.com>
@@ -2584,7 +2584,7 @@ F: include/hw/cxl/
 
 Dirty Bitmaps
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 R: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
@@ -2598,6 +2598,7 @@ F: util/hbitmap.c
 F: tests/unit/test-hbitmap.c
 F: docs/interop/bitmaps.rst
 T: git https://repo.or.cz/qemu/ericb.git bitmaps
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 Character device backends
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
@@ -2808,16 +2809,17 @@ F: scripts/*.py
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
@@ -3394,7 +3396,7 @@ F: block/iscsi-opts.c
 
 Network Block Device (NBD)
 M: Eric Blake <eblake@redhat.com>
-M: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
+M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 L: qemu-block@nongnu.org
 S: Maintained
 F: block/nbd*
@@ -3406,7 +3408,7 @@ F: docs/interop/nbd.txt
 F: docs/tools/qemu-nbd.rst
 F: tests/qemu-iotests/tests/*nbd*
 T: git https://repo.or.cz/qemu/ericb.git nbd
-T: git https://src.openvz.org/scm/~vsementsov/qemu.git nbd
+T: git https://gitlab.com/vsementsov/qemu.git block
 
 NFS
 M: Peter Lieven <pl@kamp.de>
@@ -3491,13 +3493,13 @@ F: block/dmg.c
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


