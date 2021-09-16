Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FBA40D29C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 06:39:42 +0200 (CEST)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQjBV-0001GV-LK
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 00:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQj9s-000880-CY
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:38:01 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:4810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQj9p-0007B9-Ij
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 00:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631767075; x=1663303075;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JLuylWYBtEa555dunSRK4Mk8tc3gj74iC8WdUNYeuHw=;
 b=XjQudDhx/hE71Y+xOApWWlT7FTyInGC95vRVxhlw72Xe+NSNfv7B08kr
 zmI6b5JhI5JjqQ7BCSOiY5nlX1lni/66AvX5cuDfDaqPUUN4AobokPFAl
 MqclWuTluQctjGDmqJ1e/g6kbpu3ilPgaPbYjv8eJjTs/CbIlGTLKj1iJ
 puTJVe6QvPyB3kBaHYcmmnI4nQCKkyuxFi4F3BiCjxUj1ZiUyfMW6woEq
 mf0Uo4ASAzbZZSUcnx0JQaaDTHPYDYkNzGSASrAaa3g64ca/dEW2unv/u
 8mXcYIZMn8rrhQFLnL6pBGkT43MvqEdZMJwo8WPVat8XKGiZTwaX9p4IR Q==;
X-IronPort-AV: E=Sophos;i="5.85,297,1624291200"; d="scan'208";a="184925504"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Sep 2021 12:37:49 +0800
IronPort-SDR: qfPFJTBmuJmIgjvRRQTwhxRqM3R4Pae+C0d9oVhCLkp12brJbR5SWfU6r/mPkQYgzYkRERrZOp
 Va9b0IKVV/Ws99qOn0d1fW2nDjVvoE2EhWmmvpAAb+TU8+FXu/lphihHjL2jKlFUjO5DXDeFJ8
 6IvnGBFs4X1qS+Q6cgq0zExtX79V6ALPunRCjmlT/ItZwZUVW84iaiYV4+XjHNaF0koa51zUSQ
 N/QtPvtCvS23LuUNFrKP4kQi6brBofY+RCQ9dBpmyj9SqAV1TctQXwuJ8IdihNy2DgPfq9YedI
 nBQHtSepMxrnqB1H+4bGgprG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 21:12:38 -0700
IronPort-SDR: YtFVum4mV1eHQ9XUv1ela3gYt9YwIq/QYgdoWA6DSW+BSNAgqSlrcgoCwbadU5VAvRUfmX5Qzk
 6HTMgHayOS7munYoWqSaSSJMiI2RBSzuTH5aGXS3RMRjaKeFGdMfFHCFjbBPP6P/Z3FBtRaMdX
 w6BYhBwb0ks5zxCT+K6S63JPHJoypgVkEGaiKYPq1BeiTabnT5pWXnkIc87ieLk1juTbvWjeO8
 egISD0DaM6m6QlosBAyPVmneFRVqKDPwnv0hWpBmrI85pizhce6fqeYayQYoMbdlzql+DgZVF+
 gZM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 21:37:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H947y1hs7z1RvmL
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 21:37:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1631767069;
 x=1634359070; bh=JLuylWYBtEa555dunSRK4Mk8tc3gj74iC8WdUNYeuHw=; b=
 NEwma1HpkXKZ5v4ZheDbufMdimNde1nIvtPhknX+yW65uPjVMD+w3mVI3+Whn8di
 htmUDteJCRtaoRGzh9+URc+/p3bNajBApA5fIxXtJ8D45KbQfKmDjO7FdJgrfI3D
 c6AbDANWmFJuFDOJkKSpmtm4KTuNh+5/ehB3OSKSJB7JrDJyHTfIN/AAGzxmJMXT
 h4YLQn8BbXWRBQ10Nyr6K2QWzuqpQJRBjKW4HOektcMZE+878YqMXMZPiWmczblv
 M1i8HrIjXHtPysTydwOyX4MEeVjNhHfZ6+0V9+9MGZ/labD7mWCnEXdC8ZaEn1dm
 9FTwhUjETDDoHOmAZVautQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FDVSCKvtopvR for <qemu-devel@nongnu.org>;
 Wed, 15 Sep 2021 21:37:49 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H947r4qp8z1Rvlb;
 Wed, 15 Sep 2021 21:37:44 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] hw/riscv: opentitan: Correct the USB Dev address
Date: Thu, 16 Sep 2021 14:37:38 +1000
Message-Id: <d6cb4dfe75a2f536f217d7075b750ece3acb1535.1631767043.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 36a41c8b5b..d38c43abc1 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -39,12 +39,12 @@ static const MemMapEntry ibex_memmap[] =3D {
     [IBEX_DEV_TIMER] =3D          {  0x40100000,  0x1000  },
     [IBEX_DEV_SENSOR_CTRL] =3D    {  0x40110000,  0x1000  },
     [IBEX_DEV_OTP_CTRL] =3D       {  0x40130000,  0x4000  },
+    [IBEX_DEV_USBDEV] =3D         {  0x40150000,  0x1000  },
     [IBEX_DEV_PWRMGR] =3D         {  0x40400000,  0x1000  },
     [IBEX_DEV_RSTMGR] =3D         {  0x40410000,  0x1000  },
     [IBEX_DEV_CLKMGR] =3D         {  0x40420000,  0x1000  },
     [IBEX_DEV_PINMUX] =3D         {  0x40460000,  0x1000  },
     [IBEX_DEV_PADCTRL] =3D        {  0x40470000,  0x1000  },
-    [IBEX_DEV_USBDEV] =3D         {  0x40500000,  0x1000  },
     [IBEX_DEV_FLASH_CTRL] =3D     {  0x41000000,  0x1000  },
     [IBEX_DEV_PLIC] =3D           {  0x41010000,  0x1000  },
     [IBEX_DEV_AES] =3D            {  0x41100000,  0x1000  },
--=20
2.31.1


