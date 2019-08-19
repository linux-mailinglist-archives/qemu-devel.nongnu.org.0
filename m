Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC5E923D7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 14:50:56 +0200 (CEST)
Received: from localhost ([::1]:49536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzh7f-0001oU-Lm
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 08:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1hzgbG-00038A-K8
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:17:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hzgbE-0007E2-1m
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:17:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42679)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hzgb5-000772-1Y
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:17:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id b16so8481500wrq.9
 for <qemu-devel@nongnu.org>; Mon, 19 Aug 2019 05:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XpJQyqt9eVkw4Ky9gzCatUZlRhl2+fQ2Ask93O4jv04=;
 b=Oqjg7vna3C9SkkeU0UDSWBOASer49pTtcJ9FgSUA959qYpBVEy3F9vWkpPAeMng7IK
 6fNrA24erzgQp6/VMQi+LqtEj1xmZVnT833+PdWVGBlxkhIw2mxaOKfpzhNLRPS4IFc/
 snW9iMQrVbQHhq0SVLvAz4TIRz8Av6SKoNHHUyUaBOWmRjoGWhyXo/hdtMfFadcj2Bi1
 ckwQW3+RIrr0iX6PrLifH/gavNJW7kxxuxpRfbKWO7AGY2vTWoaSx9SNNDn01p5K8oJQ
 WQuhzKq8wtiY2CGJkSlihSmH7FFESOpoE+yt7Xi224VT1D9NynvP32ZFTjLl9p3DiRfT
 7cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XpJQyqt9eVkw4Ky9gzCatUZlRhl2+fQ2Ask93O4jv04=;
 b=cPlnTi+SvUVmKS3L/iuB3ZsQh15evuJAoqJVk42sIFfWU63YnjlbzpV1FCRrVnuvpf
 H+usdkmrQuJ/8VM5qvZRmRhb2WvPvupq6ujg1mWV57giGg92sp2TRpzoROGfVnHCc3v7
 Z8czXIuOv5dVnzlCLTlPxHLVjRIoiwvOs4XvnkZBCKenH4qMRNGN3DhxxZ1oD7I/9Fep
 0apcdRoHA2Hc5JfgrmWIBXlQtMvFIF5QBH/rUd26rzIEPV5nNV1U2s90vXvEJp1Tz80h
 3DU9yb6Uxt/3j/07qzPWzeHZuoxeX8XxwZVik2IMlPtpzN0H/DJJI9qLZDznFqu4Rkl8
 5oxw==
X-Gm-Message-State: APjAAAWG2kR8VX8mnEUhYewSZUoJiymB92+1VP9fhc3ns5tqalvlXOEY
 1YwcwC/eU2428qfxGgGnjbaN9g==
X-Google-Smtp-Source: APXvYqzDOPGh9c70jiSIPIlCYEfwEmtueJOoxFwaIRHXsEDI8DBJu1JpnVW25LM5FHLvTafg3unzyw==
X-Received: by 2002:a5d:4ec6:: with SMTP id s6mr841462wrv.327.1566217030963;
 Mon, 19 Aug 2019 05:17:10 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id f18sm15797290wrx.85.2019.08.19.05.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 05:17:10 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E495C1FF87;
 Mon, 19 Aug 2019 13:17:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Mon, 19 Aug 2019 13:16:57 +0100
Message-Id: <20190819121709.31597-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::436
Subject: [Qemu-devel] [PULL 00/12] softfloat header updates
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit afd760539308a5524accf964107cdb1d54a059e3:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190816' into staging (2019-08-16 17:21:40 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-softfloat-headers-190819-1

for you to fetch changes up to 5f8ab0004e878a6cd0f50fa8659df4a4f853eea8:

  targets (various): use softfloat-helpers.h where we can (2019-08-19 12:07:13 +0100)

----------------------------------------------------------------
Softfloat updates

  - minor refactoring of constants
  - drop LIT64 macro
  - re-organise header inclusion

----------------------------------------------------------------
Alex Bennée (12):
      fpu: replace LIT64 usage with UINT64_C for specialize constants
      fpu: convert float[16/32/64]_squash_denormal to new modern style
      fpu: use min/max values from stdint.h for integral overflow
      fpu: replace LIT64 with UINT64_C macros
      target/m68k: replace LIT64 with UINT64_C macros
      fpu: remove the LIT64 macro
      fpu: move inline helpers into a separate header
      fpu: make softfloat-macros "self-contained"
      fpu: rename softfloat-specialize.h -> .inc.c
      target/mips: rationalise softfloat includes
      target/riscv: rationalise softfloat includes
      targets (various): use softfloat-helpers.h where we can

 ...oat-specialize.h => softfloat-specialize.inc.c} |  26 +-
 fpu/softfloat.c                                    | 264 ++++++++++-----------
 include/fpu/softfloat-helpers.h                    | 132 +++++++++++
 include/fpu/softfloat-macros.h                     |   8 +-
 include/fpu/softfloat.h                            |  65 +----
 linux-user/mips/cpu_loop.c                         |   1 +
 target/alpha/helper.c                              |   2 +-
 target/m68k/softfloat.c                            |  98 ++++----
 target/microblaze/cpu.c                            |   2 +-
 target/mips/cpu.h                                  |   8 +-
 target/mips/internal.h                             |   7 +
 target/mips/msa_helper.c                           |   1 +
 target/mips/op_helper.c                            |   1 +
 target/riscv/cpu.c                                 |   1 +
 target/riscv/cpu.h                                 |   2 +-
 target/riscv/fpu_helper.c                          |   1 +
 target/s390x/cpu.c                                 |   2 +-
 target/sh4/cpu.c                                   |   3 +-
 target/tricore/helper.c                            |   2 +-
 target/unicore32/cpu.c                             |   1 -
 20 files changed, 342 insertions(+), 285 deletions(-)
 rename fpu/{softfloat-specialize.h => softfloat-specialize.inc.c} (98%)
 create mode 100644 include/fpu/softfloat-helpers.h

-- 
2.20.1


