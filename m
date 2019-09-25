Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2F2BE09F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 16:54:33 +0200 (CEST)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD8gZ-0006sE-By
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 10:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8Nz-0005A6-Cm
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8Nx-0001do-D7
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:35:19 -0400
Received: from 4.mo68.mail-out.ovh.net ([46.105.59.63]:52061)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8Nv-0001cC-UZ
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:35:17 -0400
Received: from player786.ha.ovh.net (unknown [10.109.159.152])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 1B0DC144B75
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 16:35:14 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 96B72A4D420D;
 Wed, 25 Sep 2019 14:35:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 19/23] m25p80: Add support for w25q512jv
Date: Wed, 25 Sep 2019 16:32:44 +0200
Message-Id: <20190925143248.10000-20-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8872372744048249617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.59.63
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 47159de3a443..11ff5b9ad7b3 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -327,6 +327,7 @@ static const FlashPartInfo known_devices[] =3D {
     { INFO("w25q80",      0xef5014,      0,  64 << 10,  16, ER_4K) },
     { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
     { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
+    { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
 };
=20
 typedef enum {
--=20
2.21.0


