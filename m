Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22435AB4B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jun 2019 15:07:43 +0200 (CEST)
Received: from localhost ([::1]:39504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhD4w-0001Oo-Az
	for lists+qemu-devel@lfdr.de; Sat, 29 Jun 2019 09:07:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hhCy8-0007ym-N7
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hhCy7-0003ab-Fh
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:40 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54773)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hhCy7-0003U9-5x
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:39 -0400
Received: by mail-wm1-x344.google.com with SMTP id g135so11587404wme.4
 for <qemu-devel@nongnu.org>; Sat, 29 Jun 2019 06:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2RzVzva0p3si7jPLhYz0L/MLVU9X0nppYnW+PugeGaM=;
 b=rTRYFKYcwuMfp84HPxxQyNe21scS6/5KdmDE3KHdxZ+YieNNv5m/bGhQTDDri9ieBE
 gMOT5irZe/hI/Zk4BPEj5cZ8WBCUilHiyWP3k2AIth0vJo9NGUg0B69TdFrkw35a+BTS
 b/8LoxAKx9uuF0VuqnQVzdRXvmnvfvzIaWPiEEVKmxHyvUhY07xmHHI9Kq89qLdPT7lF
 j4VEWzHxe8sYxsFquPW0vUW+9xZXNHUyLpphmxsvAljDkpFKKx+DrE7vNUPismGRJPoA
 d5OAoRgHp7CmPaSzaoA4y4+RMqhIGhOZA1y+a33mkcif9yBS87pnB1KmRmdw7w1ybyHl
 puuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2RzVzva0p3si7jPLhYz0L/MLVU9X0nppYnW+PugeGaM=;
 b=n0oipX74PQCtQ2+R4tj2pEvQRpGIqRq9+ynZM2N1U9huuG5MTc2qed+Ly+Rf3eHOZJ
 sbC/aWtxqIIwA+TnSSikIIpGl986iUCKvizXM+m8nahbJRTQyyFfqRGBPhgju4CabIGr
 HxdxSAWM31MIgCMcndwZ5dhucTOyGkhA/CiLGNmGGxb48P5fYE/VApP2mL5y2kjls7v0
 2Z2/uVWCocdVd1AYdBjhE/HlTidlt2KNuiVR/JvXAaDkfEMpYFMvugAcrFLtrYRCguA8
 hE/WCB0DF096QGjY3d8lsOWjBGKHwLHvyOJBqZR0xCHH4EOGHJkDdnAUuy/RcXAf5ZBn
 ZIew==
X-Gm-Message-State: APjAAAUVGztUQA7TJ2xTFLy5ZxaNYfR34SLebrOUhLUytkuBl0Q6B59Z
 EcuNK/STlhgli41gg40WO2XtIY5xN4T9Pg==
X-Google-Smtp-Source: APXvYqz50brG4C71dmclU62EqBJSGoKn7i9ovwD9wEHrNsbPX5siy0OoMRKz2pWK+LGTDuXzPjT/3g==
X-Received: by 2002:a1c:7ec7:: with SMTP id z190mr10464702wmc.17.1561813232210; 
 Sat, 29 Jun 2019 06:00:32 -0700 (PDT)
Received: from localhost.localdomain (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id d10sm4937676wro.18.2019.06.29.06.00.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:00:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 29 Jun 2019 15:00:14 +0200
Message-Id: <20190629130017.2973-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190629130017.2973-1-richard.henderson@linaro.org>
References: <20190629130017.2973-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PATCH v6 13/16] tcg/ppc: Enable Altivec detection
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
Cc: mark.cave-ayland@ilande.co.uk, amarkovic@wavecomp.com, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented the required tcg operations,
we can enable detection of host vector support.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 9a44670180..c6defd4df7 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -3513,7 +3513,7 @@ static void tcg_target_init(TCGContext *s)
     unsigned long hwcap = qemu_getauxval(AT_HWCAP);
     unsigned long hwcap2 = qemu_getauxval(AT_HWCAP2);
 
-    if (hwcap & /* PPC_FEATURE_HAS_ALTIVEC -- NOT YET */ 0) {
+    if (hwcap & PPC_FEATURE_HAS_ALTIVEC) {
         have_isa_altivec = true;
     }
     if (hwcap & PPC_FEATURE_ARCH_2_06) {
-- 
2.17.1


