Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5404DBE7C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:35:33 +0100 (CET)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUinL-0007NQ-Ri
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:35:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiL4-0001Uo-HN
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:19 -0400
Received: from [2607:f8b0:4864:20::42d] (port=41896
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiL0-0002Iy-BC
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:15 -0400
Received: by mail-pf1-x42d.google.com with SMTP id p8so5885120pfh.8
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5de5JN0djpoCpESfODi2INQYJ/S5KNFn/Rt19ewlkfA=;
 b=SGOpv71IaKANlR+ST5w88ZsiGxfarPuTYBpEO79CszyARAtHQ+aznHE/icIoGGE3VL
 Iro4hZrMjQDOFTRCoTempDhujfBmUVWKXcPfNOE8JkP/TXxXEt3Z0g4rQwBGxW3uBkQF
 +E11P64cY78YRFZGKjR2F3HS1MwAgKwvrsIJhvAnkuRCCr5HYquZKpaLasDL11Ov/aIr
 oEeo2IbV+g7v1+qPtj/Dw3DxKxYSzWZaGLiAJ/D66zfXiMFdEkjuSu0M9ptOZXH/z+Ad
 fSISgtntkQBbIoVtEKILkzm99tegdiSp7LsaWNkPXqHzLo7+BdlRgb+h2tcfg9PNRqzk
 K7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5de5JN0djpoCpESfODi2INQYJ/S5KNFn/Rt19ewlkfA=;
 b=YUZT0yLCPXPj27WQM/2ybLDR9Fa35LWogNIgvigIryKaw69zKpUWrFcl9kiJcYWZii
 N63njljDsVuUiHPqJNX3a8riHzDY1Vtz1sUrpwmT5fGT6SqOXHdzaLSIQiIIu+QkTxxB
 VuwT6Urp0QZE30fxs7rHjI7Bv5nk/HFD6vHlh3xv8VNKUkH1Qfk7z53mcv0pwP5+Dmeq
 ljgw7yx/mEPee2jRI4rW72cOxrimkNeldcySPmzOwZi2HxtdLPrVCK4pC1RyM6X9uhxf
 7+6CF3HaaSsI5bYMLG5rKQXL0/WAhniANH0nPN8nZZ3aL0RsWlTaiPlyKJxjr0DMYUg8
 WOjQ==
X-Gm-Message-State: AOAM531oIXvsYrfjo3U9hKCHdWvpqhehm62dkwycJimKy+XC7rRkwb7/
 DwVn7H2dcNQeNVDvTEHd/W4yIMY15FKDUg==
X-Google-Smtp-Source: ABdhPJyPyTXXVGyF7AjoogIOHUe4ip97V++EYNT8eZ82aV+hX2X3v4MxiQLKA4EIZRdMu5I0s2ATrg==
X-Received: by 2002:a63:388:0:b0:37c:8577:c8f3 with SMTP id
 130-20020a630388000000b0037c8577c8f3mr2369102pgd.148.1647493573102; 
 Wed, 16 Mar 2022 22:06:13 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 34/51] target/nios2: Enable unaligned traps for
 system mode
Date: Wed, 16 Mar 2022 22:05:21 -0700
Message-Id: <20220317050538.924111-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unaligned traps are optional, but required with an mmu.
Turn them on always, because the fallback behaviour is not
documented (though presumably it discards low bits).

Enable alignment checks in the config file.
Unwind the guest pc properly from do_unaligned_access.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c             | 4 ++--
 configs/targets/nios2-softmmu.mak | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 460032adc0..bf40cff779 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -264,8 +264,8 @@ void nios2_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     CPUNios2State *env = &cpu->env;
 
     env->ctrl[CR_BADADDR] = addr;
-    env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE, EXCP_UNALIGN);
-    helper_raise_exception(env, EXCP_UNALIGN);
+    cs->exception_index = EXCP_UNALIGN;
+    cpu_loop_exit_restore(cs, retaddr);
 }
 
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
diff --git a/configs/targets/nios2-softmmu.mak b/configs/targets/nios2-softmmu.mak
index 9a372f0717..1e93b54cd1 100644
--- a/configs/targets/nios2-softmmu.mak
+++ b/configs/targets/nios2-softmmu.mak
@@ -1 +1,2 @@
 TARGET_ARCH=nios2
+TARGET_ALIGNED_ONLY=y
-- 
2.25.1


