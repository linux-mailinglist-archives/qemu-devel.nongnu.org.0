Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E132FB6C
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:40:41 +0100 (CET)
Received: from localhost ([::1]:51442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ2m-0004wS-Bm
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:40:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzK-0000Wj-9b
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:06 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYzH-0008Gb-Cq
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:37:05 -0500
Received: by mail-wr1-x435.google.com with SMTP id f12so5866711wrx.8
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+GxKI5juIqhk1EGDwh5fKAHzAvqchzuN7HVSBiJuxfI=;
 b=ZGSjyi32Mp9mqcgwe2Fn136PjSvCe6ceS+4QuNmzew9q8Noh9T+4JNb4NDmd6KatK+
 Ms5l8pB2R6clbhpeKrXbDgC6W/pkgZgtRdnbZVpPPK/K0tmYIa9TvhvvAeHzamUM6m5c
 tioKX3SPOEmDPDOM4TPVBQNA0CN+rOaffKsnStwaEdnapk8tvHULJNZqkBBDQsWk/tCN
 fHbwdYlT8i+hD1LGt55AUdKHfc4Rn+usn2Pf0+GXz6Xez8J2/d7T8aE6nhyjZ0eKUOI/
 yFepoUsv+c6SPNU+m2ybgJQ74rCh/84AYrrLUhCLLVrzjAtpzXVsfi3D7nKFgeXEW2G5
 unpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+GxKI5juIqhk1EGDwh5fKAHzAvqchzuN7HVSBiJuxfI=;
 b=p6zI1e+/wCeS4XCIlx6PHxiz8sR221e2QGiT4uP3yQ7vGLGt8kpZDM3Mit/nOAfNeR
 XjJJTTxWP1K/kx+NFeZYQjSG5rgaJ2DaNbkFg2tbPP3EfwAdSMDDdAl5hV3DjLdS+Bfe
 xFyFBNGztT+4z91pExYqKYHkw88Te9s+PFf/c6JHFTYxdCTr8NQX9xL4l0e7OplY0fez
 ZD4XvKiHHklmRi/sgjtK7stucG01O+PgFbhIg9bAJ5oRLj5Z2I60FUg4/3m6Ke39qSc3
 b+x7SWK1hUNnsvb9IgWzpOgjNCZu1R2FK0IoekgfXV0DM6iWF6/OGxiBY02kun6ikcNo
 qi7A==
X-Gm-Message-State: AOAM531+ytOlyMWQtdQJUIMPngCryWzlh8jcjXWGgRL1jCAbcat+nas5
 AkOOrPOmp6RfVBMyJ7wGK8w2yjLPMos=
X-Google-Smtp-Source: ABdhPJxAE/ckP2EfEWdUMTNDisV/P1tKOefglPRpdm5fUyWUF/szxzAflEFmUbzhqqBRcTfxT4jKKA==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr13927252wrv.319.1615045021990; 
 Sat, 06 Mar 2021 07:37:01 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b131sm9323605wmb.34.2021.03.06.07.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:37:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/14] hw/intc: Introduce SH_INTC Kconfig entry
Date: Sat,  6 Mar 2021 16:36:15 +0100
Message-Id: <20210306153621.2393879-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use the 'SH4' config for architecture
specific features. Add more fine-grained selection by adding
a CONFIG_SH_INTC selector for the SH4 interrupt controller.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210222141514.2646278-4-f4bug@amsat.org>
---
 hw/intc/Kconfig     | 3 +++
 hw/intc/meson.build | 2 +-
 hw/sh4/Kconfig      | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index c18d11142a8..66bf0b90b47 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -53,6 +53,9 @@ config OMPIC
 config PPC_UIC
     bool
 
+config SH_INTC
+    bool
+
 config RX_ICU
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 53cba115690..b3d9345a0d2 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -47,7 +47,7 @@
 specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
-specific_ss.add(when: 'CONFIG_SH4', if_true: files('sh_intc.c'))
+specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
 specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
 specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 0452b4624ae..c2008c6a0d2 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -19,6 +19,7 @@ config SHIX
 
 config SH7750
     bool
+    select SH_INTC
 
 config SH4
     bool
-- 
2.26.2


