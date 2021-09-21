Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A01412F22
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:13:52 +0200 (CEST)
Received: from localhost ([::1]:55276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZyR-0002RQ-Aj
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZhc-0001Ci-Es
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:56:28 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:45015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=891501f09=alistair.francis@opensource.wdc.com>)
 id 1mSZha-0005E3-Gy
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632207386; x=1663743386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jp3ZHxOBlio+kXe8kL+dBvSS6iAo681TwSo6Sm+6EK4=;
 b=UwdKoRwKNI+Thp/eJMan8PcGjkzEUaRFG11OTu/0oJYw1IPc+Qry6oyg
 hJlHmuBI1Us4h8d3GsZb18Le4vIXoKPP0gCVb5Yqbhiy3BFZLsGtbuxAf
 hOjXWAGMA5xlg3BZdVGN6V2riGvTYh1aOQNCNx4k+JXS82P9tn+ftKq7G
 pR39NR8LPO8wTR/kT8WEN3MJuIv0h1f5E/t6gPTqndb9Ha0lylLZgQN+e
 XOPQamd6GltkyFESEIPk84TAcqw+DN7O2MAJbFAsYJLXJU1WQZfar4X+K
 qm8QoMUrp4xLURtNlWVslndxk53VCr/dz6hUSsQGiYndLQ8nbmXWTo0wS A==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624291200"; d="scan'208";a="179591632"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 14:56:25 +0800
IronPort-SDR: FdWWcRsjUIr7boPtpM/04SavtG3H0Ul1f0/PREbemhQqvMTqrPcbekdLIah2BsSrVYWdxocrHu
 TO8lLnMbKZ8fggS06xAe2vRDEcm4Nr8/s02jao+/BsxKblLGc9cvrUaOwAhOC7WgTTjSg9Elkp
 xYI7hWg1hJCDplLYafx9jNrVUD/4WyAxZBx157KCl0hW0+nH7slbnSPBig2N3YGQhJPDBhUUXV
 DNMg9FH4XsfdSl4BgpGDswZPSqiHZrr2zF90haqoPywCBiTJYJFAnBvXJ2/+JK8BubEb7jMsbV
 eCR77mITVVqvlRT5lIfI2wQl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:31:06 -0700
IronPort-SDR: F50Pk7dafI2V4gEJJJ3PnLREkitUHfO+OQqeJgpEhd4oipQTGEJh0DwH3po2q8LewiZBBrkMbo
 zSG5mZXqZUUdn7HFQ8fBRU4xgH28oOm2G70YfTZNw53A1Rv75Ox/8gYyNcuVHAeF2D6uaWn4nU
 Ae3yAKOtU3tRtlcrYwijVscU1lJsyem4S1cYvBdCHVEHKljU2KaEWc6tlpJq2APzOj/Uu2EFD2
 YIe0UgoNl9YPtsJjuqzZBYU/w8F7gDtf3C+Pijgy6VVY5fPcQxIgRMNrxRQGcvZyTGtd0tqXpr
 FNk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 23:56:25 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HDBzX6bY9z1RvlV
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 23:56:24 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1632207384; x=1634799385; bh=Jp3ZHxOBlio+kXe8kL
 +dBvSS6iAo681TwSo6Sm+6EK4=; b=igQEYP60P1GuqB1W4hAb/5AL8mKCOYndR0
 T+NswkgWsrueO8v3peLRugrp5GA01EPZbFUWn9AuZPxQfVgBib3e8dFQ+0wpqEXE
 B6nmmkMiz8jT36v1rzz4Qfy9pUcvTQy41Al3nCBh3e/SznOSkEhgaQSMR2sNlh6v
 MvEQgHwk9EWYyu97Ide0hXfSygw/e6pBziYX/FsY5LGyQL7/G9VCuXHQpQdoy+r5
 APVYjaqeTNYOEvNlqxVqcHV92yiPTT8IPUG8I5SDVpFdsL/xemKxq0DAuK5JW5a+
 vQpo8e60xkMpT0KEosijFyKiQUJDV8DtqwWeqAx7Z/iLeCCn3JBg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FAi2C-ZdxIm0 for <qemu-devel@nongnu.org>;
 Mon, 20 Sep 2021 23:56:24 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.26])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HDBzS0yZNz1RvlH;
 Mon, 20 Sep 2021 23:56:19 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 21/21] hw/riscv: opentitan: Correct the USB Dev address
Date: Tue, 21 Sep 2021 16:54:12 +1000
Message-Id: <20210921065412.312381-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
References: <20210921065412.312381-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=891501f09=alistair.francis@opensource.wdc.com;
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: d6cb4dfe75a2f536f217d7075b750ece3acb1535.1631767043.git.alist=
air.francis@wdc.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/opentitan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index f7cfcf1c3a..9803ae6d70 100644
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


