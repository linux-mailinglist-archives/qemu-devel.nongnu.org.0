Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4739D2D8BF
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 11:14:01 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVuem-0004DS-FZ
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 05:14:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hVudi-0003nv-Bf
	for qemu-devel@nongnu.org; Wed, 29 May 2019 05:12:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hVudh-00060U-B4
	for qemu-devel@nongnu.org; Wed, 29 May 2019 05:12:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42348)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hVudh-00060D-6n; Wed, 29 May 2019 05:12:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7841861980;
	Wed, 29 May 2019 09:12:47 +0000 (UTC)
Received: from localhost (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2637C171B4;
	Wed, 29 May 2019 09:12:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
Date: Wed, 29 May 2019 11:12:43 +0200
Message-Id: <20190529091243.25562-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 29 May 2019 09:12:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] MAINTAINERS: cover tests/migration/s390x/
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
Cc: Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generic s390 section looks like the best resting place.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f5f8b7a2c37..0be23997e9fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -102,6 +102,7 @@ F: pc-bios/s390-ccw/
 F: pc-bios/s390-ccw.img
 F: target/s390x/
 F: docs/vfio-ap.txt
+F: tests/migration/s390x/
 K: ^Subject:.*(?i)s390x?
 T: git https://github.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
--=20
2.20.1


