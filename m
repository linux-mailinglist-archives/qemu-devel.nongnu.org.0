Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D13B412E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:11:33 +0200 (CEST)
Received: from localhost ([::1]:46294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwio8-0002eK-K9
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4R-0005Pi-2T
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:19 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4P-0001yy-J2
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:18 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a13so9799846wrf.10
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SeSEcRIPGoSv9nIgUL5/majnlvtkMwRXIAnFMpntYY8=;
 b=i8AcMrjs9iY3jRdNo1ntGr+neGC6pImAv1mHuAEwvSPIAB8lwQGEqQKTL0ewidYBzQ
 DTGRUJdSwUjmK8VSt4fYaVCbAGLqAHZ9QDj9PPiCEHsEKUCKbXo5yM1Fa1C1HxJtkae8
 QoLoUMNR+O2Ex9EF/x7zJ/S8wO+X+JuJB6M95swke9EpjtyvyUjTnrR3XGZO8bzYzxio
 ACodGH9//kXb2Z1YlM3MOCGYg+eBeOkwwsryFsecpmNNGLeXiVg0ZGq0wGvRxK41HR18
 CquCoegMQQ8xHoCcNVPMo7Yev15wHgGktR34zDl1vjT3XUT0IUyXX/Bwu3keH/WRFfLk
 ZH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SeSEcRIPGoSv9nIgUL5/majnlvtkMwRXIAnFMpntYY8=;
 b=Ryx5vxT3U92ILiS0rBGNp0mOWUlTO0RDCuU8r8Fqx2/sfLR/LLPzXVm03XnsOmdoGD
 WMAuRnA1s2DiPpPLcoaYn/A39DePfgPf0ZrCggGXVB6AXvOYums3RR9TwSUU2Pdxy0ET
 kSne/pmMGaSvRMYQWUU74s/Ztsc6FOlJxv9CGbM8E49OZnRFzOsorm88fI/DQrd494cC
 UZ6BLSS1Hq5MEWVa/SUtxjU9pT6IqJJ/kj30v/jct3vuYf3/wSJfj5I0i4JD/m+aXhwa
 cr9cXhtn9BJaLRlaMAGS5JMAoWGKbkz4j+kyUpqEPwRh1HPGuZXLbPhnA28xvhHN28xV
 H/Kw==
X-Gm-Message-State: AOAM531ZkhwPsCHBnwgKwYlIrm/VD4g9s0VEAbn7ZvSUasSktQft7WJB
 fo/b8vDMhThD5k5MModAsINR5o92RJvLDw==
X-Google-Smtp-Source: ABdhPJwBaGwUmxT8qSbfLwxIZbqU66wGQMpcYCWYXwXIYjn4bijRuffh4i2fK188CFzhutnFTOyWhg==
X-Received: by 2002:a5d:648a:: with SMTP id o10mr8392212wri.304.1624613056125; 
 Fri, 25 Jun 2021 02:24:16 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g17sm6734642wrh.72.2021.06.25.02.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:24:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] target/mips: Remove SmartMIPS / MDMX unuseful comments
Date: Fri, 25 Jun 2021 11:23:23 +0200
Message-Id: <20210625092329.1529100-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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

These placeholder comments for SmartMIPS and MDMX extensions have
been added commit 3c824109da0 ("target-mips: microMIPS ASE support").
More than 11 years later it is safe to assume there won't be added
soon, so remove these unuseful comments.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174323.2900831-7-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 0a4257db2a9..8b251183209 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -21578,14 +21578,6 @@ static int decode_nanomips_opc(CPUMIPSState *env, DisasContext *ctx)
 }
 
 
-/* SmartMIPS extension to MIPS32 */
-
-#if defined(TARGET_MIPS64)
-
-/* MDMX extension to MIPS64 */
-
-#endif
-
 /* MIPSDSP functions. */
 static void gen_mipsdsp_ld(DisasContext *ctx, uint32_t opc,
                            int rd, int base, int offset)
-- 
2.31.1


