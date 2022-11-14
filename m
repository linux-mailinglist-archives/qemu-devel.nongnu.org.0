Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7332628E12
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:14:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouin9-00076V-IB; Mon, 14 Nov 2022 18:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouif2-0003Da-E6
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:42 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oubkl-0007Hh-Jf
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 10:52:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id y16so19027842wrt.12
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 07:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HH1+xBjjcIdrtUfBU620QV7bApj4K8yb03F0Xf+u3js=;
 b=HmRmYt5KMONGtvljvhbmG1H+PSxhN4JCnrDtkSr3BtYKRWtnlQO6IaaJh6jbz7/sG3
 kELwXRK93ysNeu2oKpjQ6Jtp7uXfla5X6AJ925OKW/tyKafDJEMxniC6/vEN15oS0d8B
 nCbpW9zp/M/micd+Jn2TwEuXNx4spN2gv681SM7Z175TGmrlLnpr3r6OFHR+QE3TfVPb
 G83Y/aNzC9LzBNqqa6KRlBFwSQkBpNy1kAmoe2VCJCSqKFvSx1PG0AMcnrjuICQp1SV4
 cYj7ppFDVNVd6YrizAP2dLcXC2dOKvyQIjiz1Y0DrSUwE4Gs07836FZ+3FJaMuhjp1qE
 9Afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HH1+xBjjcIdrtUfBU620QV7bApj4K8yb03F0Xf+u3js=;
 b=XnKFWctVKjt+0U0e8byOnYowXJ534L9UJZXL6NQ7bX9QT8L8TmINWHUrowDCwUJYA4
 F0oIXTq2n5KJzUuFh0gNhfGuTNx/v4+yWQpCo7AJTnJ0bKkcwcE7RA79l4x0uK/xyaHn
 Mi4NKl9C+CTSSZ8JMUOkIfwD6eXra5wTErPZXntToIyGFtJm5OsD2/ZkPExjTUEWqWwV
 fOs4QD6gLAZfO/99ekqXawWc5bO7fJSwzamQZhsKq+HRTCDjHNizKI8t0KzruPdl2jBn
 i18jx3Uvk0wGgaAmQYURtPmVAmMgeo2muCb/7xyx959PizRZhjKqXatqoDnh2Zsk00bz
 29DQ==
X-Gm-Message-State: ANoB5pnBmk6UxtEOowhjyU9YTPgGKZZ1PU4EpKZav/ekrCm9+WwWrWHk
 ZT4rCF6yLVeK1pCRcWZne1HLWfa/eHUmsg==
X-Google-Smtp-Source: AA0mqf7jEJNn6qyjbF/1yj62epXSsg8n0lwRfXAB/1odNhFjLNvriD0Y3ELsU1ewf+5t1yHLVz5KGA==
X-Received: by 2002:adf:f350:0:b0:236:cab3:fdb2 with SMTP id
 e16-20020adff350000000b00236cab3fdb2mr7777808wrp.607.1668441124752; 
 Mon, 14 Nov 2022 07:52:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m66-20020a1c2645000000b003cfd58409desm9039277wmm.13.2022.11.14.07.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 07:52:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 0/2] target-arm queue for rc1
Date: Mon, 14 Nov 2022 15:51:59 +0000
Message-Id: <20221114155201.425027-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Hi; here's the arm pullreq for rc1. Just one bugfix and
a MAINTAINERS file update...

thanks
-- PMM

The following changes since commit 305f6f62d9d250a32cdf090ddcb7e3a5b26a342e:

  Merge tag 'pull-la-20221112' of https://gitlab.com/rth7680/qemu into staging (2022-11-12 09:17:06 -0500)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221114

for you to fetch changes up to d9721f19cd05a382f4f5a7093c80d1c4a8a1aa82:

  hw/intc/arm_gicv3: fix prio masking on pmr write (2022-11-14 15:10:58 +0000)

----------------------------------------------------------------
target-arm queue:
 * hw/intc/arm_gicv3: fix prio masking on pmr write
 * MAINTAINERS: Update maintainer's email for Xilinx CAN

----------------------------------------------------------------
Jens Wiklander (1):
      hw/intc/arm_gicv3: fix prio masking on pmr write

Vikram Garhwal (1):
      MAINTAINERS: Update maintainer's email for Xilinx CAN

 hw/intc/arm_gicv3_cpuif.c | 3 +--
 MAINTAINERS               | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

