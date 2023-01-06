Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4AA65FA41
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:30:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdET-0003Mx-L9; Thu, 05 Jan 2023 22:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDG-0002dR-AX
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:17 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDD-00088M-W0
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974967; x=1704510967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5GCD721cWnvqU7EJYbteJdF7sl+lFrKMS/AYDxW8vbc=;
 b=Z82yaSDs3LajjK92VUCq3iCQDpB6BYraGz6Wu70RLTOodUFLxS153+mR
 rGAlC23j4nXaIZ8Ez1Bm3ZDBX8Unk0J0cHz7Yvh6Et1gfvfUf/uR0l/MH
 O1TYToikEZDbI1ktxSPjQfBZaoJcQK0iA5CnAtHC/j+nO2EouaHB9mb84
 wF0yJkjl9cs2/ZaZ5a/JQj7ZUy1KYE9QUPpwxm/tajGaTrFcJdynE1IDJ
 QehZlXvk57hQojgnKPBf55jZFVcunX6OOi2/mkGERd7cfY02E7HE9JSfB
 YZ+JaWx9puH2TvwW0BPyH0uq9cPEbFN2y+xysdUTi6FqwP+5eHsPQSJlQ w==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254833"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:15:06 +0800
IronPort-SDR: po3vxTLMXRYeB4C4Agl9HjfaffYVzPy1hsWDpLkqkvCoZL3Zq9HRp1DaNB1I2huRMhL7HQXHBK
 Nu7XWZAl2ARLCtdFePpHOil2eLcbQq8MooH+h54oiE7l0m/Z/3Q7QqwC7Pq1Yj6YMBLiarc1h6
 8Bdy1M6QOKXpdEYtdaHTs6ad6mt9KvYVHJdzm1bhDwaMcGhx7UYp9uGObb0gv/7KNUb5c0wRGG
 TvQHttO4KDrr1hgEDMzp2Z4QyNI3ECzcqk+WyJmmCDOP280/QlUweX6x7oygpVxIk0RIP2lvlE
 2MI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:17 -0800
IronPort-SDR: XLzyvlGaMECAfpyF1ucl0cuQUSO91cqfchqqhYRRrKgu2o7sVybYom5ZbyyfeeaTJbarZaYdYu
 CsI6d8dCiO+otCccprloSP/Y8qnhMlo1FQrW0tjVsDV+wiXCYwYEnlEF3iarvMycdv49flULLs
 Q/ZW38tWzFwwIE1Q6IDtmg688TpmyTAyCazZYaqcWD0q1o2W539pTdjQW0fDPDc3dr/Y/sOq7l
 uAdtw5xF2aN+rtzARs9tu3WH4aGxq7k+KgWTgXhu2kRCqLZdJbjtTpi1jHe1MJpNi63jAPNQLJ
 DtU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:08 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kL5DG4z1Rwrq
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:15:06 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1672974906; x=1675566907; bh=5GCD721
 cWnvqU7EJYbteJdF7sl+lFrKMS/AYDxW8vbc=; b=r1CqF/Ed3hrD7izB29yvXH1
 carMMS0gL0IwDwRXB7qPBp8447sbUxayL9A+BRvJb8SFPw2ruzT9JB/GwovhIQQ7
 6nBVeuCkQexAgMKQi/2f8pANtT1E1xj6SJlxfSNtT8nbqYeZK/kdSxoJlBCIaRio
 DWM5QAQezErUGeWzP4Ia6/iLxivlcW1OwUjHqcMgzX1H0iwMvtU7jFV6pEEudpXm
 sV/pzp+Ouxc83z6qHkOzqxlBKqgdQqgHhQmIyxBQ87bAThfl19ZwqdiALF+svqKD
 V0Ru9wOvM87p4aCcaY1zd3aqsLtr1873M0lWc+pcPcSclF8WvnVo9GEE+OseRug=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id PwVoqyG-HyzU for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:15:06 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7kJ6xMgz1RvTp;
 Thu,  5 Jan 2023 19:15:04 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v3 35/43] hw/intc: sifive_plic: Use error_setg() to propagate
 the error up via errp in sifive_plic_realize()
Date: Fri,  6 Jan 2023 13:13:49 +1000
Message-Id: <20230106031357.777790-36-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

The realize() callback has an errp for us to propagate the error up.
While we are here, correct the wrong multi-line comment format.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Message-Id: <20221211030829.802437-8-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c9af94a888..9cb4c6d6d4 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -379,7 +379,8 @@ static void sifive_plic_realize(DeviceState *dev, Err=
or **errp)
     s->m_external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
     qdev_init_gpio_out(dev, s->m_external_irqs, s->num_harts);
=20
-    /* We can't allow the supervisor to control SEIP as this would allow=
 the
+    /*
+     * We can't allow the supervisor to control SEIP as this would allow=
 the
      * supervisor to clear a pending external interrupt which will resul=
t in
      * lost a interrupt in the case a PLIC is attached. The SEIP bit mus=
t be
      * hardware controlled when a PLIC is attached.
@@ -387,8 +388,8 @@ static void sifive_plic_realize(DeviceState *dev, Err=
or **errp)
     for (i =3D 0; i < s->num_harts; i++) {
         RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
         if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
-            error_report("SEIP already claimed");
-            exit(1);
+            error_setg(errp, "SEIP already claimed");
+            return;
         }
     }
=20
--=20
2.39.0


