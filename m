Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3C5612D8B
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGst-0005fD-TW; Sun, 30 Oct 2022 18:34:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrR-0002PT-BW
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGrP-000093-Mi
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:32:57 -0400
Received: by mail-wr1-x42a.google.com with SMTP id cl5so2020290wrb.9
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAh3ZgWCQqxTmF/7LDpHBvUI6ozlW0DAI0FCTxY1dVk=;
 b=QkEO/fQW2w82G/qdL3BIMBaa+PqmDE75WccYQIiAL6M9AvGmv9xQ2gI1CjC5v7sOUC
 UJASeCtFPscP4TcWzBnsDFBW41fkcjxFCfkghqOGuyzp1pVA2OCXTAUzO6lCnOYPu46f
 +0+NOUdeVw2zCh16eXT3A256s8oZDN1CgIXESoDPxlpnV3iy+I2PZRDSndrPyekzLXfS
 bpEqeT1VJqOrDimE2IG8qOWDfJZTMeNxcUVKwL5wTLIy8GtXvRbn0GbN1c8G13fkmWqA
 W0P3v4ZG1zWSLW9FuE7fOY4OH2YTQdqNIZgOHlzgoNilHChpAyf1INFzRy+uJZRil7pE
 SweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAh3ZgWCQqxTmF/7LDpHBvUI6ozlW0DAI0FCTxY1dVk=;
 b=b3G+oYus85bE2HyFiEtzYw+40ZrMJd9tcIbPqDAyiXJ5wEtx+U4RqEcNT7Oq0WxQec
 RArjUOMSZkO14qE+yVmCBARO2pJYKpXkHieZI4ErT69rSNUhp3NrSd9YdgpN8EjOs19Z
 bASprC+bH2l1SOywqDTDxpvbFIi263QI4jmLNti+7UqZyjb2G3sXPVrx/tn/mXGFMwOe
 sil43LbvBCH/rNwW5z2zq5KSh+/0ylvZJobno6PL7E6Hwj0PrkSq9y4QydzzLM+0MGai
 /LHz1IUMpLu516b6NauW551IQafJ/iWiH72FuvqpBy5b6xlBxTfE/Pnrcao7EbZ8bfzf
 tjmQ==
X-Gm-Message-State: ACrzQf0cDmAEWkBNEBly038UjvbhgPgR/NS1HP7O0QZ7VNzOnoTNYVZc
 KFJ/u+8RsqwcXF3EdL3QsjdApIIJaDHbGA==
X-Google-Smtp-Source: AMsMyM5EH0WeZwCxpPKIlspaj8DPK8p6RMxgFTORk8AL/DZ4/swecvM4/4I4gxcmfaJC95aR7yv3Jg==
X-Received: by 2002:adf:b612:0:b0:236:5d1f:143a with SMTP id
 f18-20020adfb612000000b002365d1f143amr5873790wre.364.1667169173765; 
 Sun, 30 Oct 2022 15:32:53 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a5d620a000000b0023657e1b97esm5271966wru.11.2022.10.30.15.32.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:32:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 38/55] disas/nanomips: Rename nanomips.cpp to nanomips.c
Date: Sun, 30 Oct 2022 23:28:24 +0100
Message-Id: <20221030222841.42377-39-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

Now that everything has been converted to C code the nanomips.cpp file
has been renamed. Therefore, meson.build file is also changed.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-25-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/meson.build                  | 2 +-
 disas/{nanomips.cpp => nanomips.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename disas/{nanomips.cpp => nanomips.c} (100%)

diff --git a/disas/meson.build b/disas/meson.build
index ba22f7cbcd..1977f5cd92 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -5,7 +5,7 @@ common_ss.add(when: 'CONFIG_HPPA_DIS', if_true: files('hppa.c'))
 common_ss.add(when: 'CONFIG_M68K_DIS', if_true: files('m68k.c'))
 common_ss.add(when: 'CONFIG_MICROBLAZE_DIS', if_true: files('microblaze.c'))
 common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c'))
-common_ss.add(when: 'CONFIG_NANOMIPS_DIS', if_true: files('nanomips.cpp'))
+common_ss.add(when: 'CONFIG_NANOMIPS_DIS', if_true: files('nanomips.c'))
 common_ss.add(when: 'CONFIG_NIOS2_DIS', if_true: files('nios2.c'))
 common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files('riscv.c'))
 common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
diff --git a/disas/nanomips.cpp b/disas/nanomips.c
similarity index 100%
rename from disas/nanomips.cpp
rename to disas/nanomips.c
-- 
2.37.3


