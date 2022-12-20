Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E226521FC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:06:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3K-00046b-Qi; Tue, 20 Dec 2022 08:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3J-00046D-2B; Tue, 20 Dec 2022 08:53:05 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3H-0000yb-2F; Tue, 20 Dec 2022 08:53:04 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1443a16b71cso15368684fac.13; 
 Tue, 20 Dec 2022 05:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j+YNQntagKQI44WA48wRqfjjB5DN9As576ZDVe1TcBU=;
 b=BprzFXdt/WnpSJEvsXt6050W91zha/+3RpOh5875DGQCp+GUWo0ovx2TYzEp0ajwxs
 svD6jPEs7hhpqAK2aajo80GIv737JusT7FM1SETmBaY/b73WPJpa50qBuIEdkX2eP+nX
 UiHKKd2GBZcxDayao3SIDq7qW1eFVqwjP0GqgbWfjIjZ07PDf/13w8OOfs8kz9C8FPn7
 xUG3YItYLASHkEY+/ouJF5GIWMuD9+Nz5F/i6oYNBggJxqUAqP+gl34GeaoSBGs187vi
 Zz80JAlOWDGaCm7+ThbhO6nSSH7Re2nkOgJzRiarhIGkw19/Nc0F+ildEZMlZ4JYYa9k
 eGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j+YNQntagKQI44WA48wRqfjjB5DN9As576ZDVe1TcBU=;
 b=paKAag4ax6qgaey70NFmUgquBhvokL4bDPVHLwEI6uBrns2NtQSObnV7zFIKs/V6BD
 emNyZodzOuob3FKIEqe5FePXowHDxMY/kz/pCcK7GeqsmZASunf5O9s8VJU0xDpCdmlf
 bmvf2kziPSKhhgwk8OjR8uPavDbxJVheX8oZ81d6UvKTs28nTdRiVRoFBWU53X+l1jpm
 j0MNt9O1VPFDhKOY8Z/qH08S+Reg5BP1wv4nZtp9C83SzHWKC1yKW0Xmo2exiKQkSiuL
 PdwxNXlrFPkiCHqotFtRB6v9Z645/HLkzC38mbl8SUg7TQE8sBED7jSjS3VEynqazstL
 SgSA==
X-Gm-Message-State: ANoB5pkpQVR41TmQpS/yLkCIKEthha4JUzTL2eOfHzPJ6HzwTlkyUJj3
 cewuRasuLM7UVFMLZEVe44sRHp399ww=
X-Google-Smtp-Source: AA0mqf5T/zwT0/4e2lKWbTo0BKsdzetoVm/Jl4QS7L+pQR/Gd2yXahaK6hlIjO2d8BcNxAkerO8f6Q==
X-Received: by 2002:a05:6870:47a9:b0:13b:acd4:1315 with SMTP id
 c41-20020a05687047a900b0013bacd41315mr21686216oaq.39.1671544381122; 
 Tue, 20 Dec 2022 05:53:01 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:00 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	danielhb413@gmail.com,
	peter.maydell@linaro.org
Subject: [PULL 00/15] ppc queue
Date: Tue, 20 Dec 2022 10:52:36 -0300
Message-Id: <20221220135251.155176-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

The following changes since commit 33698d3abf8ce65c38bb4b12b600b130d2682c79:

  Merge tag 'pull-monitor-2022-12-19' of https://repo.or.cz/qemu/armbru into staging (2022-12-19 16:12:59 +0000)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20221220

for you to fetch changes up to bac9fdfd3940f7b79735f85cd3a6dd319365e978:

  target/ppc: Check DEXCR on hash{st, chk} instructions (2022-12-20 10:39:24 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-12-20:

This queue contains a MAINTAINERS update, the implementation of the
Freescale eSDHC, the introduction of the DEXCR/HDEXCR instructions and
other assorted fixes (most of them for the e500 board).

----------------------------------------------------------------
Bernhard Beschow (6):
      target/ppc/mmu_common: Log which effective address had no TLB entry found
      target/ppc/mmu_common: Fix table layout of "info tlb" HMP command
      hw/ppc/virtex_ml507: Prefer local over global variable
      hw/ppc/e500: Prefer local variable over qdev_get_machine()
      hw/ppc/e500: Resolve variable shadowing
      hw/ppc/e500: Move comment to more appropriate place

Daniel Henrique Barboza (1):
      MAINTAINERS: downgrade PPC KVM/TCG CPUs and pSeries to 'Odd Fixes'

Nicholas Miehlbradt (2):
      target/ppc: Implement the DEXCR and HDEXCR
      target/ppc: Check DEXCR on hash{st, chk} instructions

Philippe Mathieu-Daudé (6):
      hw/sd/sdhci: MMIO region is implemented in 32-bit accesses
      hw/sd/sdhci: Support big endian SD host controller interfaces
      hw/ppc/e500: Add Freescale eSDHC to e500plat
      target/ppc/kvm: Add missing "cpu.h" and "exec/hwaddr.h"
      hw/ppc/vof: Do not include the full "cpu.h"
      hw/ppc/spapr: Reduce "vof.h" inclusion

 MAINTAINERS                 |  6 ++---
 docs/system/ppc/ppce500.rst | 13 ++++++++++
 hw/ppc/Kconfig              |  2 ++
 hw/ppc/e500.c               | 58 +++++++++++++++++++++++++++++++++++++++------
 hw/ppc/e500.h               |  1 +
 hw/ppc/e500plat.c           |  1 +
 hw/ppc/spapr.c              |  1 +
 hw/ppc/virtex_ml507.c       |  2 +-
 hw/sd/sdhci-internal.h      |  1 +
 hw/sd/sdhci.c               | 36 +++++++++++++++++++++++++---
 include/hw/ppc/spapr.h      |  3 ++-
 include/hw/ppc/vof.h        |  2 +-
 include/hw/sd/sdhci.h       |  1 +
 target/ppc/cpu.h            | 19 +++++++++++++++
 target/ppc/cpu_init.c       | 25 +++++++++++++++++++
 target/ppc/excp_helper.c    | 58 +++++++++++++++++++++++++++++++++------------
 target/ppc/kvm_ppc.h        |  3 +++
 target/ppc/mmu_common.c     |  5 ++--
 target/ppc/spr_common.h     |  1 +
 target/ppc/translate.c      | 19 +++++++++++++++
 20 files changed, 224 insertions(+), 33 deletions(-)

