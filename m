Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C099733A3A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 23:51:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXurL-000257-0q
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 17:51:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hXunh-0008F0-Re
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 17:47:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hXunX-00031j-6V
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 17:47:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41130)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1hXunO-0002XB-Ku; Mon, 03 Jun 2019 17:47:11 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57A303078AB6;
	Mon,  3 Jun 2019 21:47:01 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-164.bos.redhat.com [10.18.17.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82C5F61B6A;
	Mon,  3 Jun 2019 21:46:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Mon,  3 Jun 2019 17:46:51 -0400
Message-Id: <20190603214653.29369-2-jsnow@redhat.com>
In-Reply-To: <20190603214653.29369-1-jsnow@redhat.com>
References: <20190603214653.29369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 03 Jun 2019 21:47:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 1/3] docs/interop/bitmaps.rst: Fix typos
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pygments and Sphinx get pickier all the time; Sphinx 2.1+ now catches
these errors.

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
2.20.1


