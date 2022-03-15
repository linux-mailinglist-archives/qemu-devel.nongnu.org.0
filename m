Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AD94D9500
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:07:44 +0100 (CET)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU1HT-00009W-2I
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:07:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=066bbe4b2=alistair.francis@opensource.wdc.com>)
 id 1nU0r6-0004KL-9l
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:40:28 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:18518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=066bbe4b2=alistair.francis@opensource.wdc.com>)
 id 1nU0r3-0008F1-LP
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 02:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1647326426; x=1678862426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uH+FnFzokSTg9hEnoprqBqYtSFmT3D4puqtd1m9I0kM=;
 b=ADxEidZ+YK1U0cY6mkyFKLErPIvFBp6h5bdKLr/goFD5MVDH60kqW2Fz
 EggzRzELoMxUUJE7Ncguz/Sfaxst9gVtyLdMUjC4ugN1zZmOoKe64ssgt
 SWEVL9cxO8x4NpyAn5yGn9YJrJcq3Uy1x8C4B4r0eKUwI9nChVggvFfXe
 eWDKLZo+mUkno+TuWzxpb8WFmnvJ1YJLMzTQVesww79wr2H7G9PYtguFB
 kvbZ7Ho5USyWkRAo3VYnrBcDOFi+5e5XBSKpdzNX1JeQaxCqbgygA/SPt
 COz3h/6jsyxkXTN3o6q/loQL0jYb6HeYNpjl28MCrZWDtw9PFMWqV6zS+ A==;
X-IronPort-AV: E=Sophos;i="5.90,182,1643644800"; d="scan'208";a="196320401"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2022 14:40:19 +0800
IronPort-SDR: 3554KGE5p8Dk5oA8atz3aba98dR+hKKJkAiVqDU/tJ0sKVcTT+/NdGzUwj5b0Jer4oAhRnhRuN
 fVIM1ruwhX28CHcZlklTcyvRFhM8t1ysjCFwSnvEJGr5dpAFJEhNPHUatQLLbA9rD91wNpAP9Z
 M6npS6/gotF45LImwFLERzy49FA3ed+T2tyffa4uHIh2T3TV/ctDlWSGpTi8JlUiAIoSpDAuAP
 iyUdL2h9tHrkd4rPz0JvK30O+7gCpCF8wOpxgGS3uqcQhL1rIrgBZcQTZUoMgufoPLd7pO1wAU
 dMgFDTFtUspbYQfpZNyXMRov
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 23:12:25 -0700
IronPort-SDR: s4m+n1hM2nhQjDnMnEydLPk3j5YqwebNvii1Dl+igzJ35Kl4boZ/sWSCJwJdfaCWPX19IsHIM9
 w+J7SPMfEYGcWXnCbBx80kkG/xREU1vhrbDBYPTH2Tptbqn5+UBdgmCt7CIGYAWo5rE6Qvyav1
 +C1KH6JYx4D3bXYPj4RWM07c72Lmb61SSzDFdpyvUAyhom91AJDMetzgTjCklNygPsR9IgyhZ9
 AjfQO5vn509lHo++L0YYytQ30SopkGyPJDdiK2sAaeB1M/vOARF9ny0yGcaiC1kNqCGJpGEMmw
 BnA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 23:40:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KHkLB0hKGz1SVp1
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 23:40:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1647326417; x=1649918418; bh=uH+FnFzokSTg9hEnop
 rqBqYtSFmT3D4puqtd1m9I0kM=; b=h2k3Y9mkcSePcXpw+4F3rdE9b8XqZNEa1a
 AgzBdY/FDgwfTqUv9LWILrySFrv6glsHJuMFlNxM/kOfdEgPSKbOEpj+Tao3FZoG
 mkKIrOblMu0X14+uSkVmEgjZnBeSA8THsv7+o5WHVg5DHuub9XF+vjnJiu+FBPKN
 S83qB5OOV0LnqdZ/wrAg2BNmYr7U5uJiCdcjpdBMN2WVb5bGt1jm2SdRDBxvkIdz
 dFI8Ggt0QVwi5WNBwhbAhyMyltR+vKSvhvXFUpJat+xqcBTCs8c0H1j3Ee53mvR8
 R2c1pIAemoZ7pd+rBH59H2vQCk/Jj6BG+gNtowxTySXkTkLZw30w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ggPXJajEQbI6 for <qemu-devel@nongnu.org>;
 Mon, 14 Mar 2022 23:40:17 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.107])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KHkL64fdCz1SVp3;
 Mon, 14 Mar 2022 23:40:14 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, bmeng.cn@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 1/2] target/riscv: cpu: Fixup indentation
Date: Tue, 15 Mar 2022 16:40:06 +1000
Message-Id: <20220315064007.3600746-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315064007.3600746-1-alistair.francis@opensource.wdc.com>
References: <20220315064007.3600746-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=066bbe4b2=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ff..a4120c7fb4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -709,11 +709,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq=
, int level)
         case IRQ_S_EXT:
         case IRQ_VS_EXT:
         case IRQ_M_EXT:
-             if (kvm_enabled()) {
+            if (kvm_enabled()) {
                 kvm_riscv_set_irq(cpu, irq, level);
-             } else {
+            } else {
                 riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level))=
;
-             }
+            }
              break;
         default:
             g_assert_not_reached();
--=20
2.35.1


