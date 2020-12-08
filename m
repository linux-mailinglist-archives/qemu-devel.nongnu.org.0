Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCAC2D1F3F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:47:14 +0100 (CET)
Received: from localhost ([::1]:35878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmR9t-000109-7i
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:47:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0z-0004Gp-PO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:38:03 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:44752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR0x-0001Mb-0h
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:38:00 -0500
Received: by mail-ej1-x642.google.com with SMTP id m19so22126516ejj.11
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aukrehohMNBj/77mUsP++hcXafJAket0+6KWGIXO0nA=;
 b=cYJvu8QmCh1iAR1hLkECf/nTF0tRLRFQEqhfJt7gWh0LW/xSxjZT+0CXHzPvis2QXq
 Rse/iqCWAF2iRQQdSbiJNKGOqrquoZddI6tBLgjgaERU04mpjsN/q2JGWXR0TR/VFlrR
 U+W2PF7plWveFFlsBr+4d9ZiL8HfXisOAM/MrtDHETwuqDFWpiC5azSjnFBhbiNVAWZ7
 E/RBx0FjkgQGiVPZyNdW06WDkk3CK9EwQEOj+CZHLS4zKjtwV1UXjO74mwC4uhqKAYoA
 darwQKnaXi5KhFBbp0KnkNSWv/OuWdoCO7gjc5CEgyoGF1EKPlnQ8dSnKZ0FOWrGlf6A
 Limw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=aukrehohMNBj/77mUsP++hcXafJAket0+6KWGIXO0nA=;
 b=ItuYDGYGHufqv0C2QSCJkz2OWW+oUHbkaUwcy5tcGJYeMdqbjmYfTY2g7HMR3dI9+z
 Hr81CvOHiiS3+sIoKejHIqqVk57Ltb1obt1jpkZUgEJJ8Uun8pV+C0feKxzo0UJtiVMk
 yIhXQLragKP9fVRQXvVZ97F1m6aynTShq21uIY417pzTdOZU0mt2FGoxbV0HBtZJv0Yj
 sb4y/3Vw9J9hw2Gso8tvqmCMnw61Hl6JBchDcC39xyqe2inUrgkLUe1YC10jGcVsqHmF
 0/O1uvPmzw+XGma5Mt6Zspdv5mQyO69n59gvZsTwwip9n53be2StO3MpZYIFtjFXPggG
 xHMQ==
X-Gm-Message-State: AOAM5337kgw9yTPAEdihtFqDoXhlN14bPwYfKBWsP9CLx0xhDrgSwfn+
 uiVXG1J78+Ld6ndRU7b3SqcXhvr+bRY=
X-Google-Smtp-Source: ABdhPJybqp2BNzaBlaHOIYhqOJWkb3UKa2oTa2o8LX+GbDac5ltWhOZMecS3sI/+6stAs6U7VoBYtQ==
X-Received: by 2002:a17:906:38c8:: with SMTP id
 r8mr21677157ejd.39.1607387877543; 
 Mon, 07 Dec 2020 16:37:57 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 35sm13972994ede.0.2020.12.07.16.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:37:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/17] target/mips: Rename msa_helper.c as mod-msa_helper.c
Date: Tue,  8 Dec 2020 01:36:55 +0100
Message-Id: <20201208003702.4088927-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x642.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MSA means 'MIPS SIMD Architecture' and is defined as a Module by
MIPS.
To keep the directory sorted, we use the 'mod' prefix for MIPS
modules. Rename msa_helper.c as mod-msa_helper.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201123204448.3260804-4-f4bug@amsat.org>
---
 target/mips/{msa_helper.c => mod-msa_helper.c} | 0
 target/mips/meson.build                        | 3 ++-
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename target/mips/{msa_helper.c => mod-msa_helper.c} (100%)

diff --git a/target/mips/msa_helper.c b/target/mips/mod-msa_helper.c
similarity index 100%
rename from target/mips/msa_helper.c
rename to target/mips/mod-msa_helper.c
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 681a5524c0e..35dbbbf6519 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -6,8 +6,9 @@
   'gdbstub.c',
   'helper.c',
   'lmmi_helper.c',
-  'msa_helper.c',
   'op_helper.c',
+  'mod-msa_helper.c',
+
   'translate.c',
 ))
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
-- 
2.26.2


