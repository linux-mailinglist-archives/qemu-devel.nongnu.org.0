Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6094D9BEF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:14:17 +0100 (CET)
Received: from localhost ([::1]:35874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU70C-0004tI-UI
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:14:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6i6-0005L9-Qi
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:34 -0400
Received: from [2607:f8b0:4864:20::42d] (port=44610
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6hx-00084m-A2
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:26 -0400
Received: by mail-pf1-x42d.google.com with SMTP id u17so17346157pfk.11
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Tp3WhNKm8JxXl/T2EoFZ8o3VjhBm7jaY9n4gps6ekw=;
 b=bQR6UdtxGZ2y7/OxggowNfVB4Zll4W5Ngz3CsdhrLluJiS8yKIunwF7aKbPDvf+xBj
 UVsjfZOH0+DAD3LHsBHTfxkoVVchhK50ixkLZA9tSLtuBugzmIrrnSjfYlluQGr1N/1Y
 5oj0OqeWbUyU8A8uu+6vfiwMEYoHVHujdCT8WiJAYYmeCFxbjrlvuGadBeiAbKTKU6Sm
 zvmrmzJLJesSyP90lJb+3ALS8N8nUjBRNGyLDBlCGiLYcd3JdUX0kcIBBArw2Oom/l3d
 HKjx8eEj3cqkVqREVjAg4p/xwj9w2uvSJ/4Em6PtwaM3fG2yUvBeCbS3YNIvKl0pin+o
 FT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Tp3WhNKm8JxXl/T2EoFZ8o3VjhBm7jaY9n4gps6ekw=;
 b=p3lXorBEQNk6pp6G0M2b1tgNfQp6+v7Zql75Roy/+03KNzT1ZT/0S/qjkLJPWChObJ
 7lEI71q5COuCjkeBnnJ1q10HyAo9lfTKv3Y0O1VOlOGAKbsssR0FviuIvHsjpI1HM+ks
 CDDag5/Q7FnLcuSgWt9OcmRMb2XZ9O/3/0xf7+rR7TmybrlQbggaRLvDUsdOqaJQIn8/
 A3mI2j950fnZS5zTWQMxOSdjA849SuFGrhk7Iqdgzj1dzpQWKKvW24cOrYCHrHQIAc0E
 wUI1XtUMK+h9TotIm1phBXZG/K+UpkWsJ7ec4JdG64bcMJoPoPGKeKWSswKHwVO6PfKl
 5LsQ==
X-Gm-Message-State: AOAM531JGfG8lJtM7kf7qe0EztuABfR8K8OBZnWSymzxUEgK5SSH5u/F
 eNiKc3uAiPuK207AIL7VGUlEYyriGGw=
X-Google-Smtp-Source: ABdhPJy/dj4hIlgzEvC/MGrwmDYrSI587xI8JN37IbGaVY0JUEE4RSwHv/cNDdTGpqHmAYCh292epw==
X-Received: by 2002:a63:2003:0:b0:381:2dd3:ab4b with SMTP id
 g3-20020a632003000000b003812dd3ab4bmr11641620pgg.517.1647348923390; 
 Tue, 15 Mar 2022 05:55:23 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a656cc7000000b00375948e63d6sm18838537pgw.91.2022.03.15.05.55.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:55:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/21] coreaudio: Always return 0 in handle_voice_change
Date: Tue, 15 Mar 2022 13:53:39 +0100
Message-Id: <20220315125350.82452-11-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

handle_voice_change() is a CoreAudio callback function as of CoreAudio type
AudioObjectPropertyListenerProc, and for the latter MacOSX.sdk/System/
Library/Frameworks/CoreAudio.framework/Headers/AudioHardware.h
says "The return value is currently unused and should always be 0.".

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220306123410.61063-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/coreaudio.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/audio/coreaudio.c b/audio/coreaudio.c
index 23d7593eb9..3186b68474 100644
--- a/audio/coreaudio.c
+++ b/audio/coreaudio.c
@@ -545,7 +545,6 @@ static OSStatus handle_voice_change(
     const AudioObjectPropertyAddress *in_addresses,
     void *in_client_data)
 {
-    OSStatus status;
     coreaudioVoiceOut *core = in_client_data;
 
     qemu_mutex_lock_iothread();
@@ -554,13 +553,12 @@ static OSStatus handle_voice_change(
         fini_out_device(core);
     }
 
-    status = init_out_device(core);
-    if (!status) {
+    if (!init_out_device(core)) {
         update_device_playback_state(core);
     }
 
     qemu_mutex_unlock_iothread();
-    return status;
+    return 0;
 }
 
 static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
-- 
2.34.1


