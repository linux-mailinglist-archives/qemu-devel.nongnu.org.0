Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48694CCC87
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Oct 2019 21:47:14 +0200 (CEST)
Received: from localhost ([::1]:58638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGq1J-0003dI-8P
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 15:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iGpzD-0001w6-51
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 15:45:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iGpzB-0008Gx-Nz
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 15:45:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1iGpz7-0008Ej-9B; Sat, 05 Oct 2019 15:44:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7C15A307D844;
 Sat,  5 Oct 2019 19:44:56 +0000 (UTC)
Received: from probe.redhat.com (ovpn-120-66.rdu2.redhat.com [10.10.120.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E926E5B681;
 Sat,  5 Oct 2019 19:44:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] MAINTAINERS: Add Vladimir as a reviewer for bitmaps
Date: Sat,  5 Oct 2019 15:44:48 -0400
Message-Id: <20191005194448.16629-2-jsnow@redhat.com>
In-Reply-To: <20191005194448.16629-1-jsnow@redhat.com>
References: <20191005194448.16629-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Sat, 05 Oct 2019 19:44:56 +0000 (UTC)
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I already try to make sure all bitmaps patches have been reviewed by both
Red Hat and Virtuozzo anyway, so this formalizes the arrangement.

Fam meanwhile is no longer as active, so I am removing him as a co-mainta=
iner
simply to reflect the current practice.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21264eae9c4..87e80ae110c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1818,8 +1818,8 @@ F: qapi/transaction.json
 T: git https://repo.or.cz/qemu/armbru.git block-next
=20
 Dirty Bitmaps
-M: Fam Zheng <fam@euphon.net>
 M: John Snow <jsnow@redhat.com>
+R: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: util/hbitmap.c
@@ -1828,7 +1828,6 @@ F: include/qemu/hbitmap.h
 F: include/block/dirty-bitmap.h
 F: tests/test-hbitmap.c
 F: docs/interop/bitmaps.rst
-T: git https://github.com/famz/qemu.git bitmaps
 T: git https://github.com/jnsnow/qemu.git bitmaps
=20
 Character device backends
--=20
2.21.0


