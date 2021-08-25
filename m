Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698403F759B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:08:18 +0200 (CEST)
Received: from localhost ([::1]:56350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsdd-0002fa-EJ
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsY3-0006GP-NV
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:32 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsY2-0002G5-9c
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:31 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso4243830wmc.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=99fs6jcmMHJLrcJdKY3HRNZUMhTVbvVJpVEtsAH0Vus=;
 b=Lffh9mCTl9Rwh1L6F7jozTo3Dq54OeElJCZsS1oX27ycd7WflYdYBnWCw4q4qVdJxo
 kDNq+SopZsFEq9mbW5MpUH0JeEI7yzBOwRarSMlinMZyLrwzlviJidAAuTdw8A4qFooc
 GAWT+evTubgo+6F+uBIqKjdK/eWxpYbtAhqR2L7i/tc0sJ4RU9eOXwcSNoRskpdr6P4S
 S6yT8m8mHR8nCPzrYMfMtF2Oj2jwDtUWD+teV4U6aliMrbvZb69wazoBsPLJBUJGZMlK
 3I9AgYNvXsCJGjCdCvt6c6DGewq2ixBsxHJlz20cHDbg+vhlCLtg/X8xQEo0G/Q4+cOM
 e5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=99fs6jcmMHJLrcJdKY3HRNZUMhTVbvVJpVEtsAH0Vus=;
 b=CzHLjUvbKGvSiqMsp3f/GjgitwyIyQoshCvJzWubcLFPLVN0bT+6gIheAqn12VTa7L
 NGxdgcpJLmzD8YbD2A+ZIyVFv4xecuMaUxKWyVXiAXGQUUiFGXhgvPeY+beiAT84cBil
 7BC87GmEFFZifmZcpnIlrG+7G8Bc40GM5m/5/GMt7T0bLKIkYm4xzkBcYJuoHKsqHtNo
 SEZsdY/vyyf/aCgP/ghmEI+vuqVHugv2SgrjCnzu32V/g0/j1v3Ohl1+2pbI1G0qOBLa
 DksljTRYcbzzhSfUThgjAiwE+iAf/2M59L9QVbA7lRkCAx3SzeYiOv+wx8Mv+3fqx4a7
 2KGQ==
X-Gm-Message-State: AOAM533uJmErYujARKg4Tpj1WKyFyErQ1/wZoaeriAbzKsepalzIWL89
 7wKq83LlmCAGsp/Tb6biEDUgN35cRX8=
X-Google-Smtp-Source: ABdhPJwsMpYeOU8IWSr+1zqW9d2ICi0bg3RrpfUEJ41txy0WITMyWqlu/Wezd+pP7pJZqI38LSLIRw==
X-Received: by 2002:a05:600c:220f:: with SMTP id
 z15mr297262wml.74.1629896548319; 
 Wed, 25 Aug 2021 06:02:28 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d7sm21646640wrs.39.2021.08.25.06.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:02:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/28] target/mips: Decode vendor extensions before MIPS ISAs
Date: Wed, 25 Aug 2021 15:01:46 +0200
Message-Id: <20210825130211.1542338-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit ffc672aa977 ("target/mips/tx79: Move MFHI1 / MFLO1
opcodes to decodetree") we misplaced the decoder call. Move
it to the correct place.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210801234202.3167676-3-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 6b95cca052a..490add3fc15 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16094,6 +16094,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
 
     /* Transition to the auto-generated decoder.  */
 
+    /* Vendor specific extensions */
+    if (cpu_supports_isa(env, INSN_R5900) && decode_ext_txx9(ctx, ctx->opcode)) {
+        return;
+    }
+
     /* ISA extensions */
     if (ase_msa_available(env) && decode_ase_msa(ctx, ctx->opcode)) {
         return;
@@ -16103,9 +16108,6 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     if (cpu_supports_isa(env, ISA_MIPS_R6) && decode_isa_rel6(ctx, ctx->opcode)) {
         return;
     }
-    if (cpu_supports_isa(env, INSN_R5900) && decode_ext_txx9(ctx, ctx->opcode)) {
-        return;
-    }
 
     if (decode_opc_legacy(env, ctx)) {
         return;
-- 
2.31.1


