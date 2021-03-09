Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E329B332EF0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:23:26 +0100 (CET)
Received: from localhost ([::1]:59588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhwz-0007XN-V2
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg32-0003Ue-Eb
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:32 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJg30-0003q6-Kt
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:21:32 -0500
Received: by mail-ed1-x530.google.com with SMTP id dm26so21705840edb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 09:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJdRBlWM+wZ66yoBLFObCROF7hpC192uscdEZY5GxEY=;
 b=i7s2x861cgBBsbrHGRmdeg4lcqr8JtWLPuLXpvJXZB6jQIRv8ygX84y9nhO3lPm3T/
 0HNMI5LNowIOGU7Nn5xy/S3ZiX2JKIocWuSxA97YiZTAh+Zi9/bhsv4uSHiNPKkQxli0
 kYtWwEgvYvYWVBxg0KtwecrLiL1KCfcJuYvjwD48vVlu8XoSX9sLxkmgQzoQz+oURQsG
 56l01mXem7M7I6pR9O7rwEJxbBg4jI22Uh3nrSP54rFyuLnB0TCoxipHRZ4kY9AN7esU
 HcwbKll+8th415fmywxSYAa7XvlbXt/WPDaPieJgWmxVc2lAhm0sTYGxXsMy9D9cppm5
 psKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJdRBlWM+wZ66yoBLFObCROF7hpC192uscdEZY5GxEY=;
 b=taKYc5G407uCcho9r+P9x08olvAfeN4ZgMdo9QlP/16yfgdjLiv5/gFN10eFqUllXF
 X/raBBECOuQIg6NUBIfrDaIQYWeiKytR5XLlpWYOWVGTBxQnmixAsmvY4VyjLJfpYRt2
 NEhRQfrdK6DNmvdEd7hdg264exhnZXsml2Yl/ZWp+9YWS/JnrCKcgcMBp8ZMaHwHN4jU
 uGMeJkFYNh5g/nPaEbpVKYeeNv35spJC8R2dojZ6lxYIVXSBmDqDJ6CCsXIr8i+8bsqU
 UnTZu7ZVZK9KL/L3vki4DQarwUnJV0lw+j/xPiTsCbUJKk0ZxA+a0fSQj6lGoZOp7JPM
 j9hw==
X-Gm-Message-State: AOAM533oJ1jhsBnLBSRAFATn+jiFg7FN+9yH7KpyR2KqA0OJhsxHIXVU
 7ijJogYfQWSsGzIod0USylli0A==
X-Google-Smtp-Source: ABdhPJzd7DFAOy/ta9197qeuOVUD5N7hAjxjw523gv/J9m+LfrvcAJBi3w6bI5mInYzvWsUl4ppgcA==
X-Received: by 2002:a05:6402:22f6:: with SMTP id
 dn22mr5243032edb.214.1615310488766; 
 Tue, 09 Mar 2021 09:21:28 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r13sm9475011edy.3.2021.03.09.09.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 09:21:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1A4981FF7E;
 Tue,  9 Mar 2021 17:21:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 0/4] semihosting/next (SYS_HEAPINFO)
Date: Tue,  9 Mar 2021 17:21:23 +0000
Message-Id: <20210309172127.20470-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: keithp@keithp.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Hopefully the final revision, instead of hacking about args to
reverted to the orignal code (with minor tweaks for args). Still based
on my in-flight PR:

  pull-testing-docs-xen-updates-080321-1

which already moves the semihosting code out of hw/. Please review:

 - tests/tcg: add HeapInfo checking to semihosting test
 - semihosting/arm-compat-semi: deref parameter register for SYS_HEAPINFO
 - semihosting/arm-compat-semi: unify GET/SET_ARG helpers
 - semihosting: move semihosting tests to multiarch


Alex Bennée (4):
  semihosting: move semihosting tests to multiarch
  semihosting/arm-compat-semi: unify GET/SET_ARG helpers
  semihosting/arm-compat-semi: don't use SET_ARG to report SYS_HEAPINFO
  tests/tcg: add HeapInfo checking to semihosting test

 tests/tcg/aarch64/semicall.h                  | 18 ++++++
 tests/tcg/arm/semicall.h                      | 15 +----
 tests/tcg/riscv64/semicall.h                  | 22 +++++++
 semihosting/arm-compat-semi.c                 | 62 +++++++------------
 tests/tcg/arm/semihosting.c                   | 26 --------
 .../arm-compat-semi}/semiconsole.c            |  2 +
 .../multiarch/arm-compat-semi/semihosting.c   | 62 +++++++++++++++++++
 tests/tcg/Makefile.target                     |  3 +
 tests/tcg/aarch64/Makefile.target             | 18 ------
 tests/tcg/arm/Makefile.target                 | 16 +----
 tests/tcg/multiarch/Makefile.target           | 31 ++++++++++
 11 files changed, 165 insertions(+), 110 deletions(-)
 create mode 100644 tests/tcg/aarch64/semicall.h
 create mode 100644 tests/tcg/riscv64/semicall.h
 delete mode 100644 tests/tcg/arm/semihosting.c
 rename tests/tcg/{arm => multiarch/arm-compat-semi}/semiconsole.c (93%)
 create mode 100644 tests/tcg/multiarch/arm-compat-semi/semihosting.c

-- 
2.20.1


