Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9C1B673D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 17:36:29 +0200 (CEST)
Received: from localhost ([::1]:60138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAc0J-0004vc-Vu
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 11:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48936)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1iAbrp-0006CS-IP
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:27:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1iAbro-0006Kz-0x
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:27:41 -0400
Received: from mail-pg1-f169.google.com ([209.85.215.169]:37065)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1iAbrn-0006Jw-RY
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 11:27:39 -0400
Received: by mail-pg1-f169.google.com with SMTP id c17so50640pgg.4
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 08:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=0aUWUGKUdj74mYp5bqvI3cmVOmwPFCZNAshHhaO5kdk=;
 b=OtsslQwnikP4eIlc7fJAZK7Z/jrMp14RnDG/Cea8FCRcyZ7RUu441LISNOE24Ub3hv
 G0R4zJCZCp1OvUjo0DZrTjYdBFcwhgbAycOvwJp1r2XfPBjx/Ljh2FH15jrrghdIIczx
 MgZ0chkTEjirr0q20ZKy6FjBJtpiETn7EW22sk9jMphp8nGKiuBGnr3/h2P0WI6zMosa
 ZOPEsSxBPZF7Y1ujhY3SwDqd9yehS6csdzZgfWI6aV51jjXTdDrO1/LgXT+2CWFx7/0l
 9X/bqdzVUwpYD9ohcgOEdfej3fIwU9xwG2mFUOZS/w97UxrmqAMVhZz8N54l3uVuXP5x
 nuBQ==
X-Gm-Message-State: APjAAAXlRTPdAaDXsMFYypvRmNqCegpAgFdku09tXDwcheOiQI6AfmxV
 sJxKX0N2fbwVMC8Z43cjDtRZhg==
X-Google-Smtp-Source: APXvYqwyOf8MyieLYw+12IjC53KH8Bzot9HsRMRORbDtWn8zLGWd/6I77RkM7n3AZkbEJT33Unrkew==
X-Received: by 2002:a17:90a:3462:: with SMTP id
 o89mr4451651pjb.2.1568820458437; 
 Wed, 18 Sep 2019 08:27:38 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id cx22sm2843592pjb.19.2019.09.18.08.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 08:27:37 -0700 (PDT)
Date: Wed, 18 Sep 2019 07:55:55 -0700
Message-Id: <20190918145640.17349-4-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190918145640.17349-1-palmer@sifive.com>
References: <20190918145640.17349-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.169
Subject: [Qemu-devel] [PULL 03/48] riscv: sifive_u: Fix clock-names property
 for ethernet node
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guenter Roeck <linux@roeck-us.net>

The correct property name is clock-names, not clocks-names.

Without this patch, the Ethernet driver fails to instantiate with
the following error.

macb 100900fc.ethernet: failed to get macb_clk (-2)
macb: probe of 100900fc.ethernet failed with error -2

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 hw/riscv/sifive_u.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 8313f2605e..ae5a16e636 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -215,7 +215,7 @@ static void *create_fdt(SiFiveUState *s, const struct MemmapEntry *memmap,
     qemu_fdt_setprop_cells(fdt, nodename, "interrupts", SIFIVE_U_GEM_IRQ);
     qemu_fdt_setprop_cells(fdt, nodename, "clocks",
         ethclk_phandle, ethclk_phandle, ethclk_phandle);
-    qemu_fdt_setprop(fdt, nodename, "clocks-names", ethclk_names,
+    qemu_fdt_setprop(fdt, nodename, "clock-names", ethclk_names,
         sizeof(ethclk_names));
     qemu_fdt_setprop_cells(fdt, nodename, "#address-cells", 1);
     qemu_fdt_setprop_cells(fdt, nodename, "#size-cells", 0);
-- 
2.21.0


