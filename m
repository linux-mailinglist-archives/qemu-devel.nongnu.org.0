Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DF83F8CBC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:11:33 +0200 (CEST)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIuZ-0005Al-Io
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImr-0005ir-Pz
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImp-0008TJ-Vz
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:33 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 d22-20020a1c1d16000000b002e7777970f0so7366715wmd.3
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9S9qaExeEhXE11YYRh9+JjtdaNpjXkfjgsg5lVi2dxo=;
 b=sfXghfE+twl1JYaOEQZzV7aTIr0RfcD9zbM6R9AfpYYLcR1KmzHEtD05MUlrFd3sta
 ZEXaT6BhxgCS1okIe78W08QV6whIFhD7oE0rRuBATt3lpTBNkvwyNa0jrJE94mnsCrqc
 HEE64gHS01obxkynoUchLnuX6o3mVOlTLvmxzRKthE2i0XPf0bM17ckdcFtJC2hwpiFr
 cLzw4BL3xaXi56iE3jo4cDI+WGw8NTYOIh0xvM7eCTXVL44ML/D38sjgMruNC6ILqqYv
 ZtAb16DFxaGeZOqIBpKnoM8FOemxSEkGbs9B+J9G0Ly2goTy+xwLn+sOsM1LU3UyZrtz
 cZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9S9qaExeEhXE11YYRh9+JjtdaNpjXkfjgsg5lVi2dxo=;
 b=FbGfxgH4RpYWR7BpY3h3NoABZtzJXWtB2Dz81UVPhJqeYSyGbEicsi22jcdHyQXEEg
 +78bF1yh/Fbl3lJe7gMizMs2oTHvd7rR2GzJWXAkG8rLMuo/QQA36YnzDk9PWaQPTyhQ
 1+JtDhpVTkEqS1wMGWnjKJZUeTLF7S+chV4XHd2PnRJ61Eb7+lC+Lr4VALYPgXTVxdLO
 N1auoUbYx+9D+MOE6dKRxZTXGs5uP8uWvIhM3Yjdtf4UC4IfUrLANc7+AUEk5v5bnj3Q
 YcjyDFrHTvje6XiVXWfM57K7mnItHvzpMQxXspp843w/HtgyWLBKmi3vZiKhOEMlvshy
 BMhQ==
X-Gm-Message-State: AOAM531Qep8p0AzxhCDgHztdBHnMTwSTtLP0+BaweOXUtZZ0l3+ESjbJ
 H2jumyJLtnNCnMmcYnP/bvB+eZW5eie3yg==
X-Google-Smtp-Source: ABdhPJyR5faZx3WlY/be2m0vBYeYzHVafnZoAnTwsoihtcGPbbdEM5DYQkLf2DCG+MqW2rf8cZQ0pA==
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr15448697wmg.162.1629997410588; 
 Thu, 26 Aug 2021 10:03:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/37] arch_init.h: Move QEMU_ARCH_VIRTIO_* to qdev-monitor.c
Date: Thu, 26 Aug 2021 18:02:50 +0100
Message-Id: <20210826170307.27733-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU_ARCH_VIRTIO_* defines are used only in one file,
qdev-monitor.c. Move them to that file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-id: 20210730105947.28215-7-peter.maydell@linaro.org
---
 include/sysemu/arch_init.h | 9 ---------
 softmmu/qdev-monitor.c     | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 60270c5ad15..e7789399508 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -30,13 +30,4 @@ enum {
 
 extern const uint32_t arch_type;
 
-/* default virtio transport per architecture */
-#define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
-                              QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
-                              QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
-                              QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
-                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
-#define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
-#define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
-
 #endif
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 721dec2d820..a304754ab91 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -52,6 +52,15 @@ typedef struct QDevAlias
     uint32_t arch_mask;
 } QDevAlias;
 
+/* default virtio transport per architecture */
+#define QEMU_ARCH_VIRTIO_PCI (QEMU_ARCH_ALPHA | QEMU_ARCH_ARM | \
+                              QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
+                              QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
+                              QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
+                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
+#define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
+#define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
+
 /* Please keep this table sorted by typename. */
 static const QDevAlias qdev_alias_table[] = {
     { "AC97", "ac97" }, /* -soundhw name */
-- 
2.20.1


