Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B73A3B2B53
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 11:25:03 +0200 (CEST)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwLba-0002lO-BM
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 05:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLaH-0000uC-8p
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:23:41 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwLaF-0001pi-Lo
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 05:23:40 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 m41-20020a05600c3b29b02901dcd3733f24so5770909wms.1
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 02:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ZMUxnbum+28GeXkldx2zLX40blZjdHwAmY8BDvrclk=;
 b=MWCJTNkC/dpFDM8eUr7z9G7bR1sNzZUncz9JNh5IyWbjHtbWEIeMcnt3V2hvuW6Z5R
 3BvwixnppAVLiFvuMZ+TzrNBFXqZFxxVy+Ob48ZhpSInLm/PrBpZAh8MovSgFkKJZuko
 SeSSIessXdi+0CGjxCG58uyWdshg2QIFsY0+VE+onb+xS4a7d5yq6kASKsBbFy2TAvIv
 oaQZLUakyxfLPy5JDV2hwQ23JnmL0Iozkcp4zDSorQCYb402LtQQIrKYDvcsmH/1fcPa
 /dVV9F8+EzKYflHBueecb5Ez0S9mksFntECzCX1E3El0KsV9O5ptzQwTgva1K0QuWK9I
 xkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5ZMUxnbum+28GeXkldx2zLX40blZjdHwAmY8BDvrclk=;
 b=g2sopccLBI2xGS0j+6f5f5rVSl2Cl+g6lbVJf1GwR7wpql+HYMZfhqBWaGpd0SPAqG
 E86iccX11zEBiq/ylxoz8uLxHqCsq5ebnhXDnH2xZELWCnS1xH5I/hKyuzChUhVm83Uk
 rFnUcq1oB/YpsJ4PEEd9sJfD4JmEtzFbNCxRqv9+GCOnGLw1lDgLvbau/DCil2drdwN5
 OxiyCye4odf5J0tYpTLggDJc6/s4PEbR68zs4F+YhaFu0+7kVRZ3qBjSazB39gehYhpy
 Ws+BzlXT5DIqddNwhMhUkARJdVxwqKH6Snv2lJwpaDs+b788Zz4k4ovLjNoQlMerTJBg
 sb/w==
X-Gm-Message-State: AOAM530gJhZlKKMlNjAznCf3cEt5+Dz6ZL5IBnGgcZ8Mry8yZcll6vL9
 l3uVo8qVpEe4aPpKDj3+OS6bRZQI23Jt+A==
X-Google-Smtp-Source: ABdhPJxQEDwNyEPJVjULylMuzV8XiWMSwnNdKsh6cKqHwDblQk3vB8CGBJbH2fAWqrt9C8FTYOw93w==
X-Received: by 2002:a1c:98d5:: with SMTP id a204mr3024061wme.43.1624526617831; 
 Thu, 24 Jun 2021 02:23:37 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b15sm2935709wrr.27.2021.06.24.02.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 02:23:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Integrate renesas MCU/SoC timer module [part 2 from
 review]
Date: Thu, 24 Jun 2021 11:23:32 +0200
Message-Id: <20210624092336.1078504-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patches wrote while reviewing Yoshinory's series.=0D
=0D
I'm not reposting his patches with the fixup squashed because=0D
I made various comment on his v1 while reviewing. So posting=0D
with !fixup for easier integration while addressing review=0D
comments.=0D
=0D
Based-on: <20210623123416.60038-1-ysato@users.sourceforge.jp>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  !fixup hw/timer: Add renesas_timer.=0D
  !fixup hw/rx: rx62n switch renesas_timer.=0D
  hw/timer: Remove RENESAS_TMR / RENESAS_CMT=0D
  hw/timer: Remove SH_TIMER=0D
=0D
 include/hw/rx/rx62n.h            |   3 +-=0D
 include/hw/timer/renesas_cmt.h   |  43 ---=0D
 include/hw/timer/renesas_timer.h |   1 +=0D
 include/hw/timer/renesas_tmr.h   |  58 ----=0D
 hw/rx/rx62n.c                    |   6 +-=0D
 hw/timer/renesas_cmt.c           | 283 ------------------=0D
 hw/timer/renesas_tmr.c           | 493 -------------------------------=0D
 hw/timer/sh_timer.c              | 368 -----------------------=0D
 MAINTAINERS                      |   1 -=0D
 hw/rx/Kconfig                    |   1 -=0D
 hw/timer/Kconfig                 |   7 -=0D
 hw/timer/meson.build             |   3 -=0D
 12 files changed, 5 insertions(+), 1262 deletions(-)=0D
 delete mode 100644 include/hw/timer/renesas_cmt.h=0D
 delete mode 100644 include/hw/timer/renesas_tmr.h=0D
 delete mode 100644 hw/timer/renesas_cmt.c=0D
 delete mode 100644 hw/timer/renesas_tmr.c=0D
 delete mode 100644 hw/timer/sh_timer.c=0D
=0D
-- =0D
2.31.1=0D
=0D

