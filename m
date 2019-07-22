Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B9B700B5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jul 2019 15:15:19 +0200 (CEST)
Received: from localhost ([::1]:33410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpY9t-0000Qk-ED
	for lists+qemu-devel@lfdr.de; Mon, 22 Jul 2019 09:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hpY9B-0007Nx-6U
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:14:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hpY9A-00034K-2K
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:14:33 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44516)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hpY99-00033H-RQ
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 09:14:32 -0400
Received: by mail-wr1-x441.google.com with SMTP id p17so39341871wrf.11
 for <qemu-devel@nongnu.org>; Mon, 22 Jul 2019 06:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFDAqPQkZPRu7uzWO2+Dyf2rR9xqez/uX3of0Oc36D4=;
 b=kSO2Xwhf6bcEwaJ/WUWedgC1YRUnVIwTC49BVYN60DnEeYHZ4iMX92biHgevt71O4m
 2Xd8wyFnPHWiD/EeM+dn2v3ztblQbjHwsf7ABex6iblFVrkRlh3kJ0Qs7KyAJI7cXjWH
 /WOyl/ALRP0T6W0j3E4X1bpRCnJ0nUtnEbr/QkBpaEYFqYOml2EmiFYJJAWTd+XbYQl2
 mCJne2FAYdVmuwlMaJvU2/YNpcPXWxQJN/zCqA44yEBod0vomOsES8eSrfgfaczIgnGC
 bY5trNVWnptg4Yk42sR6o9RbxQKw+f2CsYkoq6cyCyT7aplg6TPOSGP/Hc9ADfWry3Y0
 eoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFDAqPQkZPRu7uzWO2+Dyf2rR9xqez/uX3of0Oc36D4=;
 b=VuP+LEw8hcSQ/esT2G4U4vfzMWmihDWS6uT8famFhk8msimTbjrH/wzkih6u1vu6nN
 36u/VwgNrdPOqSC3FUVIC/ultzimK0uX/0gA8gxVzbhzFVaDc9zcQ4uJdJMkkWBdwvXi
 QHp5cy4SPBpbpBWzzQpQsEhCOWicRHtUibXrk4G8OuA2e5098K3SLBjq4cgduRIUMc2J
 IScAYUI2vrsAbG8HgRd2ExfHTNQMffQb9R0J81A6RP0Np8I89irn3XeBnl6vaaLPBqI7
 BUaCFk9JxOU2jR0UJ4CrNdeoP14TVphi0SCM9Ee+YuhebXClGvZ+jY1XzErnaRutFJAY
 DT5Q==
X-Gm-Message-State: APjAAAWMSqaH3hEU6Vkip1rmRZVTavTjjD3sMG6BnctAA6/URuHV/bUY
 DWzjD4H4Vp1MI0BoYRPBaiu7uKnK8VcPhg==
X-Google-Smtp-Source: APXvYqxAjphPrLvnZEXOV5iFs2ydeGYAu5sgpyubaErFeDU0Xe0ZaIAstBGmprY1DtGz7m8T7JyOXg==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr75206447wrl.134.1563801269988; 
 Mon, 22 Jul 2019 06:14:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f12sm42207217wrg.5.2019.07.22.06.14.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 06:14:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jul 2019 14:14:22 +0100
Message-Id: <20190722131427.2669-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PULL 0/5] target-arm queue
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

target-arm queue for rc2. This has 3 Arm related bug fixes,
and a couple of non-arm patches which don't have an obviously
better route into the tree.

thanks
-- PMM

The following changes since commit b9e02bb3f98174209dbd5c96858e65a31723221b:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2019-07-19' into staging (2019-07-22 10:11:28 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20190722

for you to fetch changes up to ddb45afbfbc639365d6c934e4e29f6de5e5e2a0e:

  contrib/elf2dmp: Build download.o with CURL_CFLAGS (2019-07-22 14:07:39 +0100)

----------------------------------------------------------------
target-arm queue:
 * target/arm: Add missing break statement for Hypervisor Trap Exception
   (fixes handling of SMC insn taken to AArch32 Hyp mode via HCR.TSC)
 * hw/arm/fsl-imx6ul.c: Remove dead SMP-related code
 * target/arm: Limit ID register assertions to TCG
 * configure: Clarify URL to source downloads
 * contrib/elf2dmp: Build download.o with CURL_CFLAGS

----------------------------------------------------------------
Peter Maydell (4):
      hw/arm/fsl-imx6ul.c: Remove dead SMP-related code
      target/arm: Limit ID register assertions to TCG
      configure: Clarify URL to source downloads
      contrib/elf2dmp: Build download.o with CURL_CFLAGS

Philippe Mathieu-Daudé (1):
      target/arm: Add missing break statement for Hypervisor Trap Exception

 configure                     |  2 +-
 Makefile                      |  1 -
 contrib/elf2dmp/Makefile.objs |  3 +++
 include/hw/arm/fsl-imx6ul.h   |  2 +-
 hw/arm/fsl-imx6ul.c           | 62 +++++++++++++------------------------------
 hw/arm/mcimx6ul-evk.c         |  2 +-
 target/arm/cpu.c              |  7 +++--
 target/arm/helper.c           |  1 +
 8 files changed, 30 insertions(+), 50 deletions(-)

