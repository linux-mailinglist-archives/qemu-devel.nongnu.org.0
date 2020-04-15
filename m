Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2841A92DC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 08:05:16 +0200 (CEST)
Received: from localhost ([::1]:43686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jObAh-0006q6-Nt
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 02:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35447)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOayy-0002jy-G7
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 01:53:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOayw-0002nx-S3
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 01:53:08 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47552)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOayt-0002Yc-I4; Wed, 15 Apr 2020 01:53:03 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 1C240BFD2F;
 Wed, 15 Apr 2020 05:52:26 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v7 22/48] nvme: bump supported version to v1.3
Date: Wed, 15 Apr 2020 07:51:14 +0200
Message-Id: <20200415055140.466900-23-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415055140.466900-1-its@irrelevant.dk>
References: <20200415055140.466900-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/block/nvme.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d5c293476411..59935d4641a6 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -44,6 +44,7 @@
 #include "trace.h"
 #include "nvme.h"
=20
+#define NVME_SPEC_VER 0x00010300
 #define NVME_CMB_BIR 2
 #define NVME_TEMPERATURE 0x143
 #define NVME_TEMPERATURE_WARNING 0x157
@@ -1913,6 +1914,7 @@ static void nvme_init_ctrl(NvmeCtrl *n)
     id->ieee[0] =3D 0x00;
     id->ieee[1] =3D 0x02;
     id->ieee[2] =3D 0xb3;
+    id->ver =3D cpu_to_le32(NVME_SPEC_VER);
     id->oacs =3D cpu_to_le16(0);
=20
     /*
@@ -1957,7 +1959,7 @@ static void nvme_init_ctrl(NvmeCtrl *n)
     NVME_CAP_SET_CSS(n->bar.cap, 1);
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
=20
-    n->bar.vs =3D 0x00010200;
+    n->bar.vs =3D NVME_SPEC_VER;
     n->bar.intmc =3D n->bar.intms =3D 0;
 }
=20
--=20
2.26.0


