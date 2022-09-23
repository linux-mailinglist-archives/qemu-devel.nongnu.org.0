Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A535E72EC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:28:41 +0200 (CEST)
Received: from localhost ([::1]:40054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obaIq-0002jK-3v
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyY-0001jz-PH
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:45 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyU-0005ek-Jf
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906058; x=1695442058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vZU/43lRY2chLbAeJzOxBBpvBmMQMwxjZ66GSqjz1/4=;
 b=Gdtgsl4rmPztP0/+GM1NBvS3uRFcwjCBjpL0q9AmdpbUImx67yN/AUJV
 2c8R6lmnLJevjNe5EPw1XhbYl04o2YpRWweVZbxQsunCzyMbkLRFVRWIW
 oebBgOfTyIXu1plwZXqjcNINuRYSWDLWjNPfYd7QGvJkReNvL6kR7DpME
 IPw4RvrhPHMByX0DxZhnSN56uHuHy7DE65KAlrcSrUvfwgtQs7fe0wFQL
 S9Teii+YeV3tkjI/mvgxm6+8ErY0UXfkr4bVnmmoxslBson4uBhp4Y1hf
 xgkLmekV+uiq+S0ddp2JhPeICgpZDtk4mnGTMuBWY2W/WqJxamPLs6afY Q==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510482"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:36 +0800
IronPort-SDR: Ytw1ckH8qcjD7+tyc4rOEV2z49l/9g9YJOULlha+lAIGwdpwdwVIcLEKVwWDZ/cfHL0NyQz4DU
 ZjLHbz189BoDhjldZTvkG6F7rNFZwXstRstGHbcjmmCB89re8lmqg3MK5CcyD+8wQ3Igh4SeG4
 ugX84heOD5ety/v2Le0X8qiBfsh2TZN7grEmLserglUaqEH3+H7eGq1NGa2KeQj1ST04I9PVTI
 4Wu39O7BtICs0Ly0itoL4mB/4HZbUTz2sOzKqYOoO4etRHieUnwCzjYoH5M4ibh/6fX8tv19NZ
 9J7FpJrQiDXVyOmCHMs1CB0y
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:39 -0700
IronPort-SDR: Z9dFel/Csf9OWGuhyIGhJC5sWuXHSZi/YrRnbP6tClm00ChmZuEDVNdzC7+1mF80JW2lsY2r0g
 0s0yq9ygDXAhg6eXoodYqw5RKQcw+xHwFGkZR79xW9IiVArKaMrfhPPtX4DtTHdsz3tnENICjO
 BNHX8G/qlhiw9KaWp8wIDXlGOj1xbChWQodg0wd/+VxHkVTtzQJzrQLHMeWbwqITARxJ0C++0l
 w46Ip25TIPfAJfAiDueTekBiQ+SpkeiUmfMeD5tYE6fnh0w/MuvPCyFzgQF+0IRqY83VzbHwhI
 tQg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYdsN2NjYz1RvTp
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1663906056; x=1666498057; bh=vZU/43l
 RY2chLbAeJzOxBBpvBmMQMwxjZ66GSqjz1/4=; b=cKfueAyXvm1D5N7YepF4tXQ
 DVZbTZOiniDYQ85XktxhD0RJ+WhuXI02an6qalakkBy3tff/xsLq16EAAa5yFuEn
 6ALU0lgdLq4xJdd7XQ6Tzenlg8HjnHpxqu3U6wltvQIsnxuueCHGyhoiSzdSsL0v
 PAdQy0hOJFYZxzS5zOjIp88Ap9Y8VeNFr7n9TW9oDjSZqTxkYtgZVHBHTnD1Zw6K
 bg6Egawfe87Xqk61R8IKp8flslBdXIyD059fScVtEQccuJkVXPeXFg4IjRDCjPlf
 aPUMaC5wg1jVTeUpvVzwkb+PYnyUT+bhsrlJ4CLTFmxrinZGa1wFmpZl8WGQJCA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pOlSn0zcz5JY for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:36 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYdsL1cmPz1RvLy;
 Thu, 22 Sep 2022 21:07:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 10/12] hw/riscv: opentitan: Expose the resetvec as a SoC
 property
Date: Fri, 23 Sep 2022 14:07:02 +1000
Message-Id: <20220923040704.428285-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
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


