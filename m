Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF12A677398
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 01:06:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJkLm-000118-DU; Sun, 22 Jan 2023 19:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=380668d3b=wilfred.mallawa@opensource.wdc.com>)
 id 1pJkLk-00010u-3b
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 19:06:12 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=380668d3b=wilfred.mallawa@opensource.wdc.com>)
 id 1pJkLf-0007TV-7X
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 19:06:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674432367; x=1705968367;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5oa6UUini4nihWHrDxq/euHryq8YHHpTXQ5iJqv+FnE=;
 b=foD+NS03CbjIPV7klQDTMxF1wuB3BYfmplxDp9kmSBnGax7oyb0VX8zK
 ZeC0idNt23Ox1Q4DjTODmIprYuX/9TS91ikvbWxwp8dM/sNmcyOXWs2Uu
 ZDgaMQ5wPz7rzO04o9ehGMuxxHr2o8JgtmIzQYhqcFzo9SfekFJK8ujh9
 YnvW4Ar1YTF6xhGgkKd3HIiqCK1Q9kxb7hjMFJVMSpAseyONNY6BeZYdl
 h/4o7MQq4f/g14wlhpOJMcAh0MzAHClveZLncislLYGQXFmEbJo02+gDd
 oicEYHzSLqFAscVp9onOoot9wlHJ84LQkigSYEyhBuW4TGLJiibM4Tcju A==;
X-IronPort-AV: E=Sophos;i="5.97,238,1669046400"; d="scan'208";a="333494696"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2023 08:06:01 +0800
IronPort-SDR: ojsHL9ikuIhhx/7mCrsZNsl/96fcB9wCtok1KDq5tCOKif2npDNtiwwz76jH9GICsKpqAPblY+
 lC1iQ0ZFelthKGJ18eRtJZdtdxA3CfKJo1CYTnFay23ggZMJ+v5m2qdNTLqjJOK5plbJxm8I9U
 pQvnHBUyi8D2Z8bjzHUbTDmA7jlUqIvWGczVtPGsb4zLeqlq7mt3YVa/qbOJNf4zYP+X/eyNTd
 v8/MOmtE46wiuYmobp9HeaVQHwguWKdhKiQYcuB8zNDx4ld+DTX6FCvAawcpuAVoHVDIsW8QqM
 lPw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2023 15:23:36 -0800
IronPort-SDR: XXhMzQcGph3C1TB0A+Hclvj1p6WL1z15hQf76X8KB27czyZ9DHvT3o8UcP3n5C16PLeehHWAPI
 SuyGtsxtLGF4TpkVQB4hbwutI1cR/hRGQFVxGclXRc+t/4vAm0+tl9pXmR1mecCeKGxzMkUyxU
 0yAir6ow9PFNxt0EKXD6s/9KrRYFyyZM4f+MIstrZhn7QVJJf5b12Ol/TLXiy5Go/Gm/lLcJvm
 VRvNXWFpC/MSpqjoM3XLJRdRbX6WP9ifEwp2xlpwz/FgpfObs1F8kynUU85StWhWlQ+3iAqdFA
 iqE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2023 16:06:01 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P0VkK2JPkz1Rwrq
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 16:06:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1674432360;
 x=1677024361; bh=5oa6UUini4nihWHrDxq/euHryq8YHHpTXQ5iJqv+FnE=; b=
 P3XTDTMhYw5Z8421mkigARHmzoK2kjb/coQ5tadiiXuPGQsMz3q49pBcFKbAcmFn
 s+GecnSZJZ+W8JzaoyT/+oyDR7CaYgDL0ONOIKRaWFhwB0czXA0+UBF/Cyu9yRuF
 xFg3a+F/ToNyfP6Uhhr1wyoqs+Y+OxnUGOgeA6p0u6Z1XTtZfeYloHu8YfCsUvVc
 HKOWVyj24h90emBmWA4MrciH+bGiJhxrp9ZiJWfe0M64rHZXaTyDkfGPU46gqWdy
 iHvNdWcaVClIxR6pFj/cJFe7epmPX4ROU/IaCayT63bL/jzVBhL3qynYj30Ajl9W
 I27IQ5nZFb5r4/n7WeRI+g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nkCpqJssY4K1 for <qemu-devel@nongnu.org>;
 Sun, 22 Jan 2023 16:06:00 -0800 (PST)
Received: from localhost.localdomain (unknown [10.225.165.30])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P0VkG1vffz1RvLy;
 Sun, 22 Jan 2023 16:05:57 -0800 (PST)
From: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
To: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH] include/hw/riscv/opentitan: update opentitan IRQs
Date: Mon, 23 Jan 2023 10:05:41 +1000
Message-Id: <20230123000540.58351-1-wilfred.mallawa@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=380668d3b=wilfred.mallawa@opensource.wdc.com;
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

From: Wilfred Mallawa <wilfred.mallawa@wdc.com>

Updates the opentitan IRQs to match the latest supported commit of
Opentitan from TockOS.

OPENTITAN_SUPPORTED_SHA :=3D 565e4af39760a123c59a184aa2f5812a961fde47

Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 include/hw/riscv/opentitan.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/riscv/opentitan.h b/include/hw/riscv/opentitan.h
index 7659d1bc5b..235728b9cc 100644
--- a/include/hw/riscv/opentitan.h
+++ b/include/hw/riscv/opentitan.h
@@ -108,11 +108,11 @@ enum {
     IBEX_UART0_RX_BREAK_ERR_IRQ   =3D 6,
     IBEX_UART0_RX_TIMEOUT_IRQ     =3D 7,
     IBEX_UART0_RX_PARITY_ERR_IRQ  =3D 8,
-    IBEX_TIMER_TIMEREXPIRED0_0    =3D 127,
-    IBEX_SPI_HOST0_ERR_IRQ        =3D 134,
-    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 135,
-    IBEX_SPI_HOST1_ERR_IRQ        =3D 136,
-    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 137,
+    IBEX_TIMER_TIMEREXPIRED0_0    =3D 124,
+    IBEX_SPI_HOST0_ERR_IRQ        =3D 131,
+    IBEX_SPI_HOST0_SPI_EVENT_IRQ  =3D 132,
+    IBEX_SPI_HOST1_ERR_IRQ        =3D 133,
+    IBEX_SPI_HOST1_SPI_EVENT_IRQ  =3D 134,
 };
=20
 #endif
--=20
2.39.0


