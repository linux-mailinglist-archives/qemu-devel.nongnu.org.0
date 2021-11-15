Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A17745151E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 21:23:22 +0100 (CET)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmiVd-0003jE-BA
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 15:23:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmiSW-0006RR-0l
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:20:10 -0500
Received: from [2a00:1450:4864:20::42c] (port=38784
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmiSF-0001wQ-14
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 15:19:57 -0500
Received: by mail-wr1-x42c.google.com with SMTP id u18so33055813wrg.5
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 12:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hHm5zHM1YZpAUWKhAsNGPmxiocxuJTjbIRYCCBQcsw=;
 b=ni+iAUBbBX8bW+QW6gYqpuiqQvwXaKWT8O76v1ZqETFePgzzWf2GQT80kbcuxDn/b9
 R5kOy26AVfDepduSkxYbhS0f1fwqE1OQuIE9TDXhriN/B4ZvQyz8k1MLbQ5EcmApAnRc
 kFjXqMZ4lR/yxq1rZ4v1mpqrpXDokHLDdodNbmyPSMqFiirOz02cuhD8zAdRxfGifN32
 +rZxIQi+Jsh8YQ8APeSswNJtuNpDSK7041hweGcnBTibYozk78qmmnp1UO8yZqgeLs+6
 22Z8qYuI+iookgpSTqYbaVVffxy/ItzYAkwVc548JTr3XVTg6PGAr0TgE60knDumgVCG
 zMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hHm5zHM1YZpAUWKhAsNGPmxiocxuJTjbIRYCCBQcsw=;
 b=nvc5Gz6wk93GktD+ToLsB8KgY5FXEmeI0WYT5yoXnJ2a3fLLkMOOxZakEicv9Z0T+E
 6mit0zIAgQEE5kKvlY1h3EPYBqtjOFzY7+gUS6jgoruuCY62+G2WFlDFRzfGTBO4mBqi
 6wqwqGjgT0t7yHHTpLqQeP50gIHnE2cfnVQfm4vEdNcd2JNutah28A3Hoc5XPyhJ2Z92
 g/lZtad6UkXxsaEtmWRwpdYoJuOjjFlKdIAVBZ9Wv6oyHVuV9J7q1GYSOPKfVUnKjAzZ
 IkvwykyAUgl6sgXTl83lFyAA9Xtg7HTnivuX6qcmbK65RewNWKWKC2ZRoMq82xsmIWeK
 ZUaA==
X-Gm-Message-State: AOAM530+RmDI6jf5/VH4wLZwDMeUCEErNzEE43uDSAHyjbIEQHCEMCeR
 xoQFLRshT6XSDFF/7mnWUTWHx9fArkfPAQ==
X-Google-Smtp-Source: ABdhPJzT6Mss88/a+Q8V8BzJ08em9xOYMcow+cSwzUQ/SOJaP9qb0lZ3NpmHLJBW+kUEo3Mf7YbbGg==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr2269182wry.358.1637007588341; 
 Mon, 15 Nov 2021 12:19:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm15419033wrs.48.2021.11.15.12.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 12:19:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] target-arm queue
Date: Mon, 15 Nov 2021 20:19:42 +0000
Message-Id: <20211115201946.327770-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; some minor changes for 6.2, which I think can be classified
as bug fixes and are OK for this point in the release cycle.
(Wouldn't be the end of the world if they slipped to 7.0.)

-- PMM

The following changes since commit 42f6c9179be4401974dd3a75ee72defd16b5092d:

  Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into staging (2021-11-12 12:28:25 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211115-1

for you to fetch changes up to 1adf528ec3bdf62ea3b580b7ad562534a3676ff5:

  hw/rtc/pl031: Send RTC_CHANGE QMP event (2021-11-15 18:53:00 +0000)

----------------------------------------------------------------
target-arm queue:
 * Support multiple redistributor regions for TCG GICv3
 * Send RTC_CHANGE QMP event from pl031

----------------------------------------------------------------
Eric Auger (1):
      hw/rtc/pl031: Send RTC_CHANGE QMP event

Peter Maydell (3):
      hw/intc/arm_gicv3: Move checking of redist-region-count to arm_gicv3_common_realize
      hw/intc/arm_gicv3: Set GICR_TYPER.Last correctly when nb_redist_regions > 1
      hw/intc/arm_gicv3: Support multiple redistributor regions

 include/hw/intc/arm_gicv3_common.h | 14 ++++++++--
 hw/intc/arm_gicv3.c                | 12 +-------
 hw/intc/arm_gicv3_common.c         | 56 ++++++++++++++++++++++++--------------
 hw/intc/arm_gicv3_kvm.c            | 10 ++-----
 hw/intc/arm_gicv3_redist.c         | 40 +++++++++++++++------------
 hw/rtc/pl031.c                     | 10 ++++++-
 hw/rtc/meson.build                 |  2 +-
 7 files changed, 83 insertions(+), 61 deletions(-)

