Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCE1536E2B
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 21:25:07 +0200 (CEST)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv23e-0006mj-2H
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 15:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv202-0003QQ-PW; Sat, 28 May 2022 15:21:22 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:32951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv201-00021g-5s; Sat, 28 May 2022 15:21:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 o29-20020a05600c511d00b00397697f172dso4774870wms.0; 
 Sat, 28 May 2022 12:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LI+dnKU/+rDWdb/mssAvvUNnXgacIhfVq68lVqQxR9A=;
 b=BUn3Q4FX3j17dHxatQ2s9OAvzlA13RCkCQbPh2MMHiYXtUMnSXrU9ybUyPeqGUhrLM
 GSGOSGu1j8qwhhbylWw0NBOqFH0m0X9S8XByiLP5Pzus0s23s33uTYlqnMXJkl6OR50X
 nO5NCyGNgJh3FMttbLGS3eQD5VcYsKRu5R0gl6jdGLj/HO+VTAoFPOipcZQg7FVbb0Bf
 cfda4BxLTqvOBYkkDL2jMZOYVPdKNfXO4f5TOyKbSDNZs4Sfl+VRxFyjOfAJrrtkVphg
 WFFM3obLnXyCW9xgN6IelBnSs6jB6Yq/+5/C+PciHGiroC+DnTJHjMB+suEKG/keJg3k
 zs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LI+dnKU/+rDWdb/mssAvvUNnXgacIhfVq68lVqQxR9A=;
 b=dJETySVCrG70qES3YnP6Pu3W3BKe3glxEp8HaGhT674hh+/RGEK7/9+iHOW4KZ73HQ
 7n64Um8iAzMBW0yO8ap60yxGBHqhTmnHV59p52zuf2At+HMtQ8/RmVvu3FylP43/e/Xa
 znS/lPoCFIzE75mrZYkbAtJHf0ocZlyqXTPywvtvyZOVX6VxyOHTwZlxvFFsoMQve/5R
 uqSOLuJM/UM84TWF+PTrkMkyqd0MxUtDrLuzb3h2jZOtv/wMobOFoBW/W6tMM0Z1wqJv
 Fs7XFKVLnk2x30VAtmQeU/I9aAWBh7Y9Euk9Cu9JjbE3gEXKkWsN/HmShXdFK1nJwpgy
 Wlww==
X-Gm-Message-State: AOAM531jDRdQjETaFXAvDwX/G3bwMOqtozTCEBFbiLzgeOlJcWlSMQHb
 vepPbt12TnzIsN7IKO0ox3OAyPWvG0sIA3yOSlI=
X-Google-Smtp-Source: ABdhPJzoVicv372ss3/Bc9OVm/f8bW+vjt81HQ4kmckU+wjpE3sI9/3qAHQBsZG5aCwf2M81yJIduQ==
X-Received: by 2002:a05:600c:3ac3:b0:399:323:3a8d with SMTP id
 d3-20020a05600c3ac300b0039903233a8dmr3958891wms.101.1653765679034; 
 Sat, 28 May 2022 12:21:19 -0700 (PDT)
Received: from osoxes.fritz.box (pd9ed79c4.dip0.t-ipconnect.de.
 [217.237.121.196]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c069500b003942a244ed7sm5341022wmn.28.2022.05.28.12.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 12:21:18 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v3 2/7] hw/isa/piix4: Use object_initialize_child() for
 embedded struct
Date: Sat, 28 May 2022 21:20:51 +0200
Message-Id: <20220528192057.30910-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220528192057.30910-1-shentey@gmail.com>
References: <20220528192057.30910-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32e.google.com
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

Found-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
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


