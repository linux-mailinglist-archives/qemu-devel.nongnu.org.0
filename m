Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5954D9BDA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:11:19 +0100 (CET)
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6xI-0007tq-MU
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:11:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6hn-0005AQ-47
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:16 -0400
Received: from [2607:f8b0:4864:20::433] (port=43744
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6hi-0007y6-Qp
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:12 -0400
Received: by mail-pf1-x433.google.com with SMTP id t2so16830246pfj.10
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LG/c+ztFQy+lUqxAjjhbBGZeuruF9FjjhdwvvjkCJJo=;
 b=Yd1nBQW2mtlGX87fE8YhTjfDA+/bygnMccGLbHCBc5Ic6wzkdc8dtIS7CMnEH4YMNY
 QJN7Y+M/kVm5sqxYWyfp16L0BVkklkq4gmO11ZUddPyHMUtZ/j4fuvf+wIt4FnXvPbJm
 MePeVhDnraBFqSki5UlO4rk1vYaKlyVtTwX6WMrXjWIfMGfwi02xvDga9ro/QQdm1wme
 B1C1Q9iGHuWs9I5O+G9UuLWgDZNkgdAF3jfgLpbrViKMaz1qhc0i3UKAcQ0a21T/wlu8
 BkWImlA8vQUwbNfaITF9f1Ndl4fp7R8zC59L55XceEn7bdvzk3Z2mD16SlKB+jaDX1n2
 8v4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LG/c+ztFQy+lUqxAjjhbBGZeuruF9FjjhdwvvjkCJJo=;
 b=3sL1Tr6/bI3aoc0pbBgzS4kPHZ01gjBBW5KxrVU+VyF6ML2stLucxAjHqii9HEcGn2
 v/B+mwoc0jLHyHfnMXdCCYoe8hLoKq8PsoKRjl3Omm22bPs8PwUYjZS6GsatYq8A049V
 hCNcLvkqNliNqATILyFLeht3rsUZEgO/k+50SBTxern0L2rWR52jawa3CPwUgEIHUMRw
 V7UZXthRImRcfIw1huJhruuwdY9GflnIs2I44uTToV5LQAT6/xWJtS7HWdRRaBosAvw5
 yzE6pU2172zCTlVe+HDVWi9ChxMLh24FE7AZLxCHLMmNpyNt/2R4sVcsLD6LSY+W5oOA
 KuMQ==
X-Gm-Message-State: AOAM532Db7Jvnh5rFxJlVdTfHEV8ZiS6xwbZTLGF8Ijuyc6YBvaMt8hS
 9qG5IdG3IChYTOimWq8Pk64VXLOcljU=
X-Google-Smtp-Source: ABdhPJwR2ib+LSWtnmCU6ZJovLr63O7ttgxztHCXBaaMijW7HjmJO6VeYZheR32W+tAtkxDiQHvcXQ==
X-Received: by 2002:a05:6a00:17a6:b0:4f7:d375:ac4c with SMTP id
 s38-20020a056a0017a600b004f7d375ac4cmr9284541pfg.19.1647348906268; 
 Tue, 15 Mar 2022 05:55:06 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a63b606000000b003808b0ea96fsm19512366pgf.66.2022.03.15.05.55.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:55:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/21] audio/dbus: Fix building with modules on macOS
Date: Tue, 15 Mar 2022 13:53:37 +0100
Message-Id: <20220315125350.82452-9-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
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
Cc: Li Zhang <lizhang@suse.de>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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


