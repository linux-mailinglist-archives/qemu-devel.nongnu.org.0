Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62849DB966
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 23:59:34 +0200 (CEST)
Received: from localhost ([::1]:60922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLDnw-0002xq-Uq
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 17:59:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iLDk9-0007m7-Cj
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 17:55:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iLDk7-0002jM-Ub
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 17:55:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51794)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iLDk5-0002hT-9o; Thu, 17 Oct 2019 17:55:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6284FC0495A3;
 Thu, 17 Oct 2019 21:55:31 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-173.bos.redhat.com [10.18.17.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0980A5D9CA;
 Thu, 17 Oct 2019 21:55:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, jsnow@redhat.com,
 qemu-devel@nongnu.org
Subject: [PULL v3 18/19] MAINTAINERS: Add Vladimir as a reviewer for bitmaps
Date: Thu, 17 Oct 2019 17:54:35 -0400
Message-Id: <20191017215436.14252-19-jsnow@redhat.com>
In-Reply-To: <20191017215436.14252-1-jsnow@redhat.com>
References: <20191017215436.14252-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 17 Oct 2019 21:55:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I already try to make sure all bitmaps patches have been reviewed by both
Red Hat and Virtuozzo anyway, so this formalizes the arrangement.

Fam meanwhile is no longer as active, so I am removing him as a co-mainta=
iner
simply to reflect the current practice.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20191005194448.16629-2-jsnow@redhat.com
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe4dc51b08..250ce8e7a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1816,8 +1816,8 @@ F: qapi/transaction.json
 T: git https://repo.or.cz/qemu/armbru.git block-next
=20
 Dirty Bitmaps
-M: Fam Zheng <fam@euphon.net>
 M: John Snow <jsnow@redhat.com>
+R: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: util/hbitmap.c
@@ -1826,7 +1826,6 @@ F: include/qemu/hbitmap.h
 F: include/block/dirty-bitmap.h
 F: tests/test-hbitmap.c
 F: docs/interop/bitmaps.rst
-T: git https://github.com/famz/qemu.git bitmaps
 T: git https://github.com/jnsnow/qemu.git bitmaps
=20
 Character device backends
--=20
2.21.0


