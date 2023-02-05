Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB0768AF38
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:06:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObu9-0001Py-Ue; Sun, 05 Feb 2023 05:05:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtP-0000yh-UR; Sun, 05 Feb 2023 05:05:15 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pObtI-00057T-Qp; Sun, 05 Feb 2023 05:05:02 -0500
Received: by mail-oi1-x236.google.com with SMTP id t5so87010oiw.1;
 Sun, 05 Feb 2023 02:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Et7iI0/Oi3d3wRPuPDyUFe1DmOOnmg65C1nk80cN4KU=;
 b=L1hwT1fZ9Lx8BvAt9Ndm/aRQBzr7dcm2HpvIq5nr93OZlqGDefOlFZ1gu4oxmksxZn
 74MEoyUx2WExMmQgNL69JfP444ULvk2dK5vdY26dE7QqSsF9xqmgJL9N4W27+hiuxGih
 blVgqlKd83whaa8W+ZklIwO7H3qZyog98lEyCoXcJIm3d9IK4QyD5UxOh+FjyYQjTLaL
 3UTbped6fPmGpFJxEJigBuTeKgWcPOgKeSM8Y8o9Vy2y9mOi4KdiGqHyl1yM2n+dHsf5
 hFWeliYRI8C2K4g+Gx9fKJsnsf80KbgAaRZVyzwj8y5706CwaRacLB+mF71we6f1g9bm
 Qqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Et7iI0/Oi3d3wRPuPDyUFe1DmOOnmg65C1nk80cN4KU=;
 b=E6F7izcrft1kS8CNQcIFd2O+QCXJfG7lk6zWIoNr19hIQhKx5Of/8vgpie8EFPiRlq
 VO5/OGkHdRNviHwPZV9ABNN7e+X9el0EJRpjOih2/bvVj3hV6rncOdG9iM60nfvpQMyW
 Ur9ST8BY8r3KXCdopXNYIPdQZ7T2o6WF5zp0GmpiDWQywhNFHmH8TkFamPxjKVLugj5B
 l8J6/8BwDUXwPsejyZUvExXoLeaO1pYuCeYyKQYvuoQxU2PbhPXmBfv58CHK1YtA4Vnt
 58Bss1J+xgMa5fdzyaCVMYL+pMDJSRoVsodA03VRbe9ky8tOx2OUo/qPG4dC1LhLQrpr
 f27w==
X-Gm-Message-State: AO0yUKVFhJBOI7g7QPFx4p4u2cej0zbdx2OQ8a9UT6dGS6VvGdUYJale
 VC8WCgJSw3WS3vR1bDclThVZkgMcc54=
X-Google-Smtp-Source: AK7set9FVP2Em5b4IYSM8r+OtkXR/S+6b0vklS3kWNZqxuJxtKpEMwfYy6BOY7Y1w2SPbcN2nT3fAA==
X-Received: by 2002:aca:acd7:0:b0:364:cef2:dfd0 with SMTP id
 v206-20020acaacd7000000b00364cef2dfd0mr9227253oie.29.1675591494613; 
 Sun, 05 Feb 2023 02:04:54 -0800 (PST)
Received: from grind.. ([191.19.125.138]) by smtp.gmail.com with ESMTPSA id
 s191-20020acaa9c8000000b003631fe1810dsm2730924oie.47.2023.02.05.02.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 02:04:54 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	danielhb413@gmail.com,
	peter.maydell@linaro.org
Subject: [PULL 00/16] ppc queue
Date: Sun,  5 Feb 2023 07:04:33 -0300
Message-Id: <20230205100449.2352781-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The following changes since commit ceabf6e500570ecfb311d8896c4ba9da8cf21f2a:

  Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-02-04 17:17:15 +0000)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20230205

for you to fetch changes up to bd591dc1b3c39b7f73b8d9f20be6e9001c905238:

  hw/display/sm501: Code style fix (2023-02-05 06:40:28 -0300)

----------------------------------------------------------------
ppc patch queue for 2023-02-05:

This queue includes patches that aren't PPC specific but benefit/impact
PPC machines, such as the changes to guestperf.py, mv64361 and sm501. As
for PPC specific changes we have e500 and PNV_PHB5 fixes.

----------------------------------------------------------------
BALATON Zoltan (5):
      ppc/pegasos2: Improve readability of VIA south bridge creation
      hw/ppc/pegasos2: Fix a typo in a comment
      hw/display/sm501: Remove parenthesis around constant macro definitions
      hw/display/sm501: Remove unneeded casts from void pointer
      hw/display/sm501: Code style fix

Bernhard Beschow (5):
      hw/pci-host/mv64361: Reuse pci_swizzle_map_irq_fn
      hw/ppc: Set machine->fdt in e500 machines
      hw/ppc/e500{, plat}: Drop redundant checks for presence of platform bus
      hw/ppc/e500.c: Avoid hardcoding parent device in create_devtree_etsec()
      hw/ppc/e500.c: Attach eSDHC unimplemented region to ccsr_addr_space

Frederic Barrat (4):
      ppc/pnv/pci: Cleanup PnvPHBPecState structure
      ppc/pnv/pci: Remove duplicate definition of PNV_PHB5_DEVICE_ID
      ppc/pnv/pci: Update PHB5 version register
      ppc/pnv/pci: Fix PHB xscom registers memory region name

Murilo Opsfelder Araujo (2):
      tests/migration: add sysprof-capture-4 as dependency for stress binary
      tests/migration: add support for ppc64le for guestperf.py

 hw/display/sm501.c                  | 419 ++++++++++++++++++------------------
 hw/pci-host/mv64361.c               |   7 +-
 hw/pci-host/pnv_phb4.c              |   2 +-
 hw/ppc/e500.c                       |  24 ++-
 hw/ppc/e500plat.c                   |   9 +-
 hw/ppc/pegasos2.c                   |  16 +-
 include/hw/pci-host/pnv_phb4.h      |   5 +-
 tests/migration/guestperf/engine.py |  28 ++-
 tests/migration/meson.build         |   4 +-
 9 files changed, 268 insertions(+), 246 deletions(-)

