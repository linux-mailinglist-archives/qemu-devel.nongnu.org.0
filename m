Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF72583625
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 03:06:33 +0200 (CEST)
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGryy-0005xc-UN
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 21:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2015eeb89=alistair.francis@opensource.wdc.com>)
 id 1oGrsx-0001U1-0G
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 21:00:29 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:38268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2015eeb89=alistair.francis@opensource.wdc.com>)
 id 1oGrsu-0001AK-TA
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 21:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1658970016; x=1690506016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y+Gs+EeH8M/oThW2c7E/r1DVOEnrJeyMxJuaOyZxUJY=;
 b=j4DRq9HgPXim9haV36E7jS2BOa1x18OB5R3haRemrXLend//52/eEHlp
 3qK5UVFd97nu07dFpBhtNAJFFvNAuIhNuK8TCDuTOmkGbgbf/ShjI7FKc
 pHkF1pyoZMGVKPTCkCcZOlVBwvhPYq5JpnMtzo+U2i/ET5fWSb92uUp0k
 19pMP6Aoiqczm013XHexMiDR1u6vzqvBOJFLm+4owZFPf6d+fSxbUAcfv
 uI/YG7exBUWTu+bRfbCeudEAnEWCAVobEuafeb7tqOxKkzxuhsNKKIw8x
 ZsERnovKT8K1D2R092OpIK57FkUnl0EEcxyFFcPKg4S31RGcHKrXlFhZ+ A==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654531200"; d="scan'208";a="207719383"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jul 2022 09:00:13 +0800
IronPort-SDR: CvhkhRToFWP/6DjE7hBd9lyVJmvB95ngb113XLOW/lNXFp3lLn4nP8r/gdX+t2tJZRMSnSYUxc
 uCmlMujYRzJho4xE7MecVMkxacezsfGhfXc9B6rrpegdqlex1Xdbq3mnOgNmKxJX+y780Yn0eF
 QY3wibkK2MP9dEzifn6izjLLGEr4yLLKvMzB5A2vXP7/e3GXdGba+N8TLitfN13Xp5zD/a1N6R
 N7oL5ysT8j9lynZH9FYBiNuXl2MavSb5QBMfBdwQHvNzS4keZeSbuZ3jUU5mP0rUe9iFrT6H8V
 K5B4BGuBbyz0qYk8ex+7jJBC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 17:16:21 -0700
IronPort-SDR: iI9eg4u2KSsB/A55L+TIUtUMOOaKDEPdzgUX+KowVEi5znrZLu1uV2hnq6kXCAJnSaxnd1MwZa
 9VNwPSvVGazgw5g3j6fHGT1LDzvXr75ADzKHHXGBWVyiCXVEO8NryxIcd5gbV16KL3MvnQ0S++
 jxeU+NAbutOwdIOI+/rspuL5EW9kSzjeuk0Q9Utj5rJLUtd9rQjv/5nxf7Ph6hg2qWCxllTp+e
 w1bh1rJSDSK2OwWQRwFpbmYWI8k6/T2Emyvjurbj02otik1Trk8KMFIyT+W90FAgykTgxMDlqT
 2hY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2022 18:00:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LtXPT4877z1Rwnx
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 18:00:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1658970013; x=1661562014; bh=Y+Gs+EeH8M/oThW2c7
 E/r1DVOEnrJeyMxJuaOyZxUJY=; b=sRwspD4MjwCW7Vug4zAM+HP5JJSt2SmtKA
 PueGQQhGzEFRdRC0uIkd3yImjokM5pZLu+nos7hAvAPYUEeDCHlvc21R6lkqopZC
 0VMhA1vnyr0cS8lktrdmAuSQbhxsWp7yyRGg1Mg+F8fMJONzmKGT3VnEWM9T4Z0R
 ptyMAYdIFZ15GSbze7q/+/VOGTnews2l1cJpvURYHRdgt3BDuQ1YSRpJMmuDYOiv
 c4wMJKoCQTEpJ30lBsqo88Fw9dUmmLG2X9j/EJBgKO56eYEY2CBs95vtNboMYOBg
 GCVFSfaw3ErRDY7uQ1op8T1KkK4slKu0vouyk3z5rgmF77gKCTrQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id COIU2vEMcKq0 for <qemu-devel@nongnu.org>;
 Wed, 27 Jul 2022 18:00:13 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.18])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LtXPR0mQHz1RtVk;
 Wed, 27 Jul 2022 18:00:10 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 2/2] hw/intc: sifive_plic: Fix multi-socket plic configuraiton
Date: Thu, 28 Jul 2022 11:00:00 +1000
Message-Id: <20220728010000.2764631-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728010000.2764631-1-alistair.francis@opensource.wdc.com>
References: <20220728010000.2764631-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2015eeb89=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Atish Patra <atishp@rivosinc.com>

Since commit 40244040a7ac, multi-socket configuration with plic is
broken as the hartid for second socket is calculated incorrectly.
The hartid stored in addr_config already includes the offset
for the base hartid for that socket. Adding it again would lead
to segfault while creating the plic device for the virt machine.
qdev_connect_gpio_out was also invoked with incorrect number of gpio
lines.

Fixes: 40244040a7ac (hw/intc: sifive_plic: Avoid overflowing the addr_con=
fig buffer)

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220723090335.671105-1-atishp@rivosinc.com>
[ Changes by AF:
 - Change the qdev_connect_gpio_out() numbering
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 56d60e9ac9..af4ae3630e 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -454,10 +454,10 @@ DeviceState *sifive_plic_create(hwaddr addr, char *=
hart_config,
=20
     for (i =3D 0; i < plic->num_addrs; i++) {
         int cpu_num =3D plic->addr_config[i].hartid;
-        CPUState *cpu =3D qemu_get_cpu(hartid_base + cpu_num);
+        CPUState *cpu =3D qemu_get_cpu(cpu_num);
=20
         if (plic->addr_config[i].mode =3D=3D PLICMode_M) {
-            qdev_connect_gpio_out(dev, num_harts + cpu_num,
+            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base + c=
pu_num,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EX=
T));
         }
         if (plic->addr_config[i].mode =3D=3D PLICMode_S) {
--=20
2.37.1


