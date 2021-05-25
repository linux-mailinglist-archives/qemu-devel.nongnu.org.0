Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A848C38FFF1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:28:53 +0200 (CEST)
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llVEy-000284-NI
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVB0-0002SS-2H
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llVAw-0002yN-Ec
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:24:45 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d11so31794338wrw.8
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEpF42VO968NzP26solMD9dIdhFaTBHy/3N+y7M6kL8=;
 b=B4pnHbk/rGUxEo/+UYkZEJpaVHoyVCOfU3OLRor1EP/pSaCYVYgSugmNDO8jcDQBBO
 Pl4RBHr0iapFFPTqSGcLj7jt4nl8sp1ViJa3kpkqsuvbiNH4Ig7KC+yb1n43Tp+DbKF7
 8MU7jI/DCl3Ch7nlLKanQ81PiTK4N4Ub8lCH84yHhRe7VGRrTBsoCjJbi8d8j9zkOlQm
 ZNthcz0ZZnvazTJ//PELrr/5p+8KJZ6EuYGlFD8HNIgBHAP6Bu4EuT7TVydQkrtPXS1f
 mmux6wIGelYzKEwaml1gF9m7bouAD51vcaCX2VvrgD269FwxnCzMpC2RN36hRTujkL6v
 FMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEpF42VO968NzP26solMD9dIdhFaTBHy/3N+y7M6kL8=;
 b=r+/2lPLrqUZaOxD2UgMWcXN6+OtvZBOprXLyXuyXXaD1+JIA+FYQ/XMTBa4vT/X9rt
 wgwOv5YDqbr+t9bQe3G/7qog2DwadL9ZZhvaKcA7yYrYh7FXIstp0I9KuIeTnAMFH7W5
 K2Xy5EKiNtRnMsh9ccFHfeqp8rk5TSk1+5eyo3EKlmAVEcrj8nOeOUclKhGVdvv64Q5z
 1l6d/bzZPaouUSdvQnVytIj/zjCgHzkW5P+ade3v5Mt6HudV1GeXzecmRwYkjBokMi7Q
 0gfuC9u5qGH+yc1zdVfIYHCCzdMcjMDWJXyRxMXsauhjT+lxePZQXtmD6/QDUMj5rURb
 nGsw==
X-Gm-Message-State: AOAM530ntxr32Bb+PQpc5YOtaV16HL8KOJyQGGz5KkRq8Xllp6SpKyLw
 HFlj+ARkIuaElH05odmiunM2yju01abI0Q==
X-Google-Smtp-Source: ABdhPJxEYV3pbUmgd2ikq1Ja+ezQnkOi43bh8wCuUkVn1klIVmtPysVZ6gSrHUvsC2nr1Yh/jZW2CQ==
X-Received: by 2002:a5d:6d04:: with SMTP id e4mr26198830wrq.344.1621941880363; 
 Tue, 25 May 2021 04:24:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z131sm2530099wmb.30.2021.05.25.04.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:24:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A1E61FF91;
 Tue, 25 May 2021 12:24:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 5/7] hmp-commands: expand type of icount to "l" in replay
 commands
Date: Tue, 25 May 2021 12:24:29 +0100
Message-Id: <20210525112431.22005-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525112431.22005-1-alex.bennee@linaro.org>
References: <20210525112431.22005-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is not a 32 bit number, it can (and most likely will) be quite a
big one.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210520174303.12310-7-alex.bennee@linaro.org>

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 435c591a1c..5ee9cfd520 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1667,7 +1667,7 @@ ERST
 
     {
         .name       = "replay_break",
-        .args_type  = "icount:i",
+        .args_type  = "icount:l",
         .params     = "icount",
         .help       = "set breakpoint at the specified instruction count",
         .cmd        = hmp_replay_break,
@@ -1699,7 +1699,7 @@ ERST
 
     {
         .name       = "replay_seek",
-        .args_type  = "icount:i",
+        .args_type  = "icount:l",
         .params     = "icount",
         .help       = "replay execution to the specified instruction count",
         .cmd        = hmp_replay_seek,
-- 
2.20.1


