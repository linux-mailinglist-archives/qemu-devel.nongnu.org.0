Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6DB65FA3B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:29:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdF4-0003YI-BK; Thu, 05 Jan 2023 22:18:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDg-0002xy-0x
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:36 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDe-0008VI-FN
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974994; x=1704510994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0rrAKh1mFiMSsrpJ48/O7XxeyrgKnPOug7wW4yEMM1I=;
 b=CPvKNaEyPB7wTdjJDgJJiMeLI1GPet8OE40lNuvcO0epypGrzF8eGdGt
 Jp1bNaVUlKeTc5Fqxjc5zgcJzJ5HF11vJn86fgb+lPIIx7qw2k7WaCuEI
 K0CTSeLmtKhqvl6zwgqCp68RPgz491fklS0GhkE0EsAD64hccwsp74ue0
 /Yq2UrKau46KJHCGj8z0/8RMxaHQAiupLMjYVoeJBgw4Qhg4ZK8FJwBYY
 9LegGsP1ePDhVkW40+ngORL0QiUB/MXjQGLNsgqXRoh7hG8Vdgv+5Lg4/
 cNaYBrZ64IaGop+HRW9Z5Fb2rsird4XEYWxLsj9GzJ5fv1MbTM/+RD1Pu Q==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254851"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:15:20 +0800
IronPort-SDR: tMT4EW28M9e7q2tHNiUu1V608my52HA9TfoUrm7jpdWo9IH6O3mX7HGH88NojO5CZaa63rcaFW
 veeAASlO2leAqtRD9kFVpR8Wuxd01ryBSj7f6Q+GHP7WbUs+tAImQAGi9PZoxmcyopTbE+y0Sf
 3Qw8AHaqCwrxyhYWdsrusmt2Mkxov7dguL4iPxDslGU1swzagbBge4QLrTC87ESPp9DLaM2bux
 h14TD8kzkLCreOFCuhjGCg48CmP/fJlCdxYuRrhgd0iIU+Z3xHeqBWo6eRSXwcLhLX3nZ/PsOW
 wRw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:31 -0800
IronPort-SDR: 1Z0dZCJoD4TIXOySWDUC8QeQlRQitar4TvIurtOJqoOwoxWbeAdjgnU7PbR4OYw9w/gKjE8YQj
 c/PQ5dDnWIOP8KJoRDiJsBJ9gCEUewKtkF75O+mj6NwgA1PrLAYY4OtPaIzUfrQy5OUCVxXo5m
 /tlyv47f270hcE+jZ3wBO8OmObS0MUjf/TFUiDwvJv4CYjU3vP5BJudYxCDeeQQxLoHH259vJS
 4zuOYdUj34Fk0fF0QQXKlw7uy56UEDATzfQ2Gm72Erasa7tlmXH6uLC7LVUCVRzs6xJPjn0RH5
 oHg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:22 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kc311pz1RvTr
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:15:20 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974920; x=1675566921; bh=0rrAKh1mFiMSsrpJ48
 /O7XxeyrgKnPOug7wW4yEMM1I=; b=rpyDtZSQUhCVKw6qonMnNTJHuBpJY0KTRk
 VKQsmVt9xoFNno9dxwn+VEE49KIzFxQ37z9rbabuMjwjuCHWMWzLmpJsWb8YFyh8
 qinG0DzH0PB6E8260s+eSRsDK6zFDu7c2OY3CqWsvpgsXnJjV2tJzwRaC5pC/qKZ
 RCoTfI+JcW3e4Ee3suFb1f5qaJ/3qG12SE5fnHoXa60W9a3vS6Fj6MY1DxjUwnxs
 DPp/XL9Eoy52puh0uzoIEpGRwf+UmOsbaIk6kUg9iW75JBCJMv7ow78Ac3+EDLRz
 5BVEK824SKZbK6xwKKaExUG6A6O8jqHPqsBAldeMHhkyTFlqq4RA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id gPnrrhCSpBmB for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:15:20 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7kZ6mmBz1Rwrq;
 Thu,  5 Jan 2023 19:15:18 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 43/43] hw/intc: sifive_plic: Fix the pending register range
 check
Date: Fri,  6 Jan 2023 13:13:57 +1000
Message-Id: <20230106031357.777790-44-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
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

The pending register upper limit is currently set to
plic->num_sources >> 3, which is wrong, e.g.: considering
plic->num_sources is 7, the upper limit becomes 0 which fails
the range check if reading the pending register at pending_base.

Fixes: 1e24429e40df ("SiFive RISC-V PLIC Block")
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-16-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 1a792cc3f5..5522ede2cf 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -143,7 +143,8 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr=
 addr, unsigned size)
         uint32_t irq =3D (addr - plic->priority_base) >> 2;
=20
         return plic->source_priority[irq];
-    } else if (addr_between(addr, plic->pending_base, plic->num_sources =
>> 3)) {
+    } else if (addr_between(addr, plic->pending_base,
+                            (plic->num_sources + 31) >> 3)) {
         uint32_t word =3D (addr - plic->pending_base) >> 2;
=20
         return plic->pending[word];
@@ -202,7 +203,7 @@ static void sifive_plic_write(void *opaque, hwaddr ad=
dr, uint64_t value,
             sifive_plic_update(plic);
         }
     } else if (addr_between(addr, plic->pending_base,
-                            plic->num_sources >> 3)) {
+                            (plic->num_sources + 31) >> 3)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid pending write: 0x%" HWADDR_PRIx "",
                       __func__, addr);
--=20
2.39.0


