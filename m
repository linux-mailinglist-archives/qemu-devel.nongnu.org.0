Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A35140ECEC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 23:51:52 +0200 (CEST)
Received: from localhost ([::1]:51700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQzIN-0007QF-6Y
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 17:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzG9-0004Ql-79
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:33 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:30147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=886e160e1=alistair.francis@opensource.wdc.com>)
 id 1mQzG7-00026z-Hb
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 17:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631828971; x=1663364971;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CBsfhYFKjqvmOlHyimgBj0IVZ6vQo4ThlAu38+MgGcM=;
 b=LCRprXunx9jP8DWXBeFLWx1XyqTVg4CERZtJZvUwavM1R2p1k0qup7yd
 aXcmcaoyUosmsQIAFN7HAn0YZxPjPaKAUDf3lXg+pKEjriL4EAZCDOxOJ
 zZcxgtWrxI+t/jeSuLULolfY1Qv8fQQgretUw0omrrES1KNO3lpx1dclh
 LJKw7UN1kJ0MUM0k8KFItZXcLgLpH87nmndgXK/uDq+MJTKboIlQVCtJ3
 N6rLlcenTGFxrwfAE5oB4xv15ouOFXlSOPK496N6QJRG/IMbmGlFEG/88
 8j/toQCJ0Q8iG4oqS8bQq+TMbiTFSsVX+Mf9kdy8/uK02Qm/ytPPb6io+ Q==;
X-IronPort-AV: E=Sophos;i="5.85,299,1624291200"; d="scan'208";a="291828386"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 Sep 2021 05:49:29 +0800
IronPort-SDR: FBJvWFvSQOHdCPrJiCSXgBqY1Z58w22mLY+2TImcgUdnayaZR4y5rX/nEcCxtXpJTwyGWyBYBt
 uBNX5rcLrBtD7Kryv5TfFbANfMx0Kb5FUBAf5tckZFlVIwAupUGF/63gsxS3Qbg2fI55lDQHlq
 sHePrYXXnL3fvJ3x90rVYustiVt/1eX92BROrDucMLurpk5toZmI9OyeDlg4n6/6X0ARgbNcTK
 D6g6eiZNsz2vZ81yUh0piJZ6sjNsiliORLD/VpRirQ0A6OfqrIl28iB3ZT9VGM6EpM+Jhzac+y
 sbTcFXo8Cz8uRrD5KJ5kAUDw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:25:50 -0700
IronPort-SDR: m7SjlJcj6ppNNVkbRMHz+Cx41x5k4TbLC/hdYtI9Kn8xDcEeZoFTE8484/xA+349Wn/YoQ5XSi
 QAiFt8q3psI2K+Gc0G0TucyQr7ijdk5Wb8PGq09dbzqwRuLcU1xrOKvwf4vqNwQi1FzNNkueCd
 kMkfeucEc/2/+yQAeeoCmBqadxAsTdd71t3IS9hm9K1EHL519fMXu0A77+negiow9IjwsRLctf
 FlYJMXYWDAdSiYRsCMsEdT5ZCg/EkU4koiNdoev8J8Dl9kikaw/GIeQ8mS4+cgki25fVBK7WPc
 nss=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 14:49:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H9W2K2drZz1Rws6
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 14:49:29 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1631828968; x=1634420969; bh=CBsfhYF
 KjqvmOlHyimgBj0IVZ6vQo4ThlAu38+MgGcM=; b=lyVGRw4zGEA5Ht4vCggMsGE
 BuzSf81ddPcj7FeUBxi3EFPSq20IRuJIOIuPhjnXf7IsMw08/wZip6wdELvIg09h
 jZNiJ3xIIZ/8Jg3FQZ5T4gMZNkI3jiyWUECsoVUXTNC466gUKSpzhq/IKglr9Vhw
 HTHSG4bZ8b14HC+yb9M+y3q6CsW3cAaCUbVDQaIt4UfezdJEsoC6dr5XlVmiwgyQ
 qqP0KC7jyRvRwkZVd8Tuiumaijb2cJdhoDwIhscWQUho+b5fqMWn+w1P/JPeiwvM
 XQz+pECxnFVkBGPJMPSHQg6gERJSM9SJGf9m1URM4wr+2RhEOUkNjexXFVK8V7w=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4vWfDiEbG8G9 for <qemu-devel@nongnu.org>;
 Thu, 16 Sep 2021 14:49:28 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.23])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H9W2D2cCtz1RvlV;
 Thu, 16 Sep 2021 14:49:23 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 03/21] target/riscv: Expose interrupt pending bits as GPIO lines
Date: Fri, 17 Sep 2021 07:48:46 +1000
Message-Id: <20210916214904.734206-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
References: <20210916214904.734206-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=886e160e1=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

Expose the 12 interrupt pending bits in MIP as GPIO lines.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Tested-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 069d6162f0bc2f4a4f5a44e73f6442b11c703c53.1630301632.git.alist=
air.francis@wdc.com
---
 target/riscv/cpu.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d4d5961807..7c626d89cd 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -567,11 +567,41 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
     mcc->parent_realize(dev, errp);
 }
=20
+#ifndef CONFIG_USER_ONLY
+static void riscv_cpu_set_irq(void *opaque, int irq, int level)
+{
+    RISCVCPU *cpu =3D RISCV_CPU(opaque);
+
+    switch (irq) {
+    case IRQ_U_SOFT:
+    case IRQ_S_SOFT:
+    case IRQ_VS_SOFT:
+    case IRQ_M_SOFT:
+    case IRQ_U_TIMER:
+    case IRQ_S_TIMER:
+    case IRQ_VS_TIMER:
+    case IRQ_M_TIMER:
+    case IRQ_U_EXT:
+    case IRQ_S_EXT:
+    case IRQ_VS_EXT:
+    case IRQ_M_EXT:
+        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+#endif /* CONFIG_USER_ONLY */
+
 static void riscv_cpu_init(Object *obj)
 {
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
     cpu_set_cpustate_pointers(cpu);
+
+#ifndef CONFIG_USER_ONLY
+    qdev_init_gpio_in(DEVICE(cpu), riscv_cpu_set_irq, 12);
+#endif /* CONFIG_USER_ONLY */
 }
=20
 static Property riscv_cpu_properties[] =3D {
--=20
2.31.1


