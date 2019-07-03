Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323655EC88
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 21:11:31 +0200 (CEST)
Received: from localhost ([::1]:38760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hikfC-0005CC-EM
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 15:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39683)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ppandit@redhat.com>) id 1hikcZ-0003dx-VX
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 15:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ppandit@redhat.com>) id 1hikcZ-000895-5L
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 15:08:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60216)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ppandit@redhat.com>)
 id 1hikcW-000871-Jh; Wed, 03 Jul 2019 15:08:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 530DE3082E51;
 Wed,  3 Jul 2019 19:08:26 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-160.sin2.redhat.com
 [10.67.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18C05968A0;
 Wed,  3 Jul 2019 19:08:21 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Thu,  4 Jul 2019 00:36:15 +0530
Message-Id: <20190703190615.31436-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 03 Jul 2019 19:08:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/ssi/xilinx_spips: add lqspi_write routine
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Prasad J Pandit <pjp@fedoraproject.org>, Lei Sun <slei.casper@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Define skeleton lqspi_write routine. Avoid NULL dereference.

Reported-by: Lei Sun <slei.casper@gmail.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/ssi/xilinx_spips.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index 8115bb6d46..0836b8977a 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1221,8 +1221,15 @@ lqspi_read(void *opaque, hwaddr addr, unsigned int=
 size)
     }
 }
=20
+static void
+lqspi_write(void *opaque, hwaddr addr, uint64_t data, unsigned size)
+{
+    return;
+}
+
 static const MemoryRegionOps lqspi_ops =3D {
     .read =3D lqspi_read,
+    .write =3D lqspi_write,
     .endianness =3D DEVICE_NATIVE_ENDIAN,
     .valid =3D {
         .min_access_size =3D 1,
--=20
2.21.0


