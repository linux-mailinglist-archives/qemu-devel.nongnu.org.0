Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540473BA18E
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:46:45 +0200 (CEST)
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJVE-0004xY-Bj
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJMW-00051f-IV
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:45 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzJMR-0004MX-U1
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:37:41 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a8so837033wrp.5
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RXzcBY1Xz+NzYhjk5HmcS/3KibwDarkLazlUMdNcDYk=;
 b=VQxDiu3oXmp8q+ULhpUe/Law/dvmY9ty3gGvPQWK7tJddH7G5XXwOGKhGpwRSZlaEr
 O9w/zdVsHVsPRMOMvWGKixCeZ6lm9+vaq1Xn8FW1ThWanjeT+0Y13B67j8stVY5vOJlH
 +XmkKiV6DhIsLtwT5hey0YpRp0evIuuXa1mUpefvk0J3xExKHs1ovovvz5J7tB/0gJuo
 L7yICrchrS2uscyqwPJbilf2HRoz7P6oA/np9TbHZ26g33ZVzPGErz0R7+s+XNGQqhbN
 oRn2mQ+v1CT1PTg025R2fcqcJf96uyapi+FJpV2IpTsPt3ivSe0j3GdIPKhsK2FQ5Wh3
 NnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RXzcBY1Xz+NzYhjk5HmcS/3KibwDarkLazlUMdNcDYk=;
 b=tl2VAtw7YknpMZfzZ9Pel/jNSLLBNxNA2hfTA/NB6RT5P7L7blHqClHk72pq9pZTP2
 ogLQBmKu3Cz8arffmLZYRCzftoBE0j4axaqUKrlc1cfvIsV7tjuKgMX+MtIITcStn0jz
 kWN3HeplyosqVtk3mnEsoD2r/3R0aCO0imdPFKDskcWTqNlV29Sy3HCLwv2WXnc2Bj9M
 oAxlTtra7juKKMy3xiZPCGTuQ5DQa83xf4F7tsdjwsSHpuGGsFQJC14X9zFi/0AoMIBP
 Kc39n6j4ETb6kfZWleFJNn4pZ2812r/di3W3VJdAxlkYtd0WfzkYfh/73yOtWP9O2K0e
 nxkg==
X-Gm-Message-State: AOAM533u/il0CtitIG0Jg/H+ctrtrYNnGiyWP+BXpgy20rwvUdJz66x9
 PmYWpCANWE0MeX6aWweWHK2Sh/XNDnXMChaO
X-Google-Smtp-Source: ABdhPJxctLpMrvv3XuqntkdS50fc3IMCTk6IkkoYGuhQgzLVmLNst08JkrW8OHBsPrXCoyEibZ4t2Q==
X-Received: by 2002:a05:6000:1c9:: with SMTP id
 t9mr5998774wrx.330.1625233058535; 
 Fri, 02 Jul 2021 06:37:38 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id h10sm13644502wmq.0.2021.07.02.06.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:37:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/18] hw/mips/jazz: specify correct endian for dp8393x device
Date: Fri,  2 Jul 2021 15:35:56 +0200
Message-Id: <20210702133557.60317-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
References: <20210702133557.60317-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The MIPS magnum machines are available in both big endian (mips64) and little
endian (mips64el) configurations. Ensure that the dp893x big_endian property
is set accordingly using logic similar to that used for the MIPS malta
machines.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210625065401.30170-11-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/jazz.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 89ca8bb9107..ee1789183eb 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -126,7 +126,7 @@ static void mips_jazz_init(MachineState *machine,
 {
     MemoryRegion *address_space = get_system_memory();
     char *filename;
-    int bios_size, n;
+    int bios_size, n, big_endian;
     Clock *cpuclk;
     MIPSCPU *cpu;
     MIPSCPUClass *mcc;
@@ -158,6 +158,12 @@ static void mips_jazz_init(MachineState *machine,
         [JAZZ_PICA61] = {33333333, 4},
     };
 
+#ifdef TARGET_WORDS_BIGENDIAN
+    big_endian = 1;
+#else
+    big_endian = 0;
+#endif
+
     if (machine->ram_size > 256 * MiB) {
         error_report("RAM size more than 256Mb is not supported");
         exit(EXIT_FAILURE);
@@ -290,6 +296,7 @@ static void mips_jazz_init(MachineState *machine,
             dev = qdev_new("dp8393x");
             qdev_set_nic_properties(dev, nd);
             qdev_prop_set_uint8(dev, "it_shift", 2);
+            qdev_prop_set_bit(dev, "big_endian", big_endian > 0);
             object_property_set_link(OBJECT(dev), "dma_mr",
                                      OBJECT(rc4030_dma_mr), &error_abort);
             sysbus = SYS_BUS_DEVICE(dev);
-- 
2.31.1


