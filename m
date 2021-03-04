Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B554D32D5AC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:51:39 +0100 (CET)
Received: from localhost ([::1]:37306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpKE-0004O6-FS
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpH5-0001kc-1g
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:23 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpGz-0007sK-SW
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869297; x=1646405297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MdlxPyQDR8qSUgNiNJgxJ6VdOI7AjD9KFtZk0qwoNW8=;
 b=b+Ye8dHJ7MBgs8iW96Jl+n7BfxsVN5i30xUgVV1vs43KeKuxx6xUXXwb
 UAjyFy4vvFnCAiXlGE1asSAS/rwOdZM/oiiihcocX+LemidJSYyczDoEk
 I/SUvOuVMF7JXzN0tcdS80MbRjcrFrM1AJE9RQ+qlAcmIfRBVoQ0EJ+pB
 6iqnud+hFeV0ljUwC6f/bt8+Zdz9HVvGUgscSgNTBFJ3MRvlII2mW/OID
 fRhwm/WKCjzYD0gMSYRVzarBIubXrY27zLLi2kWvjNSHevZ8BhU8aMfEE
 ioCTE92XGToskiXbNqkcNYOHRbtuinzEuSDD4981cktyfx1OuLEl1jaWU g==;
IronPort-SDR: qFlm75bb/et9EJRYXM73N/GtS3OOJXqvMCh2qnOpqmoIF+ssAYtqEh+336JU/b3j3maQuSDh6n
 P+BEbbMuJ0U5b54cckjE+n222KWC3aEzKM1OIwrOSlY3zWPPMS0NMWaMfqIhbLckginvpNKKro
 aMrF6MTH071jstIMPr/rB0APSPcE3wjh9uaGsla9HCezM/UY9rTsv1YEiZ5yj8wbszl7jIrijl
 ucFFG1oGlRyJ6tTG8aqITdA0zRaI5k38Q/P2OGcBlwRErj6eDaqbORoZxY3PJf7ELGuKn0sS17
 QcQ=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984407"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:08 +0800
IronPort-SDR: w+c4HGL65Wjx/OcHtQp+62cV8KZuXFa3pVryPY5SrTbOWzZNriWRQZVy/e8UwCsqAZwAgi4WIb
 Mwrq+vl8QJ3+XVGofTyHZN9TUC5WMBVm8Rjh6eJaKdZhPkRB/lwzpx27SO0Ys0++W53d1WGl9S
 lz93SW1/N5h+MHzLNPuebWc85iDJfFIEs16w4KQTlxjOxmvxJhWteiM9QQXFYZPhzfiTB31MHO
 5X0vxpyLZrGqQWo9y52DlV3+nwL6gT4tPsWBnpW4pftBji5HLmo9HQ3V6fFwsYXS5d+wlH5gV0
 gyYYVh7A9dKg8Iicf1kU+fNC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:22 -0800
IronPort-SDR: wqu5wrG2zWSpUksiQ4pIjbqfzI1+AmS6eYBy3CG8YQp3DraYjHFvaTPqsW1jcgMG0r0CpYWNel
 RCMIU70EX2BqqaWKx6sMoFx952gCvVtlc9koj2IMTnBhzrbfjmY2Zn+bXFbXJmCGcScsvW5yPZ
 Gg91MNx6i0Oz8xfX+wneQfGVZfNLoYFbbWoUVDaEChpugNEcpsdttBrT5nwMH5Er0pD6drzyL5
 pf+ttS6PYxQ8jP2sGB40SSYMdvsQ7uvYpVmBfWVSIo6rkyOtw7ywlZ1i8aft0Y1O38EvFExgiT
 8Nw=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:08 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 06/19] hw/block: m25p80: Add various ISSI flash information
Date: Thu,  4 Mar 2021 09:46:38 -0500
Message-Id: <20210304144651.310037-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This updates the flash information table to include various ISSI
flashes that are supported by upstream U-Boot and Linux kernel.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210126060007.12904-3-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/block/m25p80.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index ad4456b74e..5f9471d83c 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -210,6 +210,19 @@ static const FlashPartInfo known_devices[] = {
     { INFO("640s33b",     0x898913,      0,  64 << 10, 128, 0) },
     { INFO("n25q064",     0x20ba17,      0,  64 << 10, 128, 0) },
 
+    /* ISSI */
+    { INFO("is25lq040b",  0x9d4013,      0,  64 << 10,   8, ER_4K) },
+    { INFO("is25lp080d",  0x9d6014,      0,  64 << 10,  16, ER_4K) },
+    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32, ER_4K) },
+    { INFO("is25lp032",   0x9d6016,      0,  64 << 10,  64, ER_4K) },
+    { INFO("is25lp064",   0x9d6017,      0,  64 << 10, 128, ER_4K) },
+    { INFO("is25lp128",   0x9d6018,      0,  64 << 10, 256, ER_4K) },
+    { INFO("is25lp256",   0x9d6019,      0,  64 << 10, 512, ER_4K) },
+    { INFO("is25wp032",   0x9d7016,      0,  64 << 10,  64, ER_4K) },
+    { INFO("is25wp064",   0x9d7017,      0,  64 << 10, 128, ER_4K) },
+    { INFO("is25wp128",   0x9d7018,      0,  64 << 10, 256, ER_4K) },
+    { INFO("is25wp256",   0x9d7019,      0,  64 << 10, 512, ER_4K) },
+
     /* Macronix */
     { INFO("mx25l2005a",  0xc22012,      0,  64 << 10,   4, ER_4K) },
     { INFO("mx25l4005a",  0xc22013,      0,  64 << 10,   8, ER_4K) },
-- 
2.30.1


