Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6285C64F3C9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:12:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IU3-000611-UP; Fri, 16 Dec 2022 16:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITs-0005wb-LF
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:05 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6ITn-0000be-ST
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:42:59 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bi26-20020a05600c3d9a00b003d3404a89faso1997425wmb.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=++dngzwVZrf/lhItKbFYZlrrhOCx5GYOttIsi96mUbc=;
 b=sqpalmsfwALTaW8MdpFF1E7RvU8ya5O9lmA4aQfi4/GH//mRnNYxfxAtEZJCTdPkfj
 2WjuWLhzV9FeEPmhzK1SiuZs1RIC703Dbfub5+jZQfI499pBguzPfFgH2jl/+uxaAdPQ
 e0KLwJefBb3ji1f9hQJ0CJe0y1UzaK9TCGQBWSthHvZejmw3Vy3/oZJdPDus0BsPFIZ2
 OYYl7wGVPCnWqcHMBqhwRSfX872/0ZKGLlGgwNCDU/NCTTMHEcEf6LOfaoAzKhFWj+R5
 9SedeesR6PVTDR1JIW6ykKiHUnYyfkfBWVGStQhzBkjS0L8dF3tEXPeHDhan8XID/u+O
 O9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++dngzwVZrf/lhItKbFYZlrrhOCx5GYOttIsi96mUbc=;
 b=p9yJuT6CtfIUyBHGth3A0V5f/OWVLn0qkJreydYYNUpUT4v4g0Qgm0nSjlHMbJCLgK
 wJNpl1QRj3rwMyyeXDhsCDOxddETibg5y4WzhFMGZS9xp+ADJFCTMfzCom2crVHSTa/0
 yJVdx47fzUAiJJGE0BJOKMiySZelZmD0lVT98uhZttcjgO7ziTwaq+QKW1iBwd2fLHAb
 lNMGUq5AvWmUjd2gMpYc2sKoJFWuyDBAC0OaCHOLGaqEATf+arrSNST9imvHA3ffPRWq
 77mZC7aReiKCRTrgNa26BcQDym9ehON3YdDEE2bSPWZLQZgeOT24L4mbGuWhkaKvnK9C
 q28A==
X-Gm-Message-State: ANoB5pkrAUmGXEeSNfbiGMD12+45b7U9bQPlGAn3B6NEFXhlPjJBtHF7
 5wIxJHCFuqm7s4IbsWisgMQ3Hf39feq9oaDv
X-Google-Smtp-Source: AA0mqf5laPTLRvGi+3NE0n0//1NLqiO79lonhOR/q/BPg8RcP3SZubmz3avwW60ZXHUU4e6Phuz8yw==
X-Received: by 2002:a05:600c:384e:b0:3cf:a483:3100 with SMTP id
 s14-20020a05600c384e00b003cfa4833100mr28021532wmr.3.1671226972536; 
 Fri, 16 Dec 2022 13:42:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.42.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:42:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/36] hw/input/ps2: Convert TYPE_PS2_DEVICE to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:15 +0000
Message-Id: <20221216214244.1391647-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Convert the parent class TYPE_PS2_DEVICE to 3-phase reset.  Note that
we need an 'exit' phase function as well as the usual 'hold' phase
function, because changing outbound IRQ line state is only permitted
in 'exit'.  (Strictly speaking it's not supposed to be done in a
legacy reset handler either, but you can often get away with it.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221109170009.3498451-2-peter.maydell@linaro.org
---
 hw/input/ps2.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 05cf7111e31..47a5d68e300 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -1001,12 +1001,18 @@ void ps2_write_mouse(PS2MouseState *s, int val)
     }
 }
 
-static void ps2_reset(DeviceState *dev)
+static void ps2_reset_hold(Object *obj)
 {
-    PS2State *s = PS2_DEVICE(dev);
+    PS2State *s = PS2_DEVICE(obj);
 
     s->write_cmd = -1;
     ps2_reset_queue(s);
+}
+
+static void ps2_reset_exit(Object *obj)
+{
+    PS2State *s = PS2_DEVICE(obj);
+
     ps2_lower_irq(s);
 }
 
@@ -1281,8 +1287,10 @@ static void ps2_init(Object *obj)
 static void ps2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
-    dc->reset = ps2_reset;
+    rc->phases.hold = ps2_reset_hold;
+    rc->phases.exit = ps2_reset_exit;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
-- 
2.25.1


