Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CF43874E6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:17:27 +0200 (CEST)
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livqv-0005IV-UM
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhc-0008E2-A1
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:48 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhR-0005Wk-44
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id o127so4979797wmo.4
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SOwWByj9Hv79uAoR3pk2Na/zMM2B+Ft68GAsD76YMDs=;
 b=QOi6OYdySSZFH1c6NtjIs9km37rlQRRi7NNAQc0seBUZIhPP/3FuoH7oVbGJ6im+27
 t12lJTZjebh8Yy0h6et6bGUdNAZIFfcF+nK9LR6tF3q6AKW78nsoZNAsymHIOarzwcfF
 Ms27qWnNLjtCvz5+kyGof25pNj4aoe/bz+jc9A5hN6wARME8PbwAk02/jINvkcnf927a
 7N5di5qtu0TmiBg1KydPkXfqDm1QijdxKi71HmHU25VC+ZsWuUVNQ/gOOIin9CAgNTIU
 UIaHNed2qpba/YItLtEN6Ijx7ilQztmLfrSoFrH2Cf0zhTet6dPRt+FT2zh8JycQDS3j
 UhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SOwWByj9Hv79uAoR3pk2Na/zMM2B+Ft68GAsD76YMDs=;
 b=iPOr/pr2hh9wFwGNEMIGCKlb5Kgye7o/pnOViwc0MKH/Bo93Kk/sEF1Y/MIGxoGGEv
 b8LkS0ipj4ggvmMVQTtks59MScNL+CaVqdN9qW9vU2K8DrnBbcZitJIuc4mhV1s2vOC3
 s1Nn4QdiK92V2YF0hnLvCf/xGE0uKNKHtqW5SAE0KVKDKV6i/1QZxxpY9SKclZTfJrGw
 3BR6deljEPjS3dFJILgFWsoFD9DmnXFKRIDiRtLfE2rzwhE7pZ+4VP4Upwil0/wxg6E6
 83xsQ7NI/uw17EiGjD2rZy3aDSXxcanxBYAFqG8RX/Lo3x0yE+EyNuGgtCrgv4eZYJzS
 ZnaQ==
X-Gm-Message-State: AOAM533DABSGVUwyMRvDfBeIfyhjRWfQFLzFjyBwwc5WZfg8+hjObW+T
 CLNdOVVfG9zrSTYhMZnWhWMvGA==
X-Google-Smtp-Source: ABdhPJx3YBLfFp5z9cRjhWx1iJC6SPTx8G6d6ZV/Tu8FGpIunC/kdE+tV7tON8w1Kw/3XILbU/gxlA==
X-Received: by 2002:a05:600c:2948:: with SMTP id
 n8mr3740468wmd.95.1621328855811; 
 Tue, 18 May 2021 02:07:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p7sm20501159wrt.24.2021.05.18.02.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EBEC21FF9A;
 Tue, 18 May 2021 10:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 11/29] tests/tcg: Run timeout cmds using --foreground
Date: Tue, 18 May 2021 10:07:02 +0100
Message-Id: <20210518090720.21915-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
Message-Id: <20210512102051.12134-13-alex.bennee@linaro.org>

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


