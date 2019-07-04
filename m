Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F68A5FBC4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 18:33:42 +0200 (CEST)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hj4g1-0004SH-09
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 12:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47538)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hj4ec-0003uQ-P4
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 12:32:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hj4eb-0001hj-Ge
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 12:32:14 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37986)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hj4eb-0001gl-8v
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 12:32:13 -0400
Received: by mail-wm1-x344.google.com with SMTP id s15so6761183wmj.3
 for <qemu-devel@nongnu.org>; Thu, 04 Jul 2019 09:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PiGmCNtIPyvyrB3MYR+Y5W/+nnxEY92v2/4r8tEDZz8=;
 b=Hc65PDgXZ0ndYHuCZqh/8BxZkMX243VIrHKiiwLiyi8Hos7AK8FSjzsGQby/rQNTlS
 ZAlvG8drT0hzW1lbDwGRz1pMxHByDlM8szQadvAL36ddQ8fJqpnboVGWyqf4M4i3AF2E
 EFldxeRx/YuAIJSN5mOpwjmZ+IxBWpI+J0iFBtzc0HvhvNUasyhHm6qGCN5Y+De4f8C0
 hsywvaNW1S2fOjRNQ/21sS/NuQrPQYytmnP3LS5fIbdlf6497I72I/YQlEY8sj3so2lA
 U1UnTmW/qnUAaMcmdXJRqKCJulx0svFoSQojZ7rmDuwliwbVYLNW738ImNqPHuBPlTbe
 +PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PiGmCNtIPyvyrB3MYR+Y5W/+nnxEY92v2/4r8tEDZz8=;
 b=qdCigD5iIldBI2VTNk1vbJjav0FgMH0p3Nm6sgu6y/KbDJQSpkhtl33QxpNgDg8o3U
 Rf7VMMfwPawAlhv4AjcXfhRNPHKwQ9vQ6a//XqG80zR0gDaH+WKhu11tvhQqNFO0lqCj
 +ZVVj1UCGgSKjTEpx4mRZuraY0djfQGhH+0jQmuLcPwQQFtw1ZYDjFU96253VNVoQ+u+
 I2KPJPFrg44/RSRLLJ2Ja3j9bvP0GSqQgeTDFsInLG+uYeaG35dKO8Rqrzln500y2oWJ
 tH1iUr4JktzRIPYC2foyVy3H6dqnyFLgt6ie2XVe1kUkqB4QvimhrMg1RlxeXLlhu7ET
 IerA==
X-Gm-Message-State: APjAAAXVG88GFA+fnCZbCnyehPna5tfgJzqKs/zDOlp9NzagSRv8W33N
 Fa0Bvkqn2z8ts79DH8tYZTUWr6wZ/zr7cQ==
X-Google-Smtp-Source: APXvYqwNX6cLaBakyui86imH6ZRpWW+JnBdB8M7gDs7BpqaOwhegRJHfyJiBiU8oJguWZiVGDNc8jw==
X-Received: by 2002:a05:600c:2549:: with SMTP id
 e9mr297466wma.46.1562257931591; 
 Thu, 04 Jul 2019 09:32:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t14sm5235592wrr.33.2019.07.04.09.32.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 09:32:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  4 Jul 2019 17:32:09 +0100
Message-Id: <20190704163209.14481-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-devel] [PULL 0/9] target-arm queue
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

A last collection of patches to squeeze in before rc0.
The patches from me are all bugfixes. Philippe's are just
code-movement, but I wanted to get these into 4.1 because
that kind of patch is so painful to have to rebase.
(The diffstat is huge but it's just code moving from file to file.)

v2: fix up for clash with the qapi refactor which only
showed up in a build-from-clean.

thanks
-- PMM


The following changes since commit c3e1d838cfa5aac1a6210c8ddf182d0ef7d95dd8:

  Merge remote-tracking branch 'remotes/kraxel/tags/ui-20190704-pull-request' into staging (2019-07-04 16:43:13 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20190704-1

for you to fetch changes up to 89a11ff756410aecb87d2c774df6e45dbf4105c1:

  target/arm: Correct VMOV_imm_dp handling of short vectors (2019-07-04 17:25:30 +0100)

----------------------------------------------------------------
target-arm queue:
 * more code-movement to separate TCG-only functions into their own files
 * Correct VMOV_imm_dp handling of short vectors
 * Execute Thumb instructions when their condbits are 0xf
 * armv7m_systick: Forbid non-privileged accesses
 * Use _ra versions of cpu_stl_data() in v7M helpers
 * v8M: Check state of exception being returned from
 * v8M: Forcibly clear negative-priority exceptions on deactivate

----------------------------------------------------------------
Peter Maydell (6):
      arm v8M: Forcibly clear negative-priority exceptions on deactivate
      target/arm: v8M: Check state of exception being returned from
      target/arm: Use _ra versions of cpu_stl_data() in v7M helpers
      hw/timer/armv7m_systick: Forbid non-privileged accesses
      target/arm: Execute Thumb instructions when their condbits are 0xf
      target/arm: Correct VMOV_imm_dp handling of short vectors

Philippe Mathieu-Daudé (3):
      target/arm: Move debug routines to debug_helper.c
      target/arm: Restrict semi-hosting to TCG
      target/arm/helper: Move M profile routines to m_helper.c

 target/arm/Makefile.objs       |    5 +-
 target/arm/cpu.h               |    7 +
 hw/intc/armv7m_nvic.c          |   54 +-
 hw/timer/armv7m_systick.c      |   26 +-
 target/arm/cpu.c               |    9 +-
 target/arm/debug_helper.c      |  311 +++++
 target/arm/helper.c            | 2646 +--------------------------------------
 target/arm/m_helper.c          | 2679 ++++++++++++++++++++++++++++++++++++++++
 target/arm/op_helper.c         |  295 -----
 target/arm/translate-vfp.inc.c |    2 +-
 target/arm/translate.c         |   15 +-
 11 files changed, 3096 insertions(+), 2953 deletions(-)
 create mode 100644 target/arm/debug_helper.c
 create mode 100644 target/arm/m_helper.c

