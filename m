Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D0320D63
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:08:46 +0100 (CET)
Received: from localhost ([::1]:60462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDv25-0008QV-Kg
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwk-0003sY-Lp; Sun, 21 Feb 2021 15:03:14 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwh-000801-6X; Sun, 21 Feb 2021 15:03:13 -0500
Received: by mail-wm1-x329.google.com with SMTP id o82so11663217wme.1;
 Sun, 21 Feb 2021 12:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OIyWkXIHvI4kNUqxYnAR61a/CdM/+9iu9ZaZAZRb9T8=;
 b=tsPoBIl5w4G0KXze/RMiERgDPDjTeMj2qZTo1VDmRGrxQPPD1mQ444vcqVOhkggAFV
 PBd6agyQxNY0tXhjdmB/SbWX0yNRHZWpUdFJEHLfWHrNJGozb6AqJ9MwiCztI/1jahCA
 xyEyWHn8Jjr1YjAmCOWBXRNhRkkd3afjmQ/sEav9swtaJauXZQwxQBjTkPA7Pe7ZZIV8
 onLfuXXwnbjveBlHNYogudfwip/w9B4/eFeawB5IVMOKUDDyBWoYMqHs+Ov+29cPgfWG
 NavFNeHKVCiyD+tbwt5VSusEbSggdVUpSzGbog9g02cc5V2HWB963knZcXnUVoW6COea
 mezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OIyWkXIHvI4kNUqxYnAR61a/CdM/+9iu9ZaZAZRb9T8=;
 b=me4M8Qw2amxjKNrLmYy9O8yV1aUjWGq1AFC/Tynm0RtcystcDjOqEkjdQyKlSsjgl9
 sQLWUl37ARFlvO3aLR0C1RyUKUitso6N2oCNWCYzEOP2NxbGlmv9t6gclOh++VaZkE1K
 uLfz/5h4Iya6teD2gUC8BdtLIit9WaCPAWLi3dJa6RuUU8l6LzhbWl7EdHi3XV7khOrC
 RVgK2XNQ4Oc8OG9VbhTUIiLMbGPILPNOSsnVprgmP9MSzy1QJmgjMWgpgEvGxvGO9Lh8
 gzs++YfZVJIV2v/er2xkiTei0FyrBHFFiDA98gpIUPSNTKjqRODpbxx+fNCGdSKXzdig
 SPBA==
X-Gm-Message-State: AOAM531lUwcWImp+IM3Ei1afZ8BAilyNj/7v2Oft4VFLnG04dJLjURF4
 +A1u3bKb3XzDDC43uyPU+wqPnpTBU0I=
X-Google-Smtp-Source: ABdhPJy09m+hcc4cBmilGpcZ5SSeMSp4i5gJWFEqtuicCCWegfxyuRi8s8FON5+4Qs09+XrlmppFgw==
X-Received: by 2002:a7b:cc0c:: with SMTP id f12mr17508289wmh.111.1613937789245; 
 Sun, 21 Feb 2021 12:03:09 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e1sm26013513wrd.44.2021.02.21.12.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 12:03:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] hw/intc: Introduce SH_INTC Kconfig entry
Date: Sun, 21 Feb 2021 21:02:44 +0100
Message-Id: <20210221200249.2536247-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221200249.2536247-1-f4bug@amsat.org>
References: <20210221200249.2536247-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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


