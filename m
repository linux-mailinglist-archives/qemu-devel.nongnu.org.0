Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7700643DA8F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:51:22 +0200 (CEST)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxNp-0007NF-IO
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxGk-0007gR-8c
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:02 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:41707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxGi-0001s5-6S
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396240; x=1666932240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Flu3ImfJDOuc4S17tyTyOmKZ2MobboLwiyCkPnQM2PE=;
 b=npCn/hGcVtI+4SOBreRvrgPm2tXNAdoj2WkaPtEYQ/l6bAmB3goqvKPe
 J8iP0hYkZiZXrBAt+usKrMKst4JV0AeJosPGPikSSYJ1KVGX2+GmLmLqw
 0Vp3DTZdlvGdct63XGPdpJPmS+qVR11IlKFXxcmljdE1AiMQ74L/r1/2I
 R+YZUGDkreRjUZDcJ+Qaqj2FFLNlLW888tlWkmexo5cPJCF4FegYg0Kuz
 7qGaTtJrtwr0Lrvisj/EH+gG+VKaS2olFu7yfuclz8d3T2FvZqZ128ftr
 AEEBR4dS9rexv/mR9HzCh5fPghELRPCBybB+6KTJy+jaNT9/ouBu25Fzv A==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="184975467"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:43:59 +0800
IronPort-SDR: 1tTR+hA1/+yE37glzw/luHD2Tfs+ZDl3NF8/lIEqgLeeJL95t29YCZ8YJI61j2xR3k5jJsGomr
 VVc6XW+XLxLdsvaGbJV/5oNG83lJD8vmsIgry6LXo0LX2HjyMBF484xfU+uOy9xYLDD+9970zv
 5BCXImsVrX/t/uVgsxB8w4EheVn+v77TDn4jgA82pHa3etX97rMhGaZ0OGDfCuisfI/tuSA51G
 SDMOnCTuTbq0uoHOMRsgV07RnXEnHfwz/qOuqQCpacCtzkTCekh4dbvDX6Iy6+bROnn6HHMgp9
 16KrW/ZZBGiB+ZVEk+6sCoAw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:17:54 -0700
IronPort-SDR: IXV6mEfuA6iUbhXeVrWFDpglpgazuXMGFASEruG3fpphT29+UrISqs48W+VqxP7skRCFeRTnq1
 eKpIE2Nxoaz/IG3idtPTgmJ4m7QnxwZ7q8Z2X+jNfr2d/5s1j/oY4MqEfFUw7tDuaqfIeRrcCI
 VkFkfsYDI9JC7PBYwWtzutlcaoVBxh3Zb9u5hbu6r4F5kLzNrprwX3vQugdDeai7/CXMLukleg
 vW4pg8kiSXx2VgEDVMZbs2o1hTSyJJy6EJDYz5g1/2GHVex8vWbrg75/MfMf0kF5HEeufEp/jH
 8jY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:43:59 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftHf5HnRz1RtVv
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:43:58 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1635396238; x=1637988239; bh=Flu3Imf
 JDOuc4S17tyTyOmKZ2MobboLwiyCkPnQM2PE=; b=sd9NPyJ3T2fxjIJKouibqJR
 HyIiCs1wDacBcyDlqjZa+Oty757Mw3kQklVTnAHY8hsSnmthpiXrtEP9LYeQr63a
 khYfMMn6mmqv2aNPniTte/6Oc28oFgL1YUMEiUqxpA7fhHNsfb3cYL9tY71SD8tT
 xraWMozDhfU9QC6WEwClcShPr0bzFFjHc/JUs8Hb/spd5+M1VcxUGVutzWS/No5p
 csWK5D8my0XnZu/V1duTHi0f9E4WP2+Ryr9CYMH+i5F2geamDaDsf8MD3LtBjcpq
 OUmp2PeL64RDpqc+zLfaCp4c0pldmjcM2pcV0Q9dU/GWtiRElXf+5pmBIBizgAA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WkdFKpt_wIRQ for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:43:58 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftHZ28X3z1RtVl;
 Wed, 27 Oct 2021 21:43:53 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 01/18] hw/riscv: virt: Don't use a macro for the PLIC
 configuration
Date: Thu, 28 Oct 2021 14:43:25 +1000
Message-Id: <20211028044342.3070385-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
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


