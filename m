Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5373D739F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:49:47 +0200 (CEST)
Received: from localhost ([::1]:37300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Kef-0004GI-Pc
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd5-0001eE-Bz
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:07 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd3-0004rL-Gp
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id g15so14674956wrd.3
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vm8qkI5Fksw2oZJcXjM/ZMr+MZw51dyeLAEO49VBPmY=;
 b=fzXBuf73wSDfGTfJMQALf+KXisgVLb9wD1ezupo8bX7fPhChiO+3OZ+RveDU4VweiV
 m9WVVBnE5N5jI6PbRLLETz9D6ZRPPM7IcTx4wprrneoVzJZzZRWJ/kugmV0ygyhBCdvX
 C5+oQR9WRmKp+QshhE7duG1Cw/Cw3HtJiErp2Nr+LS+L8jb6naoHxQi+fYUBs7GZ0XT9
 +kypNM+Ap9J52n42x9Ef/iVyHPudwEXI1wiWd2otvnm8ekTjc6WBWZzFAHoLFAsuYnCO
 64tnIusnJDL60qbJwqbLrsG/XvCLglFHuOVM5NRaODnkakRnsEpDFHY9879OKjI7LAis
 SjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vm8qkI5Fksw2oZJcXjM/ZMr+MZw51dyeLAEO49VBPmY=;
 b=VHlXhJxf0diX+BbvyJ4r41C3b56lbISu/Lm7gfLePthfDRSz7L9azsIKckhBfRFBZE
 zLrHA0JUzdp0pmE472PmUJZk6Livf5ZKg5FdCSzyDbJcolxj9wwiFxJ2REzRPqHjHQXq
 mHfl6z9qRvC0//qdNaCTskjL14V5nbHWa/gCZ4SsHqfnsLvSNBdrbcyd0Zt1t+FmwKRh
 n7/sMk44CVmMY0vxVbEjeBloAvf6+Ug52FMTm9goJi9MZZnEg1fkwch0oPUxVDdOD3LW
 obWqlNODCEB9Kn7ONCsVw78dqvSQEeeVrsA/6eBHOLYLsOQnwM4mLET8iVXOpUd9sfnE
 1IzQ==
X-Gm-Message-State: AOAM533m0HfQC2u0MMd7/Y4Cw7/pykF80zRA00q8Rq2V0WjHy3/XEcF1
 f6WzJRHtjPDqD3YAm1J8CauhYT3v1J4qDA==
X-Google-Smtp-Source: ABdhPJySCfJg4+MNnO4nqxtTEw34KdcKajl/sYkiu4CsPvIE/FQ6vNCm3EM5mIUk4XTyDb8LaHHj7A==
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr14302430wri.52.1627382883456; 
 Tue, 27 Jul 2021 03:48:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] target-arm queue
Date: Tue, 27 Jul 2021 11:47:47 +0100
Message-Id: <20210727104801.29728-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

arm pullreq for rc1. All minor bugfixes, except for the sve-default-vector-length
patches, which are somewhere between a bugfix and a new feature.

thanks
-- PMM

The following changes since commit c08ccd1b53f488ac86c1f65cf7623dc91acc249a:

  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210726' into staging (2021-07-27 08:35:01 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20210727

for you to fetch changes up to e229a179a503f2aee43a76888cf12fbdfe8a3749:

  hw: aspeed_gpio: Fix memory size (2021-07-27 11:00:00 +0100)

----------------------------------------------------------------
target-arm queue:
 * hw/arm/smmuv3: Check 31st bit to see if CD is valid
 * qemu-options.hx: Fix formatting of -machine memory-backend option
 * hw: aspeed_gpio: Fix memory size
 * hw/arm/nseries: Display hexadecimal value with '0x' prefix
 * Add sve-default-vector-length cpu property
 * docs: Update path that mentions deprecated.rst
 * hw/intc/armv7m_nvic: for v8.1M VECTPENDING hides S exceptions from NS
 * hw/intc/armv7m_nvic: Correct size of ICSR.VECTPENDING
 * hw/intc/armv7m_nvic: ISCR.ISRPENDING is set for non-enabled pending interrupts
 * target/arm: Report M-profile alignment faults correctly to the guest
 * target/arm: Add missing 'return's after calling v7m_exception_taken()
 * target/arm: Enforce that M-profile SP low 2 bits are always zero

----------------------------------------------------------------
Joe Komlodi (1):
      hw/arm/smmuv3: Check 31st bit to see if CD is valid

Joel Stanley (1):
      hw: aspeed_gpio: Fix memory size

Mao Zhongyi (1):
      docs: Update path that mentions deprecated.rst

Peter Maydell (7):
      qemu-options.hx: Fix formatting of -machine memory-backend option
      target/arm: Enforce that M-profile SP low 2 bits are always zero
      target/arm: Add missing 'return's after calling v7m_exception_taken()
      target/arm: Report M-profile alignment faults correctly to the guest
      hw/intc/armv7m_nvic: ISCR.ISRPENDING is set for non-enabled pending interrupts
      hw/intc/armv7m_nvic: Correct size of ICSR.VECTPENDING
      hw/intc/armv7m_nvic: for v8.1M VECTPENDING hides S exceptions from NS

Philippe Mathieu-Daudé (1):
      hw/arm/nseries: Display hexadecimal value with '0x' prefix

Richard Henderson (3):
      target/arm: Correctly bound length in sve_zcr_get_valid_len
      target/arm: Export aarch64_sve_zcr_get_valid_len
      target/arm: Add sve-default-vector-length cpu property

 docs/system/arm/cpu-features.rst | 15 ++++++++++
 configure                        |  2 +-
 hw/arm/smmuv3-internal.h         |  2 +-
 target/arm/cpu.h                 |  5 ++++
 target/arm/internals.h           | 10 +++++++
 hw/arm/nseries.c                 |  2 +-
 hw/gpio/aspeed_gpio.c            |  3 +-
 hw/intc/armv7m_nvic.c            | 40 +++++++++++++++++++--------
 target/arm/cpu.c                 | 14 ++++++++--
 target/arm/cpu64.c               | 60 ++++++++++++++++++++++++++++++++++++++++
 target/arm/gdbstub.c             |  4 +++
 target/arm/helper.c              |  8 ++++--
 target/arm/m_helper.c            | 24 ++++++++++++----
 target/arm/translate.c           |  3 ++
 target/i386/cpu.c                |  2 +-
 MAINTAINERS                      |  2 +-
 qemu-options.hx                  | 30 +++++++++++---------
 17 files changed, 183 insertions(+), 43 deletions(-)

