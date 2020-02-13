Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B8915C0CE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 15:59:09 +0100 (CET)
Received: from localhost ([::1]:54070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2FxM-0000gd-DP
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 09:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2FhM-0004kV-T9
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2FhC-0002Hm-RQ
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:32 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44885)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2FhC-0002FW-LM
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:42:26 -0500
Received: by mail-wr1-x429.google.com with SMTP id m16so6961842wrx.11
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 06:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5tUOJeIx9ODuErotr2GDfZAcpkDzh5ZHq/aLo2wzos4=;
 b=T4P1tRXVUqqo3OuOnWb0Bx5MvMMUSgbh7XdsBvL6dytd+kiIWHCnQEqFKJXH2tdrvn
 yKwN/SYaWAmJkwb8B6jM7nRfDAWY3EK/vX7gwdLfjFy4ubJlb+VKirhOkY9ooNcom9yd
 D0dwD/d/pcWS5mHkBnt9bZIIlAlJBF/jjVJQ8rA4G4uItaotOdo9PQE6YJf79xVVqDpQ
 p2RcJ+F3RQL589cD8THWmdHH1JllWtOQZR+nM6VM5yAMAgsoW7pCNJPY9lm4vEIyK94k
 nrOv0N7uocd3WM2yrDh6rKs8+t7f8zilZopFNhec1RG9qz//z50cChpFq/oLgPisC1iR
 YrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5tUOJeIx9ODuErotr2GDfZAcpkDzh5ZHq/aLo2wzos4=;
 b=Is1IftQS7ejtPweyjLvoYe0+erNHfqI3QCqJxsNm2x24bCMmeRGDi6/YD9kVZD2yuv
 d5s9leKbKMFqGVU0iAQnkTfgrMI+21Zjh3F3nWD/Q5phK9f9sNIM0KjKQ5oTJ6rKfZLn
 QDahv2ueLWBVZsl5Sqv8eC4novfUzKVaNvW01ilxQAYJR7gQCvifDw7l/iAZUBz+GhWA
 NV8ywFracJGZk7g9TJSrcjSHuvZ6m4kiBOZZ5H2qPKMmRXwCln5ixyGev+AvkBmE/TZv
 dKIebZuEipi8JkRkZ2d4/NRX/FLZe+XIVSwOXrTuHlGnce84FqEs/n+EZNHg1wp+vbEj
 +fbA==
X-Gm-Message-State: APjAAAVw7PrWD7LU3/pYZm1r8OAXUblEH3tr80VnmS/BF5GJeK1ihgcl
 9fJCMHMomxJ4g/vcI+aIrWJbogHLImc=
X-Google-Smtp-Source: APXvYqwQN9wVTHr5Rr5IXl8i/5+qk4gvRiCh1iakSQsDfDuj0HOuiUkboUB2hFRQYhikH6aVyMg6Ww==
X-Received: by 2002:a5d:6545:: with SMTP id z5mr21700352wrv.3.1581604944243;
 Thu, 13 Feb 2020 06:42:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e22sm3362454wme.45.2020.02.13.06.42.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 06:42:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/46] hw/char/exynos4210_uart: Fix memleaks in
 exynos4210_uart_init
Date: Thu, 13 Feb 2020 14:41:31 +0000
Message-Id: <20200213144145.818-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213144145.818-1-peter.maydell@linaro.org>
References: <20200213144145.818-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

It's easy to reproduce as follow:
virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-properties",
"arguments":{"typename":"exynos4210.uart"}}'

ASAN shows memory leak stack:
  #1 0xfffd896d71cb in g_malloc0 (/lib64/libglib-2.0.so.0+0x571cb)
  #2 0xaaad270beee3 in timer_new_full /qemu/include/qemu/timer.h:530
  #3 0xaaad270beee3 in timer_new /qemu/include/qemu/timer.h:551
  #4 0xaaad270beee3 in timer_new_ns /qemu/include/qemu/timer.h:569
  #5 0xaaad270beee3 in exynos4210_uart_init /qemu/hw/char/exynos4210_uart.c:677
  #6 0xaaad275c8f4f in object_initialize_with_type /qemu/qom/object.c:516
  #7 0xaaad275c91bb in object_new_with_type /qemu/qom/object.c:684
  #8 0xaaad2755df2f in qmp_device_list_properties /qemu/qom/qom-qmp-cmds.c:152

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20200213025603.149432-1-kuhn.chenqun@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/exynos4210_uart.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 25d6588e413..96d5180e3e2 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -674,8 +674,6 @@ static void exynos4210_uart_init(Object *obj)
     SysBusDevice *dev = SYS_BUS_DEVICE(obj);
     Exynos4210UartState *s = EXYNOS4210_UART(dev);
 
-    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                         exynos4210_uart_timeout_int, s);
     s->wordtime = NANOSECONDS_PER_SECOND * 10 / 9600;
 
     /* memory mapping */
@@ -691,6 +689,9 @@ static void exynos4210_uart_realize(DeviceState *dev, Error **errp)
 {
     Exynos4210UartState *s = EXYNOS4210_UART(dev);
 
+    s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                         exynos4210_uart_timeout_int, s);
+
     qemu_chr_fe_set_handlers(&s->chr, exynos4210_uart_can_receive,
                              exynos4210_uart_receive, exynos4210_uart_event,
                              NULL, s, NULL, true);
-- 
2.20.1


