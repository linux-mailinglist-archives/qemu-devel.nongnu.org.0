Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4E064CB6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 21:25:55 +0200 (CEST)
Received: from localhost ([::1]:36426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlIDv-0000lK-VA
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 15:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37416)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hlIBX-0007dT-9n
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 15:23:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hlIBV-0008OH-9x
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 15:23:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57500)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hlIBR-00083r-Bl; Wed, 10 Jul 2019 15:23:17 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EEE4A307CB38;
 Wed, 10 Jul 2019 19:23:08 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-130.bos.redhat.com [10.18.17.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E1A260BFB;
 Wed, 10 Jul 2019 19:23:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 Jul 2019 15:23:04 -0400
Message-Id: <20190710192306.28604-2-jsnow@redhat.com>
In-Reply-To: <20190710192306.28604-1-jsnow@redhat.com>
References: <20190710192306.28604-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 10 Jul 2019 19:23:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 1/3] docs/interop/bitmaps.rst: Fix typos
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
Cc: peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-stable@nongnu.org, jsnow@redhat.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pygments and Sphinx get pickier all the time; Sphinx 2.1+ now catches
these errors.

Signed-off-by: John Snow <jsnow@redhat.com>
Reported-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-id: 20190603214653.29369-2-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/interop/bitmaps.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/interop/bitmaps.rst b/docs/interop/bitmaps.rst
index 510e8809a9..c29ac4a854 100644
--- a/docs/interop/bitmaps.rst
+++ b/docs/interop/bitmaps.rst
@@ -399,7 +399,7 @@ in any one source bitmap, the target bitmap will mark=
 that segment dirty.
        "arguments": {
          "node": "drive0",
          "target": "new_bitmap",
-         "bitmaps: [ "bitmap0" ]
+         "bitmaps": [ "bitmap0" ]
        }
      }
=20
@@ -1437,7 +1437,7 @@ applied:
    .. code:: json
=20
     <- {
-         "timestamp": {...}
+         "timestamp": {...},
          "data": {
            "device": "drive0",
            "type": "backup",
--=20
2.21.0


