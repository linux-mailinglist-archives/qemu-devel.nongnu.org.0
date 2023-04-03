Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365306D4D07
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:03:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMcV-000542-Gt; Mon, 03 Apr 2023 12:01:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMcU-00053Z-FD
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:01:22 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMcS-0002B1-Mr
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:01:22 -0400
Received: by mail-wr1-x434.google.com with SMTP id r29so29852337wra.13
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 09:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680537679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=eUXge7AChh5REvFsWF9GdI8G1aAGGPFOlMyBAHX8YkM=;
 b=f41XcX41591M6jRmAAtYW1Jli9TYzcl+2YFmIPjFb03Hz/xnhTQ6oWnFgrs1XmPaqv
 dNpk1inZIjKfOFeCMKK+nhKoNSeXS7miEhKX556cBk718ZX/T4sn8iYFdh/WCZ/fXzv4
 Ygtgz0TGulilv8EesvZhHgsdr7Us0hpy8Bln+amySQSw+M66iC+tPJINoMyhk3IRmvUk
 BzqrGS4RfXEfoPDlNQQRZk4AaKMmXHnwbUZnaTiM+7ZDCSxsLLnvrwdcw94btsZ3zcQf
 N7mq2FVoplROBlcJW1QP12Esy2R8ijrwDbS5P6ZYzxperTYhgKZZSjolmNc0U6/JaAU8
 MM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680537679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eUXge7AChh5REvFsWF9GdI8G1aAGGPFOlMyBAHX8YkM=;
 b=N7VUBFbKAqfayl4lX/RrmUPAOR8GGcbVLw+rdZEO1odo75HbT99SmNVRaTQwMFIsgY
 jVhPm54hCC70TvAw3UvVryxd3gXvSFPgzNBlUiSe0Ll6VDIw6j9/EsppbJR5Za5jrjh6
 p1dZXHPo3pvmr3OZenaOIbiRkKtLUIWxlSBhPxob3DqxGUuu9ZvaHFg0OEXs4ZjrbUeS
 9R8FE0RNXBEowa4UavJXJ3DhfT4aVL5rL+oIlBP5KBY76v6vANcv2aE7wZXI+jnjlLBJ
 Y4D9qwWEwncR6nXvrvYwc83Xf43DeeLJJeDD8YxbpUiAZJkx33cYDNUMVEWiqNpKB4Lr
 CR4Q==
X-Gm-Message-State: AAQBX9fObzvAx5DGv5I58z8MD9kn51GX4zVMMWD6dneJIAgkIQWP3Nv6
 FWSP92G1VZmTK92G8Y76imGLkpAcNHSFRgA+xt0=
X-Google-Smtp-Source: AKy350ZeXkeId9g9HHJJb9esuB6Wj108vszaIMu9QfUwENe11nnstnFpDtxqrG4CstZBb+q949FScg==
X-Received: by 2002:a5d:6585:0:b0:2ce:9a15:3724 with SMTP id
 q5-20020a5d6585000000b002ce9a153724mr23442608wru.3.1680537678639; 
 Mon, 03 Apr 2023 09:01:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d68c1000000b002c59f18674asm10088668wrw.22.2023.04.03.09.01.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 09:01:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] target-arm queue
Date: Mon,  3 Apr 2023 17:01:13 +0100
Message-Id: <20230403160117.3034102-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit efcd0ec14b0fe9ee0ee70277763b2d538d19238d:

  Merge tag 'misc-fixes-20230330' of https://github.com/philmd/qemu into staging (2023-03-30 14:22:29 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230403

for you to fetch changes up to a0eaa126af3c5a43937a22c58cfb9bb36e4a5001:

  hw/ssi: Fix Linux driver init issue with xilinx_spi (2023-04-03 16:12:30 +0100)

----------------------------------------------------------------
 * target/arm: Fix non-TCG build failure by inlining pauth_ptr_mask()
 * hw/arm: do not free machine->fdt in arm_load_dtb()
 * target/arm: Fix generated code for cpreg reads when HSTR is active
 * hw/ssi: Fix Linux driver init issue with xilinx_spi

----------------------------------------------------------------
Chris Rauer (1):
      hw/ssi: Fix Linux driver init issue with xilinx_spi

Markus Armbruster (1):
      hw/arm: do not free machine->fdt in arm_load_dtb()

Peter Maydell (1):
      target/arm: Fix generated code for cpreg reads when HSTR is active

Philippe Mathieu-Daudé (1):
      target/arm: Fix non-TCG build failure by inlining pauth_ptr_mask()

 target/arm/internals.h        | 15 ++++++++++-----
 hw/arm/boot.c                 |  5 ++++-
 hw/ssi/xilinx_spi.c           |  1 +
 target/arm/gdbstub64.c        |  7 +++++--
 target/arm/tcg/pauth_helper.c | 18 +-----------------
 target/arm/tcg/translate.c    |  6 ++++++
 6 files changed, 27 insertions(+), 25 deletions(-)

