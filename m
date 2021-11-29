Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E04621E3
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 21:11:21 +0100 (CET)
Received: from localhost ([::1]:48220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrmzc-0001ei-1P
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 15:11:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmty-0003Op-VG
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:05:28 -0500
Received: from [2a00:1450:4864:20::436] (port=38752
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrmtq-0008CN-B2
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:05:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id q3so16515851wru.5
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 12:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62TUW3Vud/abx7oT8R5VZ/lcoz88/dROOmNsgymRkt4=;
 b=y+amE4xjw1w5rJJRZY1O3X8MFMxCdq+7EzlcQBvrovYqh66i1BVal7OMAqr37w5bl7
 RPA2CUjX/BFMaEL3idd5bRdA3DZrSq0pkA1v95fo5byIfsiZmE0yzBSd3FoTpTM7zhCl
 3HPvBimZapcKiwPtXNcs+IrqqSIQvkuKLkzj9zIMG3t3EEzIEn1yZlGHOIVVCrrsaCnk
 se0OAGf/dXj6Y+6w15hgJJy2Xz8l7pVqof6qBiDsyGlawYHJWECrILGPnmR0nzvO4ptW
 AHH5vhgN6ZcgSUD85x3PkLdQ4IX4zXAsN8HjVpK5tKMraFp6O3XQvDfBA8gyD9Eo5JDg
 qXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62TUW3Vud/abx7oT8R5VZ/lcoz88/dROOmNsgymRkt4=;
 b=Z+fDcecqoV3jZP0ZgFoeZt9MkGXt6eNlIzgMhRyqFVRiaSmxyB/d6UgtAXnhErrILC
 kvzUGB5lUFaRvY4SH4id6c/9LHKgz5nOeuln7A8JfxXVaVk+JoKN4adaW9TZ21zhZQDa
 9aW+L9JFxcP3kV/yLOywCb0AA5nk3sAnz6sbufTqtrcUIaTk44Zju8BEHJrOLeY7Y3WD
 HOG44UG/ttCHwdHryVKnLjbPlEyDW2bWakC6tQoSzKL61NYs6RsWgOg0mqyftCCMLRJ5
 yecsrWMwn0zfIVOvKPFIxXk9hMbZn1po1qvFCrAvS8Ts7jvxKDQBCpRmnaaU+8e9KV64
 ZGug==
X-Gm-Message-State: AOAM531Plh4Qq/bFxlnHOZLY3J3LXsaRz9/NXJnENH3YXQkUOcRovitS
 KBRoCU3Vql1+cO9yOTjw8VHOIA==
X-Google-Smtp-Source: ABdhPJz/bsf3PB389gYqS1OIceWKVyUuiWbR3fyka6msLmzmvaipESlWm8vQxwJ6Fo4cK0oTToptow==
X-Received: by 2002:adf:cf11:: with SMTP id o17mr35051011wrj.554.1638216313208; 
 Mon, 29 Nov 2021 12:05:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id v15sm14678863wro.35.2021.11.29.12.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 12:05:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0 0/4] qemu-common.h include cleanup
Date: Mon, 29 Nov 2021 20:05:06 +0000
Message-Id: <20211129200510.1233037-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-common.h has a comment at the top:

 * This file is supposed to be included only by .c files. No header file should
 * depend on qemu-common.h, as this would easily lead to circular header
 * dependencies.

We still have a few .h files which include it, though.  The first 3
patches in this series fix that: in 3 out of 4 cases we didn't need
the #include at all, and in the 4th case we can instead #include
qemu-common.h from just one .c file.

Patch 4 is just removing the #include from 8 files in hw/arm which
don't need it at all.  (Probably there are other files like this, but
I just did the Arm related ones.)

Tested by pushing to gitlab for the CI build.

-- PMM

Peter Maydell (4):
  include/hw/i386: Don't include qemu-common.h in .h files
  target/hexagon/cpu.h: don't include qemu-common.h
  target/rx/cpu.h: Don't include qemu-common.h
  hw/arm: Don't include qemu-common.h unnecessarily

 include/hw/i386/microvm.h     | 1 -
 include/hw/i386/x86.h         | 1 -
 target/hexagon/cpu.h          | 1 -
 target/rx/cpu.h               | 1 -
 hw/arm/boot.c                 | 1 -
 hw/arm/digic_boards.c         | 1 -
 hw/arm/highbank.c             | 1 -
 hw/arm/npcm7xx_boards.c       | 1 -
 hw/arm/sbsa-ref.c             | 1 -
 hw/arm/stm32f405_soc.c        | 1 -
 hw/arm/vexpress.c             | 1 -
 hw/arm/virt.c                 | 1 -
 linux-user/hexagon/cpu_loop.c | 1 +
 13 files changed, 1 insertion(+), 12 deletions(-)

-- 
2.25.1


