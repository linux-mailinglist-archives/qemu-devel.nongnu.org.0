Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E0E5E92CB
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:44:38 +0200 (CEST)
Received: from localhost ([::1]:56138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQ3p-0006c9-2j
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqV-0002WR-Jn
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:30:51 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:35711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPqT-0006IE-UZ
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:30:51 -0400
Received: by mail-pf1-x436.google.com with SMTP id e5so4188220pfl.2
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=NHZEwyZe4QvDxYFPPW8rgMjXXwZjWrApXq6jqgxMbHA=;
 b=eSxFd8QWEz63E3jXfmNOFHJMU6CbKHFE9mQJuc8c7HkViaTjcHS1GWWK0kIUJ8oVna
 vIg7nmaQasrGqnqCKqdIvH+fF1Jwb1HbphGpaL+ePuhAh4MX/hr9WA7AnOBuODavFfjy
 xdeaqsTnqhG7AI8DGbUEvcpp53LeBbP/Z8wWQGeM0ySZ0KdiWgNfyrzKsgfcHc7sqrxM
 yZ1qm+Y3b/qV32JSNLUHRnVtRcDRqHbkFcOtLx1SCogSsKo0QELAd2TWReQaFD51gS9E
 qN5AAEpU5wXSzOsksrUAUeGJt2nyCyxZtdCVVgfVrhnhFkAIz7kpnv8mQorkOAT6BcRU
 krBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=NHZEwyZe4QvDxYFPPW8rgMjXXwZjWrApXq6jqgxMbHA=;
 b=19VdIYN3qf55N7zNvRzjet+imEG4X7hDY7MI5OecNVGbP1JctB2ZLeQPme3pYRI7tV
 c3y4KIBeQRRYjCy7Dzptfof5zo/F3wekD9v3AHORmCcXl8y6Y0RIfLjnJqlJvP9Ajxdd
 okG8dz68cmaAPFgPT3F5eP88Qd3PM6WaPy25CY9csd1zTdHsMI9wh+7j4OUnqYiKTtDp
 NEag24HmTLnIgoZDjliWsczN3erHxJ9yrMBh98A2Zu+pQkuVL1bnL+P+4BYlauJ04HAP
 Nj92KLbzX3A+NHKTdfGnFwuLY+++X7SkFtarcZTPBDkT87dgXsd7Vmw4lOYtkJLECpcZ
 3kNA==
X-Gm-Message-State: ACrzQf10eprMnU7d+nM9twLYGZ5EHxmDR7eNo0mbO95M88IPhzSbq6C9
 U8uwt2zf8WGHiq3vOWQChrm/iSi8Jo0=
X-Google-Smtp-Source: AMsMyM5RAKdwNBeBVXvr2q+yVqdKkYr4+6Qiq9nco+paeNd2ZRNzLy+xIg3gISwQUtNHA2WwtcjZIQ==
X-Received: by 2002:aa7:9e0d:0:b0:540:94a7:9051 with SMTP id
 y13-20020aa79e0d000000b0054094a79051mr18380275pfq.59.1664105448328; 
 Sun, 25 Sep 2022 04:30:48 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:30:48 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 02/54] semihosting/arm-compat-semi: Avoid using hardcoded
 /tmp
Date: Sun, 25 Sep 2022 19:29:40 +0800
Message-Id: <20220925113032.1949844-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Use g_get_tmp_dir() to get the directory to use for temporary files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---

(no changes since v1)

 semihosting/arm-compat-semi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index e741674238..d5e66cc298 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -503,7 +503,8 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
+        len = asprintf(&s, "%s/qemu-%x%02x", g_get_tmp_dir(),
+                       getpid(), (int)arg1 & 0xff);
         if (len < 0) {
             common_semi_set_ret(cs, -1);
             break;
-- 
2.34.1


