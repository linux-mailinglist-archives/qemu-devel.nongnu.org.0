Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14752547435
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:24:54 +0200 (CEST)
Received: from localhost ([::1]:55356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzEb-0006rp-5G
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTu-0006aS-H1
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:38 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyTt-0006mv-1t
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:36:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id u8so1451452wrm.13
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I09RuRBTDHhSRzTYr/o2mwFl0EFDkRli978RWl4TvaA=;
 b=Nq6N6vpRAVPVm8Qd1tbLvs5S2Vrng6NzxTnTm2CcpDoIz0SZD2cPpgw1o5jUrk9LJp
 FGW0SCWc1yVRAtflWhhsPopxNXBW0M66+x2LDXj3TXo6LWdJU7gLaF3lmk5SKVoqviWP
 VBkTND6orRGVjSs3x6/0XOKE7pAf7uig4tbvgFGNnsjZsIwvW4t5TRZagWY1YtQQBlpi
 coVzRh1Tiek5FsPwSPGfiFOwN99IkC/nKvn8Zb+Mcjo6GqEhEn8NLZoL33EjUHibLj7f
 L4chQUY0J/hZInFFaItIsro9uEcXY8eIXOeOaAM1ETSdBL5INkUIAHP0ueDWVL81t1V9
 UjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I09RuRBTDHhSRzTYr/o2mwFl0EFDkRli978RWl4TvaA=;
 b=WGVUxGIuyleviiWdF9tkyh8wlPb8y00dpSAUxPEQ3KOjifmZh2YCvufrWbVLYEfkAs
 Ft9nDPRZ52CVgnNlrDOO3kavoohZQaR3vEXqcpWbbzE331Q+wsxwDZZUiCJLN5CwFvoC
 pUfX6JW2x76Wd03WDKRaJ6/UWrm+l2O547obfTNfu2rz2WxhhJ3nEiMGXIzraIU7wdal
 LuwKIfREU3Na7CwjduZz6Ult9YmWB0wz3wex694zUdwSXmhCpc+1oJAQdi/LN5VAmcKf
 5ZsToiGfxa/5XvraCAzucZKwpk+7mFhn+T8/z4TYxg9b8MfQc0yc2oYgbjPp2z7u1wgC
 rI7g==
X-Gm-Message-State: AOAM532y0cOD12wmA9Losv6UlnqL7DTGbAjR0Lt+qRUr2EC1RbwYe+Sp
 XA9VeTlECRy84DwTOXASOe0I5pefrcw=
X-Google-Smtp-Source: ABdhPJyou6QWsZdnWY1Zfkg5K1nfaFZT/jMWntl1y+vP2EODf9j5y1IbMcqV/ZHr9ATGGe1JcBKszg==
X-Received: by 2002:a05:6000:156f:b0:218:4328:b4e0 with SMTP id
 15-20020a056000156f00b002184328b4e0mr29200672wrz.526.1654943795230; 
 Sat, 11 Jun 2022 03:36:35 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 f4-20020a056000128400b002184280b3cbsm2132288wrx.91.2022.06.11.03.36.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:36:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 39/49] hw/i386/microvm-dt: Determine mc146818rtc's IRQ number
 from QOM property
Date: Sat, 11 Jun 2022 12:33:02 +0200
Message-Id: <20220611103312.67773-40-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

Since commit 3b004a16540aa41f2aa6a1ceb0bf306716766914 'hw/rtc/
mc146818rtc: QOM'ify IRQ number' mc146818rtc's IRQ number is
configurable. Fix microvm-dt to respect its value.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220529184006.10712-3-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


