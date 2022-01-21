Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9097E4959ED
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:27:58 +0100 (CET)
Received: from localhost ([::1]:52710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnOv-0007pM-JH
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:27:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxa-0006oO-Su
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:46 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxW-00043A-9Q
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744778; x=1674280778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=owKr7Wfv1v1IxDroR4c3qkqKxV/+rAIBnjIqFvJTHHM=;
 b=RcwQ34GS/62rRVd3sGpIdnCoOrJ6YFRx5fCGudN2tTVut1HDCLbKb8Bu
 ZYmFGLzxQqbxKrRFN3n4e6t5Dv9enYhkZlN7kbY17UzovLKaCkUO2Wtn/
 jPp+p9Hxvwboivwc0oLRDUgXYd+f6K7SOSrRkIQk8wqts1cyD7IGywGxJ
 SqQVT2+hINJ9ZzWicbgNRFDGk+C++PRuuPXKFYE5gmko0bP4Ghgnsd24I
 4lhv89lFsvz6cQF9cJwFww9dgMuyjmMcAdyGHSShIVJTQ8PA/aeGWAvAK
 r18jY2aIbJrPV4+Hnw4RtwdRYlELM2eD2t8AJROZpPoNetIiipyIKAlug Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976525"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:36 +0800
IronPort-SDR: kD4PjoR3PD4cmYbahjgWHlgbW2MNwUtY5yx63AJrzHCoS+hGR/DTZJVpizx7ZDOt9DiUZpUBuL
 +g83lJHbNbn/2kbz5MUH7PUC0uRXF+BDCVSTBnNJk7DyEnLz5F74tnXKxViPiGUxBq8cQftrVI
 /ARdVy0s2oKtEUTjURg+idgwBjpToT1HlZaLjNSoF6xWn8Xttq0r+O8z9X3o0RLKe+1ifzezyR
 wl/qEEc+5Q7dD+0wPV0VThWw0cxXBt9tOgKPK53Auk4tU05q2sJ6VkRCdyl7frdV4dhoojyszk
 Cm/ZEBDM4z74+vIfXHLIwQc0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:31:47 -0800
IronPort-SDR: y0/vfl9ZRXj9LXHPvJ83qGcWdDQpXg/TcePO0ozXDyDfOLjyqG8r++7vY80/Iu0WEptOR5Hzg+
 qnXcOrjTFhWbo8hytN1z4JA3YUO10IXDUofSSumCHIcs3pZW/hSDCJumcrJFRuYSiB7FnTbBUE
 tdyyTj1G+NPnxLmPfFt9lOm2qN6V/7Xk7e7HeKh44CwuXlsVh1xZmZUKpLukjjfVOE/AF0b9/+
 pZTNGlU7Ylpox6WFWznL8tGV3X9C4tnW8teetPJ4N/Bnij7jOUoeIFXMLCXxV561cuta4EI/oC
 sAE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:36 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7xg6pfpz1SVp2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:35 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744775; x=1645336776; bh=owKr7Wfv1v1IxDroR4
 c3qkqKxV/+rAIBnjIqFvJTHHM=; b=rHrNZfuN+a4ApBAYA8lefAoWyL6YBgr4AA
 WoX5/pfXwDcZRcMADS9bx1AxoIeVry1Abds2bgYRqq/cXEpTSKX5JBMqylX2qhOX
 PhpdSSnbM8BHA351bNyNx5SLZqnMTvtRuVr9lbXQuR11Ma7YVQEuTQvwTbvvvBqN
 eJbbHfOu0ZClfCVHTxQibE3EgMRyLYo9Zr1evZdZKVkrEt/cEwPnEuTWw0KCdXny
 LnjZ1aRnM6tG4vzC3tjUwXYu53bgrGx+di3S7qDxqIIYoXHMYMmmUKafcEf5kYPu
 JUfD1JHECpSrncgcRGz4IaR6RDKd3DAubqvo8zlLsfvgsVgMTOuA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id hy8QWY1A1YY0 for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:35 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7xb3w7Xz1RvlN;
 Thu, 20 Jan 2022 21:59:31 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>
Subject: [PULL 12/61] target/riscv: Add host cpu type
Date: Fri, 21 Jan 2022 15:57:41 +1000
Message-Id: <20220121055830.3164408-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: Yifei Jiang <jiangyifei@huawei.com>

'host' type cpu is set isa to RV32 or RV64 simply, more isa info
will obtain from KVM in kvm_arch_init_vcpu()

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Message-id: 20220112081329.1835-10-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  1 +
 target/riscv/cpu.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8fa6fdcd77..73ced2116b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -47,6 +47,7 @@
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51"=
)
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34"=
)
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54"=
)
+#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
=20
 #if defined(TARGET_RISCV32)
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 53b0524830..32879f1403 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -235,6 +235,18 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 }
 #endif
=20
+#if defined(CONFIG_KVM)
+static void riscv_host_cpu_init(Object *obj)
+{
+    CPURISCVState *env =3D &RISCV_CPU(obj)->env;
+#if defined(TARGET_RISCV32)
+    set_misa(env, MXL_RV32, 0);
+#elif defined(TARGET_RISCV64)
+    set_misa(env, MXL_RV64, 0);
+#endif
+}
+#endif
+
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
@@ -847,6 +859,9 @@ static const TypeInfo riscv_cpu_type_infos[] =3D {
         .class_init =3D riscv_cpu_class_init,
     },
     DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
+#if defined(CONFIG_KVM)
+    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
+#endif
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
--=20
2.31.1


