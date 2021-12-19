Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E5947A0E3
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 15:22:46 +0100 (CET)
Received: from localhost ([::1]:49274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myx5K-0006Kn-1R
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 09:22:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx08-0006EP-VM
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:24 -0500
Received: from [2a00:1450:4864:20::52e] (port=42670
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1myx07-0005xe-EV
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 09:17:24 -0500
Received: by mail-ed1-x52e.google.com with SMTP id j21so23399532edt.9
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 06:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8imorrcfDdDuYqAEOd69k+qbFtbECFBVn2gu1jJv1fg=;
 b=WWaZHiEmVmlhSM9r6inC7z/WOs3JfAWB3TkUxczLfNJIq9+xlRvC47fnWOkAzPsopy
 bmGn02e1k0a/xzF7YkP9YZugATPRIbqQQnY1zpgaOwiq2ummD1mdYFht6+IMJ0FLNiKv
 DD6g6cVEJKQRBRkkUB9nVOZyC8t2UtraKR1l21S1gbfOmedU/0xjn3PTPHBZvpPoTN7G
 wzpupyAf+sK7JLopurgSFiYonQAEthoGAcngYAIMVdFZcrWAFHyeBsoOblOHKxFAaePH
 nqQFTWhUgnIMlLOT36uClViY63mWYGZ23OIH6PUf3StYw2k9tEzaMzPxZ0RbWIfvw98T
 byDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8imorrcfDdDuYqAEOd69k+qbFtbECFBVn2gu1jJv1fg=;
 b=v/8o6wZihZVKsCC3sx4xemPjn7S+r0LmILoiVkGoBGBQxgcZvjiJZG16ysOpBI7aaG
 SdYTHlAI4yLO+txF6B1BKYbd4LOdy7pxePrFFPpKoW2QRYi++hIF2Lq+9Zoc+aw0l+jN
 SDQmjMYBNLDsKrmKn3itqQBUflbiFV00yHaEqyxTfRcfIhzQV1ro7pYbZWynt6VC27N0
 1q9nSFeVJ14kxCNnELFld4wtS0owuaLTyPuBJYT9bxTV9WRS6GFqO8tLtmALfRHljBoE
 Xn9QYaB/JgqeiuDn25n0azYpJgD1Is1NfwstKVtJTO91qe80JUQ9Qw12uSiQv76VKqsE
 QA3Q==
X-Gm-Message-State: AOAM533bTLsOEmtemcUu+1LGOi3D1QC5WxgtLr7jsVeCFAo4iLTZxKA0
 67+Q+9d9/Qdl8SkjBAFZ0mZjTAiDbmk=
X-Google-Smtp-Source: ABdhPJz3R5Xk1lhsuGYYgUwSnaE6OWi9t/IC3WUzEoo6HiNsX+ZQelWxH72DuMoY/voj3FpOf8HQdA==
X-Received: by 2002:aa7:c783:: with SMTP id n3mr11737799eds.121.1639923442166; 
 Sun, 19 Dec 2021 06:17:22 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.gmail.com with ESMTPSA id hq9sm4570665ejc.119.2021.12.19.06.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Dec 2021 06:17:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/16] meson: rename "arch" variable
Date: Sun, 19 Dec 2021 15:17:01 +0100
Message-Id: <20211219141711.248066-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219141711.248066-1-pbonzini@redhat.com>
References: <20211219141711.248066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid confusion between the ARCH variable of configure/config-host.mak
and the same-named variable of meson.build.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 69cca2aa9f..4fdaa65b05 100644
--- a/meson.build
+++ b/meson.build
@@ -2850,7 +2850,7 @@ emulators = {}
 foreach target : target_dirs
   config_target = config_target_mak[target]
   target_name = config_target['TARGET_NAME']
-  arch = config_target['TARGET_BASE_ARCH']
+  target_base_arch = config_target['TARGET_BASE_ARCH']
   arch_srcs = [config_target_h[target]]
   arch_deps = []
   c_args = ['-DNEED_CPU_H',
@@ -2866,11 +2866,11 @@ foreach target : target_dirs
   if target.endswith('-softmmu')
     qemu_target_name = 'qemu-system-' + target_name
     target_type='system'
-    t = target_softmmu_arch[arch].apply(config_target, strict: false)
+    t = target_softmmu_arch[target_base_arch].apply(config_target, strict: false)
     arch_srcs += t.sources()
     arch_deps += t.dependencies()
 
-    hw_dir = target_name == 'sparc64' ? 'sparc64' : arch
+    hw_dir = target_name == 'sparc64' ? 'sparc64' : target_base_arch
     hw = hw_arch[hw_dir].apply(config_target, strict: false)
     arch_srcs += hw.sources()
     arch_deps += hw.dependencies()
@@ -2881,8 +2881,8 @@ foreach target : target_dirs
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
     qemu_target_name = 'qemu-' + target_name
-    if arch in target_user_arch
-      t = target_user_arch[arch].apply(config_target, strict: false)
+    if target_base_arch in target_user_arch
+      t = target_user_arch[target_base_arch].apply(config_target, strict: false)
       arch_srcs += t.sources()
       arch_deps += t.dependencies()
     endif
@@ -2920,7 +2920,7 @@ foreach target : target_dirs
     arch_srcs += gdbstub_xml
   endif
 
-  t = target_arch[arch].apply(config_target, strict: false)
+  t = target_arch[target_base_arch].apply(config_target, strict: false)
   arch_srcs += t.sources()
   arch_deps += t.dependencies()
 
-- 
2.33.1



