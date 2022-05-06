Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823A51DD8A
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 18:23:59 +0200 (CEST)
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn0kH-0007iU-QQ
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 12:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0i0-0005NK-U8
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:21:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0hy-00051c-4e
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:21:36 -0400
Received: by mail-wr1-x433.google.com with SMTP id e2so10684732wrh.7
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 09:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ydvGhN0t90iiq5XA2T/fENqieiHK1rfWLY/HogNzzMQ=;
 b=Mg1+TFFFhlicPhHTToZ8ET0LfFBc8QkCedXw+yYmQmix3Xh2BqQ/Lthm84MaMAYwAz
 JaHMMgAIvQPmbfsecuCLNudP5mssHBrQ8jiGGx1b5ZlyFvBsXBuMuw/GcddfdUhYenaa
 ZUiAgvaxhkFlp0WoIOZl5oJimOIIwS1sUMPPdkGZeZj5U0UGjs+P5dtMUF7PQ8LoX0VV
 7AE2akSGDCX89lE+gQKbComrajdqHXmMGHwyafCT1nVqcYB9lMDVkKM5ybek4lQqcqUO
 tJi9hAOxKDZj2MIr2I0NbOv+MEI5Nq90yjvurwvIRRz52LZ8kVB4IgL1vmF+jmw9a8aL
 Br8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ydvGhN0t90iiq5XA2T/fENqieiHK1rfWLY/HogNzzMQ=;
 b=2Z9wgq8qYYBdkU8uN56rsB2J/wUwYlveyEmVbYwrawEDOpWiOVEMb6hwQeG/Pii/zp
 ABiEZXCRTUcM1Tcg0uYrYJtjs8cfvfXSJf9rJXelGt/HbgnH5xR3dXDxv5FFBa9Qw3zP
 shC2Ghtu2sAKpz8f/v138rPfvhFGqxPT9Ms9twF7YoGhphYxewZ5K7KTpe78RHZI+rF6
 q9dJ315VNus2xo0lpx0sW/4LcE4KM0MRlLB0cK0c6FeeMHISKN6xBzOm8qT67LzgwIRN
 x7girl/3zJiwhYiU9BL6f0P/mNp24v+FD4dyPIccsus4DbySJbYTMCeOtZ0zrqm4Jtbi
 SieQ==
X-Gm-Message-State: AOAM5313IzYAU+Eqd+0w4K3z3wzj/dKhoGxv5fXFv+cPrDX/+2uNdqy8
 Tn5GXr6psVYdEOtr7DwlM1E138ke04SfIQ==
X-Google-Smtp-Source: ABdhPJwfl21HFJPoxzdId8MNtm5RinorC94CQb0EWW8ItfMIY4Ka6ndMdF6GKTbqOkQSyxoa/38WSw==
X-Received: by 2002:a05:6000:168b:b0:20c:54e5:7beb with SMTP id
 y11-20020a056000168b00b0020c54e57bebmr3282395wrd.223.1651854091733; 
 Fri, 06 May 2022 09:21:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4482000000b0020c5253d926sm3782082wrq.114.2022.05.06.09.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:21:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] gicv3: Use right number of prio bits for the CPU
Date: Fri,  6 May 2022 17:21:24 +0100
Message-Id: <20220506162129.2896966-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

This patchset fills in an odd inconsistency in our GICv3 emulation
that I noticed while I was doing the GICv4 work. At the moment we
allow the CPU to specify the number of bits of virtual priority
(via the ARMCPU::gic_vpribits field), but we always use 8 bits of
physical priority, even though to my knowledge no real Arm CPU
hardware has that many.

This series makes the GICv3 emulation use a runtime-configurable
number of physical priority bits, and sets it to match the number
used by the various CPUs we implement (which is 5 for all the
Cortex-Axx CPUs we emulate). Because changing the number of
priority bits is a migration compatibility break, we use a compat
property to keep the number of priority bits at 8 for older
versions of the virt board.

There is one TODO left in this series, which is that I don't know
the right value to use for the A64FX, so I've guessed that it
is 5, like all the Arm implementations.

Patch 1 is an independent bugfix; patch 5 is cleanup.

thanks
-- PMM

Peter Maydell (5):
  hw/intc/arm_gicv3: report correct PRIbits field in ICV_CTLR_EL1
  hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
  hw/intc/arm_gicv3: Support configurable number of physical priority
    bits
  hw/intc/arm_gicv3: Use correct number of priority bits for the CPU
  hw/intc/arm_gicv3: Provide ich_num_aprs()

 include/hw/intc/arm_gicv3_common.h |   8 +-
 target/arm/cpu.h                   |   1 +
 hw/core/machine.c                  |   4 +-
 hw/intc/arm_gicv3_common.c         |   5 +
 hw/intc/arm_gicv3_cpuif.c          | 208 ++++++++++++++++++++---------
 hw/intc/arm_gicv3_kvm.c            |  16 ++-
 target/arm/cpu64.c                 |   9 ++
 7 files changed, 179 insertions(+), 72 deletions(-)

-- 
2.25.1


