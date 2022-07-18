Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D923B578857
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:27:57 +0200 (CEST)
Received: from localhost ([::1]:36624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUXD-0005Bz-7F
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURn-0007Ke-NX; Mon, 18 Jul 2022 13:22:20 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURk-0001eo-Kc; Mon, 18 Jul 2022 13:22:18 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10bf634bc50so25527654fac.3; 
 Mon, 18 Jul 2022 10:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5FjiHpT6Wxsb99wndvKWVTUaoUl79TON1Maqd8HCXAU=;
 b=dY409dQBY8QnSd+AK9BUyrcYWjMvNhDiDSzdOS8/i9YJ2AfWfwFYngPDrKTPT8R/Jj
 dAMRjccvKy4RZSyFFYP+YXelcWR3nVA3HarkbMadpOOxdwflB126dVhPOb4ych+b8Qnn
 uBlsjNrDpdmwjauUTCxn5NJ99dT34pGK/EN+RDJlIbg45swHAIqwhYu5df1fwNZY7JQY
 mgKengJVMXbzQxRSmW+1XlUPO6y7a5oRI2fvCuQJ4Q/IQ490tjWiVF7lFiBzNJn/0Aaj
 n4rpY7g0ZRNNWJB3dnFfW7wuRgQqPrjdfVR6a2ZsX2sv/04aPGSzK/PyoTTemrKZ50Dl
 QU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5FjiHpT6Wxsb99wndvKWVTUaoUl79TON1Maqd8HCXAU=;
 b=0knviG3UOe+XPBD8hXyhWQ/AFfrT8GfmJLXU5JFs6QH04AfpCGOnG0iMEZ8dE1L+1I
 lpXvXgTWcp62fLsTDNVBEbBEA1iKuQic0j1Bsz/FNvm0WT9mZvfxe9o7gcvlCc7xgOb0
 IKmX4wjgzGD5iYwqG+uz3GXWr1JQNwxfzTfRO22wVz/8z+ckD1lpTNn3X+ajywLI0lM9
 cShVZqi6rxZ2XpzBUoZ5181JECNFiHrQQ7gvXVOJNFXVvjB+XdKXz54F1oH/RGMRUP3S
 FkbH0S+GKY9tG0Uih9xu9VJQYrVq5YzHR75SQf0lysITvGVBdi0uOLuporsuOHjgFmho
 blzw==
X-Gm-Message-State: AJIora/j2bqgcHWSyOyFf926jWTYFDu5vrffRXfC2CMNj4iYsyJNJBOh
 7XCxKyQxQSLoGje64KGeQu4r1F9K9UY=
X-Google-Smtp-Source: AGRyM1vv4GQ2JcKLnrl8J3NEfqYr2/VPMm4I1MwS5tOQDmDzUSFJhqG8JFH7veFgYlY5RCygAKwQSQ==
X-Received: by 2002:a05:6870:a550:b0:10c:1646:b6a3 with SMTP id
 p16-20020a056870a55000b0010c1646b6a3mr17859978oal.298.1658164934384; 
 Mon, 18 Jul 2022 10:22:14 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:13 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PULL 00/30] ppc queue
Date: Mon, 18 Jul 2022 14:21:38 -0300
Message-Id: <20220718172208.1247624-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 782378973121addeb11b13fd12a6ac2e69faa33f:

  Merge tag 'pull-target-arm-20220718' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-07-18 16:29:32 +0100)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220718

for you to fetch changes up to d2066bc50d690a6605307eaf0e72a9cf51e6fc25:

  target/ppc: Check page dir/table base alignment (2022-07-18 13:59:43 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-07-18:

This is the last ppc patch queue before the soft freeze. It contains new
TCG instructions and changes, a tricky bug fix in kvmppc_find_cpu_dt()
and other enhancements/fixes.

- tcg and target/ppc:
  - move instructions to decodetree
  - check for bad Radix configs
  - ISA 3.00 tlbie[l]
  - fix gen_*_exception error codes
  - check fortb_env != 0 when printing TBU/TBL/DECR
- fix kvmppc_find_cpu_dt() returning the wrong CPU DT path when there's a
'clock-frequency' property in the root node
- spapr, e500: pass a random seed in /chosen/rng-seed
- all boards: allocate IRQ lines with qdev_init_gpio_in()

----------------------------------------------------------------
Cédric Le Goater (5):
      ppc64: Allocate IRQ lines with qdev_init_gpio_in()
      ppc/40x: Allocate IRQ lines with qdev_init_gpio_in()
      ppc/6xx: Allocate IRQ lines with qdev_init_gpio_in()
      ppc/e500: Allocate IRQ lines with qdev_init_gpio_in()
      ppc: Remove unused irq_inputs

Jason A. Donenfeld (1):
      hw/ppc: pass random seed to fdt

Leandro Lupori (5):
      target/ppc: Move tlbie[l] to decode tree
      target/ppc: Implement ISA 3.00 tlbie[l]
      ppc: Check partition and process table alignment
      target/ppc: Improve Radix xlate level validation
      target/ppc: Check page dir/table base alignment

Lucas Coutinho (9):
      target/ppc: Move slbie to decodetree
      target/ppc: Move slbieg to decodetree
      target/ppc: Move slbia to decodetree
      target/ppc: Move slbmte to decodetree
      target/ppc: Move slbmfev to decodetree
      target/ppc: Move slbmfee to decodetree
      target/ppc: Move slbfee to decodetree
      target/ppc: Move slbsync to decodetree
      target/ppc: Implement slbiag

Matheus Ferst (9):
      target/ppc: Fix gen_priv_exception error value in mfspr/mtspr
      target/ppc: fix exception error value in slbfee
      target/ppc: remove mfdcrux and mtdcrux
      target/ppc: fix exception error code in helper_{load, store}_dcr
      target/ppc: fix PMU Group A register read/write exceptions
      target/ppc: fix exception error code in spr_write_excp_vector
      target/ppc: receive DisasContext explicitly in GEN_PRIV
      target/ppc: add macros to check privilege level
      target/ppc: check tb_env != 0 before printing TBU/TBL/DECR

Murilo Opsfelder Araujo (1):
      target/ppc/kvm: Skip current and parent directories in kvmppc_find_cpu_dt

 hw/intc/xics.c                               |  10 +-
 hw/intc/xive.c                               |   4 +-
 hw/ppc/e500.c                                |  13 +-
 hw/ppc/mac_newworld.c                        |  16 +-
 hw/ppc/mac_oldworld.c                        |   2 +-
 hw/ppc/pegasos2.c                            |   2 +-
 hw/ppc/ppc.c                                 |  30 +-
 hw/ppc/ppc405_uc.c                           |   4 +-
 hw/ppc/ppc440_bamboo.c                       |   4 +-
 hw/ppc/prep.c                                |   2 +-
 hw/ppc/prep_systemio.c                       |   2 +-
 hw/ppc/sam460ex.c                            |   4 +-
 hw/ppc/spapr.c                               |  10 +
 hw/ppc/spapr_hcall.c                         |   9 +
 hw/ppc/virtex_ml507.c                        |  10 +-
 target/ppc/cpu.h                             |   7 +-
 target/ppc/cpu_init.c                        |  27 +-
 target/ppc/helper.h                          |  19 +-
 target/ppc/insn32.decode                     |  34 ++
 target/ppc/kvm.c                             |   6 +
 target/ppc/mmu-book3s-v3.c                   |   5 +
 target/ppc/mmu-book3s-v3.h                   |  15 +
 target/ppc/mmu-hash64.c                      |  41 ++-
 target/ppc/mmu-radix64.c                     |  92 ++++-
 target/ppc/mmu_helper.c                      | 154 ++++++++
 target/ppc/monitor.c                         |   9 +
 target/ppc/power8-pmu-regs.c.inc             |  10 +-
 target/ppc/timebase_helper.c                 |   6 +-
 target/ppc/translate.c                       | 513 +++++++++------------------
 target/ppc/translate/fixedpoint-impl.c.inc   |   7 +-
 target/ppc/translate/fp-impl.c.inc           |   4 +-
 target/ppc/translate/storage-ctrl-impl.c.inc | 250 +++++++++++++
 32 files changed, 849 insertions(+), 472 deletions(-)
 create mode 100644 target/ppc/translate/storage-ctrl-impl.c.inc

