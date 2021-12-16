Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480D1476955
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 06:03:07 +0100 (CET)
Received: from localhost ([::1]:33812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxiv4-0000cf-ES
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 00:03:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxink-0004JL-Ux
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:33 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:18178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxini-00041i-Pf
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630530; x=1671166530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3X15HcUvQRy3KpgAj7UNFaQ0IIYxsE7ynJ42gJyEVqg=;
 b=qJ8CrUBV/bWd3/p+0FOVWB9s23cknHd50IRn5ImohineYpmQUm5g3LgX
 aVdQvLh3CgFm0zWY3H7tqQZfgaV+9K2Pn6ZbChvYkWTjmXljRq0VQ2VXx
 nfR7jZleePU9KvuRCyR5ho1+4qQ5gvO3iyomvDPFppd9rN00bMsRl57sa
 Q3HHZYBGVdahYZpfAgGWo/bFtdffW1Mia8Na3Tw9/Bu1yza7kj6zwFpAg
 fNqt9Zwr7PE1zBQF2eKsCytzaxCC4YZfU+ihSEBG7RpePZzyKdvS9uGIo
 BNXth3I4fFakM/LlWPHWxgMkJPzNjuWqOcfz7k9i+kOnE8wd0qRc05ewG g==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="187354603"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:55:29 +0800
IronPort-SDR: VkfRVdamu+S/qXWK6U+dl8k5QRYFxp9Hi+IdSTNmSitH2I5Gg93n90srWPdiAWvBW7wC1WIvF9
 4pAJEJ8vDSAmIpFRMb+SUAchv8dU5IkJLngohsxrnftsVHiMe9ZX2Ryn/1pliP98wMqtoY2Yoj
 FdnyBvELX1jXFZmZ7l/D/5JstpxW+16cqHh4x7vFI96beWCPkpBidY4AwPj+Yyy9xfiB3CMgoo
 wjt4IQhtB2kuuBl8bLCFoTPkWevyz+7HRAb4vRy1d2IQMNT22kIaQWnPovNlMnsPoc2Q0DZXOW
 2v+GDW9c6orvppYqdNFaILY1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:29:51 -0800
IronPort-SDR: J3ob3WqUp8hsExXydjMXpl8VfrSZ9dLeMcXinsZ4Z5aCKeEftDWPdswON95h97fTikgb6T8v23
 rEHsgPrvd/wpEcW72S13XYnKCu6ZD8GdFsC/QbbFejR3sebbzm2C3EjAAg/Us41trOlppkXWJk
 7l7vhqkvc6jM4n7a+empgR8t44LmkOm0/351fFYloG0tWpZILni6PfPxwAdmSZAXS6L/vZsbCi
 jCDt5XGaDulOOr4EuRl61g+Sn2wOsodNTwVxxgaaBsjwhWyiSZT5JZ9I0aj6jxCf55LiyTpqVa
 Iac=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:55:30 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0DJ6R1Sz1Rwns
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 20:55:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630528; x=1642222529; bh=3X15HcUvQRy3KpgAj7
 UNFaQ0IIYxsE7ynJ42gJyEVqg=; b=Ieoa19D+IXxSdKlUIz63VrlHuR/7Auulnt
 A/wgMtB2Nu4vX06xI1gMQMEx8sD+apV9tSOGPGkhWhjStTS+2woaX+6Y7PLzC2pB
 RtFmzOGUfHgE3gcAKktJTtsIFWq34P5iyQknjrh7BRdZx+6BwapyM6uGF6qd75dT
 Gx+8IwguvLWwEP6RhE4Pp5Bp38Vk/gFvPM80aJvxapiSVECOX6xfIae0s+IvyJPW
 ZMKalVH6+HDTyzeV9i7PpVIEBdcCA7VyZt83CcIpGl1IaY9goVFawVCmlZWgydDK
 Fc2Zy7Ztnmp/pcAlvJFLCLKN9qQYVza34BYL3Rgq0O8yAWpAV6Mg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 44rSkG2u-oaU for <qemu-devel@nongnu.org>;
 Wed, 15 Dec 2021 20:55:28 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0DC5rj7z1RtVG;
 Wed, 15 Dec 2021 20:55:23 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 9/9] hw/riscv: virt: Set the clock-frequency
Date: Thu, 16 Dec 2021 14:54:27 +1000
Message-Id: <20211216045427.757779-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

As per the device tree specification let's set the clock-frequency for
the virt CPUs.

QEMU doesn't really have an exact clock, so let's just 1000000 as it's a
nice round number and matches the sifive_u CLINT_TIMEBASE_FREQ.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/472 (RISC-V virt)
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3af074148e..41a85cfc60 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -202,6 +202,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,
         qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu")=
;
+        qemu_fdt_setprop_cell(mc->fdt, cpu_name, "clock-frequency", 1000=
000);
         riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
         qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle)=
;
=20
--=20
2.31.1


