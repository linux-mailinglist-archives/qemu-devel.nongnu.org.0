Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F136386F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:05:44 +0200 (CEST)
Received: from localhost ([::1]:34596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGU3-0000oF-HD
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGd-00034W-Aj
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:51 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGb-0000eM-UK
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:51 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n10-20020a05600c4f8ab0290130f0d3cba3so4186031wmq.1
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cJdBKLIJjo1FmzN1QJg7i4Ge0av2J5mMxKO6UU2xPVo=;
 b=oLru24v/zcZWzUaNRH1jCGVsMjsheo/erIlq+h/g0NMuvdm4JbgxexJMzOxBboW5kc
 MI+u4m3l9CCsDiy0/boI3SLc67qzl82pR1zdT7YM/hwzt4GA0H40ez5Q9E8QklwrqEL5
 BJdjpJtWRz8Uv70lLkCVZdplG54IBfyyrV8zFyuKQU6zujlsnR9ng1fHKCLNI3TMMHht
 hd0KRgtMg8IuK6G0anYRGNxW1bJ75XiM/E0MnupehQby4v9jH0eebqEDHsvSBgIPDJeW
 NmONNKJSXOKA1n6GWTy3oVV4vRp+0ts73RHVcZK2ot9N2NH0iFFbV8Y/Lcl9htB4YNx5
 IW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cJdBKLIJjo1FmzN1QJg7i4Ge0av2J5mMxKO6UU2xPVo=;
 b=K/YXMehczczI9XAf0fUrvFmAqj2O69XkQkQojtAg/dZ/YCnnK9eG45ALxX+PMy7uZH
 DG6HfuEQpl70rGDDpxN/AFKf2cBp2Lo4hVOa9Aqch/R+Nw0Zo9r+Lr7Rnoj7NxFhtVOR
 iP61JqpOvGNf4hJiVrrO2PZcqGmr+HPdI0nPRR94gwQves8oOodxw4OSQtO0nKKMyLzT
 GcACGCABIuKuR37jZAvvcJ1yqsDPcBy2Dj3hAaBqIrQT+unKTK4Fqjc03kOtS25OgI+k
 FrMDOQCg4CsVmynzJqOdyg+s4lFE9em7AF6aREmCUBnatHn3H87lZIGcWADxuVjZ86Qu
 dBwA==
X-Gm-Message-State: AOAM533NQni/ulq9ft2Hx2fn7HOoGiHAFDcpL711U057+OW2DvsEp7Fq
 DbZB2pHh12YpZnyEGr3NHDmQTjkxoWd5bg==
X-Google-Smtp-Source: ABdhPJxZw8CHQt0JuPprvDTIQus1iPDp13zHWwYjySmSpmEySKmc5fteRKbBr6Np7dGG5G2NDpzCWw==
X-Received: by 2002:a1c:23d0:: with SMTP id j199mr18698947wmj.74.1618786308414; 
 Sun, 18 Apr 2021 15:51:48 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u6sm19127327wml.23.2021.04.18.15.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:51:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/29] meson: Introduce meson_user_arch source set for
 arch-specific user-mode
Date: Mon, 19 Apr 2021 00:50:39 +0200
Message-Id: <20210418225058.1257014-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to the 'target_softmmu_arch' source set which allows
to restrict target-specific sources to system emulation, add
the equivalent 'target_user_arch' set for user emulation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: meson_user_arch -> target_user_arch in description (rth)

Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meson.build b/meson.build
index d8bb1ec5aa9..1ffdc9e6c4e 100644
--- a/meson.build
+++ b/meson.build
@@ -1751,6 +1751,7 @@
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
+target_user_arch = {}
 
 ###############
 # Trace files #
@@ -2168,6 +2169,11 @@
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
     qemu_target_name = 'qemu-' + target_name
+    if arch in target_user_arch
+      t = target_user_arch[arch].apply(config_target, strict: false)
+      arch_srcs += t.sources()
+      arch_deps += t.dependencies()
+    endif
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
       target_inc += include_directories('linux-user/host/' / config_host['ARCH'])
-- 
2.26.3


