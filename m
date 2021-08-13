Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF203EB45A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 13:03:36 +0200 (CEST)
Received: from localhost ([::1]:36806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEUyO-00043d-1c
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 07:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEUwv-00020w-AX
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:02:05 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mEUwt-0003kd-LJ
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:02:05 -0400
Received: by mail-wr1-x434.google.com with SMTP id x12so12699054wrr.11
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z7eTTlwvjT4nSxT+Z2GTSgfhJeBSLa1KGLED6tW8Fvw=;
 b=J+nXGzV6d/rT5U0LqUzByO+o9UrbjfYKCYJBtkIKdm4JsPdTGmwRRNtwkCKVFtRe1l
 po3OLnXXboVDOouCyiiAMPiZPSpdbtJRYrqbQMWMKhK1Iuu4qWWqh0GUxogngFL1xaHp
 iaXUJskkk2hTb7+dyVVKDr82pm8h5t0vsHXvRvp9/yA6v3WNPSP5K9yo5VIhJqI+MFSw
 8j9LzLZ/2bJtaissbLU97fiQfQ5mmj7aUyucPMdwY1C36y1I+nZFWjPl4rhZte02hWqp
 7lYOcFoQkSVGt4yC/Jp1Cjv0nP8OzUnJhG20UXb8gw3IkEznPPgpjha/BW3F2cv9Yaz5
 CfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Z7eTTlwvjT4nSxT+Z2GTSgfhJeBSLa1KGLED6tW8Fvw=;
 b=GrT9VeqHKJoXWNZzEFkKkJNPWYBcWT87QqPK2/s85QI5nsz9aPqyMGox5yoKmUPTfk
 HTUequisC5SlqlcGTLee8wjiAcj4D8X2M3KDGpcKA1ROI8vAxiJmfigl29H7sgd43J2w
 lFUiSqvhbw9Y2dERA+XKd/7T0QR4XpANYiEHvvSbEUz/CXBh8T7nfVcqaNTipU9nB8OW
 lNdyFn4vWYs8vj5OXcejJ6EGu/+uFN8q5BXR+D1ghm3dEjPnEDrq89KyamnJFe51wZFN
 Fa+ALlw+1nwNypQBUl6DScaq2iX9vfuMqr31az9h0FqygLYyafns20MyAfOw39l5MBpM
 U+Zg==
X-Gm-Message-State: AOAM530Kc6zUkdI7f4TELLzrGs6TzrrkkK5RyI6QCk/75BiZbb6HJIVJ
 0e4Ddd72KvKx+dpJcUM1VkSVV133hRE=
X-Google-Smtp-Source: ABdhPJzQi3vImTkIK7VVX/QhxuDjPX+gq0ItC3TljIdQ/UKpRilY69KYBtyulfm2Er0A0hf9HSxQ2g==
X-Received: by 2002:a05:6000:1b02:: with SMTP id
 f2mr2383763wrz.274.1628852521365; 
 Fri, 13 Aug 2021 04:02:01 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 h9sm1042122wmb.35.2021.08.13.04.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 04:02:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/mips: Allow Loongson 3A1000 to use up to 48-bit
 VAddr
Date: Fri, 13 Aug 2021 13:01:49 +0200
Message-Id: <20210813110149.1432692-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813110149.1432692-1-f4bug@amsat.org>
References: <20210813110149.1432692-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the manual '龙芯 GS264 处理器核用户手册' v1.0, chapter
1.1.5 SEGBITS: the 3A1000 (based on GS464 core) implements
48 virtual address bits in each 64-bit segment, not 40.

Fixes: af868995e1b ("target/mips: Add Loongson-3 CPU definition")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cpu-defs.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index c6ab3af190e..cbc45fcb0e8 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -828,7 +828,7 @@ const mips_def_t mips_defs[] =
                     (0x1 << FCR0_D) | (0x1 << FCR0_S),
         .CP1_fcr31 = 0,
         .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
-        .SEGBITS = 42,
+        .SEGBITS = 48,
         .PABITS = 48,
         .insn_flags = CPU_MIPS64R2 | INSN_LOONGSON3A |
                       ASE_LMMI | ASE_LEXT,
-- 
2.31.1


