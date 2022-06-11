Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363BE547434
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:24:03 +0200 (CEST)
Received: from localhost ([::1]:53130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzDm-0005Gk-9o
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySz-0005Wg-LW
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:41 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySx-0006Zr-Pl
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:40 -0400
Received: by mail-wr1-x433.google.com with SMTP id o16so1492663wra.4
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2I5JbZGTrIskB0/+F8X6yPWuOCPIAP2+ywVc/zA5MLs=;
 b=n+lEKs7EfyzFRJXx+maNA/JggZ5ikBK858hEC7O+uynqBcGGrhFE25dj8XgHxqqe8x
 NdrevwWKQbAKcgWnqfr7CW3olY2KtAZLxgGnZkYtYwYOIbTyLcExqLUUK33KcOJoGmUl
 I9+l+sbPbTgPFnk07kzSA+rFoK3X6MLNnTnLKkXkhp9sgzJaa+l5VLLO1BFcx9RvzHNg
 FTWYfbq+ln3x7FODEwULTD1+tmjbX46ExvccOLVLdlNFYD67VjCZ4Za9Zom7ShybtHgV
 WtLgaN5F7qclqC2oXeUy1sJtnwT6df9HIeACkUvfOUFJC9LY6YMGe9zP2FMHmJQjvo97
 t9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2I5JbZGTrIskB0/+F8X6yPWuOCPIAP2+ywVc/zA5MLs=;
 b=zvJXZ6SOEkJ43VyZWetsDVoPgkMZYP8+/hXyk7t53IqHXALYg3W+Y5/1A4KXw3kPoj
 sj6UV1q9tO/UXCulXfgxVXfzy8OBfN8F4DFV/qtBYdSxe+JILHx5d/v/o9XM3PMNC1SU
 Y+XZ4ec0XO5WzvktHoyJZxcvHiW9oIGfSsIorAT5yjmXe4BQA0td5XUQW6hN7Gns0S8n
 CGsiLDbbFVbchEPsY2VdAxGtX8pu7a2TFAK9F89IwlOzZpiXTjETy7gxyEcR7k3UjWVU
 nqfpm/7xhxLXv6rEpmKvy2f8u7o2sPedN0kimsH0kTHtNKBh7uiVaM42PjC7qrDAT8sw
 Y1bQ==
X-Gm-Message-State: AOAM532gCZEX3uTNPQ7o8AdAAmyVh2WeL2zIpH+uKkbnMbWVQW+cJIsX
 Cp1cGiLJrVgX/DcPcKbfAxMODdDmM48=
X-Google-Smtp-Source: ABdhPJyBEHV9CngziY9jPntRqfcVEFTdGoKQzz3b0+HI6XyLza9v5gk1Zfs1xe9Ixou7a42UDrXaBg==
X-Received: by 2002:a05:6000:1789:b0:219:cb95:79a6 with SMTP id
 e9-20020a056000178900b00219cb9579a6mr10630951wrg.353.1654943738879; 
 Sat, 11 Jun 2022 03:35:38 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 z16-20020adfec90000000b0020cff559b1dsm2162089wrn.47.2022.06.11.03.35.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:38 -0700 (PDT)
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
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 28/49] hw/isa/piix4: Use object_initialize_child() for embedded
 struct
Date: Sat, 11 Jun 2022 12:32:51 +0200
Message-Id: <20220611103312.67773-29-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220603185045.143789-3-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 9a6d981037..1d04fb6a55 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -224,7 +224,7 @@ static void piix4_init(Object *obj)
 {
     PIIX4State *s = PIIX4_PCI_DEVICE(obj);
 
-    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_MC146818_RTC);
+    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
 }
 
 static void piix4_class_init(ObjectClass *klass, void *data)
-- 
2.36.1


