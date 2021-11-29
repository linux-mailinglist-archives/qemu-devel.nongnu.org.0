Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD454612B6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 11:42:20 +0100 (CET)
Received: from localhost ([::1]:33308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mre71-0005H5-To
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 05:42:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre49-0002O1-ON
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:21 -0500
Received: from [2a00:1450:4864:20::32c] (port=44973
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mre47-0004mR-Pc
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 05:39:21 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so12039861wms.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 02:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tSsj4XuqKiESeZfzfZH/FwaRWxm+xkE3a7WRG2Gcuns=;
 b=kXqYMoiaYSn9DrBu9xbVdVm3XRkP8cSEvYZrBHrooSlhr8wRH3Hfc0+qOLHea9a/6k
 Mxy0f2cF5gETdZtNlTyUuN23vdElq0kBblA791wtXIXetO/yhqfbpoJhEjc2U9jwbtTe
 Ae3rJuboXpElEzoCVK6vPOLpViogFTsftiQOg7EOtjC/c21MAt93vd1T64Sj5FHlKJby
 z88tEiUkvpiG+sa7sBAMoWU28CHEGBJMbTE3W/UZieUsEi/nxfI3LG1VdUccXg1fHl70
 vXFFiC/QgFXlOsZmIO33gcPkVSa44IF9NscP9rc0e7FpGVulJgpWHS7yvuBYg23izl1b
 BO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tSsj4XuqKiESeZfzfZH/FwaRWxm+xkE3a7WRG2Gcuns=;
 b=b0tHks1x/J0YAhN8v83q7xzqHXpG70dt5/9wfrZioWN+syJrNy1dtCkaZZnG5bQgos
 kdIasQuq57ohgn6QoAl8tbEwry0O50VyJiB4rgFDQXTlyBrYwCy+fSqU3R7kUdyRtdob
 hwR4tNt08gwdXUViIAn/ZDq1apQO4+p8U6AqFrqv+WywEuJB1DZq+UioMLSnHhBMEF2S
 vN8wdSV+C3/gdz5A+8/4z/gc8lBOHETRztSZeipP31C952TgPMfMsaWiBTN681Jt2K4m
 UxiWzUaupqG/9eleyYhsB+/91/pQiDMPSTCiOHKX0jajDKz3EA975gnsinhbzGWQQSIE
 QAnQ==
X-Gm-Message-State: AOAM531suCz+02hAGHeP9wHCnOzrsJjJhgS/6TtelZh3BokBlxfJ7lEe
 l184KdrvXYWG/kFlW2ue4od+vimnemCxKg==
X-Google-Smtp-Source: ABdhPJxy5rFE6eHcXDYLqjiHP7F2HnbqvxcEH5eM/F4RX7FoHgvS2vUXh4HmNUZrm3AJrdBeGUz+lw==
X-Received: by 2002:a1c:2685:: with SMTP id m127mr35860865wmm.42.1638182357633; 
 Mon, 29 Nov 2021 02:39:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t17sm18810912wmq.15.2021.11.29.02.39.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 02:39:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] target-arm queue
Date: Mon, 29 Nov 2021 10:39:10 +0000
Message-Id: <20211129103915.1162989-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; this is a collection of mostly GIC related patches for rc3.
The "Update cached state after LPI state changes" fix is important
and fixes what would otherwise be a regression since we enable the
ITS by default in the virt board now. The others are not regressions
but I think are OK for rc3 as they're fairly self contained (and two
of them are fixes to new-in-6.2 functionality).

thanks
-- PMM

The following changes since commit dd4b0de45965538f19bb40c7ddaaba384a8c613a:

  Fix version for v6.2.0-rc2 release (2021-11-26 11:58:54 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211129

for you to fetch changes up to 90feffad2aafe856ed2af75313b2c1669ba671e9:

  hw/intc/arm_gicv3: fix handling of LPIs in list registers (2021-11-29 10:10:21 +0000)

----------------------------------------------------------------
target-arm queue:
 * virt: Diagnose attempts to enable MTE or virt when using HVF accelerator
 * GICv3 ITS: Allow clearing of ITS CTLR Enabled bit
 * GICv3: Update cached state after LPI state changes
 * GICv3: Fix handling of LPIs in list registers

----------------------------------------------------------------
Alexander Graf (1):
      hw/arm/virt: Extend nested and mte checks to hvf

Peter Maydell (3):
      hw/intc/arm_gicv3: Update cached state after LPI state changes
      hw/intc/arm_gicv3: Add new gicv3_intid_is_special() function
      hw/intc/arm_gicv3: fix handling of LPIs in list registers

Shashi Mallela (1):
      hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit

 hw/intc/gicv3_internal.h   | 30 ++++++++++++++++++++++++++++++
 hw/arm/virt.c              | 15 +++++++++------
 hw/intc/arm_gicv3.c        |  6 ++++--
 hw/intc/arm_gicv3_cpuif.c  |  9 ++++-----
 hw/intc/arm_gicv3_its.c    |  7 ++++---
 hw/intc/arm_gicv3_redist.c | 14 ++++++++++----
 6 files changed, 61 insertions(+), 20 deletions(-)

