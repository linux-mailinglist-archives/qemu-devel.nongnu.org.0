Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701FF575526
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 20:38:11 +0200 (CEST)
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC3iz-00089z-I1
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 14:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3MGDQYggKCk8DByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZE-0004J5-7E
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:04 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:42794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3MGDQYggKCk8DByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com>)
 id 1oC3ZC-0007Mn-Nr
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 14:28:03 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 cu3-20020a056a00448300b0052ae559108fso1510903pfb.9
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 11:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=tBQdneFk1mZ3l+qSjTrc7swcXUrArsAjIK7JSlXHfs9mMU1T+GXX+1JzNeRPZUVhLZ
 8fphVp/crtIfCay4H/u7cwDF8cRdum8s1gq4LIRni/jZcdbb+Kvm2wKHBUHKNjiSfjcF
 k+v4VWkRUQFbNfdbo3DJMwxJ/LeXocq6r2qpliEyrdws0LbtQEHosChiWsdKXKEQoKEH
 steCSxWKWMDdhQ53lYADXQajyKaOo6SioTNHvxIiZn8y8Txc/Jrl/zs576JRo5W/ozxS
 r5+ALQyOia4QG4+jnef3SC0Juv18jMGKyHqaJw2tBSpZvllcjEr3O0DHjoIbOonP+gyC
 WQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=vhcn9HX+W8BDC3zc9EzHTKhU6VuXS2Qk41Wg69c1pG8=;
 b=4ZunG2zRmHlEiwnqRnnlPuClJpHkN91BROpNtmyMbz1n8s4Za57muVHClYhF++jabW
 osDuLaYW3P9Li1bXl8EoOreTlaEbcUpw7VnUs42t4SZ2kKMxjy7RrR+uyAbo0gKMms2w
 EPokeXXrQZp398o+pU7pcXCzw6ZdvGZIve9Qm67ZPhh6yy5SP2czyMK3yBDEUMpJrs1t
 OhOh6t7jz1xPFvfZsculr0dJ1vcEYwjLRdrnC5ogeN5SebCvSrVhgXTOF0qeIQU33mMh
 VrhQSiSBz20YSO/RY62fsoX+IK6bViyuOrimH8YyMjzuu8TSkjMnRi5litmtmG66/822
 vEzA==
X-Gm-Message-State: AJIora9FnURzyTpfSzIuzcyH4ENuef5RQOCrxyoO6cOvuFCIE0loIaXR
 B4l0Yb6t2ZmY+z+CQn/x8YcGU8jPobv1xg==
X-Google-Smtp-Source: AGRyM1tlxa/879nc1eRONpvWhDyUKu3hiZow9ESzRrsjDRClvMMJZRTIVXQqQREl+VnTkF3OueQxO8/fX9/L9Q==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a62:6183:0:b0:52a:c31d:11b7 with SMTP id
 v125-20020a626183000000b0052ac31d11b7mr9562442pfb.74.1657823280730; Thu, 14
 Jul 2022 11:28:00 -0700 (PDT)
Date: Thu, 14 Jul 2022 11:27:40 -0700
In-Reply-To: <20220714182756.85664-1-wuhaotsh@google.com>
Message-Id: <20220714182756.85664-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220714182756.85664-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH 1/8] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 wuhaotsh@google.com, venture@google.com, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, hskinnemoen@google.com, f4bug@amsat.org, 
 bin.meng@windriver.com, qemu-block@nongnu.org, armbru@redhat.com, 
 thuth@redhat.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3MGDQYggKCk8DByr5A9yx55x2v.t537v3B-uvCv2454x4B.58x@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

The ACK bit in NPCM7XX SMBus module should be cleared each time it
sends out a NACK signal. This patch fixes the bug that it fails to
do so.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i2c/npcm7xx_smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index e7e0ba66fe..f18e311556 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -270,7 +270,7 @@ static void npcm7xx_smbus_recv_byte(NPCM7xxSMBusState *s)
     if (s->st & NPCM7XX_SMBCTL1_ACK) {
         trace_npcm7xx_smbus_nack(DEVICE(s)->canonical_path);
         i2c_nack(s->bus);
-        s->st &= NPCM7XX_SMBCTL1_ACK;
+        s->st &= ~NPCM7XX_SMBCTL1_ACK;
     }
     trace_npcm7xx_smbus_recv_byte((DEVICE(s)->canonical_path), s->sda);
     npcm7xx_smbus_update_irq(s);
-- 
2.37.0.170.g444d1eabd0-goog


