Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C3B3728D3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:26:11 +0200 (CEST)
Received: from localhost ([::1]:45046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsFm-0004uk-SG
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzw-0002eU-NY
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:48 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzq-0006p6-AF
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:48 -0400
Received: by mail-wm1-x32f.google.com with SMTP id i128so3027537wma.5
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VsOEBZtB0HF2JImaMnITvaw+tRLQeXiNM3E9i7SwoP8=;
 b=HCT2ZZIjEzwPiuoRYouhafiSUVh8poxDZpaSYLY1d+sBdEDGdHnO+jlsLczns1UjZz
 nugmWKtjjqeV50wxCR7ck4L3Fyam/3Di7z8jvm9yItBqrPWCI2HcOZ7HaNrxWPe0VoYw
 sUCOVs02fTJmqzeNr1l97bSPfQPr2HgwC3T2phEZuJ4NBULbHXIuwWf865igmOkUSkaE
 s8dgsoWZahReRTY5lwK0zLwr3Ngg17/ziW//1Bo3exLHIdg50nz0S++X3lJBBq2YWPU6
 4UbByNAk8DoSm/32ph9jrqpGKxvZUlDPqSgRuHjiaYuGHF89ENXKOwL0eomNaLRX8xly
 yO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VsOEBZtB0HF2JImaMnITvaw+tRLQeXiNM3E9i7SwoP8=;
 b=pbiImj2x+Mst29RIAHrju40/AgIjbg8cHjjmAyxOKWc8Ksh29kFHIGsukuv4EEBjhv
 8qXCyDU1DkTc4RczxtY/l6CpaDkr9GKuErctnHzFEoWZrx/CMgE9qCh00cTh6uBmzVfF
 5Ch29UXNwtzYJ1A6ex0ADtAr46LF/D9oVfk2e6oveeYpJDE5pB1xO/ZzetzEeryK9V3k
 G6XhjAgutlkaL59IRqOTClwN6t19O441FLeSQgOXq/BJKOKIBtG8hsH2K5yIhFsU57oP
 iQG1QDQzTRk54pTwHzxVfc9642oqdzcbcULM3GHy+ABI18C81cRwRdATXrA/B0NFoU5f
 xTsQ==
X-Gm-Message-State: AOAM531e2b5p8rFb+ZMUNI6f6lyhPaFELi8NYxxhuXjv97Hy3b3aoMV/
 L/QT6fUgrzPGs0IRWnuqH8+TUg==
X-Google-Smtp-Source: ABdhPJxAqOoIgHHaDlcrl0VSBb35QwEuI+O0F5cB8+/hvh3LTTsGtntINuAEUY6wroHieCueE1lFwQ==
X-Received: by 2002:a7b:ca42:: with SMTP id m2mr26263966wml.67.1620122980972; 
 Tue, 04 May 2021 03:09:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o15sm5851734wru.42.2021.05.04.03.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:09:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C50431FF9B;
 Tue,  4 May 2021 11:02:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 12/30] tests/tcg: Run timeout cmds using --foreground
Date: Tue,  4 May 2021 11:02:05 +0100
Message-Id: <20210504100223.25427-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

when trying to run successful short tests from the Makefile timeout would not
terminate. Rather it would wait until the time runs out. Excerpt from the
manpage:

--foreground
    when not running timeout directly from a shell prompt,
    allow COMMAND to read from the TTY and get TTY signals; in this mode, chil‐
    dren of COMMAND will not be timed out

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-3-kbastian@mail.uni-paderborn.de>
---
 tests/tcg/Makefile.target | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index cab8c6b3a2..b29fae4630 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -43,9 +43,10 @@ quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 
 # $1 = test name, $2 = cmd, $3 = desc
 ifdef CONFIG_USER_ONLY
-run-test = $(call quiet-command, timeout $(TIMEOUT) $2 > $1.out,"TEST",$3)
+run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
+	"TEST",$3)
 else
-run-test = $(call quiet-command, timeout $(TIMEOUT) $2,"TEST",$3)
+run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2,"TEST",$3)
 endif
 
 # $1 = test name, $2 = reference
-- 
2.20.1


