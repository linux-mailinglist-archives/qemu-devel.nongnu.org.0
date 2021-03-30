Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B0A34E910
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:27:48 +0200 (CEST)
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lREPL-0008NZ-Te
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENe-0006nF-Jy
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:02 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENb-0003b2-Lo
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:02 -0400
Received: by mail-wr1-x435.google.com with SMTP id o16so16299942wrn.0
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 06:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TYZaK7OyeUlHhTrryJ20sv2eIhToxq0FwiWh5jDZJds=;
 b=KfUisD/QqVfH31wGJVl5H4QP8Ts/j9UDfNqNp9moBlPyVaCeMmPZ3lUo74fxin5SiP
 g22guJq9AfEwH0xHQdVe/m28oWXfU8E+ExmO3imPFHELFELPBW3tiuauKyBSZMYcdKko
 9yj0ZV0RkpuaufZVnk9K81qRrpARgKNHgotDWgF9/jzLQ6pOI4pUaF/+xqgWXA1fJEo3
 M5WeI43G+3QTrY2gz8Bf8dhdP4egeGkiD0ScH9JNgIlC5m/Ku+cEw/ZflmpPQ4TiMbik
 Kfa/hg7AT92MFaY9rNkwIHBXNLWryBlCh8pARTuTSJJWxAgl6r5yoH3aik3ksKCZMJ57
 QeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TYZaK7OyeUlHhTrryJ20sv2eIhToxq0FwiWh5jDZJds=;
 b=nL+CponU3TMcqCFFegJaANYviwY/8JjEHhzTnHooduqF8BwW1bzxal+E45WCvRbbff
 5lLH+9eiGBTBiqfYPDtnXMAAbz8bVLc4Yixx9E1PHeuhQQzrmUzele52BirCOgTMLVsl
 QznM/u2lNwAjfKEcNfHZhcIqTuOlCQmld6dg9l5DtxEJE1+M9btOLiwdbt+wwJy6AnLb
 coWLAt6rweQjfPhp6R7HXqRosQxqdqJpC14uLaMsje17tdkgr4v8uZ7saq2A4pyi3Oe1
 9LOorTMK64cwcHMS/BsYxwvx9zq+e61LMuXFcZ2R0Xi6Rf3VeZJ7fZf9c+4jc3WCiSjT
 ddXw==
X-Gm-Message-State: AOAM531N7tBBgw0hsS2p8vqqgrxxG65mRCkZ5OgKHF8+HqhYMwfRiJ5j
 mNu+00Ni2mbH04kI7M+XAit02858k8mJPJFT
X-Google-Smtp-Source: ABdhPJxIxGz9uzdROIOWw3kVH6bSvogYfoRcR9YdphKjRZAvr+0RasTtM0spThJ7H19zY7vSHlb6dQ==
X-Received: by 2002:a5d:46c4:: with SMTP id g4mr34122916wrs.241.1617110757396; 
 Tue, 30 Mar 2021 06:25:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p18sm33140892wrs.68.2021.03.30.06.25.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:25:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] target-arm queue
Date: Tue, 30 Mar 2021 14:25:50 +0100
Message-Id: <20210330132555.8144-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

The following changes since commit 7993b0f83fe5c3f8555e79781d5d098f99751a94:

  Merge remote-tracking branch 'remotes/nvme/tags/nvme-fixes-for-6.0-pull-request' into staging (2021-03-29 18:45:12 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git pull-target-arm-20210330

for you to fetch changes up to b9e3f1579a4b06fc63dfa8cdb68df1c58eeb0cf1:

  hw/timer/renesas_tmr: Add default-case asserts in read_tcnt() (2021-03-30 14:05:34 +0100)

----------------------------------------------------------------
 * net/npcm7xx_emc.c: Fix handling of receiving packets when RSDR not set
 * hw/display/xlnx_dp: Free FIFOs adding xlnx_dp_finalize()
 * hw/arm/smmuv3: Drop unused CDM_VALID() and is_cd_valid()
 * target/arm: Make number of counters in PMCR follow the CPU
 * hw/timer/renesas_tmr: Add default-case asserts in read_tcnt()

----------------------------------------------------------------
Doug Evans (1):
      net/npcm7xx_emc.c: Fix handling of receiving packets when RSDR not set

Peter Maydell (2):
      target/arm: Make number of counters in PMCR follow the CPU
      hw/timer/renesas_tmr: Add default-case asserts in read_tcnt()

Philippe Mathieu-Daudé (1):
      hw/display/xlnx_dp: Free FIFOs adding xlnx_dp_finalize()

Zenghui Yu (1):
      hw/arm/smmuv3: Drop unused CDM_VALID() and is_cd_valid()

 hw/arm/smmuv3-internal.h       |  7 -------
 target/arm/cpu.h               |  1 +
 hw/display/xlnx_dp.c           |  9 +++++++++
 hw/net/npcm7xx_emc.c           |  4 +++-
 hw/timer/renesas_tmr.c         |  4 ++++
 target/arm/cpu64.c             |  3 +++
 target/arm/cpu_tcg.c           |  5 +++++
 target/arm/helper.c            | 29 +++++++++++++++++------------
 target/arm/kvm64.c             |  2 ++
 tests/qtest/npcm7xx_emc-test.c | 30 +++++++++++++++++++++---------
 10 files changed, 65 insertions(+), 29 deletions(-)

