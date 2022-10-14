Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FED65FEA67
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:21:31 +0200 (CEST)
Received: from localhost ([::1]:42024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojFwg-0000mA-AG
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFaz-0002ay-4l
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:07 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:61593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFav-0001sI-5O
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 03:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665734341; x=1697270341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pzSOV2dPnYF9YkdIqAmWTb5G3B84p6FwH+oMhjFGFH0=;
 b=g5mi6A48OO+IrPhIVC3swikEBkuj6UIu7n2M144RRTbPy03itGsca9bl
 lX0WYdqqrsZ5lvxqDj/MEIqXnfmRq/n9501si0ws61h0yqvM+9Dkjdv6b
 h4m7gk+x9NKOWqbrZtMKaPwqfghEGmAoAEOEFBG3UMhpnmelYMil50Bql
 Pr77NYSvvPRA2b6s5ZIC9bLQWjQ+XYFrOL1EAvw23tZVRIAVXYMMNLtSS
 nytjzwD8Wie/O69+lIakAq3dDFUcuCxokII+D5Cw0EUiJr2mQcLyyjAav
 vpfJbpzwjg/ntltnahJ0eeEOENw5YAQpn32AztKIlSxxWGXVuinECyPUn w==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; d="scan'208";a="213790419"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 15:58:57 +0800
IronPort-SDR: Cj5mFvbDSFezY+ZvehTEFqw1Z5rQZsyQigV1DrOGFGITcMrXVqfdoEO7GELaCikatpSSy6c+FX
 xPHgtKXk6IkBOwLpPyU2ns1lhoIvd+IGFHRJnh1NmkllMe+tF3cKYJ2M6arDWmJ7uE1gVnb3h9
 wQHV28b3Dk0ekDuWG7z2CUB2Ukgl8/E/KKqRnBsFK0O741oI8UgaxDeZmsR65xLiSocTDHTizW
 I5CKiPm7AsCveizkIXHBnVuuKR4H9zFEhr2tp5G9ze5wFb+T/dbGR3ZcMuUMrh92bYjwW03/XA
 ns+6M1CWrcgtrUOxH9H3hj9v
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:12:56 -0700
IronPort-SDR: Dln0KOTzO2TGYVjbjAfJpRb7ORg28/kdATV/CWf+PXNxwYoRg3q0+QXWPDo14waUAhD9D0MW2f
 RWqIGov9JLcDMuVGGUvkXWyf8vRHlI2qKVdwjA1f57BgQdMWbj5xxqSgfYGWRX/2b0LiHL0nIW
 nxKNX8w7HjUqHxE+AORJ/djyE+gvzCYYGlDgUCIHEq3ogEWY2Uj525LIzbZfa9DkhSCc6yz8RI
 nmEchEKtJOmDsRjo2VDV+5Ru+6eGfjWtBB0hHdtIuH7jsfp+kquaW4PxjeJZ8JdYA8vWv31U1C
 BMY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:58:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mpf0c6f4Rz1Rwrq
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 00:58:56 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1665734336; x=1668326337; bh=pzSOV2dPnYF9YkdIqA
 mWTb5G3B84p6FwH+oMhjFGFH0=; b=mFn7vod7SznJte9CuJpHAmuVHCuPh3nSdz
 PiWlzyUEHZfNylzffkpR/n40Lj66uZ4RyouO3wLMr6v7DebQqSwW256qxuyHYD3f
 npjV3A9Rr15qyZdptuaAdONqlQkfAc/9IjCAkvk9SUMY+24t+85t84dwlsBbP08o
 vVH62nOzCvGk0YYeUIKnSK5pf5QO4Sci9bujJaZDO6AiR//W7UpzZaMjTAPLP6P6
 xvw2FtUxGxAPOqfAGvxOm+ygx7pnaFhNUqnxOuntGEGmk2/hkhi9Gh4inz5nEqUs
 agXUGfzKIjDp5QN/4E73n1z1mbuhHMpZzp87NbxieBpv6dIFt+QA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ggaWVBAJeWcs for <qemu-devel@nongnu.org>;
 Fri, 14 Oct 2022 00:58:56 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mpf0Y37ktz1RvLy;
 Fri, 14 Oct 2022 00:58:52 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/10] hw/riscv: Update comment for qtest check in
 riscv_find_firmware()
Date: Fri, 14 Oct 2022 17:58:21 +1000
Message-Id: <20221014075830.914722-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
References: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=2798045df=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Bin Meng <bmeng.cn@gmail.com>

Since commit 4211fc553234 ("roms/opensbi: Remove ELF images"), the
comment for qtest check in riscv_find_firmware() is out of date.
Update it to reflect the latest status.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <BN7PR08MB435525C92550BAC5467BE672BF219@BN7PR08MB4355.namprd0=
8.prod.outlook.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 1ae7596873..f6e8eafa28 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -111,8 +111,8 @@ char *riscv_find_firmware(const char *firmware_filena=
me)
     if (filename =3D=3D NULL) {
         if (!qtest_enabled()) {
             /*
-             * We only ship plain binary bios images in the QEMU source.
-             * With Spike machine that uses ELF images as the default bi=
os,
+             * We only ship OpenSBI binary bios images in the QEMU sourc=
e.
+             * For machines that use images other than the default bios,
              * running QEMU test will complain hence let's suppress the =
error
              * report for QEMU testing.
              */
--=20
2.37.3


