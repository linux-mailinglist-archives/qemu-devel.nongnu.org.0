Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA059362744
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 19:56:19 +0200 (CEST)
Received: from localhost ([::1]:42544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXShX-00089e-0K
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 13:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lXRrK-0004tB-5j
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:02:22 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lXRrE-0007c9-Fi
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:02:20 -0400
Received: by mail-wr1-x435.google.com with SMTP id w4so23624683wrt.5
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d51u6hgF20CTqvNNatVXOlH0PfAiulv+u5hvvPIEuVw=;
 b=rCbvB9DKKtFc5q0Z1gEx0bqNkUjY54L/XS6jFzr837GUNg/VY0LoXuJHJkd4+hb7N1
 eAj67BYJImKIVF0rsLER4cm6vkJh2FzhWjC3LGOUZyv7TgSgyCOpEBuTdE+f+FH/omoa
 vqIPSJNHM8QPEhQuUR1v4vejScm+ETbcBfnAen0iD8ngt8Xt3UR0CEHi44EInmVcQTx2
 BQ5cPlVI+0Lu/e7Hof3YpMfTnAQbKWUNUaCaS8USg27hRIhWuA7Njg969k9/sOaXumaP
 dxQtnUOcLvmh/H/63vShpGVGkBZu/7t5ajpqtHjgIZ6a9kom0xD8tT6zZIBqiR8i+JIO
 EfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d51u6hgF20CTqvNNatVXOlH0PfAiulv+u5hvvPIEuVw=;
 b=fmVPmt69Nah19tdhVnyBwWKyCz0M++DcuRKAE0USrtLgo5UDQJJaA3+CuXnd9XA/yG
 oo4J26+j0zYRmJyDom1poGdBijfDikQvytJPJDZtAfHNyhwRlSIqY0YPXnbkyqKjS6Yh
 Yk0iDM1lSvkeB59TU0XqAEDf9L/0ce4c2fSqvYeBWaCNjMfFYZOXx3A1s9KL6qZgWJQI
 qKeFDYRhkL99ew68h7PicJsBEJz4MnMkgySw17OonLG8lZnYz/3qoCdZaPw148goOS/R
 ePAl74lCK+hdU+VbP0FgBisnJA+T8UvHKMYS/T+C9ebYICaAZ9vmU7GIZ6nQMw5uDC3S
 QZHQ==
X-Gm-Message-State: AOAM533+B8hgZliFzZOXWvU7qEeqiJNjFWODhj7Z3g3KBqPREDWt5Y1d
 s3eKZHEfGf4nLKS413yZXEP8MA==
X-Google-Smtp-Source: ABdhPJwhaY3jxpeBMMy8YJO2e5oqkfeqfbh/6iwCGICWSM6xtJiDMcDvaB4QSpa7Q64TTu+fLFP1dQ==
X-Received: by 2002:a5d:47ce:: with SMTP id o14mr180028wrc.236.1618592534701; 
 Fri, 16 Apr 2021 10:02:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o2sm9598031wmc.23.2021.04.16.10.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 10:02:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 057591FF7E;
 Fri, 16 Apr 2021 18:02:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] target/arm: drop CF_LAST_IO/dc->condjump check
Date: Fri, 16 Apr 2021 18:02:07 +0100
Message-Id: <20210416170207.12504-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a left over erroneous check from the days front-ends handled
io start/end themselves. Regardless just because IO could be performed
on the last instruction doesn't obligate the front end to do so.

This fixes an abort faced by the aspeed execute-in-place support which
will necessarily trigger this state (even before the one-shot
CF_LAST_IO fix). The test still seems to hang once it attempts to boot
the Linux kernel but I suspect this is an unrelated issue with icount
and the timer handling code.

The original intention of the cpu_abort (added in commit 2e70f6efa8b9
when the icount stuff was first added) seems to have been to act as
an assert() to catch an unhandled corner case where the generated code
would be something like:
    conditional branch to condlabel if its cc failed
    implementation of the insn (a conditional branch or trap)
    code emitted by gen_io_end()
 condlabel:
    gen_goto_tb or equivalent thing to go to next insn

At runtime the cc-failed case would skip over the code emitted by
gen_io_end(), leaving the can_do_io flag incorrectly set.

In commit ba3e7926691ed33 we switched to an implementation which
always clears can_do_io at the start of the following TB instead
of trying to clear it at the end of a TB that did IO. So the corner
case that this cpu_abort() was trying to flag is no longer possible,
because the gen_io_end() call has been deleted. We can therefore
safely remove the no-longer-valid assertion.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Cc: Cédric Le Goater <clg@kaod.org>

--
v2
  - added Peter's extended analysis to the commit message
---
 target/arm/translate.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 62b1c2081b..7103da2d7a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9199,11 +9199,6 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    if (tb_cflags(dc->base.tb) & CF_LAST_IO && dc->condjmp) {
-        /* FIXME: This can theoretically happen with self-modifying code. */
-        cpu_abort(cpu, "IO on conditional branch instruction");
-    }
-
     /* At this stage dc->condjmp will only be set when the skipped
        instruction was a conditional branch or trap, and the PC has
        already been written.  */
-- 
2.20.1


