Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 508874B5A87
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:25:30 +0100 (CET)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgyX-0002p2-EV
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:25:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgY0-0002tO-GH; Mon, 14 Feb 2022 13:58:04 -0500
Received: from [2607:f8b0:4864:20::42d] (port=38538
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgXz-0006U2-2e; Mon, 14 Feb 2022 13:58:04 -0500
Received: by mail-pf1-x42d.google.com with SMTP id e17so11310747pfv.5;
 Mon, 14 Feb 2022 10:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ueFe30KAYoKjPHZOLv0QgRUmcJTyJH01k8g/Vbuxj28=;
 b=o10VIbmaGSHcbSXxtantuaPKpv753l/rmiRV/OR50Jlb9NeGBX9ScSrcEv+lK+z/Fh
 4HwMMf3xZyWJsYNU8xSIrn6RrfWqtxhopqWPLxdaRmt4kwfS5WLj19F+pllQovIHWH4b
 R3wBZvxT4Iw2TBWmGpgVymQY52uZX3wSUVghPzJ8eCF5brqltJ2ig+zUhEx3/z3b1vQx
 HNbOcVc5wol0cJIiAhYpZOlx1aWcffB3UuL0L9jK4ofXmX8raPlXrCVxF6YtcRAkF8K1
 GsAECsldplL3aacnOTv83w29pzNMz1ruui65iJt0pHGPd3wVY/i++rwzI/aaicgcLL/M
 l0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ueFe30KAYoKjPHZOLv0QgRUmcJTyJH01k8g/Vbuxj28=;
 b=qdd8ojdxGHELn75znHfHnTX5PHWuXeBM1F0f7SavaUUd9iG65N7WhohXzKtbeT+izK
 dKL3ddQfpZtQkdScbE13tbivU1gZpaOkQZL4mKX5QjT8FmuPcSMnHeyGp7au95KiWah0
 HzCffP0Ajv3F5W8dlQ/N49zs/PT1pVcLnrQlAb2PfQcwf/b5P8Z912vP5NIeqFXKHmQ5
 +Q+Dpljz19pVXG7mo9GFMUC+MFQRy2f1o7TWQMSEK7GenBv0A0JjTN+xHLehpmCrRiBk
 JUGx/lNtaPyJhkDUQ8Ig6haMxWHd7+JFe6SlBWPiGEPA42X+88qm3QYRieglMkLlu2n2
 HY+w==
X-Gm-Message-State: AOAM53185YvZSTm28p01c0qw0+wAYBO2rHvNAxdrY6chloCwGa1JTPH7
 uxDLlv1L8YgpUsQGQWbPJuBn81d5y+8=
X-Google-Smtp-Source: ABdhPJwWq1kOZBauLUI2RnK7jCY6SpNHzLgkHtD7LZY++EC1LcLXho02WEiTHUN83/vT047P/HfIpg==
X-Received: by 2002:a05:6a00:10c5:: with SMTP id d5mr51446pfu.84.1644865081422; 
 Mon, 14 Feb 2022 10:58:01 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id v123sm20401523pfb.12.2022.02.14.10.57.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:58:01 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 11/16] audio/dbus: Fix building with modules on macOS
Date: Mon, 14 Feb 2022 19:56:00 +0100
Message-Id: <20220214185605.28087-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

When configuring QEMU with --enable-modules we get on macOS:

  --- stderr ---
  Dependency ui-dbus cannot be satisfied

ui-dbus depends on pixman and opengl, so add these dependencies
to audio-dbus.

Fixes: 739362d420 ("audio: add "dbus" audio backend")
Reviewed-by: Li Zhang <lizhang@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/meson.build b/audio/meson.build
index 0ac3791d0b..d9b295514f 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -28,7 +28,7 @@ endforeach
 
 if dbus_display
     module_ss = ss.source_set()
-    module_ss.add(when: gio, if_true: files('dbusaudio.c'))
+    module_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'], if_true: files('dbusaudio.c'))
     audio_modules += {'dbus': module_ss}
 endif
 
-- 
2.34.1


