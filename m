Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FD6485B64
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 23:11:53 +0100 (CET)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5EVc-00059g-ES
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 17:11:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EQt-0007fu-CX
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:06:59 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:1937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9978dc08b=alistair.francis@opensource.wdc.com>)
 id 1n5EQr-0007tH-AL
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641420417; x=1672956417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XEm4hcsLEdMTCGKbGJj98LwZvGvF7wOw0ARvNPFpnaY=;
 b=HjzKme05lgBIMPtB2V6m0aZ+pMJB29wtWG7jG5t19zEz27KVKg3eGHKr
 EoPKroSNZq+mr0cW0eMpN8TxArNl7t1xspC2GYj+zI93LplyuL0skP80d
 nDPvExK9hHwWoEKdA7veKf+e/SNOmKjs4Fx1YrtqLK17w4tik3zuyzMeI
 /Vdu+6WLKbA9v33a+4Gd+k3VKWrk7U23LDWRFo4rwdI/uj+qG9Pf2K0Ip
 XqgNQfpussAJeOLYrqkxeEth1nhGYoS6Sm/l/2c4jl2PpJcxpxmXEQekQ
 NrwwVgV+/tOP2iQWRfaSsfbicYajOhfBDuhSKs1g2ffjGuIG4YSmaL16/ w==;
X-IronPort-AV: E=Sophos;i="5.88,265,1635177600"; d="scan'208";a="188746545"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2022 05:39:56 +0800
IronPort-SDR: RC1zYx0DfaOwZe6I8zhLjT+BmjUG28fiXmtw0yPRr6PDydrugof7vUYtPc/TjFv28YZ35gHIXd
 6nco7RzloR+9t3uwt50CjuAQqECdhjOKfa/GzBQU2Yb3QNr3dL24AZSe58JgVzcV6QUdf8+7pl
 2s/O584dLOnzCX8FIpGARlnr3ARjPpK+YLkJOyzf89AnBaDA/mRwSUjoiFM3jacBWx6/WqqSEy
 CDMTUEuA5awftwoq+0L0XjHHmUhb9eDCdTKPgvuFVoe2gd/26IlJ1lANJ13mtWy698Px8rxZ9s
 QHPbri34s2Og3AjmCkFvzaRE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:13:47 -0800
IronPort-SDR: iE5lTEBEBHVyYfp15kFGgIP/smlfP3JbG4Ike0JCATarpu4ISZ+sooOfLElMV80V9KSfjhyFPi
 MARQq7UVtGRt9Azr0es3faYu/TgotSig56CvGRPPkMpMsLlaxBgjTPkrCRnTOBJliDkevSxIhd
 OSigtGF2APgzxTvXA8o7Q9etzkN33sKfRn40ZSTKGjkGEKfNg/f1J43eWRioWBtx1OjJIqBWhc
 tfiTfFwugLBwga1K4FoYS1Aun/2DHFcVBbtNexAzcLzcmfuKfpXPMU4aloPeq9fOZdF3zgPC6c
 4pA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 13:39:56 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JTjZ35cMVz1VprN
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 13:39:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641418795; x=1644010796; bh=XEm4hcs
 LEdMTCGKbGJj98LwZvGvF7wOw0ARvNPFpnaY=; b=nQJ8ljk6o113SXtmBSNAej1
 Qm0dV39xFrmonVx+4hxYGrZNHoZsna5FbqBM92/3kQec5gpPP9E4LI3t35I+USxq
 2adkGQHuASfJdpxDODRy7f+0QccsWQIaIdNgGkdmkGPboRLqu2qXxhyaDYkawewn
 IONAv+CGqryaZa3999fYsVh7PbP5wxMRcGQBiRMgFwxCvUv0E+G0PI1Bhh87lS/M
 sy4NP+NSlAmL5odEuTwLRHguL3GkeCmz2Bk0jhxB+dj/dwGXuV6V4UhewUE6q5A4
 ghfV0nlNrZY2O2hk11Fkr57dmCUDKf0abae7iE4yAYsjvLr3FKGqaNHp+icr1Tw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2fYlYwXqKf6I for <qemu-devel@nongnu.org>;
 Wed,  5 Jan 2022 13:39:55 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.73])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JTjYx6ywFz1VSkh;
 Wed,  5 Jan 2022 13:39:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>,
 alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 1/8] hw/intc: sifive_plic: Add a reset function
Date: Thu,  6 Jan 2022 07:39:30 +1000
Message-Id: <20220105213937.1113508-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
References: <20220105213937.1113508-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9978dc08b=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/intc/sifive_plic.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 877e76877c..a9f7a1bfb0 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -355,6 +355,23 @@ static const MemoryRegionOps sifive_plic_ops =3D {
     }
 };
=20
+static void sifive_plic_reset(DeviceState *dev)
+{
+    SiFivePLICState *s =3D SIFIVE_PLIC(dev);
+    int i;
+
+    memset(s->source_priority, 0, sizeof(uint32_t) * s->num_sources);
+    memset(s->target_priority, 0, sizeof(uint32_t) * s->num_addrs);
+    memset(s->pending, 0, sizeof(uint32_t) * s->bitfield_words);
+    memset(s->claimed, 0, sizeof(uint32_t) * s->bitfield_words);
+    memset(s->enable, 0, sizeof(uint32_t) * s->num_enables);
+
+    for (i =3D 0; i < s->num_harts; i++) {
+        qemu_set_irq(s->m_external_irqs[i], 0);
+        qemu_set_irq(s->s_external_irqs[i], 0);
+    }
+}
+
 /*
  * parse PLIC hart/mode address offset config
  *
@@ -501,6 +518,7 @@ static void sifive_plic_class_init(ObjectClass *klass=
, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
+    dc->reset =3D sifive_plic_reset;
     device_class_set_props(dc, sifive_plic_properties);
     dc->realize =3D sifive_plic_realize;
     dc->vmsd =3D &vmstate_sifive_plic;
--=20
2.31.1


