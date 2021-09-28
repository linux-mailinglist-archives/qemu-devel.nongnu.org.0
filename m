Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D12A41BB07
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 01:31:37 +0200 (CEST)
Received: from localhost ([::1]:45670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVMZU-0006uN-Dr
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 19:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=89863b41f=alistair.francis@opensource.wdc.com>)
 id 1mVMYB-000624-LR
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 19:30:15 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:41962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=89863b41f=alistair.francis@opensource.wdc.com>)
 id 1mVMY8-0006FK-Np
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 19:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632871812; x=1664407812;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tmIJEd3zAacH3o4eeUio1NR536Z2ac06vmlZzHbgeiw=;
 b=FotVRe3KdAL7ow6utbcHNgkl0tYOKLmTxpIABhIAQR/LDUaar1boD0qp
 TyX9oT/kuYJiqHMzlMFR0H8yPLLcVQVBsBVC0gjdP+RRR0SUIC2QLU0OP
 Q9VEtf0JQWykrNb3LqKizvpom38QkUgi0upMUe1hFTvizAm1voyhSTvGV
 EWA2YKXr7HdQzVbeyOIKScMw/CoANgD9MW4SmgLzHu8jUr8SapRD43fx5
 UzD/4TfwVgH6d3kYvN0aLZckpyvbe0SxteJKFH+DKeyERb8GTXMKqBBfr
 cLno9VLXfdjqRTvNrxcDLfuaBrg4iAtF+ZcH4QCY0FDxX2cx+727t9Xao Q==;
X-IronPort-AV: E=Sophos;i="5.85,330,1624291200"; d="scan'208";a="180294281"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Sep 2021 07:30:07 +0800
IronPort-SDR: Mh/npRXpGG8DjYp81WzeZU1rjgbim0fryEOXqN2E/UW5DbVS4dbRqFayFcqON4yAJlusOyBbSZ
 unAjV7qHVmBMzM4z7hhyucwOXI3/aQVM2LxciQCT9TYPxx6Fjy5s4QpmN0vi8ve4YKl/YmZ3ED
 yu0sUGGO84UbTmdFymoy7+H+MDP3CJGDhSVrmSZ1f0LmylplWlGjEmQ5XiH02ShVrvith/wY+j
 ZcBzxlOQ8geFb0+05pg8cs87hEPT7jf0FTjQ4V4DDmjq2yDRVp6XHYkUgu09lF7IrEq3xVc0iT
 18ebAsqZ5mQ+KbSwP2n7kOT7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 16:04:38 -0700
IronPort-SDR: fzpabZRmCmBPO5bBJimWTvgBTsgA0XnfuwQy2BocpF4YzbqKe/7sQAA+23u26ly28LmTD1qOhA
 swvEbUvhh51ldWLHUao+BjO5TD9UxW1RM4WzjdPI2WhIiyC8TYGM9QJUl0Sy2NQTX2sbCzfyJu
 aYtk0IjfYiSZ2JBYpPanHGwVT77v9G2riccyHyBshcb8r63l21Q5rTRRYjw4Ik7Cey9af8WHXx
 i6Z+eaimKwnMBP1wsrI5cNfPeiQ3mDlqp5Bdkp7TkGu3u6el120/pTb9476xa6JL5tUU9rKvvK
 miY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 16:30:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HJwht3SDvz1RvlP
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 16:30:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1632871806;
 x=1635463807; bh=tmIJEd3zAacH3o4eeUio1NR536Z2ac06vmlZzHbgeiw=; b=
 uYebWlIt/qDk/51y/EkIzJGHjidtWOQOWxqOz4cuMMteNkGZ8ZKp5PoXQ8JgobeI
 mzb/loVQ3EYyaI/1SnMX2w+HNJfKL17g3FowC2Iwwv72WBAL5hPHd9oW2CZhKFqw
 e7ShCNUgxKqRnR9oYStUaCr3ynmMVLNHESYbj9AJxy7YdrVK5jFKUoRebMM1Zu83
 SaOXK3N8gaX8xJ+qm69VfqrR9yVsfnkOXQQyrXe96wF7oSJcBxTdze0Yywq/81Gl
 iIYtwyU2fliuKOiDOBswimJ969O6cQdCrdHG0QA3xRXd9Uk23CBfLRirFfrr/PGz
 PQeSjXtBQIp3XbEBsnIRhw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id cPrIuAzMDr7u for <qemu-devel@nongnu.org>;
 Tue, 28 Sep 2021 16:30:06 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.27])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HJwhn2mdnz1RvTg;
 Tue, 28 Sep 2021 16:30:00 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, f4bug@amsat.org
Subject: [PATCH v2 1/1] hw/riscv: shakti_c: Mark as not user creatable
Date: Wed, 29 Sep 2021 09:29:55 +1000
Message-Id: <c617a04d4e3dd041a3427b47a1b1d5ab475a2edd.1632871759.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=89863b41f=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Mark the shakti_c machine as not user creatable.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/639
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/shakti_c.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index 2f084d3c8d..e7cd3bdfb4 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -150,6 +150,12 @@ static void shakti_c_soc_class_init(ObjectClass *kla=
ss, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
     dc->realize =3D shakti_c_soc_state_realize;
+    /* Reasons:
+     *     - Creates CPUS in riscv_hart_realize(), and can create uninte=
nded
+     *       CPUs
+     *     - Uses serial_hds in realize function, thus can't be used twi=
ce
+     */
+    dc->user_creatable =3D false;
 }
=20
 static void shakti_c_soc_instance_init(Object *obj)
--=20
2.31.1


