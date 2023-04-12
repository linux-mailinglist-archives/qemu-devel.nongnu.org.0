Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABD46DFFFC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 22:35:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmhB5-0004ic-7p; Wed, 12 Apr 2023 16:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pmhB2-0004gw-Of
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:34:48 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pmhB1-0000SK-8x
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 16:34:48 -0400
Received: by mail-ej1-x633.google.com with SMTP id z9so5003211ejx.11
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 13:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681331685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ol1QVpM6FT8I/EBtMG8vNh8lfip/GRVz6FxUW2l2o30=;
 b=ExVDzMzFWFmEwhgXyF8EX9ewxHzciroLjuo10a4igdquUzeqrpOWbgq35gOeoEDV91
 nQyOsdZOcgeh5Xh5/jNcdwTQe3z2arQmMSru0XvWk1+JUf+hNsDyyqVydXXcSrjoQ3r8
 1Y/rM1hdNWJeGK+YhxhzrfaMfZLDaphOecYXdacHVC7MlspYGlNP7VrajuzAdItrbFFJ
 kPVORf4C6Q1swuz2TOQwXY2yArROUicpD69qFdlwi8g+B/hit+saPva3+GMcEk32AEK9
 DahG77VRfy+KNnWdRTTc+PwdLaHFZ43AE0wALkEHO+FMnwv+bI0VhQYk1tX58Yb0WerG
 KQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681331685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ol1QVpM6FT8I/EBtMG8vNh8lfip/GRVz6FxUW2l2o30=;
 b=YlEf+Y7gRYi74gSygpVACJBYhpuo8f2mNNkL2ibknF7mDJFx8Hj+HZ9E2zlzZJ8EdS
 LZnQh/cKYKUAB7lvlZpRY4ZZFmo9FMjbID+aCuNn+K5Z2g9oPZZb8JMX7LDfs8/T0K3S
 Ybqo+PCsDVVuORGKhL27YSPt5zS7UDG9j0SEmqjA0ByOoZazwuOc+QWv9lhDLED8sggc
 FW+B1odWRx0Xqu04VMyONcPD8AV2YHNJAOfLGzocbmb1dpK9uS+53j+UTBnpuFr4FjxP
 QAxcGRpmEOFQ/0Me1YpST7dch23Vgk3b568R+KC8Iir3Z5XRG+UeJNznjf8CAOXz1GnR
 b88w==
X-Gm-Message-State: AAQBX9cB0CEbhHHqpvQH3NLmfmXs2L1jAWkx1CFzp8CUNiTcgCjJdtTX
 SIUCZnGTesYUvdQClbakX9NFJREID14=
X-Google-Smtp-Source: AKy350Zqc5IOczKB8ZMWwuodTz1dl6tx0nhWSk1Vam5o7qqXtBOWM1J/I+Z5PAxe53Q2Vh+MloTnMQ==
X-Received: by 2002:a17:906:ae42:b0:94c:8cd8:559d with SMTP id
 lf2-20020a170906ae4200b0094c8cd8559dmr141685ejb.70.1681331685389; 
 Wed, 12 Apr 2023 13:34:45 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-012-055-150.89.12.pool.telefonica.de. [89.12.55.150])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a170906358800b0094a6f908b8bsm4093562ejb.166.2023.04.12.13.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 13:34:44 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/3] ui/sdl2-input: Fix AltGr modifier on Windows hosts
Date: Wed, 12 Apr 2023 22:34:25 +0200
Message-Id: <20230412203425.32566-4-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412203425.32566-1-shentey@gmail.com>
References: <20230412203425.32566-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Windows generates Ctrl + Alt_R for AltGr. By removing the Ctrl modifier Linux
guests see AltGr. This fixes e.g. the '~' key on german keyboards.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 ui/sdl2-input.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/ui/sdl2-input.c b/ui/sdl2-input.c
index f068382209..a6538b56d2 100644
--- a/ui/sdl2-input.c
+++ b/ui/sdl2-input.c
@@ -39,6 +39,19 @@ void sdl2_process_key(struct sdl2_console *scon,
         return;
     }
     qcode = qemu_input_map_usb_to_qcode[ev->keysym.scancode];
+
+#ifdef CONFIG_WIN32
+    if (qcode == Q_KEY_CODE_ALT_R &&
+        qkbd_state_modifier_get(scon->kbd, QKBD_MOD_CTRL)) {
+        /*
+         * Windows generates Ctrl + Alt_R for AltGr. By removing the Ctrl
+         * modifier (Linux) guests see AltGr.
+         */
+        trace_sdl2_process_key(ev->keysym.scancode, Q_KEY_CODE_CTRL, "up");
+        qkbd_state_key_event(scon->kbd, Q_KEY_CODE_CTRL, false);
+    }
+#endif
+
     trace_sdl2_process_key(ev->keysym.scancode, qcode,
                            ev->type == SDL_KEYDOWN ? "down" : "up");
     qkbd_state_key_event(scon->kbd, qcode, ev->type == SDL_KEYDOWN);
-- 
2.40.0


