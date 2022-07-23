Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D96857ED0B
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 11:25:01 +0200 (CEST)
Received: from localhost ([::1]:40502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFBNc-00066W-Bf
	for lists+qemu-devel@lfdr.de; Sat, 23 Jul 2022 05:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oFB3E-0003Uk-Hv
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 05:03:56 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:37409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oFB3C-00044w-H1
 for qemu-devel@nongnu.org; Sat, 23 Jul 2022 05:03:56 -0400
Received: by mail-pl1-x636.google.com with SMTP id f11so6389971plr.4
 for <qemu-devel@nongnu.org>; Sat, 23 Jul 2022 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2VB0kZZuiqwzOpHPYpegCzSrqhCZ6EF2Vl2tI+gaJ74=;
 b=T6YSUCxvkiomgA03Eatr1qidrah0qe+46NwlPaVhaZOrdNr5bKbEyb0DUA37mko8Pt
 57YFqdh2c/P3VQ+40TDVsAyagbYghbwiY3rXD8bny9JKquIE4yB9sDT3HPgKZ9zVorWU
 JOrAAviUlQEzqgQXizMIePDiqsxTl1jZTZvTKhmwFk7IcC/Ff/p3lYmv6D2Jo/6gGVte
 o6ZWajiVFe/oBC2xBC7dyDqBATtrXmwVFopMmqeo/pfiaI9JUti4hjQoZ9h3sh/kWbWu
 elAndD06y4czMPiQZIhjCOx0JODlGG+LSruB6/wwYHTxV1cj8epxd099lfU7+LWRgeen
 vnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2VB0kZZuiqwzOpHPYpegCzSrqhCZ6EF2Vl2tI+gaJ74=;
 b=bKLu6sxgdf+mY7pi7813fF2/rYZbht0cAtG8fw7KgzEASGU/p1qVktoxrW7b5Nt6vV
 7pUwKeKz0B82YBB+Wp4aI4a3xLf8ZudzrkI7kGx7dHOnnRg/hWG+BZsrX2HYgfQMkdd/
 oiM2ifJgERs7nXIS2MARxpRInWjavclj5M9j2A3z673cPFaBOaz5n/vUxaQbUjneuFEH
 KYrMOdvpFckTq5hJOO5q205Uav0+BvfRTETUsbsmxvS3GtvTd2QQ4xQItJhRaaGuBY6n
 Lewl8+4nmvvuiWZqGNebp/L47DzaBvigQEOOblJqC4lef/9j+P80r6PQGstz0a1yC3A6
 iLfg==
X-Gm-Message-State: AJIora/pbFE1w+y5qHnK18ckI6RU7yT8PUq8QWkwH33ws01waOSOWwL5
 sXlFFwMW3Km4txqgigeRVIq7u2dXd8z5AQ==
X-Google-Smtp-Source: AGRyM1uWcKhyaacIfC6bzwTMIV9EzOJaBXUOrjE0wbUJ8fANVbuj2fgpWxyFgOxLvT3oKLc5dQCIxg==
X-Received: by 2002:a17:90b:380f:b0:1f0:27dd:656e with SMTP id
 mq15-20020a17090b380f00b001f027dd656emr22168934pjb.48.1658567032477; 
 Sat, 23 Jul 2022 02:03:52 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 v12-20020aa799cc000000b00528f9597fb3sm5372661pfi.197.2022.07.23.02.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 02:03:52 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH] hw/intc: sifive_plic: Fix multi-socket plic configuraiton
Date: Sat, 23 Jul 2022 02:03:35 -0700
Message-Id: <20220723090335.671105-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Since commit 40244040a7ac, multi-socket configuration with plic is
broken as the hartid for second socket is calculated incorrectly.
The hartid stored in addr_config already includes the offset
for the base hartid for that socket. Adding it again would lead
to segfault while creating the plic device for the virt machine.
qdev_connect_gpio_out was also invoked with incorrect number of gpio
lines.

Fixes: 40244040a7ac (hw/intc: sifive_plic: Avoid overflowing the addr_config buffer)

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/intc/sifive_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 56d60e9ac935..fdac028a521f 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -454,10 +454,10 @@ DeviceState *sifive_plic_create(hwaddr addr, char *hart_config,
 
     for (i = 0; i < plic->num_addrs; i++) {
         int cpu_num = plic->addr_config[i].hartid;
-        CPUState *cpu = qemu_get_cpu(hartid_base + cpu_num);
+        CPUState *cpu = qemu_get_cpu(cpu_num);
 
         if (plic->addr_config[i].mode == PLICMode_M) {
-            qdev_connect_gpio_out(dev, num_harts + cpu_num,
+            qdev_connect_gpio_out(dev, cpu_num,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
         }
         if (plic->addr_config[i].mode == PLICMode_S) {
-- 
2.25.1


