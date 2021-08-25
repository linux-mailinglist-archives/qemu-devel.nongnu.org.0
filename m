Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 838753F75CD
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:21:10 +0200 (CEST)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsq5-00043A-Gj
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYv-0000Jt-Nt
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:25 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYq-0002YR-Eo
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso4520488wmi.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7K4agRCBaycik3Kl53uHvRTckq1KBjkJxVACY1s8PEc=;
 b=IboX7k+qJsZB+NrThlzjpON6eM2UR/hSngZ0BNiV8sce0If9Gnif03rQEiebE4BgBa
 gmdETwYXLKD5UQ0mQnuELgnmaOHzwkXd2dwecf3F9q02Ioh1INbeGvn1Wl4MQFXn5wnf
 AAChC6jDQcpgArmrAg7xp/2MwJSyNanA8GY7Lmpp5PF0Y3OlefjXMrilSkTgJJJ8PwNg
 IzZ3TB4PaJXLbOW452jvPE/BbhJiSAlNP+wZA3ouJnmvlPOc5Nf8Y7kkVcDNXPfSPNgn
 R7LISy3+fvleVBiQHmpiphgu80ZRtVENYwO8Tjclc8qX9IBrWE4gOm3C2gOCxDMekFTc
 ldMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7K4agRCBaycik3Kl53uHvRTckq1KBjkJxVACY1s8PEc=;
 b=abeA1ZsovZOxwHeKvAEUPx/wYrwar3XU9FFjOWtVOPxn0XWgqFbp9iujAeQ+W22AOX
 yifYVHi/gCBA9Ye5nmULRQ4RW/c7kCp8CLdyQx87j2vrR69F5CjWE021I2nFg/3VU+fT
 1ksE54MkgIQr8r0gVXUjmWnZiDRt5A+frgWaGtY5x9/v+BtjLqVqqHE6UtDg/77G/FXk
 EgqnZXrdpgOokADDr2SA7G4MVYKb4rjfzda4PQkfI0WhkC1/fZqTDNvZXFts+tBdBcKX
 k+zgBORBQ22n/m54kPRKUcm4ZHEwRdH7Bao3b0s+v9t/wyjflvTec//k6ajuhT9T6Ey8
 dOnA==
X-Gm-Message-State: AOAM531BCGj0FrVM6ACkJt25ALSk+U/z5b9QgfpH1/VMmKtt6wf6GcjP
 /wYOJncAwD07YLxFoVlbTAysnNxICBU=
X-Google-Smtp-Source: ABdhPJz8+MFHLaOQkG51xP/TdF58MFnicoG7i83zJBJR6ELORKwcYeg6FYt+qwoXE4GXJZBMlXs8bQ==
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr9262374wmg.162.1629896598843; 
 Wed, 25 Aug 2021 06:03:18 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 p11sm1892558wma.16.2021.08.25.06.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/28] target/mips: Allow Loongson 3A1000 to use up to 48-bit
 VAddr
Date: Wed, 25 Aug 2021 15:01:57 +0200
Message-Id: <20210825130211.1542338-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the manual '龙芯 GS264 处理器核用户手册' v1.0, chapter
1.1.5 SEGBITS: the 3A1000 (based on GS464 core) implements
48 virtual address bits in each 64-bit segment, not 40.

Fixes: af868995e1b ("target/mips: Add Loongson-3 CPU definition")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
Message-Id: <20210813110149.1432692-3-f4bug@amsat.org>
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


