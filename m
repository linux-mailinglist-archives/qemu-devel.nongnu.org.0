Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC03514F2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:57:55 +0200 (CEST)
Received: from localhost ([::1]:57722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwtX-0003X5-10
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrW-0001gx-6K
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:55:50 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:37826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lRwrU-0002xB-Bz
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:55:49 -0400
Received: by mail-oi1-x236.google.com with SMTP id k25so1672258oic.4
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5RkNLC5WI+uRZhYZKVcGch990QPAIEFOdI+kgFgPscg=;
 b=lySFpGRpFCVhpkTG1mIVxCwCe8MRPa62h/Le11fY7EqzwuGNrwJhQG4cRaGPOHdxmZ
 h9vVeRoRC+jSMN1cthB/X5YdIecNtksl2l5wG5BqT9I8Il9HE1zW/hFZeohBaQgR7Tkc
 L1JXvF59SjKXt7CWHnVpMAU3r3BFUG44z+5nBiSY9UWhebXYoNOF/+58OxcSxO7iIlV1
 6VCK/YjD3wz2zerjmQLMJ1EbWmQx+3foChOhCao5lEjJCnCcouCQAogH6OxqDnKRb/7Z
 R8Sa+lRnv2mH37jPpsRWThVBmbbve6a0b/5BA36stiEDoI9iHXME4Jyph7Td4mfgvbme
 ChpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5RkNLC5WI+uRZhYZKVcGch990QPAIEFOdI+kgFgPscg=;
 b=LIuVAD7M8zQ/Eds09PYEiutKwl/VCUe0CJagR4wbayXezYTfmpk57UWsCoeBf7AURY
 JfkbZfxS5XO5vuCiIfzElj34qWZ03B/52iCpe1AeKteDS+qlON+e1uwICK280enQ3PyG
 XDOGDfuryiRSxSi+eATzFCYPWdq6+F0uRNYJxdeDNNLYYQI7FzCgfTDs666bxFFtpfFx
 Ph7xRYUkLPt764EgMbOK8WmmFeOyIvJicMguj2R8X4YvUVgwnkgPTB6A272dvTg0kEV3
 dt1EV1ZdNv65vBBuGKf9Unt5rDN6coUHTszZFkES2WCUkx2Kp2EA+kZrYI9wn6ozwXY+
 9Lbg==
X-Gm-Message-State: AOAM531xEYyJG37R4M5Df2057gKwAooBorWgNytX03vJmBiwV9y5E+lV
 JiOU/05RhGP2bsfceKsjJuaNJEeCDiUdbCE=
X-Google-Smtp-Source: ABdhPJyqvas8G/RV91W4iY/+GUTQ6C3yHZ3E8QQbAh8r+t0iPtEwWpqI22jJAqysCMObutywl5xJhg==
X-Received: by 2002:aca:1909:: with SMTP id l9mr5825428oii.144.1617281747188; 
 Thu, 01 Apr 2021 05:55:47 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id w11sm1082245ooc.35.2021.04.01.05.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 05:55:46 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization support
Date: Thu,  1 Apr 2021 12:55:32 +0000
Message-Id: <cover.1617281290.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=haibo.xu@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 abologna@redhat.com, Haibo Xu <haibo.xu@linaro.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
  - Move the NV to a CPU feature flag(Andrea&Andrew)
  - Add CPU feature 'el2' test(Andrew)

Many thanks to Andrea and Andrew for their comments!

This series add support for ARMv8.3/8.4 nested virtualization support
in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and 
has been tested on a FVP model to run a L2 guest with Qemu. Now the 
feature can be enabled by "-M virt,accel=kvm -cpu host,el2=on" when
starting a VM. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=kvm-arm64/nv-5.12-WIP

Haibo Xu (6):
  Update linux header with new arm64 NV macro
  target/arm/kvm: Add helper to detect el2 when using KVM
  target/arm/kvm: Add an option to turn on/off el2 support
  hw/intc/arm_gicv3: Enable support for setting vGIC maintenance IRQ
  target/arm/cpu: Enable 'el2' to work with host/max cpu
  target/arm: Add vCPU feature 'el2' test.

 hw/arm/virt.c                      | 19 ++++++++---
 hw/intc/arm_gicv3_common.c         |  1 +
 hw/intc/arm_gicv3_kvm.c            | 16 +++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 linux-headers/asm-arm64/kvm.h      |  2 ++
 linux-headers/linux/kvm.h          |  1 +
 target/arm/cpu.c                   | 14 +++++++-
 target/arm/cpu.h                   |  4 +++
 target/arm/cpu64.c                 | 53 ++++++++++++++++++++++++++++++
 target/arm/kvm64.c                 | 15 +++++++++
 target/arm/kvm_arm.h               | 13 ++++++++
 target/arm/monitor.c               |  2 +-
 tests/qtest/arm-cpu-features.c     |  9 +++++
 13 files changed, 144 insertions(+), 6 deletions(-)

-- 
2.17.1


