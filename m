Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD1053EDD9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 20:26:13 +0200 (CEST)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyHQa-00088k-C6
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 14:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyHP7-0006Pj-NM
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 14:24:41 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyHP5-0003mL-D5
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 14:24:41 -0400
Received: by mail-pf1-x42e.google.com with SMTP id p8so13355111pfh.8
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 11:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lW0I3Ia6SUG8ZL9CBoA9FfBSQDc/uwvV0C98pSDWlfo=;
 b=BqhKLP8PMegOpBqTFM5GB0d4wzmJoLVIA1vBqiarj6DEk63A9FvKeSSvG7vwN6RRYM
 TN1U9poQwPj22dELxZIr29n+yzIfKyi0kyYdMU1A8E6P6HsiSZlpK5jop9Cfkdh9qdY6
 Nu/nPocZn65H/ON3Vlv8bB0D/b1QjVTGXQEEyWggzFNQisGDUKH6evY+PN7X64b53vrA
 qYBMwSZgx57xCPVGvuf3aUOWxnQj/tJ/U1PcoglTJ0JcNawmmdMJqyDKuTE09yY2Iboa
 5noTcR+I0JfTMpy3LFQ/o6Ix/6CHOqs/NvxCUbBeokF6fAzdTZ/s6+N+qhnfk/CJX7NX
 th0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lW0I3Ia6SUG8ZL9CBoA9FfBSQDc/uwvV0C98pSDWlfo=;
 b=A/fJiOGoM5qo+53wQrSNw6cdQDmSkisYONPp4GenKNH+MS6IkrOKsHXb+06j5cB3J5
 zmDr/jKDzuYj0hcDx1NeJwE05be207imxG5gRNIDaUROiGjO3LFJUEzAcAadWcvn7ymv
 HZJ31L85V8a/lu483lesGLt1GAgneXhJWh7TS69RqBh4NqvFekHdBmtPAcxaBi3FTb7m
 OH5pf6YjzisSGfvCKNCGzY+MQIfezGROkM/k1rgm99WT2vGJzErMYFENP7vSHg2oC7nJ
 Kl5xetxudoTRiZSKZvTO9ueSRnl7Qw3PTMSgo/7QsJVEe4Q9nQOIESUaT3kXQ8hv9SLD
 /bUQ==
X-Gm-Message-State: AOAM530AesqeOVm3k1gMePDvOO4+QUGuDc4UPbJyv2uwgHeCEGX2PWEq
 QA0Nk/YDKlkaUY1VBr8j/HBM1u5WTyFCEQ==
X-Google-Smtp-Source: ABdhPJzIGjehsT0rcUlJTDzrLXiePoOKi8X11IH/P+D6QZazMFfO2Qa36/Mk/13exljtY8aDrwG7ig==
X-Received: by 2002:a63:5a41:0:b0:3fb:bd55:5871 with SMTP id
 k1-20020a635a41000000b003fbbd555871mr21848178pgm.449.1654539877963; 
 Mon, 06 Jun 2022 11:24:37 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 y188-20020a6232c5000000b0051bb79437f7sm10896813pfy.37.2022.06.06.11.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 11:24:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	thuth@redhat.com
Subject: [PATCH] gitlab-ci: Extend timeout for ubuntu-20.04-s390x-all to 75m
Date: Mon,  6 Jun 2022 11:24:36 -0700
Message-Id: <20220606182436.410053-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Recent runs have been taking just over the 60m default.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index 4f292a8a5b..9f1fe9e7dc 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -31,6 +31,7 @@ ubuntu-20.04-s390x-all:
  - s390x
  variables:
     DFLTCC: 0
+ timeout: 75m
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
  - if: "$S390X_RUNNER_AVAILABLE"
-- 
2.34.1


