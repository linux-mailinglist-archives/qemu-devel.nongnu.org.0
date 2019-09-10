Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A785FAEC9A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 16:05:17 +0200 (CEST)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7glg-0001TP-OV
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 10:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lvivier@redhat.com>) id 1i7gke-0000rs-4U
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:04:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1i7gkV-0002BV-PD
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:04:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40292)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1i7gkO-000291-To
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 10:03:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8A78880F83;
 Tue, 10 Sep 2019 14:03:55 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-116-207.ams2.redhat.com
 [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 832BE6012C;
 Tue, 10 Sep 2019 14:03:51 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 16:03:50 +0200
Message-Id: <20190910140350.2931-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 10 Sep 2019 14:03:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] MAINTAINERS: update virtio-rng and
 virtio-serial maintainer
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
 Amit Shah <amit@infradead.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As discussed with Amit, I volunteer to maintain virtio-rng and virtio-ser=
ial
previously maintained by Amit.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Acked-by: Amit Shah <amit@kernel.org>
---

Notes:
    v2: CC Michael
        add Acked-by from Amit

 MAINTAINERS | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50eaf005f40e..db916ade55cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1554,7 +1554,8 @@ F: include/hw/virtio/virtio-input.h
 F: contrib/vhost-user-input/*
=20
 virtio-serial
-M: Amit Shah <amit@kernel.org>
+M: Laurent Vivier <lvivier@redhat.com>
+R: Amit Shah <amit@kernel.org>
 S: Supported
 F: hw/char/virtio-serial-bus.c
 F: hw/char/virtio-console.c
@@ -1563,7 +1564,8 @@ F: tests/virtio-console-test.c
 F: tests/virtio-serial-test.c
=20
 virtio-rng
-M: Amit Shah <amit@kernel.org>
+M: Laurent Vivier <lvivier@redhat.com>
+R: Amit Shah <amit@kernel.org>
 S: Supported
 F: hw/virtio/virtio-rng.c
 F: include/hw/virtio/virtio-rng.h
--=20
2.21.0


