Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B16538E4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:43:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mG-0007iw-Ts; Wed, 21 Dec 2022 17:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mB-0007fG-3w
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:27 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87m9-0000Xf-7u
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662484; x=1703198484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KOmkdsaG2L/1f6aUZirO4FA9LnT3y2PXMdUmb+q6hDk=;
 b=ASRsT2+buYalDiOHo6y/i2LX7j2bMRjWSlY1RCQ7ETYKUI19T0IW2zK/
 L7+dgCeKAQBY00RGaYend12vhm/SXR/JyQUguA1kLnvCFyuNz+IYtnwzF
 hipJuA+qNLWGpyLZ4Own6pLmY6Qjf29bmGOk4GMiJSFND6WJ2Lp+2Hzrb
 du8QQHDgrLNOLmXFlqkw9E4rfjsrDgFkatB0CbXAD5xhX1nOIg+/DZrKj
 lpanpDm7o/mYu6BR/UkdLZdXP2l8drVdO3O6cOJ3QwsTdGh/h28d4LGGM
 KU+4s09qoV27bKVJzKTUuSBXTeB1wswl/YlJS0VgXqqu5RBA7u3ybR0o1 Q==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561340"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:03 +0800
IronPort-SDR: DZ8Vy+89NIaoqgAiifVmwSA3R14x2xJNQLZpmLOLkBmvhvZ6DJ5ZxjEy87REb8Uyo68Vwx2VdR
 rZZL+wWTrFKLCDWQSrqF11+uIke1YZDILVdrPTNc8wHZ7KdLGtj84ufeIChzYXjPfVwgOf+CfE
 mXPRw/1DIJ+3xrExlyZ0xGLnQzUJtHCKXfVfLazUvGswjAYuW+OZBvAs0AYDuSYC/E19cYRgH+
 GF+PFgrYK8l4wA3O/T/2GxnsAbbq0UEujiK8bDtdSEPPQe6lMMu1JEz4euxnNyjvOE70op3DMt
 lLw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:31 -0800
IronPort-SDR: XmHuAM+YVVMNq4V8SYgYXvv1oSASxjPqos9cNWIuagJHMAFgywHJJS3U0GyZbG71GqI7AD2oHL
 G0uX6stbYI1ceNgJhL5LpCOtIv3Y3pQJXU+Wvc3c18wYIirNBbbfFCbpxir2P+bHlXIJ45cyUl
 6q/mZ9liKEAm4a6k7baA8EcYCP7flIoY8wOLHp6F5Qz/mx20QL/RW+btJH2powtoedP6IX1T6a
 BJvfrTkky5GrcavYBgjOZGklg9DbZ7h8sc0NLnydkz3nybiVR1YPaxU1AV0UXfi8lCqwhjAxVv
 eqg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:03 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpM30kZ3z1RvLy
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671662462; x=1674254463; bh=KOmkdsa
 G2L/1f6aUZirO4FA9LnT3y2PXMdUmb+q6hDk=; b=dzVDggCJp99xMF57iNPHmZ2
 kFeMKGqLTWmypXoq2zMaSEvMr+3Jjrn+HLmZ6tAjBrzkfsFaKc22JvLTb/e7e9jy
 zwJrE+jWCrjjLCfI9iADRTz7Dp8BpUJNFiw7+dnvgl0JTA49hBBO11fhC1Gcd4z9
 GvAdhsr9ZojVKZ68I84DlN/qBdRN8O5RRoZdIqSQda3lmptfRGvjixM3U4hnwAW4
 VQl1lkgc9eJG5otiuhUd3QXwjW1FeRSYjx1ZLrTCFYa80rLxI1VrZpZ09AXZQecR
 jrn3De0PgzzmkD7vWXKJT7fJwrEgl5lpT11n+QfyGPBoGMDDkygxxqmKm5BCzqQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nPh_dqBgkZz4 for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:02 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpM10mqjz1RvTr;
 Wed, 21 Dec 2022 14:41:00 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 16/45] hw/intc: sifive_plic: Renumber the S irqs for numa
 support
Date: Thu, 22 Dec 2022 08:39:53 +1000
Message-Id: <20221221224022.425831-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Commit 40244040a7a changed the way the S irqs are numbered. This breaks w=
hen
using numa configuration, e.g.:
./qemu-system-riscv64 -nographic -machine virt,dumpdtb=3Dnuma-tree.dtb \
                      -m 2G -smp cpus=3D16 \
		      -object memory-backend-ram,id=3Dmem0,size=3D512M \
		      -object memory-backend-ram,id=3Dmem1,size=3D512M \
		      -object memory-backend-ram,id=3Dmem2,size=3D512M \
		      -object memory-backend-ram,id=3Dmem3,size=3D512M \
		      -numa node,cpus=3D0-3,memdev=3Dmem0,nodeid=3D0 \
		      -numa node,cpus=3D4-7,memdev=3Dmem1,nodeid=3D1 \
		      -numa node,cpus=3D8-11,memdev=3Dmem2,nodeid=3D2 \
		      -numa node,cpus=3D12-15,memdev=3Dmem3,nodeid=3D3
leads to:
Unexpected error in object_property_find_err() at ../qom/object.c:1304:
qemu-system-riscv64: Property 'riscv.sifive.plic.unnamed-gpio-out[8]' not
found

This patch makes the nubering of the S irqs identical to what it was befo=
re.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Message-Id: <20221114135122.1668703-1-frederic.petrot@univ-grenoble-alpes=
.fr>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c2dfacf028..b4949bef97 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -476,11 +476,11 @@ DeviceState *sifive_plic_create(hwaddr addr, char *=
hart_config,
         CPUState *cpu =3D qemu_get_cpu(cpu_num);
=20
         if (plic->addr_config[i].mode =3D=3D PLICMode_M) {
-            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base + c=
pu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base + num_harts=
,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EX=
T));
         }
         if (plic->addr_config[i].mode =3D=3D PLICMode_S) {
-            qdev_connect_gpio_out(dev, cpu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EX=
T));
         }
     }
--=20
2.38.1


