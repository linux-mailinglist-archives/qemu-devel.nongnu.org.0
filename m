Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503A6AF7E2
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 10:27:29 +0200 (CEST)
Received: from localhost ([::1]:47840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7xyJ-00014j-QQ
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 04:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56911)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvd-0007IO-Mi
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:24:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7xvc-0006NC-Iy
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:24:41 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50494)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7xvc-0006Mq-CV
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:24:40 -0400
Received: by mail-wm1-f65.google.com with SMTP id c10so2325609wmc.0
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 01:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=0aUWUGKUdj74mYp5bqvI3cmVOmwPFCZNAshHhaO5kdk=;
 b=lbldZro6xN4tJX/2eu+RxQOGkphXDFjGZw5pn88WOjZ+YFfieQ+uZXNquJeGl1MbMI
 sajcUMdzIyDXNa/IgfJwdlUVo0uAGNehUHMnbpeeSQfXT5wSinGgASpFG9IzH0fYiEv6
 f/QQ93RGfv0ZRzDerA8oa/AwxHdpc/JCmJOxG8xYLhZx6vVZ6Moan0KgGexeMDV/TSIE
 pUnYicKy+CKiHuyBIhcmgMyvhtQJgkGQhGt/OVYUS5f+b6V0JCBUFVyFkXtUeUmjg5q8
 SIxJmCn7Ak0f+wh3LW2cwD/ds2ZL8QscwL++Hi0/jc3Cappn3l3D3wZErustOoS/TsZN
 jKKQ==
X-Gm-Message-State: APjAAAWHDJqkRsg6CUy3HGfToIDR6CGWz/CxojCL72018DtEByNim593
 8hV+BCRkDmuMTWfXk8PDrWZu43oyF6Eq8w==
X-Google-Smtp-Source: APXvYqx+nbYOtdLAf0MkPKTDIQRL0M+eY9VdcxkiYRj4VuQ4iCxihXxccFXiefMUq7Zx3XNJiiBKHA==
X-Received: by 2002:a1c:a942:: with SMTP id s63mr2818590wme.152.1568190279180; 
 Wed, 11 Sep 2019 01:24:39 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id f18sm142325wrv.38.2019.09.11.01.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 01:24:38 -0700 (PDT)
Date: Tue, 10 Sep 2019 12:04:29 -0700
Message-Id: <20190910190513.21160-4-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190910190513.21160-1-palmer@sifive.com>
References: <20190910190513.21160-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: [Qemu-devel] [PULL 03/47] riscv: sifive_u: Fix clock-names property
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


