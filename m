Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49E599A6D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 13:11:28 +0200 (CEST)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOzuQ-0007N8-8H
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 07:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkM-0002CT-CC
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:06 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOzkG-0001Pz-7h
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 07:01:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n4so4736981wrp.10
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 04:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=WQxaEKCipo0MfjRykUTGIq/NJfiMMHNyqrHoy0wasXc=;
 b=VysPM6q5t5fpPWtwTWgT2Thb/lLmDsEUeIqusXONmN3eGXfHL8Qv3WHZOcSwejIrr6
 JHSgT2DwSUUsmfq/0p94nBz3AMuc9cF178pTUZEhxXC7k0n7QLg9ycsKgDMLu1vDYELT
 gSjDpgN5rr82FOVdvtXwq+JN3Y1flLkfTStYCR2G7NyXYfOlARjNHNr1ohZ2kXUJcFbD
 bhd06tEZjsKVnA9lUBKgbFPZHj9P5ayB1BTuiEv56ADgQOB41e1TbHcvAKtAWWjzci3z
 vHM6pSGV8Ti1IFbzwRgHpUiIuX6v+aBs40CcrL6ZAmwimLsmPHluVsUzA7imsjl7Xk0n
 jU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=WQxaEKCipo0MfjRykUTGIq/NJfiMMHNyqrHoy0wasXc=;
 b=xv6JUQzrJSpNX/dUtkOF3K+m64JZBCklLpPDqi7MWy7YX5ljH4/qatpTnqakMkbpB2
 DQ5Y8m7ZIYO1hXOEzov4dYIAmJJ1CIRKmjKcjS4Elm6/EIbYGLmP6g7t275Zkw+fbuC4
 AzeWNJtaEe+UmFB7LpI4e8LBUT+mdHo0hqgR95zCCoMLnYdi6VJIvUB8vF2+YPVFQ8ZU
 MGtH7LLmJWsLU7JrzrJ5uTYUwipPxxI83z2bjSxZJJSqHvvOi7eF8byC65rZmo5i3hQ1
 UuWRouryZ9a5580hw/yXG1rE887rzdGyUdJMsmfkooWFueOfPBCE1Fc0sAGMSdzRoZmy
 FWUg==
X-Gm-Message-State: ACgBeo1sLX83B0k86pvffwLZTUkm1fAZR+Oauw8QhKpHohB+Yof/loLr
 CBMHWGMfvBeyY+G/elQAObUiwQ==
X-Google-Smtp-Source: AA6agR66iy6G3eXDQKn8VUqjUugr6G8vV+sljq0kfEfWrpsqFaiHk+iFnsV+0fO4V/B5IoMRZUAVrg==
X-Received: by 2002:a5d:6712:0:b0:225:337c:3889 with SMTP id
 o18-20020a5d6712000000b00225337c3889mr2594264wru.59.1660906854294; 
 Fri, 19 Aug 2022 04:00:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a7bcc96000000b003a52969e89csm8154985wma.4.2022.08.19.04.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 04:00:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/6] target/arm: Fix v8 AArch32 RAZ ID regs; implement FEAT_ETS
Date: Fri, 19 Aug 2022 12:00:46 +0100
Message-Id: <20220819110052.2942289-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The main aim of this patchset is to implement FEAT_ETS.
FEAT_ETS provides tighter guarantees on some memory orderings
involving translation table walks that permit guest code to
skip the context-synchronization event they would otherwise
need to do after a TLB maintenance operation. QEMU already
provides the tighter guarantees this feature requires, so
all we need to do is advertise it in the ID registers...

...except that it turns out that for AArch32 this is done
in ID_MMFR5, which is a new-in-v8.6 register that we don't
implement yet. So we need to provide it. And while I was
doing that I noticed that we accidentally forgot to
implement a big chunk of the "reserved for future ID
registers, must RAZ" cp15 space for v8 AArch32. So the
big bit of the patchset is sorting that out :-)

thanks
-- PMM

Peter Maydell (6):
  target/arm: Make cpregs 0, c0, c{3-15}, {0-7} correctly RAZ in v8
  target/arm: Sort KVM reads of AArch32 ID registers into encoding order
  target/arm: Implement ID_MMFR5
  target/arm: Implement ID_DFR1
  target/arm: Advertise FEAT_ETS for '-cpu max'
  target/arm: Add missing space in comment

 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu.h              |  2 +
 target/arm/cpu64.c            |  1 +
 target/arm/cpu_tcg.c          |  6 ++-
 target/arm/helper.c           | 69 +++++++++++++++++++++++++++++++----
 target/arm/kvm64.c            |  8 +++-
 6 files changed, 77 insertions(+), 10 deletions(-)

-- 
2.25.1


