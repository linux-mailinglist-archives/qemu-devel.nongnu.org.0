Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B0BE1336
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 09:35:48 +0200 (CEST)
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNBBL-0005s8-H2
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 03:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42580)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iNB9f-0004fn-ST
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 03:34:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iNB9e-0003fG-RE
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 03:34:03 -0400
Received: from charlie.dont.surf ([128.199.63.193]:43868)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iNB9c-0003Z4-MG; Wed, 23 Oct 2019 03:34:00 -0400
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id 7A4F0BF44C;
 Wed, 23 Oct 2019 07:33:57 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] nvme: fix NSSRS offset in CAP register
Date: Wed, 23 Oct 2019 09:33:15 +0200
Message-Id: <20191023073315.446534-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.23.0
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Javier Gonzalez <javier@javigon.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the offset of the NSSRS field the CAP register.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reported-by: Javier Gonzalez <javier.gonz@samsung.com>
---
 include/block/nvme.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 3ec8efcc435e..fa15b51c33bb 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -23,7 +23,7 @@ enum NvmeCapShift {
     CAP_AMS_SHIFT      =3D 17,
     CAP_TO_SHIFT       =3D 24,
     CAP_DSTRD_SHIFT    =3D 32,
-    CAP_NSSRS_SHIFT    =3D 33,
+    CAP_NSSRS_SHIFT    =3D 36,
     CAP_CSS_SHIFT      =3D 37,
     CAP_MPSMIN_SHIFT   =3D 48,
     CAP_MPSMAX_SHIFT   =3D 52,
--=20
2.23.0


