Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069AB5E5471
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 22:21:33 +0200 (CEST)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob6Dr-0006Ik-Td
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 16:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ob69h-0004Vn-L1
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 16:17:20 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:43986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ob69e-0006DL-Tk
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 16:17:13 -0400
Received: by mail-lj1-x233.google.com with SMTP id b6so8384148ljr.10
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 13:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2POuy0/x2pYwHhYVGTpVRtpmFlfUJ2WYHtUNTsPO73I=;
 b=QoSqIQh/WlW0nbXmypzSRqNlcGlSJ3nLlA/HAYfd9mf5++e2GA+6GUOeuwq+qQUerO
 uV673Zt2ZhPZc/UJR/fWpTa5X43VRGwOsZ9c9YfxT7fZ6HNJwoPPQ7A4/7rvz0xyfmOf
 lrqleTsx8oyON7h0NRE4NGMRXkyNYusswVHxjmlmQ8nD9NBICwUPjZm8OptdsV+NgS9J
 7ElF51IeUcvfAhd5FplEJ5MBdSuxyybUvphKqGeifOILPIIZR3eim877Ah57/dq31Z79
 wmqej9Lfc1TTooUIMvl9+XNyfhvSInEwtfdxqF1sKdlmJOJ1vepZRG+ACpBDzj3WcHXY
 OcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2POuy0/x2pYwHhYVGTpVRtpmFlfUJ2WYHtUNTsPO73I=;
 b=I3nfhu4tLeD5XaCV8u6Zrw/i3IM0M1y4A9m0eBVb39OSzvdNLK2GWSpqkAKUqFlPEW
 cC2mGdcU5l3xnYAREYENJYviPJ7qkhS+2S07law6lYs1PyAQ4Dt7URyqGKx5dQ2LZfFI
 j3BgXPeHMviahAr1d9klyiEsHsNlb9xpTEvfOXa7djCn6wWqAQkKvsQCvq60SBaMF1f/
 kzUkSf+lcbmpA4fN/AZ+jOUPIIHxNM02/lCyq8ppMv8E8deeFLgacZqLgmAu80htF6cJ
 9IRtWkNQ4TLdnI7Tg2PAFPAoAn7KxAIejLuCvzJ99WtNJvu2VnprS7fC1yOyCAHtbfLK
 3UDw==
X-Gm-Message-State: ACrzQf0+pmP2qExrr7fpQT43kYossnF0CIh/jhpVALG8/HhE1fbXvu9A
 Rd97rBpNTacjun7jLU6Z0YutNshh/Tcjkw==
X-Google-Smtp-Source: AMsMyM5ML/SBBnESH9vwmyvJcA5L8y03s7NHqzec6a9RApa3hLYQsW6a4oUbQmdlj3KWjYLsVRnboA==
X-Received: by 2002:a05:651c:514:b0:26c:6769:79f1 with SMTP id
 o20-20020a05651c051400b0026c676979f1mr1490481ljp.343.1663791426672; 
 Wed, 21 Sep 2022 13:17:06 -0700 (PDT)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 y27-20020ac255bb000000b00494a2a0f6cfsm571278lfg.183.2022.09.21.13.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 13:17:06 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 edgar.iglesias@amd.com
Subject: [PULL v1 1/1] hw/microblaze: pass random seed to fdt
Date: Wed, 21 Sep 2022 22:17:05 +0200
Message-Id: <20220921201705.1309392-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921201705.1309392-1-edgar.iglesias@gmail.com>
References: <20220921201705.1309392-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This FDT node is part of the DT specification.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/microblaze/boot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 8b92a9801a..25ad54754e 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -30,6 +30,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/reset.h"
 #include "hw/boards.h"
@@ -75,6 +76,7 @@ static int microblaze_load_dtb(hwaddr addr,
     int fdt_size;
     void *fdt = NULL;
     int r;
+    uint8_t rng_seed[32];
 
     if (dtb_filename) {
         fdt = load_device_tree(dtb_filename, &fdt_size);
@@ -83,6 +85,9 @@ static int microblaze_load_dtb(hwaddr addr,
         return 0;
     }
 
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     if (kernel_cmdline) {
         r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                     kernel_cmdline);
-- 
2.25.1


