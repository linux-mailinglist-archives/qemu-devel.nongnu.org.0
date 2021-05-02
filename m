Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4AE370E03
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:41:24 +0200 (CEST)
Received: from localhost ([::1]:47822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldF9n-0004XW-5n
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnv-0007d3-6i
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:47 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnt-0008Ad-Fk
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b11-20020a7bc24b0000b0290148da0694ffso1934532wmj.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y5rUAff0XwGga948kJnZP8LhVBDdCm+qDgTkGYYKq9k=;
 b=VxfEiX/VdyWIyItBTwT0TvGXJ7iBuBjf3nTN+BB1mvg2upyGYRpquAQPviEBVZGrzZ
 Q9AS1Zc0nnp/+Xu1x6sEVw5BQzn4rORuLmHcR7fRKxY71qeDO7XG/72qbL7lGAzU7P/X
 tJt2d6Fr+BOtpZ55jCiMhDZ3STaMz+x/0weFb3xmfkIAtgh7h4TyrHY4YEt35T9dXDoX
 vR0Pz5AdzrHTAht/1LHhlXQ1x/zoYmOYPtpGaNua6V5aTXp/LDfbCWq3sHdBq9Kyeqjj
 aFURrqNW1uInpTsrws6mOh8fOfhSZLHeEY46rOj5g/1bpjwgnS2pRZ3jcDyKMu3MiWFT
 snDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y5rUAff0XwGga948kJnZP8LhVBDdCm+qDgTkGYYKq9k=;
 b=nf6fQG/WaZ3WbR+fyPaKofzd6MA5HKk6fzx/RPDaMvcOmz0xo1ERrKWG+JsoQgLpCe
 RV63WQxoLQDnNofZUOrXdpLpzvmzUmVLrLjcS/53DBfZG9iL0m49uxwnAayws5hN99hL
 GPmW0mUDApl+CgdCOQkpj4MG9vmmhHnrKbLkWofbsZnQkKvc3NllURHZFA5BFmVCimyN
 Mb2b1tdTWhyORoa/TsughZK7ukQ24G1NENB65pH+1quEcXp8n+nvpRxeTCBKloq6/cf+
 4voH4LX+noDViEYLxvPW+OclUzDydl3eqKNG4Us0Z1abbID5V0d73IeD4Cx/1psjFEOk
 dEwg==
X-Gm-Message-State: AOAM532clXJasVbhI4kqSUk87ZuRgCcpJTLlCU6JbXsFJAgztPKT3yIW
 AhQMSs2vtdAEDw5J2sJYX4u2CvYT4Jy+aKsr
X-Google-Smtp-Source: ABdhPJzHr+8TGy+/iFNctq6REYAIx3fBXLJWhNfOVcDMuptZYEAm4zEN+hd3mrKHaAmeZ0V4+06DOQ==
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr17381427wml.118.1619972323998; 
 Sun, 02 May 2021 09:18:43 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id e10sm9391752wrw.20.2021.05.02.09.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:18:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 35/36] hw/mips: Restrict non-virtualized machines to TCG
Date: Sun,  2 May 2021 18:15:37 +0200
Message-Id: <20210502161538.534038-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the malta and loongson3-virt machines support KVM.

Restrict the other machines to TCG:

 - mipssim
 - magnum
 - pica61
 - fuloong2e
 - boston

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210428170410.479308-30-f4bug@amsat.org>
---
 hw/mips/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 1195716dc73..dd0101ad4d8 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,12 +1,15 @@
 mips_ss = ss.source_set()
 mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
-mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
-mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
-mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
-mips_ss.add(when: 'CONFIG_MIPS_BOSTON', if_true: [files('boston.c'), fdt])
 mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
 
+if 'CONFIG_TCG' in config_all
+mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
+mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
+mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
+mips_ss.add(when: 'CONFIG_MIPS_BOSTON', if_true: [files('boston.c'), fdt])
+endif
+
 hw_arch += {'mips': mips_ss}
-- 
2.26.3


