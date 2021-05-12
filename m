Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446E537BAC4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:36:27 +0200 (CEST)
Received: from localhost ([::1]:42462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmE0-0000UN-Tn
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzL-0003hk-74
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:11 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzJ-0003hP-Dq
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so2217447wmk.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VsOEBZtB0HF2JImaMnITvaw+tRLQeXiNM3E9i7SwoP8=;
 b=l163YBaw2zHHqHhyWpGcjptjVgib4g68qAoUMqipmmypqYOh98n9ScNdpOrygSKgNm
 ZvQi53IQf/B8goSY1z+XacWIFd9Cx6wm5OzOCDLj1eM71PbWtGJ3lrFIrLiA3pylwoGS
 MjNx4P2QSzcNZS19KmmrLhViBhrZ2EwoI7UWnH08PCIC+a9TnG1BP3IRAq6mdRi7cggr
 d94MQSge0nW6YGQrNflJq/inx0qseAIIa3hgRqndot8waLmmhPBcstY94cWGeH0sI/SM
 t0YUB8CAhjztMheieoPdfPX5WptaAiYkBKpFTVlbbkbIDEWGeSbhAlXxecT+sYV1bv0k
 2Ujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VsOEBZtB0HF2JImaMnITvaw+tRLQeXiNM3E9i7SwoP8=;
 b=Oc/4B4LbTxcGyo6hw+aAYGxKaozxHvQWoZe6yuZ8GOKa4an+dFOo2FwksP3v12ihfX
 vl5AfV2v1tq3mSX0BvMP/+RmI6/nWBi7ZGdO5/9U7peJM6204yFwU2VjziQYggdxRAod
 KC2DMlFAAbWuIChYLrg4zSi6lYUZJJktRE9RzUyAh9IvBZQ7lQsE+I/ZjMbXO6tRdMd1
 h0IDZ2+alOmv6b43fl/+0/7JIZcbJ87F7rdiWoo2dI0GpIkIFuO06yK2FB4flipixY2a
 SJyeut5a13XDS0gcIlrQkVCV+C3sSshai3iQA/+0bn+PtT4EPOmQxVpZnRQfMpVhPuMr
 APFA==
X-Gm-Message-State: AOAM5321k7dunY6kFwkZcD7DhxBBUV1UMyV50G7nIDZKHc/5y4TVTOLr
 2UBO1ltilxF48gOd/aflx9NYhA==
X-Google-Smtp-Source: ABdhPJwmLMCdFHGCOY+Z1AiuH8FAClfWWma1Gm3aS4GZuVUKJXW2LETQ1/tRH3mmNaR4yE8yaoH/fA==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr10651729wmq.137.1620814867999; 
 Wed, 12 May 2021 03:21:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm347305wru.64.2021.05.12.03.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:20:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4E9CC1FF9B;
 Wed, 12 May 2021 11:20:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 12/31] tests/tcg: Run timeout cmds using --foreground
Date: Wed, 12 May 2021 11:20:32 +0100
Message-Id: <20210512102051.12134-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


