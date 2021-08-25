Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C9A3F7367
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:37:13 +0200 (CEST)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqHQ-0005bn-7P
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFy-0002im-VL
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:42 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqFv-0005Dp-QQ
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:42 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so3936160wme.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4b06IH0vqhNW/e8nrN/lgZ3UjT5LoZWUT/XSJ5RpfvA=;
 b=tizVttIyeBXvMhwNYr/eHzJGbs4/XD690vCANWVXSrEgnVo7APjoWcOxg9cabXyFpY
 Ecau4eC7Jf43mVBxFEwMg1C94C9vzuoWkZbDyZ6Obx8W17fwnRWwPGQqQ7uURRwpNUxG
 txRogf30/CQeCLEogXqAdBjzHFfZc4v2PZa1PRSUW0ikfbmmv8jErPSU0NDjAO4QhVdL
 1XQOIB1kJy3SzTeQtKvWF1kueQEYhz8KGaGTzSHqs9gFavwE0E0hzJN5+R3iXPvO2cmx
 c35XUDnZ2DiQOLSp7MPGx39+2GKwf7T7u0uoPAdOqVxSgjy/yJYFSdxL1/0ZRjDYETRe
 fR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4b06IH0vqhNW/e8nrN/lgZ3UjT5LoZWUT/XSJ5RpfvA=;
 b=c7qWONRI00egK1wxz19LQqMe0iOoU+rD9RTCTMN/1wQCA0C/OCFmQnMM3D5OSYXeIe
 4FQdH05rLrzjO0FG/Ke/A407tQUkIR0+ggougDM9u+eHyZkQB75jJHcqVOnRKYeWfD2K
 +4xVFU/makXUSZ33Ki0aUzANdsC3UNmpxQ5Jy9jYO3zaSZAV2eC6EIC+wX+UHWWDhbN0
 +CyLCdED5ol26NY6CvmJB0llJn/QzEWtJ1/zom+xA/3v8dq66faHiNDxdQL9DqpIU4Kf
 MBxzetc+P5wbY4QWtKIMvGmi8FM8assjt4i7Iem2rDANHU3I5If4cgeCfWdW1ed+wqTy
 AG9g==
X-Gm-Message-State: AOAM531vHIhBn66cGfA8SzPF42Is2tEHFuS+7uUSJSVZOHmxaSdys3XX
 VPdlkf7tuL/sifL4B2ZsQ9MXEcHkrMiaGA==
X-Google-Smtp-Source: ABdhPJyyBJBLWfdcdxHWcN/LTExvImBb4+8BZnvKrj53xiFfM++GQcuT6JdA/PowHAx/bmkW7Ik7FA==
X-Received: by 2002:a05:600c:1991:: with SMTP id
 t17mr8513142wmq.120.1629887736830; 
 Wed, 25 Aug 2021 03:35:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/44] target-arm queue
Date: Wed, 25 Aug 2021 11:34:50 +0100
Message-Id: <20210825103534.6936-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

First set of arm patches for 6.2. I have a lot more in my
to-review queue still...

-- PMM

The following changes since commit d42685765653ec155fdf60910662f8830bdb2cef:

  Open 6.2 development tree (2021-08-25 10:25:12 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210825

for you to fetch changes up to 24b1a6aa43615be22c7ee66bd68ec5675f6a6a9a:

  docs: Document how to use gdb with unix sockets (2021-08-25 10:48:51 +0100)

----------------------------------------------------------------
target-arm queue:
 * More MVE emulation work
 * Implement M-profile trapping on division by zero
 * kvm: use RCU_READ_LOCK_GUARD() in kvm_arch_fixup_msi_route()
 * hw/char/pl011: add support for sending break
 * fsl-imx6ul: Instantiate SAI1/2/3 and ASRC as unimplemented devices
 * hw/dma/pl330: Add memory region to replace default
 * sbsa-ref: Rename SBSA_GWDT enum value
 * fsl-imx7: Instantiate SAI1/2/3 as unimplemented devices
 * docs: Document how to use gdb with unix sockets

----------------------------------------------------------------
Eduardo Habkost (1):
      sbsa-ref: Rename SBSA_GWDT enum value

Guenter Roeck (2):
      fsl-imx6ul: Instantiate SAI1/2/3 and ASRC as unimplemented devices
      fsl-imx7: Instantiate SAI1/2/3 as unimplemented devices

Hamza Mahfooz (1):
      target/arm: kvm: use RCU_READ_LOCK_GUARD() in kvm_arch_fixup_msi_route()

Jan Luebbe (1):
      hw/char/pl011: add support for sending break

Peter Maydell (37):
      target/arm: Note that we handle VMOVL as a special case of VSHLL
      target/arm: Print MVE VPR in CPU dumps
      target/arm: Fix MVE VSLI by 0 and VSRI by <dt>
      target/arm: Fix signed VADDV
      target/arm: Fix mask handling for MVE narrowing operations
      target/arm: Fix 48-bit saturating shifts
      target/arm: Fix MVE 48-bit SQRSHRL for small right shifts
      target/arm: Fix calculation of LTP mask when LR is 0
      target/arm: Factor out mve_eci_mask()
      target/arm: Fix VPT advance when ECI is non-zero
      target/arm: Fix VLDRB/H/W for predicated elements
      target/arm: Implement MVE VMULL (polynomial)
      target/arm: Implement MVE incrementing/decrementing dup insns
      target/arm: Factor out gen_vpst()
      target/arm: Implement MVE integer vector comparisons
      target/arm: Implement MVE integer vector-vs-scalar comparisons
      target/arm: Implement MVE VPSEL
      target/arm: Implement MVE VMLAS
      target/arm: Implement MVE shift-by-scalar
      target/arm: Move 'x' and 'a' bit definitions into vmlaldav formats
      target/arm: Implement MVE integer min/max across vector
      target/arm: Implement MVE VABAV
      target/arm: Implement MVE narrowing moves
      target/arm: Rename MVEGenDualAccOpFn to MVEGenLongDualAccOpFn
      target/arm: Implement MVE VMLADAV and VMLSLDAV
      target/arm: Implement MVE VMLA
      target/arm: Implement MVE saturating doubling multiply accumulates
      target/arm: Implement MVE VQABS, VQNEG
      target/arm: Implement MVE VMAXA, VMINA
      target/arm: Implement MVE VMOV to/from 2 general-purpose registers
      target/arm: Implement MVE VPNOT
      target/arm: Implement MVE VCTP
      target/arm: Implement MVE scatter-gather insns
      target/arm: Implement MVE scatter-gather immediate forms
      target/arm: Implement MVE interleaving loads/stores
      target/arm: Re-indent sdiv and udiv helpers
      target/arm: Implement M-profile trapping on division by zero

Sebastian Meyer (1):
      docs: Document how to use gdb with unix sockets

Wen, Jianxian (1):
      hw/dma/pl330: Add memory region to replace default

 docs/system/gdb.rst        |   26 +-
 include/hw/arm/fsl-imx7.h  |    5 +
 target/arm/cpu.h           |    1 +
 target/arm/helper-mve.h    |  283 ++++++++++
 target/arm/helper.h        |    4 +-
 target/arm/translate-a32.h |    2 +
 target/arm/vec_internal.h  |   11 +
 target/arm/mve.decode      |  226 +++++++-
 target/arm/t32.decode      |    1 +
 hw/arm/exynos4210.c        |    3 +
 hw/arm/fsl-imx6ul.c        |   12 +
 hw/arm/fsl-imx7.c          |    7 +
 hw/arm/sbsa-ref.c          |    6 +-
 hw/arm/xilinx_zynq.c       |    3 +
 hw/char/pl011.c            |    6 +
 hw/dma/pl330.c             |   26 +-
 target/arm/cpu.c           |    3 +
 target/arm/helper.c        |   34 +-
 target/arm/kvm.c           |   17 +-
 target/arm/m_helper.c      |    4 +
 target/arm/mve_helper.c    | 1254 ++++++++++++++++++++++++++++++++++++++++++--
 target/arm/translate-mve.c |  877 ++++++++++++++++++++++++++++++-
 target/arm/translate-vfp.c |    2 +-
 target/arm/translate.c     |   37 +-
 target/arm/vec_helper.c    |   14 +-
 25 files changed, 2746 insertions(+), 118 deletions(-)

