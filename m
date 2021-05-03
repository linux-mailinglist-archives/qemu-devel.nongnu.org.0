Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEB7371DBC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:04:20 +0200 (CEST)
Received: from localhost ([::1]:57422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbzX-0002IO-V4
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldbrA-0002F1-8o
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:55:41 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldbr0-0003wT-2t
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:55:40 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so6143220wmy.5
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PP1wB8xlLysmvgANHj3AI5JMp4cGm5wsTxpTrOOY6w0=;
 b=bOhzhffdiekwp5S6Tg7kScu/DPolhaSzH/rIUfJ9E8OZOXiTLRuChIf/J1n40eXOjZ
 t4g6ax6ERJVp+SGZdiX2tN1hwnZhiuIBvxF+0tH/pglNMRx7ZDQKkYjQcHhr14uMynr4
 JfYDZ5E3fe90XUQktIxQ9sDPG1OBg1l9kwcGYYUfD0Q77p/VMjW++4iDvmz1rr5Qo08D
 3lUWS8TVFb7cahARp3tS+iTyQ1v5vxtqlEUfVmgtTPlTF5lm3mUCWAl3FhnZ9j/AYNRR
 6HYcdPOXjqGPcoGX3dmJtl6MUq1ed7jQN/DcTDaG6yAYvmiq5OtkBizdVAS+vAXL9Te5
 eEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PP1wB8xlLysmvgANHj3AI5JMp4cGm5wsTxpTrOOY6w0=;
 b=gsDGuqAp4wHE319cMVzxMk7wjSCRVyda4sRkNa2hH/9zs2dacu7bAmN6DgzGsRGVOi
 +EZUF52xiimSYLrCFqkZhpb/c7PDLv6yA6PbzRBgfTy46pHLQyRnbsTtQmAlENUsxiax
 8bcGPO9f9ANfOQ03sTLjd1QuqvBNs4hvxYi6ZzNMUIoqu8Yhq4+MTvfcoYbpIWLk/x0X
 8bQ5idpOG+nivntVIQ7hnY1nz4cttjLBrTZRIwNJ+1jfTUJ/ogPSQwYk7G1maigRGhBE
 B7bxD/yxINmIPdCxb3LL3nOIguhIbB/+mJNeJI3QIygzgwfFldEfZQUF6V00JXSVpZzB
 JYKg==
X-Gm-Message-State: AOAM530hFYarfjzhMsZnMxxERmvMR2AFhEmAulEHxZJ3xWdrEcSuTrdI
 hO6P1WmgrRUCiao0Gj4gki/dOqNggYjipA==
X-Google-Smtp-Source: ABdhPJzXnwzN6EgTaRNqv5Oac2pJnS1Qc69q9gNseREz3jjH3vvAa+ZTcvhXVhKXCiakaDoPtI9vPw==
X-Received: by 2002:a1c:6754:: with SMTP id b81mr22313124wmc.16.1620060928297; 
 Mon, 03 May 2021 09:55:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l12sm15282794wrq.36.2021.05.03.09.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 09:55:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] tests: three easy Coverity fixes
Date: Mon,  3 May 2021 17:55:22 +0100
Message-Id: <20210503165525.26221-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We recently started running Coverity on our tests/ code,
which has revealed a pile of issues that we were previously
blissfully unaware of. This series fixes three easy ones:
 * use of free() where g_free() was meant
 * unnecessary NULL check
 * side effect inside g_assert() argument

thanks
-- PMM

Peter Maydell (3):
  tests/qtest/tpm-util.c: Free memory with correct free function
  tests/qtest/rtc-test: Remove pointless NULL check
  tests: Avoid side effects inside g_assert() arguments

 tests/qtest/ipmi-bt-test.c  | 6 ++++--
 tests/qtest/ipmi-kcs-test.c | 3 ++-
 tests/qtest/rtc-test.c      | 6 ++----
 tests/qtest/tpm-util.c      | 4 ++--
 4 files changed, 10 insertions(+), 9 deletions(-)

-- 
2.20.1


