Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7714A43F7B6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:14:30 +0200 (CEST)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgM5t-0002tk-Hp
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM1o-0008Qr-Ds
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:10:20 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM1i-0004hL-5S
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491409; x=1667027409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Flu3ImfJDOuc4S17tyTyOmKZ2MobboLwiyCkPnQM2PE=;
 b=cHxqmgQuNQuAsXlv5lUOVXhGT0pB8fODfGtQ8fjnZcnK9bEblXGq4pFn
 4TVHwPjheeqSisU40RucbLnwCiqy29hqw37Kcnju4vUumOuc3xS2U6niO
 Ji+jPd4Wv4F60Xo8V1V3pcrOmILoPGJ5INKHM9PwD0yfLLHdCAVbkPUD9
 bx4EVYLOwo5P2Gj0DPBwd316a7u4RkUhTiYGBaOB6s24Xl/Icc1jo1ASH
 4+iUPrFGRGAEYKiJESaryRz5Tij+aACOP2ZpdzT2J0ObzXTXSk7zHeAuJ
 9GMVHEQIAqpH7/tJ+6oXnWG3Qci5pLnMirns9g+BxRZa35tBN0aDSvOtk A==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="188933900"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:10:07 +0800
IronPort-SDR: yZ1Ge8TpC+mqVhztPNuWnFUmq/1oKmPvM+UgpQt+MkHnB4jPSxwXXCqVhj8uLX03do//wV0USM
 S7LxJAVQhNW4SvfVPrHECFxFCA8CpKKQ+Q+vLg0clJLgscBqpof9xWhyefEa7Ikf2Q+m7kkMaY
 A10Q8/ABJiO0hQ1lH/M79XsccKVx+BB3xa3azBEBOfkNRuynQuVve7eAuC9HPbXDtJXKobMoNz
 ACOy6WWJn8B4gH2r7NcHNcDkZrQp/3G0k/9/ezCv60tti6WiqAVyyxmWpcSaQc6/m3SaaVAlLJ
 kh3NTrDlR57DU8xLyJs5x4Ca
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:44:02 -0700
IronPort-SDR: kM4YL4gODCwztx9V9IdFQOBvknb+6F7iksKpwA3zdeegUj0SiBdqCcn9NRsHydoAPRetrkDtOb
 dOTsXdhGr14crWSUE4i9KoehYRKj0uZrfhvyH1AB41wcW0167I1+EOGSX17cdCUxjbMU4UwMTc
 yefdPh1bGz13CWPndOg1GOthOXhpu2Q9I9tRRTbC1wM16QEPgmzeAlUZG55c1FZ3pKC+lPLCHS
 dU9uXGlbJFGMpDdcX8ortOmMhONBBhfOOXnHyQoSM1DERyUgnOsxeNSpYJLkoakZCeoC4V5dkc
 w8k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:10:09 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYTr2z6kz1RtVt
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:10:08 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1635491408; x=1638083409; bh=Flu3Imf
 JDOuc4S17tyTyOmKZ2MobboLwiyCkPnQM2PE=; b=Q+p7TejLpCayLBmayUcZBJE
 ChKxb9P6QdQ7Jlpe2inGkw/sbOPIUre4hnc9yCqYjK0ZlCB9VZ6aXomfKiGvfuU9
 JC2DLJVkIFOJIJidueWTDptfZ0bmX8Xm4ZBbGgwNUKAESU2/nsH9uMPeNopT5ovq
 cS188T9EjvKPQ9HO2pLjOnn7OiKM9AkCbwQwuLH3qigyWi996b961YVkRz3qi3R2
 i3JSiQUXyx4oXR19qrt+ZjZdl8Ti4H0BBktvjbV1aODE32PEEFVN5sNUm1+Vxqmo
 dhumpl3s4rJxRGeFn7Cv9LTZ1VT8YyuOCRQo8lpJBRKZNolXjelKs2NyWb2D2Og=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id lB9xM_nTBp3n for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:10:08 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYTk5Z4Tz1RtVm;
 Fri, 29 Oct 2021 00:10:02 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL v2 01/18] hw/riscv: virt: Don't use a macro for the PLIC
 configuration
Date: Fri, 29 Oct 2021 17:08:00 +1000
Message-Id: <20211029070817.100529-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Using a macro for the PLIC configuration doesn't make the code any
easier to read. Instead it makes it harder to figure out what is going
on, so let's remove it.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-id: 20211022060133.3045020-1-alistair.francis@opensource.wdc.com
---
 include/hw/riscv/virt.h | 1 -
 hw/riscv/virt.c         | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index d9105c1886..b8ef99f348 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -73,7 +73,6 @@ enum {
     VIRTIO_NDEV =3D 0x35 /* Arbitrary maximum number of interrupts */
 };
=20
-#define VIRT_PLIC_HART_CONFIG "MS"
 #define VIRT_PLIC_NUM_SOURCES 127
 #define VIRT_PLIC_NUM_PRIORITIES 7
 #define VIRT_PLIC_PRIORITY_BASE 0x04
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b3b431c847..28a5909a3b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -758,7 +758,7 @@ static char *plic_hart_config_string(int hart_count)
     int i;
=20
     for (i =3D 0; i < hart_count; i++) {
-        vals[i] =3D VIRT_PLIC_HART_CONFIG;
+        vals[i] =3D "MS";
     }
     vals[i] =3D NULL;
=20
--=20
2.31.1


