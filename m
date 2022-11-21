Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C7E63230A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:04:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox6S7-000538-0G; Mon, 21 Nov 2022 08:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Ri-0004sz-FV
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:49 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox6Rf-0007Qr-6S
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:02:45 -0500
Received: by mail-wm1-x330.google.com with SMTP id t4so8400032wmj.5
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 05:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=AZJLZiFOjiKUDIHvq/9ffi6qmedg2UVStgbpsVkGR9s=;
 b=p+0AShH/IkiiN/Osj0N1djyi2zNAGzyR7cnliJqr5hkdtK7ybHSVR2PvZclvn6Xkot
 +ORtXWGPpEFQeuVrSUlqPHr2i6zzlq3o0OWieboz/+qv975Av52LhehM4SnthRyWBHjR
 g12jQydPtZ3Mw55fqPhJfejW6Mx5dimoX6IOY9iGUl/VK30qSRE6I5vzDUsequ0Q542O
 QVh1LOtgC94B9XDr9OOurxokgY0oBpDmsf5ebTJY3/ea0sfzQi0f7eTAIztXBTQmA+uU
 ZzP1fTI34QiJAFnZFs2rS+UKnR5rdxbGFJdoEYGhok45JU9HirVbLD6QJUBlefQ+ubTc
 k+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AZJLZiFOjiKUDIHvq/9ffi6qmedg2UVStgbpsVkGR9s=;
 b=lO/SqWIZ5nSVBpqgRUOa38cqlnTTHJ5cza+sWsrt0RmPagDySXlmFRGcy35ejU3jUY
 dRo4ianOhPvHUcpIJ9HVcq8T5ckVqbZPbJpX++DPhSAJuYYiUqVka/qPfkdABgQ9kGYE
 JpzvpVgIdexBOSjaCep9/BcnNHGh8/iDC8p155oCw3rE8rw9azIaY8ofCwm3cDI05eRM
 fNZJPqJR655DNlffL4U17lRuvUJtqhWw8oT7n+QEskCJrtw0QpiLFPdWaqJoP4mh9xoQ
 CvjAu6fNGUqNFTys/nzDGxccHvFYwbnpyflqnjaSHO7Iz7U6O8pZUfO0goCYsibmvw42
 ggXQ==
X-Gm-Message-State: ANoB5pn3QePOGniS3do9cMarIbovudQMi+y/6LKlsuD+TWqKXmJ0FKG/
 5+WRJ83HvCY9eJC5iaziOrj+7fs9PdUlLA==
X-Google-Smtp-Source: AA0mqf7sK7qKFYX7ck6We6GBctRY6grSkV1DmGIuSV6MGj9M5MZdJjIkKKBYc9ba5b4riqIoO2BYpQ==
X-Received: by 2002:a7b:ce9a:0:b0:3cf:4aa7:7576 with SMTP id
 q26-20020a7bce9a000000b003cf4aa77576mr16363434wmj.39.1669035761147; 
 Mon, 21 Nov 2022 05:02:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a1c7701000000b003cf4d99fd2asm13296725wmi.6.2022.11.21.05.02.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 05:02:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] target-arm queue
Date: Mon, 21 Nov 2022 13:02:34 +0000
Message-Id: <20221121130239.1138631-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Hi; here's a collection of Arm bug fixes for rc2.

thanks
-- PMM

The following changes since commit a082fab9d259473a9d5d53307cf83b1223301181:

  Merge tag 'pull-ppc-20221117' of https://gitlab.com/danielhb/qemu into staging (2022-11-17 12:39:38 -0500)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221121

for you to fetch changes up to 312b71abce3005ca7294dc0db7d548dc7cc41fbf:

  target/arm: Limit LPA2 effective output address when TCR.DS == 0 (2022-11-21 11:46:46 +0000)

----------------------------------------------------------------
target-arm queue:
 * hw/sd: Fix sun4i allwinner-sdhost for U-Boot
 * hw/intc: add implementation of GICD_IIDR to Arm GIC
 * tests/avocado/boot_linux.py: Bump aarch64 virt test timeout
 * target/arm: Limit LPA2 effective output address when TCR.DS == 0

----------------------------------------------------------------
Alex Bennée (2):
      hw/intc: clean-up access to GIC multi-byte registers
      hw/intc: add implementation of GICD_IIDR to Arm GIC

Ard Biesheuvel (1):
      target/arm: Limit LPA2 effective output address when TCR.DS == 0

Peter Maydell (1):
      tests/avocado/boot_linux.py: Bump aarch64 virt test timeout to 720s

Strahinja Jankovic (1):
      hw/sd: Fix sun4i allwinner-sdhost for U-Boot

 include/hw/sd/allwinner-sdhost.h |  1 +
 hw/intc/arm_gic.c                | 28 ++++++++++++-----
 hw/sd/allwinner-sdhost.c         | 67 +++++++++++++++++++++++++++-------------
 target/arm/ptw.c                 |  8 +++++
 tests/avocado/boot_linux.py      |  2 +-
 5 files changed, 77 insertions(+), 29 deletions(-)

