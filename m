Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1957E5EBB28
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:10:18 +0200 (CEST)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4jR-0001CN-58
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47t-00057n-F3
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:30 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47r-0001Ek-MJ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260287; x=1695796287;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZU/43lRY2chLbAeJzOxBBpvBmMQMwxjZ66GSqjz1/4=;
 b=XrjjlfIfZwbfggpri237pBU4uBow7npu9Tt5WZJmtQkQaXcoiGUgh41m
 UMbkG0femKKD3lIBJPH+rhl4XEQ+f3PRsOHrzZw7z/d7HHFDixp2VBjMV
 Re3Ij1gU2/NSFPvYTL8qXNVC2UcOXysnGiWlvs5MnegiMfEUgoEqbDHLP
 5+RVM6r/XWAB0vpSupDcdQ+4L/g/VRpZdwkHgo8uEh9uG511wM7I7Q71S
 HJHSDS89wR6/TDR68PgKD6N6Q+65QRhRnDl+Gr3nKb9stIpAqBx/m4p2Y
 oL3BrMgWVIpphcNI2eijzkYFTZ5v+DRg/S4Pynxo92LDUNqJwcu+CfHew w==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530876"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:25 +0800
IronPort-SDR: 42TEoyIoxHIerJ8gQGeSo9iof0Pz0lfMevKu/GrMHkQhoF5Cpq+zWEr6+PdQl7nyPgE8J9P1Ke
 LPXssg4Yz28spL//geY5zzGpe27r8jAKAGllkw99eVi47dysrRue86dxyvz19e8pqHZgSy8Sfa
 nSoonOEhQn/WKCmE8dvoa13ReaMUxcoJYPKwDgFDTQ8To+gpXXRFNIEP+cslJ8n8iqUhfKv8PY
 Lik23BpZ2PildLUUFDeh54tByqD21anL7bt6hgwlDcXLDQpS1r9lkEZpSPAa1NoxNFc1me8qtV
 l8oIfuH8CoP1XoxI58lmK3OR
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:22 -0700
IronPort-SDR: XOhtK1GToLP3+JXz1T80JaWYfbbX3tgIadagn6Vr3lu2FGCEE3vJ7sf9KAIH1emt5fZClLx6fM
 6ETsE/HYMyIvMdbxar5eIRNEnf8oOdgS8Mvc8hhfyR8vyMdYd7TqZidA5b2rSsRQrTSis5Vhuj
 s+tfF7hlhs3MjoCJqZENueS6l6lMv3U9yMaeo6BI2V0crULi9SWlGPIQq4vwqvUPFsOXHrYb/J
 RSm/V8g/wyUW9aFTrjPN5xS32XdKVifdeCNhi6Xoo71LmA10tYSDuzpvwFed1Ov2Ya12DmSukQ
 lCw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:26 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sT4FTRz1Rwt8
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:25 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1664260285; x=1666852286; bh=vZU/43l
 RY2chLbAeJzOxBBpvBmMQMwxjZ66GSqjz1/4=; b=JMg2ghR3Ei4LFO6diuxp6Ws
 dPEtNdRCpBxXs6THW5apSOwIAo/WVzWmEbjTUBvHMRXC+BNU1hJefNzAUae3xj0S
 ellk7nucdohLNF0g1tWnRxPw62LVpnKiepoIk1g7WJf8HX6XR+MtC7Or0Ov9TuuO
 x5mrvcWc5BSSVYypRA4GEIBHEgcF8j9ffPFAfAnV3Pse3hKmLaEsv1/WavD5JN7/
 NkJz4WoLQlCKRSCULN17yrdATtzvSkzMlbYnBRvo+Yyv1IKtp8FViQ0cjOeUg/Li
 S2k1gI8SOIv0K3ozPhOmqCLHF2LhxsGJOEP7eW6CCBiNCO0IWNPJ3lIBCTepeUQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Nhynr5PLbgqo for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:25 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sR5ykpz1RvLy;
 Mon, 26 Sep 2022 23:31:23 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL v2 10/22] hw/riscv: opentitan: Expose the resetvec as a SoC
 property
Date: Tue, 27 Sep 2022 16:30:52 +1000
Message-Id: <20220927063104.2846825-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

On the OpenTitan hardware the resetvec is fixed at the start of ROM. In
QEMU we don't run the ROM code and instead just jump to the next stage.
This means we need to be a little more flexible about what the resetvec
is.

This patch allows us to set the resetvec from the command line with
something like this:
    -global driver=3Driscv.lowrisc.ibex.soc,property=3Dresetvec,value=3D0=
x20000400

This way as the next stage changes we can update the resetvec.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Message-Id: <20220914101108.82571-4-alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/hw/riscv/opentitan.h | 2 ++
 hw/riscv/opentitan.c         | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 26d960f288..6665cd5794 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -46,6 +46,8 @@ struct LowRISCIbexSoCState {
     IbexTimerState timer;
     IbexSPIHostState spi_host[OPENTITAN_NUM_SPI_HOSTS];
=20
+    uint32_t resetvec;
+
     MemoryRegion flash_mem;
     MemoryRegion rom;
     MemoryRegion flash_alias;
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 45c92c9bbc..be7ff1eea0 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -142,7 +142,7 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev=
_soc, Error **errp)
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x20000400,
+    object_property_set_int(OBJECT(&s->cpus), "resetvec", s->resetvec,
                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpus), &error_fatal);
=20
@@ -297,10 +297,16 @@ static void lowrisc_ibex_soc_realize(DeviceState *d=
ev_soc, Error **errp)
         memmap[IBEX_DEV_PERI].base, memmap[IBEX_DEV_PERI].size);
 }
=20
+static Property lowrisc_ibex_soc_props[] =3D {
+    DEFINE_PROP_UINT32("resetvec", LowRISCIbexSoCState, resetvec, 0x2000=
0400),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void lowrisc_ibex_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(oc);
=20
+    device_class_set_props(dc, lowrisc_ibex_soc_props);
     dc->realize =3D lowrisc_ibex_soc_realize;
     /* Reason: Uses serial_hds in realize function, thus can't be used t=
wice */
     dc->user_creatable =3D false;
--=20
2.37.3


