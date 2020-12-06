Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740F82D082E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:47:42 +0100 (CET)
Received: from localhost ([::1]:53262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3kj-00032v-Dj
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3eN-00066R-Os
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:07 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:40615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3eC-0007tS-Ai
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:41:07 -0500
Received: by mail-wm1-x341.google.com with SMTP id a3so12053588wmb.5
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dkeHRiNqYRfILITll5iC1CRHmgrIelrL5ahd1h8p/CA=;
 b=AJCAf6tBfcDaLHenkAJcWO8awSPcD6OV0VbmqjcQG8YLcoPHOBX9/zrsfUtNVfpmcP
 nIiZKqXotBUNxCRuPgt5jlY9J+OmF0W/JRNLxzmga4dPH9o6OjFFAvwGFFet9aapdvQj
 4OhagE7WsNKL70LrawKpoX3U5So49v1TraNAHhsokMcGAZgM1ZCnqC4yyvRqs39x/TbY
 N5UMqqtUfCM3amuvAeTqwaJ44Yc09OO6rP8Wd5M1gDiZNFIutZ8C6OLPOykS5/ywo3T2
 xNxVSkbiwCbPmm1cwlK6ZEIrga3rfqeagoYvTmpGjkqsuoRdZxKM29h+CQlW5mkWJQ4y
 EGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dkeHRiNqYRfILITll5iC1CRHmgrIelrL5ahd1h8p/CA=;
 b=J3Chr6FeF01RtjCPTexAXbbl4Shgf7pchpfFVzgxN1KOGkUBo20SXZ5qvpdtDuLr79
 8QNXbRpsht+1v94oX/E+AJAafzewPBTBTHUTrRZDQujiOSLA5G5pQWtxlLci5PKHuEbd
 5sgfsqGpGpssMS1K9gNb9jCDeVKUs3pSOKEAfGjGUNcvjcxkJKuLaiGvJ1N2DjFpYhJ1
 HOX+bbvEHlZ0vQk3gBF6TVFmPK7gU1+soBzypBytjyH9RqsD7rcQdBcdyu9zXNuW8gtZ
 MM4eZ8JYzVb/s8WCDBLn5oMVe6mcUW2X/ySHtZpydAlaNlwvvWV0SvRgesOyjuIPPEPU
 Tfmg==
X-Gm-Message-State: AOAM532YH4I9PUgVSuabb+hWCEGmEcoys7mGCPXBSUt0RWz3nb8M5HJt
 i19rkJgDkQxbYJ1D/KohBB0Q0eJHT1M=
X-Google-Smtp-Source: ABdhPJz3cUW+H59OJ3Lwu1sxBPsBIrKMW2o+PML6fhNgBmnIF9weKVx8bfaabn+wJQrAekiecwHQeg==
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr15652630wmi.146.1607298052994; 
 Sun, 06 Dec 2020 15:40:52 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a9sm12901278wrp.21.2020.12.06.15.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:40:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/19] target/mips: Rename helper.c as tlb_helper.c
Date: Mon,  7 Dec 2020 00:39:42 +0100
Message-Id: <20201206233949.3783184-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This file contains functions related to TLB management,
rename it as 'tlb_helper.c'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Maybe I missed some functions not TLB specific...
---
 target/mips/{helper.c => tlb_helper.c} | 2 +-
 target/mips/meson.build                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename target/mips/{helper.c => tlb_helper.c} (99%)

diff --git a/target/mips/helper.c b/target/mips/tlb_helper.c
similarity index 99%
rename from target/mips/helper.c
rename to target/mips/tlb_helper.c
index 5db7e80e22b..7022be13ae4 100644
--- a/target/mips/helper.c
+++ b/target/mips/tlb_helper.c
@@ -1,5 +1,5 @@
 /*
- *  MIPS emulation helpers for qemu.
+ * MIPS TLB (Translation lookaside buffer) helpers.
  *
  *  Copyright (c) 2004-2005 Jocelyn Mayer
  *
diff --git a/target/mips/meson.build b/target/mips/meson.build
index 4858bf86ad6..c685f03fb28 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -6,10 +6,10 @@
   'dsp_helper.c',
   'fpu_helper.c',
   'gdbstub.c',
-  'helper.c',
   'lmmi_helper.c',
   'msa_helper.c',
   'op_helper.c',
+  'tlb_helper.c',
   'translate.c',
 ))
 mips_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
-- 
2.26.2


