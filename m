Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47560623A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:52:26 +0200 (CEST)
Received: from localhost ([::1]:48742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVyC-0003Ve-6U
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:52:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVcI-0003Dh-K6
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYf-0001Dm-VL
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:00 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYa-0000xe-Kz
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:21:57 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so2187617wmr.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=EWH6+rhX4iPtONF+FGM5U6kXIXdS0ySHKPBFYEYaYeE=;
 b=wiixe9mBZRKp//QW26ZpbKXqnZXupVJ88/f7SZ3gEAzNyLT4fDyIC4u1tIn+37/Vji
 UdpFwxSp0VBD4Pmzzf17K1ImacqX3/xZ3FmRzm8cdPG7HClMuLizrLyoXDxq1acyvMJr
 FVD5bRG35gsAiLdm3mcKddsmVDfPdr5EeBetvhmE1gd9Q4PQKAE3xSVxpwMya+Ec3u4K
 2+QlWwB26fgfGsAc3zRcIbv5h3n/tqj4nS0ci9MHEWaCocZZkZZqaG+8p231DX4iNXXR
 +drLnknHnMOFIvqEVWRTnJpL1TypoSPaGZcEnDnH94zeOb/nyTJP0A8z45tvqzsROXqN
 bd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EWH6+rhX4iPtONF+FGM5U6kXIXdS0ySHKPBFYEYaYeE=;
 b=GW5zFdj4dMT5CbH+QLb0YzBMOLZJl0s4VA7030czsYzZ+CmGiI+q+y44q9jxgRzJgo
 tW9x/eW/8QuQrMAoS7Xdtcj/HqWHJrxYKuoEO4gMwcCR8Ea+/8A8csfNPdAz89k4YvhK
 q5teF7bFhx1QqrGKaQpgyXjQj90CXNK793TBtebHjf2iNBjFFkyxVAohcSIuuVjf/n7S
 kkTUPjE2kxGbYO49jKVLpawgn2tlJAfS3fTN+HhaqmnWkB0QID9kCfft2sFpRrkEK1kd
 2wFxl93y59prUYNt8aWxl0CM3ZhABGdwfzZ1aZiQ3EE/Ni+ac/5j7HvHD7Eh6joKMXgw
 BCEQ==
X-Gm-Message-State: ACrzQf2Sb/0sh4jaH8qyMHuf1dHj5prJwfhjRXrtd2sigDzgEIDsdbKc
 rHtd61r8Vbq9UOKMLvCMzkUIM1mI1sZ8yQ==
X-Google-Smtp-Source: AMsMyM5h1xYbj1sxi34JrSSW1+3QlthbW4qWwYGRmXFl9w/K4DInB8WXqlb62utbJI58KsUUEkvuZw==
X-Received: by 2002:a05:600c:1c1e:b0:3c6:e39f:e62f with SMTP id
 j30-20020a05600c1c1e00b003c6e39fe62fmr9376652wms.69.1666268509013; 
 Thu, 20 Oct 2022 05:21:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.21.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:21:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/24] target-arm queue
Date: Thu, 20 Oct 2022 13:21:22 +0100
Message-Id: <20221020122146.3177980-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; here's the latest arm pullreq. This is mostly patches from
RTH, plus a couple of other more minor things. Switching to
PCREL is the big one, hopefully should improve performance.

thanks
-- PMM

The following changes since commit 214a8da23651f2472b296b3293e619fd58d9e212:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-10-18 11:14:31 -0400)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221020

for you to fetch changes up to 5db899303799e49209016a93289b8694afa1449e:

  hw/ide/microdrive: Use device_cold_reset() for self-resets (2022-10-20 12:11:53 +0100)

----------------------------------------------------------------
target-arm queue:
 * Switch to TARGET_TB_PCREL
 * More pagetable-walk refactoring preparatory to HAFDBS
 * update the cortex-a15 MIDR to latest rev
 * hw/char/pl011: fix baud rate calculation
 * hw/ide/microdrive: Use device_cold_reset() for self-resets

----------------------------------------------------------------
Alex Bennée (1):
      target/arm: update the cortex-a15 MIDR to latest rev

Baruch Siach (1):
      hw/char/pl011: fix baud rate calculation

Peter Maydell (1):
      hw/ide/microdrive: Use device_cold_reset() for self-resets

Richard Henderson (21):
      target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
      target/arm: Use probe_access_full for MTE
      target/arm: Use probe_access_full for BTI
      target/arm: Add ARMMMUIdx_Phys_{S,NS}
      target/arm: Move ARMMMUIdx_Stage2 to a real tlb mmu_idx
      target/arm: Restrict tlb flush from vttbr_write to vmid change
      target/arm: Split out S1Translate type
      target/arm: Plumb debug into S1Translate
      target/arm: Move be test for regime into S1TranslateResult
      target/arm: Use softmmu tlbs for page table walking
      target/arm: Split out get_phys_addr_twostage
      target/arm: Use bool consistently for get_phys_addr subroutines
      target/arm: Introduce curr_insn_len
      target/arm: Change gen_goto_tb to work on displacements
      target/arm: Change gen_*set_pc_im to gen_*update_pc
      target/arm: Change gen_exception_insn* to work on displacements
      target/arm: Remove gen_exception_internal_insn pc argument
      target/arm: Change gen_jmp* to work on displacements
      target/arm: Introduce gen_pc_plus_diff for aarch64
      target/arm: Introduce gen_pc_plus_diff for aarch32
      target/arm: Enable TARGET_TB_PCREL

 target/arm/cpu-param.h         |  17 +-
 target/arm/cpu.h               |  47 ++--
 target/arm/internals.h         |   1 +
 target/arm/sve_ldst_internal.h |   1 +
 target/arm/translate-a32.h     |   2 +-
 target/arm/translate.h         |  66 ++++-
 hw/char/pl011.c                |   2 +-
 hw/ide/microdrive.c            |   8 +-
 target/arm/cpu.c               |  23 +-
 target/arm/cpu_tcg.c           |   4 +-
 target/arm/helper.c            | 155 +++++++++---
 target/arm/mte_helper.c        |  62 ++---
 target/arm/ptw.c               | 535 +++++++++++++++++++++++++----------------
 target/arm/sve_helper.c        |  54 ++---
 target/arm/tlb_helper.c        |  24 +-
 target/arm/translate-a64.c     | 220 ++++++++++-------
 target/arm/translate-m-nocp.c  |   8 +-
 target/arm/translate-mve.c     |   2 +-
 target/arm/translate-vfp.c     |  10 +-
 target/arm/translate.c         | 284 +++++++++++++---------
 20 files changed, 918 insertions(+), 607 deletions(-)

