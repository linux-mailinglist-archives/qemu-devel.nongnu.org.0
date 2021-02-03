Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A0030D14F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 03:19:06 +0100 (CET)
Received: from localhost ([::1]:55638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l77l2-0000jU-Tt
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 21:19:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77i1-0007V2-FC
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:15:57 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:40848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l77hz-0000uc-Mp
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 21:15:57 -0500
Received: by mail-pl1-x62a.google.com with SMTP id y10so9333434plk.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 18:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dYSIFcsTKnToVYrjsfe87hzAnMJgb2YCjXQ54fhnp5g=;
 b=vvvil81nDQhF9ude+TUT2qgNEbbBHn4lEH/sMbQUJCY6mgT2TjdIUEoYgWnfOpj7Dq
 mCQC4AL0lIEcDeo/LT+dkC2ojLb+h/ZrSbtfcmJvsSUYOXZOXDPgxiYGG2mf18tvp1li
 tkmWyCZkrEGOF4BmCrhOpU2Z/ryOa0GQqA9ytWKoYMhkrrtFvukLMQCUZ6dRCgYp+ONl
 5xE6XP0SjyXSye7yLFXjRnpgXZO9Jr4rL2kvC8ZGkhd1KmvyzHbKWNM5AQWhe60MUuz3
 uAMuFexdROwxZmrzJEPP2llT3rT9hBD97J7AhMKQlAfMcEBDU8KcodNa8b8U25UiO1II
 ZUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dYSIFcsTKnToVYrjsfe87hzAnMJgb2YCjXQ54fhnp5g=;
 b=TOmwkuONnd3SbcIWhhIynF/MS7j/c+5Rz+rhcuKW3PBwJx0yrgnK7Jfpj1gC48hq8c
 EVInHsgKVtk+6X3W1KD/uYcvhfkmWl0jbeA2gh0o7PjMNBcSHpLoqO1Z2Zk7Zf1vI52a
 xMM2xR1KK3kyW9XpWVWlc1ujX3ncjGji8zP2ZjhxxVf26qzoZJxpcV6lyjOIa1a2QQms
 TJYhU3992l/yHxNhuT+l9ntK0eKStVK7RDKB/7ybV4bmdPwdWlCD+iyTpt0BV2bgskj3
 qA2hhfulz0uRqjBIHq1O7X+mMTbYtvrvC3X8ovSQ0ZzgTiMoCXCkFrAGh+oxkqWzDybF
 UZgA==
X-Gm-Message-State: AOAM5322CAWTga2Xcav/qAnNQrQ8hOCYvtMMYCkxcdd0I5B5w6XzrYmf
 LvHnUFiKsWnIcyGD0WO/F5UXh/9sda8YeKn4
X-Google-Smtp-Source: ABdhPJwigFgHSOHnfQ/pdJWGGdA+ReNhETpBtRzvcTPi/FTTMjf8rMD5cbmGXGsw3otecGbuwXvv8A==
X-Received: by 2002:a17:90a:ad81:: with SMTP id s1mr814177pjq.9.1612318554140; 
 Tue, 02 Feb 2021 18:15:54 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id x1sm270301pgj.37.2021.02.02.18.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:15:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/24] tcg patch queue
Date: Tue,  2 Feb 2021 16:15:26 -1000
Message-Id: <20210203021550.375058-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 77f3804ab7ed94b471a14acb260e5aeacf26193f:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-02-02 16:47:51 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210202

for you to fetch changes up to 0c823e596877a30fd6c17a1ae9f98218a53055ea:

  tcg: Remove TCG_TARGET_CON_SET_H (2021-02-02 12:12:43 -1000)

----------------------------------------------------------------
TCG backend constraints cleanup

----------------------------------------------------------------
Richard Henderson (24):
      tcg/tci: Drop L and S constraints
      tcg/tci: Remove TCG_TARGET_HAS_* ifdefs
      tcg/i386: Move constraint type check to tcg_target_const_match
      tcg/i386: Tidy register constraint definitions
      tcg/i386: Split out target constraints to tcg-target-con-str.h
      tcg/arm: Split out target constraints to tcg-target-con-str.h
      tcg/aarch64: Split out target constraints to tcg-target-con-str.h
      tcg/ppc: Split out target constraints to tcg-target-con-str.h
      tcg/tci: Split out target constraints to tcg-target-con-str.h
      tcg/mips: Split out target constraints to tcg-target-con-str.h
      tcg/riscv: Split out target constraints to tcg-target-con-str.h
      tcg/s390: Split out target constraints to tcg-target-con-str.h
      tcg/sparc: Split out target constraints to tcg-target-con-str.h
      tcg: Remove TCG_TARGET_CON_STR_H
      tcg/i386: Split out constraint sets to tcg-target-con-set.h
      tcg/aarch64: Split out constraint sets to tcg-target-con-set.h
      tcg/arm: Split out constraint sets to tcg-target-con-set.h
      tcg/mips: Split out constraint sets to tcg-target-con-set.h
      tcg/ppc: Split out constraint sets to tcg-target-con-set.h
      tcg/riscv: Split out constraint sets to tcg-target-con-set.h
      tcg/s390: Split out constraint sets to tcg-target-con-set.h
      tcg/sparc: Split out constraint sets to tcg-target-con-set.h
      tcg/tci: Split out constraint sets to tcg-target-con-set.h
      tcg: Remove TCG_TARGET_CON_SET_H

 tcg/aarch64/tcg-target-con-set.h |  36 ++++
 tcg/aarch64/tcg-target-con-str.h |  24 +++
 tcg/arm/tcg-target-con-set.h     |  35 ++++
 tcg/arm/tcg-target-con-str.h     |  22 +++
 tcg/i386/tcg-target-con-set.h    |  55 ++++++
 tcg/i386/tcg-target-con-str.h    |  33 ++++
 tcg/mips/tcg-target-con-set.h    |  36 ++++
 tcg/mips/tcg-target-con-str.h    |  24 +++
 tcg/ppc/tcg-target-con-set.h     |  42 +++++
 tcg/ppc/tcg-target-con-str.h     |  30 ++++
 tcg/riscv/tcg-target-con-set.h   |  30 ++++
 tcg/riscv/tcg-target-con-str.h   |  21 +++
 tcg/s390/tcg-target-con-set.h    |  29 ++++
 tcg/s390/tcg-target-con-str.h    |  28 +++
 tcg/sparc/tcg-target-con-set.h   |  32 ++++
 tcg/sparc/tcg-target-con-str.h   |  23 +++
 tcg/sparc/tcg-target.h           |   4 -
 tcg/tci/tcg-target-con-set.h     |  25 +++
 tcg/tci/tcg-target-con-str.h     |  11 ++
 tcg/tcg.c                        | 136 +++++++++++++--
 tcg/aarch64/tcg-target.c.inc     | 137 ++++-----------
 tcg/arm/tcg-target.c.inc         | 168 ++++++------------
 tcg/i386/tcg-target.c.inc        | 317 +++++++++++-----------------------
 tcg/mips/tcg-target.c.inc        | 173 ++++++-------------
 tcg/ppc/tcg-target.c.inc         | 209 ++++++++---------------
 tcg/riscv/tcg-target.c.inc       | 135 ++++-----------
 tcg/s390/tcg-target.c.inc        | 174 +++++++------------
 tcg/sparc/tcg-target.c.inc       | 156 ++++++-----------
 tcg/tci/tcg-target.c.inc         | 359 ++++++++++++++-------------------------
 29 files changed, 1244 insertions(+), 1260 deletions(-)
 create mode 100644 tcg/aarch64/tcg-target-con-set.h
 create mode 100644 tcg/aarch64/tcg-target-con-str.h
 create mode 100644 tcg/arm/tcg-target-con-set.h
 create mode 100644 tcg/arm/tcg-target-con-str.h
 create mode 100644 tcg/i386/tcg-target-con-set.h
 create mode 100644 tcg/i386/tcg-target-con-str.h
 create mode 100644 tcg/mips/tcg-target-con-set.h
 create mode 100644 tcg/mips/tcg-target-con-str.h
 create mode 100644 tcg/ppc/tcg-target-con-set.h
 create mode 100644 tcg/ppc/tcg-target-con-str.h
 create mode 100644 tcg/riscv/tcg-target-con-set.h
 create mode 100644 tcg/riscv/tcg-target-con-str.h
 create mode 100644 tcg/s390/tcg-target-con-set.h
 create mode 100644 tcg/s390/tcg-target-con-str.h
 create mode 100644 tcg/sparc/tcg-target-con-set.h
 create mode 100644 tcg/sparc/tcg-target-con-str.h
 create mode 100644 tcg/tci/tcg-target-con-set.h
 create mode 100644 tcg/tci/tcg-target-con-str.h

