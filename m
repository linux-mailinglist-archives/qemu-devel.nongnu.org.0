Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC9D5E72B8
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:12:20 +0200 (CEST)
Received: from localhost ([::1]:52182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oba31-0007mR-9c
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:12:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyI-0001WJ-0A
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:26 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyF-0005d0-FQ
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906043; x=1695442043;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2aepwLmYndjeQUqiDDwWxQKp8PVopzzltTO9zBxY2SQ=;
 b=HqXGPw8x1OL4nZ+uUEtlKbqDYlsmm1hY8Tv7GAn/OqmnOq4VQ6b9Kd5I
 ebs0hRZRyI8Lko6Wsigmi+gMPVVeWMNVriv2RiAuTKQH9ikjnsIzgDLlo
 exjFh7e7IJ+2Z8jJwJxFFnQHn5BT4d9uowbJmNIXpv1KC0w7o8FlB4Mi+
 esjWHdDkuQR8f/cvFY900vh5wSzNE0x9KKzLoCBQV1qg7fWk6/1ntSU0M
 I2J+i7gnIahEUIQ2uKup4AKLjUP8MB2HGXMnCM9fH0mou0TXppO9okx2C
 BtnTlzwvZwFYWzsxBXUChDkhhC+DNaIYNQfQsxd8j/aPnC7xWL+J1NgAZ Q==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510440"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:20 +0800
IronPort-SDR: LLi0kLGyzxOsK7172rMvdQxGUojctFXhNWQ10bDwRjO/u7/ffiTgpj0etBNKVpP/m9CqlLzPFY
 YD2tMxUjoxhuL9LLkyLWjKgJ4Y0eLKF7GlucZCtShm5Dz3SwHUCuLG7H67FEhvZjL8uhp8WG+1
 AKcngN183p5hIrjH/LG3DyUUlddzhdhtj/mZCsOWwYpw7qrNK0d4Cxakdfs77r5+H6R27Cos7R
 VDWQY+KZzXLoRIvxCrUmU7WX0FMz+xaLmc5zHrOXVQIFmo93qLCYkk03MLs/hrKwSS6gNWtnlV
 xNtdNEDHdJm3CVvfh5ENDMFl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:22 -0700
IronPort-SDR: VFS8i0NxB4ZEZOZ2njqU1deeKl2vIBxZdMYeJ4f2pRLu5hwMNk1ZI1K2GsarF14KROShgN2zNj
 CegefiGI3MoDenrkvkIKYRXMF5U2NHdm5wx9ocYZ8V+NNT3K2hsL8077506NUvHH+o9dG1c1qZ
 CGqd38nI3NFBMMLnQ8i4SvOgQHwnobA1o2cyD/s8pdHHitNLS8KYklG57KGUXlwx7K7kIDfenw
 11Ov3eIUC9TetUe0JXar+8yqQK50Z43AQlB2tX2/qJazNXhqmAYMZ1guIc/HLyBk4H31ZcOhyU
 qaI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:20 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYds36Tvtz1RwqL
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:19 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1663906039; x=1666498040; bh=2aepwLm
 YndjeQUqiDDwWxQKp8PVopzzltTO9zBxY2SQ=; b=Kwb6qwXuNR+LKQ/Il/C05Jw
 d9t2FHhdyNTnzKAPmT9q2/em2+NUC9VD77IFDrR2FQaF5DNKfrF0DX1yFx9GixK9
 hbkVQp/1hCPnO+46MvZJHfbnnHMJyT/XBujK4JKTCW4NUrLbRYyX4fmbf9QoFB5K
 taMVGpFQz7pc6XlH7iZ9yTXX/YpLkCrseF23ZaxOl5Ta9fX3Jgkhq9wqs9PEHPuL
 8D6mPgGVoU4tlvRE3w6Fn6gWxHiwIq+Mri6VXiao8DUS/VhJcUyU1boCTF5JnKll
 cNr4uVCsQfZ/xa2ZzAgqQYxeEr75jOTiWiFmma5P2r4ES93i0KBwXPKpbXx3ZWg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id KXA5oaIOyvNa for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:19 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYds168qGz1RvTp;
 Thu, 22 Sep 2022 21:07:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/12] docs/system: clean up code escape for riscv virt platform
Date: Fri, 23 Sep 2022 14:06:55 +1000
Message-Id: <20220923040704.428285-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Benn=C3=A9e <alex.bennee@linaro.org>

The example code is rendered slightly mangled due to missing code
block. Properly escape the code block and add shell prompt and qemu to
fit in with the other examples on the page.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220905163939.1599368-1-alex.bennee@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index f8ecec95f3..4b16e41d7f 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -168,14 +168,19 @@ Enabling TPM
=20
 A TPM device can be connected to the virt board by following the steps b=
elow.
=20
-First launch the TPM emulator
+First launch the TPM emulator:
=20
-    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
+.. code-block:: bash
+
+  $ swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
         --ctrl type=3Dunixio,path=3Dswtpm-sock
=20
-Then launch QEMU with:
+Then launch QEMU with some additional arguments to link a TPM device to =
the backend:
+
+.. code-block:: bash
=20
-    ...
+  $ qemu-system-riscv64 \
+    ... other args .... \
     -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \
     -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
     -device tpm-tis-device,tpmdev=3Dtpm0
--=20
2.37.3


