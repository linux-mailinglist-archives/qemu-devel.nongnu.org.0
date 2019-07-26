Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3445076463
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 13:28:04 +0200 (CEST)
Received: from localhost ([::1]:38624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqyOI-0004mm-0s
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 07:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41871)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hqyNu-0003sL-Oa
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 07:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hqyNr-0008DJ-U5
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 07:27:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hqyNr-00084F-MT; Fri, 26 Jul 2019 07:27:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD23F81F07;
 Fri, 26 Jul 2019 11:27:33 +0000 (UTC)
Received: from localhost (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87D0A60624;
 Fri, 26 Jul 2019 11:27:33 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 13:27:28 +0200
Message-Id: <20190726112728.20889-2-cohuck@redhat.com>
In-Reply-To: <20190726112728.20889-1-cohuck@redhat.com>
References: <20190726112728.20889-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 26 Jul 2019 11:27:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL for-4.1 1/1] MAINTAINERS: vfio-ccw: Remove
 myself as the maintainer
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
Cc: qemu-s390x@nongnu.org, Farhan Ali <alifm@linux.ibm.com>,
 qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Farhan Ali <alifm@linux.ibm.com>

I will not be able to continue with my maintainership responsibilities
going forward, so remove myself as the maintainer.

Signed-off-by: Farhan Ali <alifm@linux.ibm.com>
Message-Id: <355a4ac2923ff3dcf2171cb23d477440bd010b34.1564003698.git.alif=
m@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc9636b43aab..d6de2004537c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1468,7 +1468,6 @@ F: include/hw/vfio/
 vfio-ccw
 M: Cornelia Huck <cohuck@redhat.com>
 M: Eric Farman <farman@linux.ibm.com>
-M: Farhan Ali <alifm@linux.ibm.com>
 S: Supported
 F: hw/vfio/ccw.c
 F: hw/s390x/s390-ccw.c
--=20
2.20.1


