Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1342A40ED1F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 00:09:41 +0200 (CEST)
Received: from localhost ([::1]:39846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzZb-0003mu-V7
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 18:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHb-0007iN-TP
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:51:03 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:57941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzHX-0002yi-8H
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:51:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631829059; x=1663365059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jp3ZHxOBlio+kXe8kL+dBvSS6iAo681TwSo6Sm+6EK4=;
 b=d+OqaMzAQ4W5sZXw8x0JUZxCtjzvU0UyKiFve2KwzSsVcJo8OLK3K/m4
 PsSExr3zzJFrKfIDMRDfquBB4I2ePOxDqEB7NDDDSMQXCpkaA5tv3Pp1l
 bh0w5jjQS4nFhCoJhp3MBYGexnf9eH4BxRTF/q674vlHJ9uv8POFAXDiu
 +Y9NgpOs9Zhc/kAdfma7eElxIwLUp8gxnICqkXj3vyokZvNMiUeBrLidO
 I8Tnn9HjZQAwOf90cPYJhrfQQarK0V7CkXZnIN72wqOAxl5NhHzItwrOq
 kxDTUPt9OyMmfn+SlOfOGFH3ZZ36hP1rkK7ECFetJwI7/eMUKykc7oN+x A==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="284004783"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:50:58 +0800
IronPort-SDR: HYlfjmZmTT8rQeZIdsNTIsQpQmQ/p5tW8lESWfngf9C8fwfT3lUB/QwBa3rB9SYtZ9aVlHzZZ1
 25/wQb+dYHHG2mMWDjqJrHeqXrhUEnST+AtiCkb9yrhyQ8MaCh7BdY7ekQXdIQqOLpE5RvWymb
 6Lh6tbdJJ9I340IgrX08i7r9aLCq+PuMP4ChieG1ElLwovSEsi9brx2yQq6dn1Gs30+vMwHAaz
 ZyXzubzpOENUnpj91wQudLlTYqOn+NTunwhWBsjbanAGUiKZJp50xK819xbtZ00n3r+bjd8fZO
 6Y2jfeYGbi8C4536bCfSzI1T
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:25:45 -0700
IronPort-SDR: 27yV5zXfjoVXluH5eGud+odSt8tq3VZAS/NxqoN7wBW4lA1NFFRaLS5my60A/8qYgviIxcn9Jo
 zOYZ2oi8Szf191pv/rOh0bT62dcMiuDamPng+9OVIL5JJD8ACxYmeVSrmnmlOHU7FDfaC0PxOw
 M4JxWl26FHDB/b4Au0ZQrxS46SvlV88weGG3YXX2T3b8JjnrrezVnYylHrD588URD3SwNdVrdj
 FtfwOiXchF8Xhy63fJv9hLQh//GccKIezVdSF4qR6mq4cKRqrdDbuRmPl6K1XYCHx44q3WHVLE
 Q7I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:50:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W422XnMz1Rws8
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:50:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1631829058; x=1634421059; bh=Jp3ZHxOBlio+kXe8kL
 +dBvSS6iAo681TwSo6Sm+6EK4=; b=JQcHU+tNetCxB1HzEmEIPDhdFMJm85rYDg
 b0p3OMZMhaQkfwCP4XPXqTc78sFVqJoLA2HI6Zd+536+kkU7FYePKHrTIi6ehv7E
 HyzXhcL/xNH1Itf4B6zh5OgwHKmsE2gTrv6Nxa3QdyLdQfz8MSLjh2WlLOwN54d4
 IlQzeBCqvqe5pmDxLC8HX46da7mUoPiK07yP1hmJ/209yhWRLiZ+6mAlX2CKxVUX
 aZwdbKhsnf2gIzCpaVyrs3HkIKouQluYv8nwv868wqyRmaFCE223MSddjA5N9INe
 +bX8lX2Y4skZHzBm5fyOl03eoAqLCfh4P+uXp/AzsRcuaHqzzJqQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qc0Kg5DsVC-3 for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:50:58 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W3y1y78z1Rws0;
 Thu, 16 Sep 2021 14:50:53 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 21/21] hw/riscv: opentitan: Correct the USB Dev address
Date: Fri, 17 Sep 2021 07:49:04 +1000
Message-Id: <20210916214904.734206-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


