Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC7B2D5CE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 08:59:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsYV-00072J-Oh
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 02:59:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ1-0008Eu-KR
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1hVsQ0-0002ZR-GO
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:50:37 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59527 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1hVsPz-0002WY-Sg; Wed, 29 May 2019 02:50:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 45DLv23KH3z9sN6; Wed, 29 May 2019 16:50:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1559112622;
	bh=LkelRvpQ4cjjKnRLrrvL3XGoOyqytqvuPHTCn8YevEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=blPyn9IE0uvyXNz/wP2JLzf9mELm6jv2oZQYt1gnamJY60NNscHM/1Di6qZVSlXxB
	sG2GDXnEqB9Mvgr5OGC1ZIE5g8bIhvOB3viHdK7C6l2M1x56pgTgTgC8Jh4zHzTKEZ
	Zsz5h7D69Gdm5GvQQnPZiNS7Ex3PETWtKcE/Z//U=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Wed, 29 May 2019 16:49:40 +1000
Message-Id: <20190529065017.15149-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190529065017.15149-1-david@gibson.dropbear.id.au>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 07/44] hw/ppc/40p: use 1900 as a base year
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
	qemu-ppc@nongnu.org, clg@kaod.org,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Artyom Tarasenko <atar4qemu@gmail.com>

AIX 5.1 expects the base year to be 1900. Adjust accordingly.

Signed-off-by: Artyom Tarasenko <atar4qemu@gmail.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20190505152839.18650-4-philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/prep.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 7a0d311d43..2a8009e20b 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -676,7 +676,9 @@ static void ibm_40p_init(MachineState *machine)
     qdev_init_nofail(dev);
=20
     /* RTC */
-    isa_create_simple(isa_bus, TYPE_MC146818_RTC);
+    dev =3D DEVICE(isa_create(isa_bus, TYPE_MC146818_RTC));
+    qdev_prop_set_int32(dev, "base_year", 1900);
+    qdev_init_nofail(dev);
=20
     /* initialize CMOS checksums */
     cmos_checksum =3D 0x6aa9;
--=20
2.21.0


