Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57950321A2D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:23:49 +0100 (CET)
Received: from localhost ([::1]:52140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEC7o-0001aX-DF
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBzt-0003PJ-9f; Mon, 22 Feb 2021 09:15:37 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBzq-0001Dy-T8; Mon, 22 Feb 2021 09:15:36 -0500
Received: by mail-ed1-x530.google.com with SMTP id q10so22145693edt.7;
 Mon, 22 Feb 2021 06:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AhAmFnOhivCLWQNmcu5zh+TK35CPBEArBmFuQg4srh8=;
 b=mMh1h4nZ3Ybbh5dCRYn4OKv3g1lrvR/ILwgy6a6lTXh/pu0pW2tLLlZUeUfuGtxtF6
 3jlrqZAVXp+Tz3a/p+WjgrxgDB2vMzbmD6e4uzNmZ8CFJfulzsQrN++P3+f+mjVzohL4
 N4KQx/MUmaeJ4ouN5nslJcLmQduOitof5EjV/gOrdZAMtSf9N8Swlo1zP0o8PIeJgPn1
 90VvAXmdAUKZ+g1gc/r8SAWpDuhUnMVyM7/Q9bYf353K0vVTMcBNjGUloTiD7wZaBoU7
 Hiq5zen2nrrmHsnlbcOh2H2SSCIm60ps7Y9ZTOrd85ijqAdX2AnX4Dszs7jJbzVuCZK3
 3tpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AhAmFnOhivCLWQNmcu5zh+TK35CPBEArBmFuQg4srh8=;
 b=LPMsXsXuTI1euWveQ3q8agf7GUu77eG981XaRSW4+YX2sdKFdGCctdM29cWsuSRH7g
 Tybj3VyJLgSkk9wh7saTe2OtMx8qipacxWAxuWxM2emPvtKT9FPDdiYxWYwvkAbhWbwo
 YGQqwwS+1MMaAQ8/5DD1xvcSQovn2y8jDRllik1G2ZOWty1OH9/ueOHGRA4RN9W+aBel
 F/8RsVYqRK6FG+WvpPpb4BTIrha7kAOJVMfIpMBzAiHdEkEBNjHJj9EkKtUmdiu5w3yK
 ohIS/eblCQo0/NdVI7pb/PXp1op/4Eu0FY69m5WKyY5+cs9FF5Jrc+xQ+b2WZpvVgI5N
 8eJw==
X-Gm-Message-State: AOAM531+W/RLggUqGbssOs+kcUsxZGz1bszovY0S3D9RJZxVTME5TYE9
 fawWUQ1cHFKu2gLMJNmcvnsUba6pI6I=
X-Google-Smtp-Source: ABdhPJw9sS/NS6tVAOZD7ukjPQCKOL3A4JuJXXOCpBZytD+nZoUSWTjtxFrWWr7sdD/Ux1iWmiUypA==
X-Received: by 2002:a50:ee16:: with SMTP id g22mr23936112eds.235.1614003332936; 
 Mon, 22 Feb 2021 06:15:32 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b17sm10500470ejj.9.2021.02.22.06.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 06:15:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/8] hw/intc: Introduce SH_INTC Kconfig entry
Date: Mon, 22 Feb 2021 15:15:09 +0100
Message-Id: <20210222141514.2646278-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222141514.2646278-1-f4bug@amsat.org>
References: <20210222141514.2646278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to be able to use the 'SH4' config for architecture
specific features. Add more fine-grained selection by adding
a CONFIG_SH_INTC selector for the SH4 interrupt controller.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


