Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B51567BD1
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 04:20:29 +0200 (CEST)
Received: from localhost ([::1]:35728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ueR-0005NF-RG
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 22:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o8uXr-000074-SM
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 22:13:39 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o8uXq-0007jR-CO
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 22:13:39 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 y14-20020a17090a644e00b001ef775f7118so10467637pjm.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 19:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/xcB4yyz0VJorUBTxjUWCNnY98x9UBxEtC0Pp+MlP1I=;
 b=AZxlGUOmCDif+/hPvCJaqJaRyb7xe4FmPWWOa+Mj6QqA/K7EOBmE+MoXjGcNr3dF1u
 amKq/BRvi6/HXF5xyuL6pywwFJcqIVCvTvdKWVnuOpbjRFnfiJGteUhWsU0mOAT1h04O
 uGLNi4frE2KzVp20FhnChCjHs+BSVuHjmbF2Hz0UYGSwcfKrAe6okWdSP1pZQ3YbiYdI
 +irynJKYA/6Xw5bEF5CenNEZlDoR9n3iEJA99CwblXRwnggdR4CAmhXY7H+ViRoivVlo
 gh/7v6+c21Flt+slMkPo43L5Zn7Fg+7993tsVERlfvwgWjHc9sOPcKGJpcyYHDVqqBJJ
 BXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/xcB4yyz0VJorUBTxjUWCNnY98x9UBxEtC0Pp+MlP1I=;
 b=Sdb1+r/ZAIkv3++kYO5nd5pXOtrNLSdeaP/cfPwqnDIV3GcwVcFWgtACcVMjSG67Tr
 /LzY11HKRqt/yNsrAJnSKeNzql5rvX35/OxQ4ESEZCILERfENoG7y6lXqctvOVlHg74a
 trE5KKxywLyE2uKv5KgBM3xmcMeP+SY07HASRbTzF9antm0QjCHbLHsB0rny8oSNYPss
 ogn85J8Ks+XOzinkFs73IsF6eVp9lOKzAxTjhRRL7+mifzWGrq16lubk/X0L/ECSljFX
 3W1Wc+xI0OFzzXgB8sZVhHoL4bQDE0nqj37ZYODhdID1R+Qb3cZLmRlzesuObjk0NwWJ
 0fgg==
X-Gm-Message-State: AJIora8BY2Wd1lUxc48kauV+c/jxBx7JJ5A3q4ergZ4JU5tvDVOjbRyl
 8CfpBWDx7XdpRpJ6wK5skYwbSXFrV/s=
X-Google-Smtp-Source: AGRyM1s99vitAhLqUbemh3TWXXQUueSvqZQouh+lM0ggBg9pXVcnimF3TD/5R4rVt3P7HhvUbbPDcA==
X-Received: by 2002:a17:90b:388e:b0:1ec:f6b6:f31f with SMTP id
 mu14-20020a17090b388e00b001ecf6b6f31fmr46432195pjb.181.1657073616690; 
 Tue, 05 Jul 2022 19:13:36 -0700 (PDT)
Received: from localhost.localdomain ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 ij21-20020a170902ab5500b0016bedcced2fsm3334071plb.35.2022.07.05.19.13.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Jul 2022 19:13:36 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH 3/3] meson: Allow to enable gtk and sdl while cocoa is enabled
Date: Wed,  6 Jul 2022 11:13:22 +0900
Message-Id: <20220706021322.22570-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220706021322.22570-1-akihiko.odaki@gmail.com>
References: <20220706021322.22570-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

As ui/cocoa does no longer override main(), ui/gtk and ui/sdl
can be enabled even ui/cocoa is enabled.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 meson.build | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 6e1c3eb2bc5..4714a0d5cf8 100644
--- a/meson.build
+++ b/meson.build
@@ -587,12 +587,6 @@ if get_option('attr').allowed()
 endif
 
 cocoa = dependency('appleframeworks', modules: 'Cocoa', required: get_option('cocoa'))
-if cocoa.found() and get_option('sdl').enabled()
-  error('Cocoa and SDL cannot be enabled at the same time')
-endif
-if cocoa.found() and get_option('gtk').enabled()
-  error('Cocoa and GTK+ cannot be enabled at the same time')
-endif
 
 vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
 if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
@@ -919,7 +913,7 @@ if not get_option('brlapi').auto() or have_system
 endif
 
 sdl = not_found
-if not get_option('sdl').auto() or (have_system and not cocoa.found())
+if not get_option('sdl').auto() or have_system
   sdl = dependency('sdl2', required: get_option('sdl'), kwargs: static_kwargs)
   sdl_image = not_found
 endif
@@ -1185,7 +1179,7 @@ endif
 gtk = not_found
 gtkx11 = not_found
 vte = not_found
-if not get_option('gtk').auto() or (have_system and not cocoa.found())
+if not get_option('gtk').auto() or have_system
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
                    required: get_option('gtk'),
-- 
2.32.1 (Apple Git-133)


