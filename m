Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEA436320E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 21:48:19 +0200 (CEST)
Received: from localhost ([::1]:50140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXqvS-0006Uv-LW
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 15:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpY-0007sx-QE
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:12 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpW-0008AR-0z
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:12 -0400
Received: by mail-wr1-x430.google.com with SMTP id g9so13923956wrx.0
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fJZf4EpsHvFbqlvRa5QjsrvKAC2y+Hv24E/qLw9S6Y0=;
 b=cYCTqOCf01Am/qFFvbHpS/ZWnGw1xKbuKs2bRuCSb6QOpjU7O1Qi4cKJdSmjFBC3iV
 yjHdQXP+Q0FMAlJhjyqSdPugBg3gs45Ba657B8w6iXw+qQA4uOZm/DsPu8bxE2twr2IW
 9DFGCOmKisuKsN9O1+swYEA580WjqezdcW9BprKj+8BX8JqnjYKIMzrX0b2JFLvYx2Di
 UCyeXnJie88/oZzS3h2wbsE/ZYxdMGuz88N2NLoShuKpmomwtL+0iPqUjGcu2erTb5FT
 Anz1XcMuZ5eElIM008kCMq1Vg4t0tRTN1YyPOYEo0QGqF3mU/TtzO0KVO7oLBF8AuyIU
 mzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fJZf4EpsHvFbqlvRa5QjsrvKAC2y+Hv24E/qLw9S6Y0=;
 b=jY9CoNhVDmof4pVVfjnV+SZVlp71lth5lsMfTR+yJ90kvq4JG4STlN/YnCMlSjm5Uq
 f6UVUNtb/Pe1dkUB21Xxd4qPxCwAJar+lMf368pQ5iVSQ60bC5qwiq0umlXMP3S4hRQA
 DjraK+aEgdc/4+HV8rQ10l79WZ6QpV6pWdhaDmG8zBtLlgJa8zqMJZ0CGwBg8c1bV/AI
 t4Naasw4EFLNlFWP0HcH67XdQv1VDg9Vuetx15m9XNAVk7PiqdkbotipKiVbhRc8ajtV
 BTRFqN0UBe0ku+SGlwmxl82Wg4kSmZPUQ4BSM9nDanspiV/atv5hcmdlUaa51egVws7D
 jsYw==
X-Gm-Message-State: AOAM530pz3pmKeCDRFjvntTMU+Z0hVjCxiBZKZxabiZbhtiJpUqf7+iP
 lmKxtkRXt1uxYvr8sVEgDEBOC6OpZLSjSsaP
X-Google-Smtp-Source: ABdhPJx45DrUtZgrN21gAyyko+VAVSHIqekcneDDSbrAP9v1vScRj/ITBlcrk5zgJGnmS+hLS6jAYw==
X-Received: by 2002:adf:f510:: with SMTP id q16mr5611247wro.343.1618688527958; 
 Sat, 17 Apr 2021 12:42:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c12sm17304374wro.6.2021.04.17.12.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 12:42:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] queue of proposed rc4 fixes
Date: Sat, 17 Apr 2021 20:41:58 +0100
Message-Id: <20210417194205.17057-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This pullreq contains fixes for the remaining "not fixed yet" issues
in the 6.0 Planning page:
 * Fix compile failures of C++ files with new glib headers
 * mps3-an547: Use correct Cortex-M55 CPU and don't disable its FPU
 * accel/tcg: Fix assertion failure executing from non-RAM with -icount

None of these are 100% rc4-worthy on their own, but taken all together
I think they justify rolling another release candidate.

thanks
-- PMM

The following changes since commit 8fe9f1f891eff4e37f82622b7480ee748bf4af74:

  Update version for v6.0.0-rc3 release (2021-04-14 22:06:18 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210417

for you to fetch changes up to 277aed998ac2cd3649bf0e13b22f47769519eb61:

  accel/tcg: avoid re-translating one-shot instructions (2021-04-17 18:51:14 +0100)

----------------------------------------------------------------
Fixes for rc4:
 * Fix compile failures of C++ files with new glib headers
 * mps3-an547: Use correct Cortex-M55 CPU and don't disable its FPU
 * accel/tcg: Fix assertion failure executing from non-RAM with -icount

----------------------------------------------------------------
Alex Bennée (2):
      target/arm: drop CF_LAST_IO/dc->condjump check
      accel/tcg: avoid re-translating one-shot instructions

Paolo Bonzini (2):
      osdep: include glib-compat.h before other QEMU headers
      osdep: protect qemu/osdep.h with extern "C"

Peter Maydell (3):
      include/qemu/osdep.h: Move system includes to top
      hw/arm/armsse: Give SSE-300 its own Property array
      hw/arm/armsse: Make SSE-300 use Cortex-M55

 include/qemu/compiler.h   |  6 ++++++
 include/qemu/osdep.h      | 38 +++++++++++++++++++++++++++++---------
 accel/tcg/translate-all.c |  2 +-
 hw/arm/armsse.c           | 24 +++++++++++++++++++-----
 target/arm/translate.c    |  5 -----
 disas/arm-a64.cc          |  2 +-
 disas/nanomips.cpp        |  2 +-
 7 files changed, 57 insertions(+), 22 deletions(-)

