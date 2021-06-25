Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C173B413D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:12:59 +0200 (CEST)
Received: from localhost ([::1]:48444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwipW-00045o-Vq
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4W-0005is-6m
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:24 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4U-00022N-Lu
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:23 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so7387512wms.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EUNHNUxYdr2ImjOQsqKJN23H1ATXEvXXcSq4igsm0wc=;
 b=I6uV1D5LQEBA+m+Iq0GUAZExfWcoOa2DIxvZHj19WlOxZSTBltHKHbTyuIMTWy1Mnm
 IMX72FTAXGIMHJS9tM7jd5I6Vj09Ew+JlvhxmlVN2yG0ONIlC0I4tnnn6icm/q6sGxNd
 Lg56hDLghoTvRE2lqp0vrdbTu5QB85tYdRJhCIkQp6qkEbKIYQiDtTHg4zaaZZV3i3Dd
 3A1JhSg11ZOg656u+8nLjUSE/HbInY5u34/fphN58yEcBKEFTSvwtyh+MmD/oenHQj6Y
 +wNqW+n/HYmatGBHxVFM0kQh7qNAnA+upn0hHY5je3VcKax2FxG+XgvcnH94eruiryDM
 ONgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EUNHNUxYdr2ImjOQsqKJN23H1ATXEvXXcSq4igsm0wc=;
 b=NoA+ZsYYLAcub+zEhYdYWAgPaWClFCFZOo//OVaHpXNeMhU1lK73uSEn84WLmtNvVt
 CuNiP3giF/5ITV6BOLrQdkIRB72YvgNXaJDyKVjHe1tJebXFnr7Jy40aaM33/JoNiac9
 ZxH4x5tAbeG66qdJfwp1c9K0nxvlLpFhZ8cT+Ewyir7HvoLbmmpHx4Sje/v8fS7GQhF/
 mSN7aYY8mAURVDf8J3djXW7+5YZaZdFfEa2uUYzGiy38+ma44k0faNXcxssHQCV1NKhv
 B7UTxvOZkjVF4ZJ3+Tr5ULRFS0kh4UArHDDzbm+2nSHMuqvC2woFeCIkLzp5jKsgqmAg
 lMrg==
X-Gm-Message-State: AOAM530BSYm3zBkd6OQSmo9qw0a8fgUt/rFLw6N6FGn6OB0+Ce01Vhjl
 ANTbmTaKVjGnFj3cV+7w4X7/jdL/wzKyZQ==
X-Google-Smtp-Source: ABdhPJwKuXKOWo9eJ2Xbv6hIQO2PPcofq2IXntvClXf/2F5vGWZQg9CJHLr5I3l5twgXHv8Sylf+9Q==
X-Received: by 2002:a7b:c0d6:: with SMTP id s22mr9428610wmh.52.1624613060941; 
 Fri, 25 Jun 2021 02:24:20 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w2sm5584777wrp.14.2021.06.25.02.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:24:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/15] target/mips: Remove microMIPS BPOSGE32 / BPOSGE64
 unuseful cases
Date: Fri, 25 Jun 2021 11:23:24 +0200
Message-Id: <20210625092329.1529100-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These switch cases for the microMIPS BPOSGE32 / BPOSGE64 opcodes have
been added commit 3c824109da0 ("target-mips: microMIPS ASE support").
More than 11 years later it is safe to assume there won't be added
soon. The cases fall back to the default which generates a RESERVED
INSTRUCTION, so it is safe to remove them.
Functionally speaking, the patch is a no-op.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174323.2900831-8-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 8b251183209..1ff0b098bca 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -14076,8 +14076,6 @@ enum {
     BGEZALS = 0x13,
     BC2F = 0x14,
     BC2T = 0x15,
-    BPOSGE64 = 0x1a,
-    BPOSGE32 = 0x1b,
     /* These overlap and are distinguished by bit16 of the instruction */
     BC1F = 0x1c,
     BC1T = 0x1d,
@@ -16121,10 +16119,6 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
                 generate_exception_err(ctx, EXCP_CpU, 1);
             }
             break;
-        case BPOSGE64:
-        case BPOSGE32:
-            /* MIPS DSP: not implemented */
-            /* Fall through */
         default:
             MIPS_INVAL("pool32i");
             gen_reserved_instruction(ctx);
-- 
2.31.1


