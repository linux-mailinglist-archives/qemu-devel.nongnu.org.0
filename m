Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166B22EE8B4
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:30:34 +0100 (CET)
Received: from localhost ([::1]:41300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdnd-0000Dz-36
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:30:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdhN-0007kK-08
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:05 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdhI-0004w4-AM
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:24:04 -0500
Received: by mail-wr1-x436.google.com with SMTP id 91so7125175wrj.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R9iTS/+Q/OL/iW6QRfMv5vZReuHwVb5bW5AGpFsloxk=;
 b=tUcaEvYkwN32GC9JZSJWC6BFGCBWEbk26/SDV94fflESJutVaCrHRc8zOkayk84Gkc
 NimTDEzVoNIXnJxTUs8OQjSVlWyMA0KJGs1Ngg11NasyZ8u8l7EWDPnoRb2saxPkWaY6
 oTy4DHY6w/IhMcv0UCz6l6GNFiMOdq+cu1cWql//dqzOR/yHVKqKdEJGfFQyAc9JAuYs
 vortXdPZv6+DzeeOEAASZrRyhixj4hFujFtpMDGJ0FBakRkUZTYkKimVcwGyVsZLxrSY
 NIuKLIm5llCHUk3ZDbcpfdEqX559I1zY1nawJe81k0ogfCPEUCeb8BdmgWDH57oVPPTv
 iARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R9iTS/+Q/OL/iW6QRfMv5vZReuHwVb5bW5AGpFsloxk=;
 b=RhqnL3vZL5etFuDwGX6B9vyQU6X9EJDcOHfrgm0OjlauEpnl2KXhQMlZjdhzxftSC5
 iXjc3Q/iteeVQjYBEtS5QA9Kz9ut33U1//2MiPfK0+NR152Sbwa804lc+C9llxsdVlJc
 5OVac09e9x0NudANz9KuNzSe/vOaJ6ekfFjcPxOgpu6wAmBIeTcn9GRZzTOqrE0jlwma
 mkYIQ43Rh45yjrO1HklNiGz02MvJ480A/M5xr4N6BvW/qVBIAtwSkGGiNk+V/53L0juR
 zZBojc86EvlvWURrfWhm7YlKR4TM/V8cGPxU23jUXesKPn/n8zsae9ZMZ5vC8FB2XU+0
 DIBQ==
X-Gm-Message-State: AOAM533BzL9Ar+4lf14jvZ7uU8pt848HXEBoM3JH1DLB/924CTe8z4I6
 RB6bGFRxwkYtoiMK9Eg8RlvOI85t6AQ=
X-Google-Smtp-Source: ABdhPJy0sO863+4qLz2HdBGbQrXuLugI5GKgLWVCcPwhAv9Pa6qnXGqqntjW9U6RUL8K1L83XVKcEw==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr657799wrw.249.1610058238789; 
 Thu, 07 Jan 2021 14:23:58 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id c16sm10724308wrx.51.2021.01.07.14.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:23:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/66] target/mips/mips-defs: Use ISA_MIPS32R5 definition to
 check Release 5
Date: Thu,  7 Jan 2021 23:21:59 +0100
Message-Id: <20210107222253.20382-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the single ISA_MIPS32R5 definition to check if the Release 5
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R5 in few commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210104221154.3127610-10-f4bug@amsat.org>
---
 target/mips/mips-defs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index ccdde0b4a43..b71127ddd7c 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -20,7 +20,6 @@
 #define ISA_MIPS32R2      0x0000000000000040ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
-#define ISA_MIPS64R5      0x0000000000001000ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
 #define ISA_MIPS64R6      0x0000000000004000ULL
 #define ISA_NANOMIPS32    0x0000000000008000ULL
@@ -84,7 +83,7 @@
 
 /* MIPS Technologies "Release 5" */
 #define CPU_MIPS32R5    (CPU_MIPS32R3 | ISA_MIPS32R5)
-#define CPU_MIPS64R5    (CPU_MIPS64R3 | CPU_MIPS32R5 | ISA_MIPS64R5)
+#define CPU_MIPS64R5    (CPU_MIPS64R3 | CPU_MIPS32R5)
 
 /* MIPS Technologies "Release 6" */
 #define CPU_MIPS32R6    (CPU_MIPS32R5 | ISA_MIPS32R6)
-- 
2.26.2


