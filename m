Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAFE537234
	for <lists+qemu-devel@lfdr.de>; Sun, 29 May 2022 20:42:04 +0200 (CEST)
Received: from localhost ([::1]:53240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvNrX-0008Af-K7
	for lists+qemu-devel@lfdr.de; Sun, 29 May 2022 14:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNq6-0006ay-Lw; Sun, 29 May 2022 14:40:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nvNq5-0002G7-30; Sun, 29 May 2022 14:40:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d26so6426823wrb.13;
 Sun, 29 May 2022 11:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cov+lge9r84+pASXyK6paUlsnrkFtZeRPcnwvaSMtUY=;
 b=QC/0n0jWuNFEjA6GJfJnyBszRzWMQMTp0+cyFjhD1QMFnPUxNS7lejjy5+gxe1YAuC
 w+F3ys81DK3z/SvhRNVa8RgOn2yZtfkcU9Og7XbVGNKh3oLpCiYS3V0dY2vnQhbFfHBc
 5JnFEqUQDHYoNwvL5+duZKnJwMRQcmKmclkU8cg2wU7wHCblLjM6axwsAIgPFiWMCMmu
 upUqKOyl45Xplo7u9TM8zut2Dy3TA0TdxoWt8+Pk5T1OCY458UmHQLMx6X8xWlh/pVPu
 ozNSTzYn9Q98Zykh/OHgwdMH3ALNshcutuakLmCWz4TMs6X5krIW4B6Lnw6AQG8EailM
 xmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cov+lge9r84+pASXyK6paUlsnrkFtZeRPcnwvaSMtUY=;
 b=GDr8i0Fgx9ZR6tWCqEroYCkoUJrk9rrMNWXuNdn6VWMciUPZA6h9Dw/4xPk/pkY9u4
 T2HXNLKsLyEyybVLIn0DiTBhvsoLRhj00t3vLgCxdhzETvucGQJeFWHlroRnSezShEHi
 nM4CeSIkovDGV1+tMeSPYcqS7/tgIdWjnGlxOiVc+SO+yIWiYN1wJGF6l2W6anNH6MqE
 aYJqavJG/hHVztyEMN0gt+k86jDdMO1ff8SY7qr+zADeBSQrcLrPeDXVXZqgXf4UtdOP
 Z8suARgL7dD7zbcM1qmSwvGy+eVUK/fc7dB5KNx5HkwzxleIrqfasu+pJzHE4S5ssgRz
 anHA==
X-Gm-Message-State: AOAM5324ekXk1qCxjn1BA35W9HLlF64uPJ5cf4kjDl7wmrttur+7lcwN
 j3CFBjNGhiP8A2YtJGSIy6++6WxOu2iJ5SPc
X-Google-Smtp-Source: ABdhPJyF+8W36m34tKnyLPNYszuTt/kp3KvReS+f4j5GE4AONrg6INOMJjSUuiQWzsdfBUtNO8lGSA==
X-Received: by 2002:adf:f111:0:b0:210:313a:790b with SMTP id
 r17-20020adff111000000b00210313a790bmr2496148wro.367.1653849631236; 
 Sun, 29 May 2022 11:40:31 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 g13-20020a5d64ed000000b002100e86319asm7341049wri.78.2022.05.29.11.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 11:40:30 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v3 2/3] hw/i386/microvm-dt: Determine mc146818rtc's IRQ number
 from QOM property
Date: Sun, 29 May 2022 20:40:05 +0200
Message-Id: <20220529184006.10712-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220529184006.10712-1-shentey@gmail.com>
References: <20220529184006.10712-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42e.google.com
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

Since commit 3b004a16540aa41f2aa6a1ceb0bf306716766914 'hw/rtc/
mc146818rtc: QOM'ify IRQ number' mc146818rtc's IRQ number is
configurable. Fix microvm-dt to respect its value.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/microvm-dt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index fde74819f2..287818c641 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -209,7 +209,7 @@ static void dt_add_isa_serial(MicrovmMachineState *mms, ISADevice *dev)
 static void dt_add_isa_rtc(MicrovmMachineState *mms, ISADevice *dev)
 {
     const char compat[] = "motorola,mc146818";
-    uint32_t irq = RTC_ISA_IRQ;
+    uint32_t irq = object_property_get_uint(OBJECT(dev), "irq", &error_fatal);
     hwaddr base = RTC_ISA_BASE;
     hwaddr size = 8;
     char *nodename;
-- 
2.36.1


