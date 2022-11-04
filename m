Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721361956E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 12:36:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oquyr-00019i-Bg; Fri, 04 Nov 2022 07:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquyp-00018M-Da
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:23 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oquym-00084s-KN
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 07:35:23 -0400
Received: by mail-wr1-x434.google.com with SMTP id l14so6681726wrw.2
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=xs0cAzuJbQmpzNJTlX5CiKuU22tOMOycVjeYOqAoYLo=;
 b=LhZz1HNyIeLBRkVProbSsGXjTz+C7tOmXRiyqaiMTKZSj3/GlrWUz6kg6tfA5CR9Xh
 w3jUROFJpS1w/rUjgO96w+hMCvBi0R0fvjgOjGZm4S++iIKonjtB8Wc2Yzb6oZ69ujxW
 sFICQ4oU6j1rofFiYdBwceuucNMY6jCW/0pF+f23IjqdAxYe8HqEFEzBJ59YWcn8ApWz
 mCeK2tnfmQQFHtxSK5NMauaCXZQA36U5bbWkgcjg2C7cmR7//oOSo3kRCRCvlKDc8svP
 SGgszm6MKMgz/dFf56Vs88Z358TQOBAvankalJtljYq2J6p6Y7oaaGDX1yam4RGPquRi
 CZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xs0cAzuJbQmpzNJTlX5CiKuU22tOMOycVjeYOqAoYLo=;
 b=wpedG+agsxN+y1jIU7saOZoeVOr74Z/3bp0mAKdgryPwFeZ527EkdJ5YhoMdKqNUGu
 VfhHK36JzxevedWaUEXAzNjX8awc3SJBF1AHOnX0kKAHsQlmfEE6F22TbbOlrbtEpV0K
 3sz1X2dZVsaXTAZryR143PxV/0V26K0zG9SoZSrKrrJuX3cFHDIMPvwDXJmN+b6BpdBA
 aNImjxP+C51wYhXCcfgWu5xfGWv+wsuFkOT7mVaQ2DUBZ3KQuEUnMl0+IRBLLPcNyRfy
 MR0AeabUmf3w1DzsLq71cpiKD431MmsImUh1MXoqIFn17RnEy97RRCXKc8crdJgZLbB+
 S0Dw==
X-Gm-Message-State: ACrzQf3jyIfFaXM5siPKeJxuSvxifFYg0gsZAyEgYrWX2jNev7b3fs6Q
 c/3FRI0EicQk035atWsiGEsZ7AgIskJnDw==
X-Google-Smtp-Source: AMsMyM6OtyiFdNIvQuiftJ7qeyLgWrj7p+1gDpT8pReZtSVftqNx6Gf2oecq/9Y+NDj/30NJvdzJGg==
X-Received: by 2002:a5d:51c2:0:b0:236:7000:8e82 with SMTP id
 n2-20020a5d51c2000000b0023670008e82mr22011360wrv.191.1667561718435; 
 Fri, 04 Nov 2022 04:35:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a5d4891000000b0023655e51c33sm3255743wrq.4.2022.11.04.04.35.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 04:35:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] target-arm queue
Date: Fri,  4 Nov 2022 11:35:08 +0000
Message-Id: <20221104113515.2278508-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi; this pull request has a collection of bug fixes for rc0.
The big one is the trusted firmware boot regression fix.

thanks
-- PMM

The following changes since commit ece5f8374d0416a339f0c0a9399faa2c42d4ad6f:

  Merge tag 'linux-user-for-7.2-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-11-03 10:55:05 -0400)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221104

for you to fetch changes up to cead7fa4c06087c86c67c5ce815cc1ff0bfeac3a:

  target/arm: Two fixes for secure ptw (2022-11-04 10:58:58 +0000)

----------------------------------------------------------------
target-arm queue:
 * Fix regression booting Trusted Firmware
 * Honor HCR_E2H and HCR_TGE in ats_write64()
 * Copy the entire vector in DO_ZIP
 * Fix Privileged Access Never (PAN) for aarch32
 * Make TLBIOS and TLBIRANGE ops trap on HCR_EL2.TTLB
 * Set SCR_EL3.HXEn when direct booting kernel
 * Set SME and SVE EL3 vector lengths when direct booting kernel

----------------------------------------------------------------
Ake Koomsin (1):
      target/arm: Honor HCR_E2H and HCR_TGE in ats_write64()

Peter Maydell (3):
      hw/arm/boot: Set SME and SVE EL3 vector lengths when booting kernel
      hw/arm/boot: Set SCR_EL3.HXEn when booting kernel
      target/arm: Make TLBIOS and TLBIRANGE ops trap on HCR_EL2.TTLB

Richard Henderson (2):
      target/arm: Copy the entire vector in DO_ZIP
      target/arm: Two fixes for secure ptw

Timofey Kutergin (1):
      target/arm: Fix Privileged Access Never (PAN) for aarch32

 hw/arm/boot.c           |  5 ++++
 target/arm/helper.c     | 64 +++++++++++++++++++++++++++++--------------------
 target/arm/ptw.c        | 50 ++++++++++++++++++++++++++++----------
 target/arm/sve_helper.c |  4 ++--
 4 files changed, 83 insertions(+), 40 deletions(-)

