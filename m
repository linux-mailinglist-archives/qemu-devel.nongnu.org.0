Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B10CA332F26
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:39:07 +0100 (CET)
Received: from localhost ([::1]:37612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiCA-00062Z-Mk
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:39:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg35-0003cs-JC
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:35 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg33-0003rz-LN
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:35 -0500
Received: by mail-ed1-x529.google.com with SMTP id l12so21830209edt.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 09:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7aRz5A1gJNP7JkbnM/fhJCTS7Za0DL/dufGag57ukuY=;
 b=MQ9vsDuiDu3UK8HP36PN5NGp/3wQjLS41Zi19koosVE2KZSVBhwg0rHPoMU2qzTz3j
 6+ewy5AO2aV1gH6c2CESdBD57MQEZ6MChXfRzppdHrF0vsVtNDcbRcpK7yY43SR574nn
 3WvaRLxNI6BKu0jEhBG/MvKHdzPTN8UrPuBo8vEsn9wmRAG7XBhtQxiQNzZ4r6Gp2RI4
 yokxxts6HUQ3qScgze+mr95/BxGtjCPTmHk6OWkVS6EZVqWqd7lwDptGhDAA7syXUEWC
 /V9XqTt1z4hyj4z2rvfQ2qdrzGyD3jekFKmLc/U/LtaOA0e0wf5Xu+cWPjyJOcESBPxA
 Vs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7aRz5A1gJNP7JkbnM/fhJCTS7Za0DL/dufGag57ukuY=;
 b=K6KfAPuoeCAcmbxudAxvFQ/V+7HLy5jKPNDf8BQEuPbdSIkxwOtvAqQUw7fhznsaIg
 1ApatAD46+mQhPO7mQuBIvNhuAqSq+mFuPqzvnYliy2RhwLhzizNi7rk30SameMzNn29
 kHu5sHey96QP2uZrARUXWdLZ04hq98iYrvm3tslaS39YqLHPOdEgWnPetjcUJdqxsOiP
 RgpYA/1ZIf8bILtMGgcRShodI80T/qe4/XArUsP30b0haYC8S75vaPzOakePNeMzlgZa
 Pw5WIkFyoFN2glqHHw5f2gZ4dUrcjv0nLxXA8RaqiwW/yQ4CONaCm+TvVfddpd7Ac6qA
 RnKQ==
X-Gm-Message-State: AOAM532UWiKwYuzGZIWbKWGXdtJZMOU7QH3CjPPn8XEtlNRD0Y/7tiqQ
 Q1xqFOcxQTz8TzFg4+pPvUMcZw==
X-Google-Smtp-Source: ABdhPJzVIhqrlYeLNSxkcUZKB3Z/zsd/wKGrbOZ5kNK339fiA276f+bves04BHtujBbsY404PNJ9fw==
X-Received: by 2002:a05:6402:32a:: with SMTP id
 q10mr5269569edw.15.1615310492277; 
 Tue, 09 Mar 2021 09:21:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id lu5sm8880626ejb.97.2021.03.09.09.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:21:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 67E7E1FF8F;
 Tue,  9 Mar 2021 17:21:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] semihosting/arm-compat-semi: don't use SET_ARG to
 report SYS_HEAPINFO
Date: Tue,  9 Mar 2021 17:21:26 +0000
Message-Id: <20210309172127.20470-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309172127.20470-1-alex.bennee@linaro.org>
References: <20210309172127.20470-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Bug 1915925 <1915925@bugs.launchpad.net>, keithp@keithp.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per the spec:

  the PARAMETER REGISTER contains the address of a pointer to a
  four-field data block.

So we need to follow arg0 and place the results of SYS_HEAPINFO there.

Fixes: 3c37cfe0b1 ("semihosting: Change internal common-semi interfaces to use CPUState *")
Bug: https://bugs.launchpad.net/bugs/1915925
Cc: Bug 1915925 <1915925@bugs.launchpad.net>
Cc: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - just revert the old behaviour
---
 semihosting/arm-compat-semi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 0f0e129a7c..fe079ca93a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1214,7 +1214,11 @@ target_ulong do_common_semihosting(CPUState *cs)
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
                 bool fail;
 
-                fail = SET_ARG(i, retvals[i]);
+                if (is_64bit_semihosting(env)) {
+                    fail = put_user_u64(retvals[i], arg0 + i * 8);
+                } else {
+                    fail = put_user_u32(retvals[i], arg0 + i * 4);
+                }
 
                 if (fail) {
                     /* Couldn't write back to argument block */
-- 
2.20.1


