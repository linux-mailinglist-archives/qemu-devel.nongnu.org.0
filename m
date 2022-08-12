Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6037D59106B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:58:05 +0200 (CEST)
Received: from localhost ([::1]:45170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMTIi-0006Ho-FY
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6b-0000Ms-HU
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMT6Z-0002P2-HO
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:45:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id ay12so478483wmb.1
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 04:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=HqiRmf1YMBTPxw5cmZnxjgiAwmvEOHb0vkdHzQsRfC4=;
 b=FmZCo0V1dZZNTIWC0jEPbmLAaq4knDpXsdX7jnj6Isgy2HThMjFY24EwLef133W2xb
 NWuk0jVC34qj8fXxIkqj63CNmaESd3fzd74OQWoDEpNFZRwnlYVYJO2h2FYHqiqbBOKn
 whfRdTt+zkHrz7H0X5bQkE2wzMfmNhL72wyjYgI+DkCBIlnUWQOpdfcNan18d/qA3O4e
 4bAGj/nbtR9zVCdaUB2C33BNTBGtt3VHufvDqf30CPTmtz7fyUZgcaBo6pSGn081q95H
 hB6MPxu+Ky+xztGwur/wYC937O1/x8UoU35XWia4yj7k5SqA42nQ7IUiT2NrBYWjBMrR
 O5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=HqiRmf1YMBTPxw5cmZnxjgiAwmvEOHb0vkdHzQsRfC4=;
 b=WwJRp3keaRaLfasJ6NRNMAnAy1TFRq48IjvsrFK0G6q5uWVKQrQhCTY2Qt7wAnUSD/
 vz96mkzMA77r4B51kiTjlpXqkXG48ON8nNfTAaKgzf/LdXYDjpSJoFm/YHwviWaYdNEI
 vgOiQz0K2JzBcaxk7bW0FYZTaeZn2xP45ht+8tQ1rOUlRuzn1idSgiJNjOMKRVbhsgEK
 MBRTYiI7T8FlwBzwuNqUdQ5heRniAmn5q0MmA/FBtJpH41tOSoHHv72CnXASbxQ9KGXD
 cE0Elm0vQh/kOTxxYz4i80SRAEUCL9hhRQAx3SHJGIriZNCrTPPe5oVjROiBUXBBxZg+
 ogeQ==
X-Gm-Message-State: ACgBeo3yJViQGc9X1DEP+ho0h1dePZppjqWME1T3uQcc54LlkS1jWL0Z
 hrwuKF0fe6QYO2WK/YKYMTVmQLEE1KSqmQ==
X-Google-Smtp-Source: AA6agR6eJ2oQWIZJXrkDUMrC+vRh1Ujiekuxu4EYcMlMC1FTPgCB5qRmU2Eq4+8EKEuNyNaa9FsMQg==
X-Received: by 2002:a1c:2585:0:b0:3a5:2163:f33b with SMTP id
 l127-20020a1c2585000000b003a52163f33bmr2435338wml.189.1660304729984; 
 Fri, 12 Aug 2022 04:45:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c3b8800b003a5418245b9sm11257797wms.19.2022.08.12.04.45.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 04:45:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] target-arm queue
Date: Fri, 12 Aug 2022 12:45:22 +0100
Message-Id: <20220812114527.1336370-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This pullreq has:
 * two arm bug fixes which fix some "Linux fails to boot" bugs
 * a docs typo-fixing patch
 * a couple of compile failure/warning issues

I think they're all pretty safe and worth having in rc3.

thanks
-- PMM

The following changes since commit a6b1c53e79d08a99a28cc3e67a3e1a7c34102d6b:

  Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-10 10:26:57 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220812

for you to fetch changes up to 4311682ea8293f720730f260e8a7601117d79e65:

  cutils: Add missing dyld(3) include on macOS (2022-08-12 11:33:52 +0100)

----------------------------------------------------------------
target-arm queue:
 * Don't report Statistical Profiling Extension in ID registers
 * virt ACPI tables: Present the GICR structure properly for GICv4
 * Fix some typos in documentation
 * tests/unit: fix a -Wformat-truncation warning
 * cutils: Add missing dyld(3) include on macOS

----------------------------------------------------------------
Marc-André Lureau (1):
      tests/unit: fix a -Wformat-truncation warning

Peter Maydell (1):
      target/arm: Don't report Statistical Profiling Extension in ID registers

Philippe Mathieu-Daudé (1):
      cutils: Add missing dyld(3) include on macOS

Stefan Weil (1):
      Fix some typos in documentation (most of them found by codespell)

Zenghui Yu (1):
      hw/arm/virt-acpi-build: Present the GICR structure properly for GICv4

 docs/about/deprecated.rst               |  2 +-
 docs/specs/acpi_erst.rst                |  4 ++--
 docs/system/devices/canokey.rst         |  8 ++++----
 docs/system/devices/cxl.rst             | 12 ++++++------
 hw/arm/virt-acpi-build.c                |  4 ++--
 target/arm/cpu.c                        | 11 +++++++++++
 tests/unit/test-qobject-input-visitor.c |  3 +--
 util/cutils.c                           |  4 ++++
 util/oslib-posix.c                      |  4 ----
 9 files changed, 31 insertions(+), 21 deletions(-)

