Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8D2B6494
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:50:28 +0100 (CET)
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1NL-00050r-Ma
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Lc-0003Ns-Py
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:40 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1La-0001uT-OS
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:40 -0500
Received: by mail-wm1-x332.google.com with SMTP id 10so3326782wml.2
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L3Z8jXG2BnPxZEhfi0MgrQ41vpPqcERXYiZc9uYCSUU=;
 b=q8AOjE1g9yAxyW/JMz/Mmy5eQYRSW23clFQOdintVUFLGxr2BnTDcSMj0ybHQNxoTF
 ovisAwfDrK3ElIm7f9CDj/v2MCN03ediKjeJdhdTsN5607SteJ164u7VY80r3zs7HVDg
 9ky3bcxSZVVXZfwozvSZgdT9WMGTXhSAlfJEnhIWwtPkG0A3F6Z4KgfZMkcH+/sYJXkX
 wL5HyIrbV3IoR9w4XKRzkXaLs99AyysUdGX91AT8AeF4UQtO0D6agze8nx8VYD9gft1I
 qp1Ac8SJxQjpmETyhTkGnQYJmoKHviOmnP885BK7wVeD8Svxtu+akclyxwPgyYORS7oq
 n0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L3Z8jXG2BnPxZEhfi0MgrQ41vpPqcERXYiZc9uYCSUU=;
 b=rr5U8Nptvvy0j+cLrgQzofp35i6fcBiK+DDV4ZDN1gxI9mepAUVq9lpPbfTfSrtRlc
 0IJmoNFxh6JCXtk5U40qwoFHWi3HfAlH0bRHcf4lCv+N+bpOYzX9OuHPspN3CgnWKFFO
 GZEiyXElWEHq5yWt0SC9AAJElwSsktoanN7QYsLDYO4tvQxduBOoul71XMA2mEskuScW
 OdpVTvvx7A4HAyjj4STtK8WcJDZ/jtfZHvdz9l+jrm64563GKg/p9BmGDcUyPMGTZG8u
 E3HaABpwn98+ZzSvrIM0O613asOiFzijE/bBZEr2pMpNAsi0IPYooKpDNmYdSktEGzJA
 6naQ==
X-Gm-Message-State: AOAM530dFQbmGBBi8tnOUp8vN7HWlXsGB73AvmT4YDoXVYq2BSXzNeXH
 1wZKA88PDMg0JfdkntjkbELM4Uz3s3YHFA==
X-Google-Smtp-Source: ABdhPJzG58Y7E48VyqftpuH9bRvLcI0TVRQ15gpWN2/9x5/sw41XNmVMnECCrtOwkql3XdAfhmscXQ==
X-Received: by 2002:a1c:2e48:: with SMTP id u69mr4553081wmu.30.1605620916622; 
 Tue, 17 Nov 2020 05:48:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm3578630wmb.11.2020.11.17.05.48.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 05:48:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] target-arm queue
Date: Tue, 17 Nov 2020 13:48:25 +0000
Message-Id: <20201117134834.31731-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arm queue; bugfixes only.

thanks
-- PMM

The following changes since commit 48aa8f0ac536db3550a35c295ff7de94e4c33739:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2020-11-16' into staging (2020-11-17 11:07:00 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20201117

for you to fetch changes up to ab135622cf478585bdfcb68b85e4a817d74a0c42:

  tmp105: Correct handling of temperature limit checks (2020-11-17 12:56:33 +0000)

----------------------------------------------------------------
target-arm queue:
 * hw/arm/virt: ARM_VIRT must select ARM_GIC
 * exynos: Fix bad printf format specifiers
 * hw/input/ps2.c: Remove remnants of printf debug
 * target/openrisc: Remove dead code attempting to check "is timer disabled"
 * register: Remove unnecessary NULL check
 * util/cutils: Fix Coverity array overrun in freq_to_str()
 * configure: Make "does libgio work" test pull in some actual functions
 * tmp105: reset the T_low and T_High registers
 * tmp105: Correct handling of temperature limit checks

----------------------------------------------------------------
Alex Chen (1):
      exynos: Fix bad printf format specifiers

Alistair Francis (1):
      register: Remove unnecessary NULL check

Andrew Jones (1):
      hw/arm/virt: ARM_VIRT must select ARM_GIC

Peter Maydell (5):
      hw/input/ps2.c: Remove remnants of printf debug
      target/openrisc: Remove dead code attempting to check "is timer disabled"
      configure: Make "does libgio work" test pull in some actual functions
      hw/misc/tmp105: reset the T_low and T_High registers
      tmp105: Correct handling of temperature limit checks

Philippe Mathieu-Daudé (1):
      util/cutils: Fix Coverity array overrun in freq_to_str()

 configure                    | 11 +++++--
 hw/misc/tmp105.h             |  7 +++++
 hw/core/register.c           |  4 ---
 hw/input/ps2.c               |  9 ------
 hw/misc/tmp105.c             | 73 ++++++++++++++++++++++++++++++++++++++------
 hw/timer/exynos4210_mct.c    |  4 +--
 hw/timer/exynos4210_pwm.c    |  8 ++---
 target/openrisc/sys_helper.c |  3 --
 util/cutils.c                |  3 +-
 hw/arm/Kconfig               |  1 +
 10 files changed, 89 insertions(+), 34 deletions(-)

