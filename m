Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A346D1203EE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 12:31:44 +0100 (CET)
Received: from localhost ([::1]:51770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igobH-000243-1u
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 06:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1igoFk-0007nE-Ii
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 06:09:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1igoFj-0008CY-9R
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 06:09:28 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43133)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1igoFj-00088x-2X
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 06:09:27 -0500
Received: by mail-wr1-x441.google.com with SMTP id d16so6712015wre.10
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 03:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cLD2Kna7vySI7JTixY4DUbJiDAp4iUXD1298DaSCR8I=;
 b=rZ0hP8tz8VogaUVsp9aiUXJlXyJGkkdBMyO4EzwmzsW7Gy2+xAqKdzolFes0iNaIZn
 TdamUM9AuYEFtfQ3vl4TJqfgY+ppsMnd8IKRfyGIft+a6L5IwidZ0US09sf2BHAIZFH5
 24GNlToZrDd2QLHGZl5Oke+5OiZRAkODRYYPMvTqFdrde3Zu1iaUrAn5wWhbAHefZMjU
 jV8GuCy9TJn8yGEx+2QCuuAJak/m7mt5hCFu7BnJFYcttdUkUSZ7bDtZqtNVUv7Ft3ym
 f2khM+ZcComZoKfZgiwAlSvC65p6w3pS2BwDKsn0vCHTtZgkmpxm81lLlU7GJXojtWg0
 IHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLD2Kna7vySI7JTixY4DUbJiDAp4iUXD1298DaSCR8I=;
 b=mw3xiJ20m+HXqQdAJDPBDKEaEAKXGGs+Fto96SZMk0CJ2IcGdFkMm92+OydPHbMEEK
 FxjCM2krRgTzl3oMjQZrRoclnau5NraMt+pRYdT65CdH2GE1Q2a97bzRYqr7ZmLmS5d/
 kWAM1RwIUYaCLLL317Zs12roSIv6Y4/LcCT7D808ZjZ0/I+Brr1bE9q5dttl2LMVV7me
 TgGLvMNG2xQfOOgCgjlHsO6C1kSc0gde8fSzE01GwMlEbN/mH6Jqme7piTMOjGf6NX7/
 i872d3fnbH+tqtqI1UkMlllVJuRbgU4I4HufFTUiMKcQSTQu2iOqEuDQXXTZrAqObTxS
 Fl0Q==
X-Gm-Message-State: APjAAAXz5ZkvIz/ami2aQ4PX6gWJMR8uKSQDQiycQnr7YF/0O0NjWoUZ
 WxAule2LxfA/YyuzzqsUaQA0nzimzGUVCQ==
X-Google-Smtp-Source: APXvYqw7CA0lEFBH/KYeeg2n0bfL6xDJGUKqfanCTrMiq+9Mugtjgo+AA2HNs/DWXkQ3LmO0zUPu5w==
X-Received: by 2002:adf:c746:: with SMTP id b6mr28282526wrh.298.1576494565931; 
 Mon, 16 Dec 2019 03:09:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x10sm20976131wrp.58.2019.12.16.03.09.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 03:09:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/34] gpio: fix memory leak in aspeed_gpio_init()
Date: Mon, 16 Dec 2019 11:08:47 +0000
Message-Id: <20191216110904.30815-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216110904.30815-1-peter.maydell@linaro.org>
References: <20191216110904.30815-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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

From: PanNengyuan <pannengyuan@huawei.com>

Address Sanitizer shows memory leak in hw/gpio/aspeed_gpio.c:875

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20191119141211.25716-16-clg@kaod.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/aspeed_gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 7acc5fa8e29..41e11ea9b04 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -876,6 +876,7 @@ static void aspeed_gpio_init(Object *obj)
                                pin_idx % GPIOS_PER_GROUP);
         object_property_add(obj, name, "bool", aspeed_gpio_get_pin,
                             aspeed_gpio_set_pin, NULL, NULL, NULL);
+        g_free(name);
     }
 }
 
-- 
2.20.1


