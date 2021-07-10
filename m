Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94ED3C35FA
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 19:55:52 +0200 (CEST)
Received: from localhost ([::1]:59040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2HCh-0001KF-QF
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 13:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7O-0006H2-VV
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:23 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:45874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2H7N-0001FJ-HG
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:50:22 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso8331023wmj.4
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 10:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FBaYKuMwOAsdEnFh/yLoGMJg5cvtO0jj+espTWV86dg=;
 b=XJE4r2v1dchxOZGfZ9icN57YDwiHJ8dajG9yxOy4FEGizjzbMkH5yd/qIWY3J1dU4w
 8XCRm1PskS1PxNxsWRMpyieD7yRonpQtAvvMoitfHxt2rpcTUE5DqHXTpPVka+T/A1wb
 QSs4VCVIJIjCKQzGZy0rObVKfXTnGtIw5cTkfiiC11xomswjJ5iTlBgT9m1KovMtIA8n
 ch0yjQf4dQGAHAXMsPkAwzeV1JlHXl0q+t3vJVRtEJbeyXkq6sqCWsuW0Y0V2Se/Z1Wp
 UNSpTPdYWXtIW/mOuFuqpeoDEeQjL7pkk9sA+2jvZa4iYb2bFm5Wo1MTAoFonflRJCgp
 minA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FBaYKuMwOAsdEnFh/yLoGMJg5cvtO0jj+espTWV86dg=;
 b=T04gP+FjKfHldy5nab28kgaJXwJhOJaeR+E1lmwrt+ROHXU0DQL83QUAY2XHQmRG0x
 I2zfmaheTvpYVgA1sKcOIChu6pUnCXO5SDFznveLTgYU5LxdVp2wFkGqpdI0w9ADZjEC
 1APGNIqMciBGg/KzCidEGuVmRPojdkeWTECjYu8byAbxmLxZDzfaJbYTzMwGU9ww45Ny
 jOu9QEYtET6UA3bbsvZ4lQWMg+e2vjB1nKvrR6kQihOHZt69bsByg9+MDkPo0qg+cq+H
 B++Rvc1eKR1wwggLKAcHSbPFLQj1Aq9D2Jc7WATuYFcrrUdbDg9yTZdHp3+0+B9DG/1J
 Shlg==
X-Gm-Message-State: AOAM533jDqzx8i3LK9rVaVGKH97feFCxP2N40J7GHp83Yh4IFcWgKiwm
 BC5tzCGNY/gf61g3EzWYFgqMGxmFOu+oxA==
X-Google-Smtp-Source: ABdhPJwYc48illHoB99lCfxjKCI1pjIB1smAMdA7AGPR3lKnJnHqhPNVpMor/zSofaS53TUaSpATjQ==
X-Received: by 2002:a05:600c:1c8b:: with SMTP id
 k11mr5352467wms.41.1625939420044; 
 Sat, 10 Jul 2021 10:50:20 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e15sm8864203wrp.29.2021.07.10.10.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 10:50:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/8] dp8393x: Migrate registers as array of uint16
Date: Sat, 10 Jul 2021 19:49:51 +0200
Message-Id: <20210710174954.2577195-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210710174954.2577195-1-f4bug@amsat.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, Finn Thain <fthain@linux-m68k.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CAM registers are now arrays of 3 uint16_t. We can avoid using
the VMSTATE_BUFFER_UNSAFE() macro by using VMSTATE_UINT16_2DARRAY()
which is more appropriate.

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/dp8393x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 2c3047c8688..68516241a1f 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -983,10 +983,10 @@ static void dp8393x_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_dp8393x = {
     .name = "dp8393x",
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField []) {
-        VMSTATE_BUFFER_UNSAFE(cam, dp8393xState, 0, 16 * 3 * 2),
+        VMSTATE_UINT16_2DARRAY(cam, dp8393xState, 16, 3),
         VMSTATE_UINT16_ARRAY(regs, dp8393xState, SONIC_REG_COUNT),
         VMSTATE_END_OF_LIST()
     }
-- 
2.31.1


