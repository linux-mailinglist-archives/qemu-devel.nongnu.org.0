Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A8025D69
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 07:13:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTJYz-0000yz-Ml
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 01:13:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9k-000499-NX
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hTJ9j-00079J-NL
	for qemu-devel@nongnu.org; Wed, 22 May 2019 00:47:12 -0400
Received: from ozlabs.org ([203.11.71.1]:60041)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hTJ9j-00077B-CS; Wed, 22 May 2019 00:47:11 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 4580T24pJpz9sPc; Wed, 22 May 2019 14:46:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1558500374;
	bh=E0P7ZBTOsd78OXOu944+9bwwwlf8kjjxDpxXnr0T90s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=p9nvs4qLHzgtufALXAjd7JNtvA06Rs/UlhtMNJXkjj2tdlTJfi1Dy1UNwyvsReEEl
	hQIoL+WeT4N1LI+ePTb+5J+46f3k4nxZrcmfqCOUi6O14/5WTngaa8X3V7I9mDaHYR
	m5ppLuCCJceg7HQubXym2iTOMYVqI8HPeZARtiu0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 22 May 2019 14:45:38 +1000
Message-Id: <20190522044600.16534-17-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 16/38] Fix typo on "info pic" monitor cmd output
 for xive
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
	Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, clg@kaod.org,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

Instead of LISN i.e "Logical Interrupt Source Number" as per
Xive PAPR document "info pic" prints as LSIN, let's fix it.

Signed-off-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Message-Id: <20190509080750.21999-1-sathnaga@linux.vnet.ibm.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/spapr_xive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 58cc6e2b50..62e13ac353 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -141,7 +141,7 @@ void spapr_xive_pic_print_info(SpaprXive *xive, Monit=
or *mon)
     XiveSource *xsrc =3D &xive->source;
     int i;
=20
-    monitor_printf(mon, "  LSIN         PQ    EISN     CPU/PRIO EQ\n");
+    monitor_printf(mon, "  LISN         PQ    EISN     CPU/PRIO EQ\n");
=20
     for (i =3D 0; i < xive->nr_irqs; i++) {
         uint8_t pq =3D xive_source_esb_get(xsrc, i);
--=20
2.21.0


