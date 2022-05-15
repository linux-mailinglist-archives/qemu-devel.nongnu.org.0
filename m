Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4FB5274DD
	for <lists+qemu-devel@lfdr.de>; Sun, 15 May 2022 03:44:03 +0200 (CEST)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nq3Ig-0000Mt-EL
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 21:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nq3F3-0003JW-Ds
 for qemu-devel@nongnu.org; Sat, 14 May 2022 21:40:19 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:38828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nq3F1-0002g7-Jg
 for qemu-devel@nongnu.org; Sat, 14 May 2022 21:40:17 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o13-20020a17090a9f8d00b001df3fc52ea7so217050pjp.3
 for <qemu-devel@nongnu.org>; Sat, 14 May 2022 18:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c+Kt0PArB3y+ijbSsfSsEw1SqbmDMmpC2y/OF67/b6Y=;
 b=ZFiVVPs+OoE2OHjiQwhQhNhC7syET1O/VDwbAFK9kRbQufA9FCzG3ohkNH6waAus/k
 PO4tfyRNBnCa9UyBf5o24NoU+4baTKRknUreS0ZpkgVIPyUMA2IB2Mk9cJtWsvhHkTDr
 qCjcClJ8TwYqbApuL7GdvlYZgJCpUYIJxpk1oT+S4zy7fPsbAjU7MI8daR7rC/2EQrPI
 TWwtswpeMyd/EgO/uyVrZcHkz7547I0zJ674j2tyBZpP8h5uJ8y7pZHr7lWGyqyLl4so
 jigpxyInPrmqTL8RdkxDvE0H6q/aJj5zd8OqKe4MQtRcHFoqjOPOKrnAldHNxuomtGSn
 edTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+Kt0PArB3y+ijbSsfSsEw1SqbmDMmpC2y/OF67/b6Y=;
 b=OjmyULvD9Xdguv+EZ81gz3/Wc9D/lVo06wtxT1It5rWU6kIc+B30aEZNpJoKv9kBCR
 OJfJzrRfZi+4mj71VjWLTcHG2oUDiO0rOVb7LvSj9jk+ymZpLxBabnpaanWE6lFQKeXO
 4lFpWSEAthe2IlN2/AZJvKh5kt04YMogGHkBgj6ga+xwoFJnImXYH8trbL9WqjpFk0Bj
 LOIkslQrTJBFWBbgqMB70TlctrwBb9vlwOsK4W/uDZq302HT4iAn5fCvAApg/PZx8/1G
 ReSrkvYbUYwsIGDun4YBd3R6TP5qXlTDG5ugQHCNCghHG39TRWTqYF/T7WIoSBQxf8/g
 MOPg==
X-Gm-Message-State: AOAM530Mf7+NciQm6WzSmeYd0GcPyZYhE9LWT2pvODmtCXKWDpNEviqS
 2h9PG7OKOZTUDn0z6rwew8dV9Mq2UGI=
X-Google-Smtp-Source: ABdhPJwKQsWhgPLsoHqQ65D459M3CmWantwYMmq+pxgzfB2i5y4wF4QDN43zGZM/JzEn3e2qhskB1w==
X-Received: by 2002:a17:90a:9bc6:b0:1d8:2d8e:1b97 with SMTP id
 b6-20020a17090a9bc600b001d82d8e1b97mr12242223pjw.45.1652578813760; 
 Sat, 14 May 2022 18:40:13 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 2-20020a17090a19c200b001d5c571f487sm3795440pjj.25.2022.05.14.18.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 18:40:13 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>,
 Jia Liu <proljc@gmail.com>
Subject: [PULL 2/4] hw/openrisc: support 4 serial ports in or1ksim
Date: Sun, 15 May 2022 10:39:46 +0900
Message-Id: <20220515013948.2993495-3-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220515013948.2993495-1-shorne@gmail.com>
References: <20220515013948.2993495-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

The 8250 serial controller supports 4 serial ports, so wire them all up,
so that we can have more than one basic I/O channel.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
[smh:Fixup indentation and lines over 80 chars]
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/openrisc_sim.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 99b14940f4..6873124f74 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -71,6 +71,10 @@ enum {
     OR1KSIM_ETHOC_IRQ = 4,
 };
 
+enum {
+    OR1KSIM_UART_COUNT = 4
+};
+
 static const struct MemmapEntry {
     hwaddr base;
     hwaddr size;
@@ -239,11 +243,13 @@ static void openrisc_sim_ompic_init(Or1ksimState *state, hwaddr base,
 
 static void openrisc_sim_serial_init(Or1ksimState *state, hwaddr base,
                                      hwaddr size, int num_cpus,
-                                     OpenRISCCPU *cpus[], int irq_pin)
+                                     OpenRISCCPU *cpus[], int irq_pin,
+                                     int uart_idx)
 {
     void *fdt = state->fdt;
     char *nodename;
     qemu_irq serial_irq;
+    char alias[sizeof("uart0")];
     int i;
 
     if (num_cpus > 1) {
@@ -258,7 +264,8 @@ static void openrisc_sim_serial_init(Or1ksimState *state, hwaddr base,
         serial_irq = get_cpu_irq(cpus, 0, irq_pin);
     }
     serial_mm_init(get_system_memory(), base, 0, serial_irq, 115200,
-                   serial_hd(0), DEVICE_NATIVE_ENDIAN);
+                   serial_hd(OR1KSIM_UART_COUNT - uart_idx - 1),
+                   DEVICE_NATIVE_ENDIAN);
 
     /* Add device tree node for serial. */
     nodename = g_strdup_printf("/serial@%" HWADDR_PRIx, base);
@@ -271,7 +278,8 @@ static void openrisc_sim_serial_init(Or1ksimState *state, hwaddr base,
 
     /* The /chosen node is created during fdt creation. */
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", nodename);
-    qemu_fdt_setprop_string(fdt, "/aliases", "uart0", nodename);
+    snprintf(alias, sizeof(alias), "uart%d", uart_idx);
+    qemu_fdt_setprop_string(fdt, "/aliases", alias, nodename);
     g_free(nodename);
 }
 
@@ -414,9 +422,11 @@ static void openrisc_sim_init(MachineState *machine)
                                 smp_cpus, cpus, OR1KSIM_OMPIC_IRQ);
     }
 
-    openrisc_sim_serial_init(state, or1ksim_memmap[OR1KSIM_UART].base,
-                             or1ksim_memmap[OR1KSIM_UART].size, smp_cpus, cpus,
-                             OR1KSIM_UART_IRQ);
+    for (n = 0; n < OR1KSIM_UART_COUNT; ++n)
+        openrisc_sim_serial_init(state, or1ksim_memmap[OR1KSIM_UART].base +
+                                        or1ksim_memmap[OR1KSIM_UART].size * n,
+                                 or1ksim_memmap[OR1KSIM_UART].size,
+                                 smp_cpus, cpus, OR1KSIM_UART_IRQ, n);
 
     load_addr = openrisc_load_kernel(ram_size, kernel_filename);
     if (load_addr > 0) {
-- 
2.31.1


