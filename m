Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BE832D61B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:09:51 +0100 (CET)
Received: from localhost ([::1]:52008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpbq-0006Qm-33
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHS-0002Dp-Sq
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:47 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:44459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpHM-0007sK-D9
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869320; x=1646405320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JbgNam/RtHpGlyLa/KNo9SV7cHXv3bMbSkugyUiyPYg=;
 b=RZvzKt3m6eGjK+L4iYDJHTg2GWE0qomW5enlgGb+NsBZcCGSh2UzcYGM
 SuU53O4gZ5IlAye4SRJfVrL+C0VFuSBjbv1qlpXfTFW15cc+X1c6REOix
 91l1E1QPnsljF4x98QKYs3FyAIViRV1go1ZrUlmD/X8MtPUr2Sh2EzZ8J
 zmjHN2qBWGPZSwy4w1l1S7940/UwWQUQxRQZFH+qqvgU6TMaDwabnn3/O
 KUCuA1U2I8iEfewFhDwA79/76jssmCNg5LAzKdZvSXD9zr1w0yq+7kc5V
 oKtChTC5bArj3Qwj83NkhKZhgzo78UzN+BPveblHA3stT9DWXv5MdkAlN Q==;
IronPort-SDR: wrv9fAnKir4ikZK0jKmjfjcOhiAcaxDoOOcQikbPllqPEndA08YyBrvCA9Be5K+NawDDXRwIQl
 72TwHYVw3U/qw7IjhX6tj3KAshlFQOnaqHFL1ZARVD/WaYIbSsK4L+K6Puuwby6pQ5RQsS35C0
 NMHxnSbo9mEehiQKJy319FVclxOasa+Tn5D89W7T3hx39q4VT8pt0MJ047BbfxKKHBX1VHLqcV
 XDNzXi8BYv2S3mKI1LdAPiB9bRdNYa2TUmitViGAO1FtGhSWHI+HldFeaWldzCjqA2F+SUhxzt
 NoE=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="271984428"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:48:21 +0800
IronPort-SDR: lnVS40whMT8VltXZcp5BcSIthAE3CbqKJHQaYQEOJQmrmu4kIQQIYGWxdbUByEtZMmJH95872z
 y7UKB9MDc8hYS2hMViADRNaxQtwMvPxbMm5qeO7dWEsEfnG+v9aSrNfDLM/BpyJlf6+5mZmrOz
 QY7qWKLzXcGv7OfnUcSD6PilEm7apj0AvJUZmtL02VZGicNa0BU5L2Bv0V/AWoEfyZP/DJj85f
 1gMGwT3pwa6QzE6+LXXOdokKSjvWgjNpzdwgoJUFPgGfxwZuNCZ8xPL/e7joecSO8ZjKPb8AcO
 t1Q24JyexzuGB21V5xegn3oV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:35 -0800
IronPort-SDR: XLiH6sR58gIcLx/Wm5RJ8ReHYane+ZiPKTxdm03i+duo46FHWxTDwI8uom3UDponuWakGDjgfR
 wEnV+vKQri8F8QaaUdBtCQ31/IVLr233H3ZUw8oCTgAZ1bJE5GFQ1gXgaHxLAXFZKtviuMSwrp
 oMnGvbYK68GIa81T+v+myTgg10yi1JvtDrQmrFvWuxZE2IAavp6CHy+yT1+rnEmhTpcgwqPDWj
 x9s71tUOTQ2jI56m7A46WIOD6qm8tR7ozlajcvPqIWH6kv94/TI/VqFP+bQQ8OTSG8V6qwkcsh
 8QI=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:48:19 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 14/19] goldfish_rtc: re-arm the alarm after migration
Date: Thu,  4 Mar 2021 09:46:46 -0500
Message-Id: <20210304144651.310037-15-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: alistair23@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

After a migration the clock offset is updated, but we also
need to re-arm the alarm if needed.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201220112615.933036-7-laurent@vivier.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/rtc/goldfish_rtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
index 0f4e8185a7..e07ff0164e 100644
--- a/hw/rtc/goldfish_rtc.c
+++ b/hw/rtc/goldfish_rtc.c
@@ -211,6 +211,8 @@ static int goldfish_rtc_post_load(void *opaque, int version_id)
             qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     s->tick_offset = s->tick_offset_vmstate - delta;
 
+    goldfish_rtc_set_alarm(s);
+
     return 0;
 }
 
-- 
2.30.1


