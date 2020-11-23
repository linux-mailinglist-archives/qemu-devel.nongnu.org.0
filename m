Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B89C2C050E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:57:58 +0100 (CET)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khATj-0007tL-W3
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFq-0004aB-3l
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:34 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFo-0002jQ-FY
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:33 -0500
Received: by mail-wm1-x329.google.com with SMTP id w24so16942635wmi.0
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VLui8b0ipa+oYwGThK25otZ93ufBSWuS0gPU8vQEbGc=;
 b=C6CEEPaauH2mfkhdFTe60//smmiCRpOu8ukSwoeedo7kslA+DqAXNK8Y3wMsww0gvH
 qOXkNx1gzL8KlcEBlApV5f/E7q8YjaVxP8S51/zesiWgb5ezLejI5nXs82nZ7qj/OYKe
 Evo0U+9nMiCBaR5X/28RJO5DTVcQSD8dYySlYTsdEG8cDPlFkVQ5v0IRvaD8nbWK7Dnb
 lpJ44bLvjWJA4tSiOjky4Vc4w4m36nTgD4uXDW48S27IgB/x7IiEX4BssVE02TfUNCkD
 1qvz91c9c5ZgQLlpyBBC8w1vnZuLfDtJRzrN0voOk9X6r3dZnHiCTn72hRLgyLaEezE1
 seCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VLui8b0ipa+oYwGThK25otZ93ufBSWuS0gPU8vQEbGc=;
 b=t2RhMTtBtI2+V4LoNC6TCVcziQ2xqRl0AoMqK4myDCBIgQEqMlaxn0szsulZIgXoYL
 mcflI+3KKbx6kTNXNpcWpChUmiMdhFZXN5rgPPu8qBKQ4xaqkxCW8wNERNfigKWDwmNd
 /pF5r6GGwVSu5F+XSL603kkJyfhZ7S4gz4iUj463qc6jDDvQawTuTG41hU8K78SR+jnJ
 ZRTXxvyrs4ihX/ygHJe/gWAJiyCVo3tA5Lyd2r5A14a1aZAPYcSdFGso3bWvbcz2wgZm
 rfdhezfIi9u62pjHQnVE9p+sXBAwTyrJoqrlcdLTgtMJCaYXZdqfQA9ToM6I5Gl54ll3
 USsA==
X-Gm-Message-State: AOAM531zRlI6QxoJhFVKb76Q4aluRVgq1p3mY9lQ0UrkE9Ib+HNYiVfs
 FLpOM8cVbuiaDNUNQ82EUFigujv4fpKCVw==
X-Google-Smtp-Source: ABdhPJxcZy+yxVnhcVHdinH0CB9TYoSdI93KhX87Krp4MSlechEOzgH7tHo3+hhf3NF4ZbWBU2qwzA==
X-Received: by 2002:a1c:21c1:: with SMTP id
 h184mr24692883wmh.106.1606131810760; 
 Mon, 23 Nov 2020 03:43:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/24] docs/system/arm: Document OpenPOWER Witherspoon BMC
 model Front LEDs
Date: Mon, 23 Nov 2020 11:43:03 +0000
Message-Id: <20201123114315.13372-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Document the 3 front LEDs modeled on the OpenPOWER Witherspoon BMC
(see commit 7cfbde5ea1c "hw/arm/aspeed: Add the 3 front LEDs drived
by the PCA9552 #1").

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201120173953.2539469-4-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/aspeed.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index b7a176659cb..690bada7842 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -47,6 +47,7 @@ Supported devices
  * GPIO Controller (Master only)
  * UART
  * Ethernet controllers
+ * Front LEDs (PCA9552 on I2C bus)
 
 
 Missing devices
-- 
2.20.1


