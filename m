Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE1C31E81B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:50:11 +0100 (CET)
Received: from localhost ([::1]:33554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCfwo-0008Lh-MG
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu3-0006fn-Pz
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:19 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCftv-0007Bu-No
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:19 -0500
Received: by mail-wm1-x330.google.com with SMTP id o82so2316025wme.1
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L5hZIHgHciIDykoIep90Im4vKtmmkQHcJFC85HItB8Q=;
 b=gvSkxfnLcAtBC/wVI40wi/Qf2Ly6kn8ZV+c5vj2D5xBpVxSWSPdHwONZLTNygp80S8
 iuZ2cbRQxQhXxBF71TE44JVvXoiN4/j9vzmMsTRQizc/c0dkYwICE9ZYaeNfDWh/y2sD
 sq9ap6lVQSU0cnm/tjNvfCjdzvR3W2hmOIx3eMtXwfYYZalIvuU9HqlhCoF2RAhvlHrG
 EMXcAk4t5nQMq2SoWW5/9NhAdbbDlGDHIOo9FYpsqQzbfDGxiywrZ4+yan3wA1BITCZ8
 hoKutTSCh3hyPReUspkIe5ZNPZcQSKGQdHKHhjA4ib1G0CE7oaZBlAPPbX2dqu5E2Q4r
 4cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L5hZIHgHciIDykoIep90Im4vKtmmkQHcJFC85HItB8Q=;
 b=pJ58IsL+XU1lpB9yGqRCO+Dd13LA+nAzZKRjOZPxX62/4hIpDVVCamH+RtCl+LoEWb
 8oRTVdZdfuD9SFfaJRoHFj1DU5hAbjq8PT7j+16u0gxcnzfHazm6dDPzzJEkuq6u+jqb
 MuSYOObtboqwYnpzTinmwAQzGllxQQ2l7SpSAr37nPFUue6asrynysgU10gygv+BBQKO
 PoSj5jPuIpEGLHZFebnjoLw9W/NZoGhb5XVdXXxFUcVg4PWd3jg5Fw/bgtGZ3F6ZAgfW
 GYr2jyFPOzUpKmq6L2hE4NpqhHhBSfqRbYxjtbN4HNpU5JJy3vUTdcTT0IcmM1VFPKFW
 ALDA==
X-Gm-Message-State: AOAM530DpKOMMSQRtzpUCBOoObGj6OkFLje7x0ayO+d8Ywg/n+zmcxX/
 EgCE11PT4UU/DmLMSmvVRlkVFg==
X-Google-Smtp-Source: ABdhPJxl06GkwZTdI/cJfx4Heg+gkeMXZZK9QI0wwv0DaoYzacyxR9qvujeEWyi88vdCRpW+/8Km8Q==
X-Received: by 2002:a1c:1982:: with SMTP id 124mr2843588wmz.84.1613641630067; 
 Thu, 18 Feb 2021 01:47:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z15sm9882281wrs.72.2021.02.18.01.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E22891FF7E;
 Thu, 18 Feb 2021 09:47:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 00/23] plugin updates (hwprofile, CF_NOCACHE, io_recompile)
Date: Thu, 18 Feb 2021 09:46:43 +0000
Message-Id: <20210218094706.23038-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1af5629673bb5c1592d993f9fb6119a62845f576:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20210216' into staging (2021-02-17 14:44:18 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-plugin-updates-180221-1

for you to fetch changes up to df55e2a701d02bc01b9425843c667fd0cb4cdfa9:

  tests/acceptance: add a memory callback check (2021-02-18 08:19:23 +0000)

----------------------------------------------------------------
Plugin updates:

  - expose vdev name in PCI memory registration
  - new hwprofile plugin
  - bunch of style cleanups to contrib/plugins
  - fix call signature of inline instrumentation
  - re-factor the io_recompile code to push specialisation into hooks
  - add some acceptance tests for the plugins
  - clean-up and remove CF_NOCACHE handling from TCG
  - fix instrumentation of cpu_io_recompile sections
  - expand tests to check inline and cb count the same

----------------------------------------------------------------
Alex Bennée (14):
      hw/virtio/pci: include vdev name in registered PCI sections
      plugins: add API to return a name for a IO device
      plugins: new hwprofile plugin
      accel/tcg/plugin-gen: fix the call signature for inline callbacks
      tests/plugin: expand insn test to detect duplicate instructions
      tests/acceptance: add a new set of tests to exercise plugins
      accel/tcg: actually cache our partial icount TB
      accel/tcg: cache single instruction TB on pending replay exception
      accel/tcg: re-factor non-RAM execution code
      accel/tcg: remove CF_NOCACHE and special cases
      accel/tcg: allow plugin instrumentation to be disable via cflags
      tests/acceptance: add a new tests to detect counting errors
      tests/plugin: allow memory plugin to do both inline and callbacks
      tests/acceptance: add a memory callback check

Richard Henderson (4):
      exec: Move TranslationBlock typedef to qemu/typedefs.h
      accel/tcg: Create io_recompile_replay_branch hook
      target/mips: Create mips_io_recompile_replay_branch
      target/sh4: Create superh_io_recompile_replay_branch

zhouyang (5):
      contrib: Don't use '#' flag of printf format
      contrib: Fix some code style problems, ERROR: "foo * bar" should be "foo *bar"
      contrib: Add spaces around operator
      contrib: space required after that ','
      contrib: Open brace '{' following struct go on the same line

 docs/devel/tcg-plugins.rst               |  34 ++++
 include/exec/exec-all.h                  |   9 +-
 include/exec/plugin-gen.h                |   4 +-
 include/exec/tb-context.h                |   1 -
 include/hw/core/cpu.h                    |   4 +-
 include/hw/core/tcg-cpu-ops.h            |  13 +-
 include/qemu/plugin.h                    |   4 +
 include/qemu/qemu-plugin.h               |   6 +
 include/qemu/typedefs.h                  |   1 +
 target/arm/internals.h                   |   3 +-
 accel/tcg/cpu-exec.c                     |  61 ++-----
 accel/tcg/plugin-gen.c                   |  35 ++--
 accel/tcg/translate-all.c                | 130 +++++--------
 accel/tcg/translator.c                   |   5 +-
 contrib/ivshmem-server/main.c            |   2 +-
 contrib/plugins/hotblocks.c              |   2 +-
 contrib/plugins/hotpages.c               |   2 +-
 contrib/plugins/howvec.c                 |  19 +-
 contrib/plugins/hwprofile.c              | 305 +++++++++++++++++++++++++++++++
 contrib/plugins/lockstep.c               |   6 +-
 hw/virtio/virtio-pci.c                   |  22 ++-
 plugins/api.c                            |  56 ++++--
 target/cris/translate.c                  |   2 +-
 target/lm32/translate.c                  |   2 +-
 target/mips/cpu.c                        |  18 ++
 target/moxie/translate.c                 |   2 +-
 target/sh4/cpu.c                         |  18 ++
 target/unicore32/translate.c             |   2 +-
 tests/plugin/insn.c                      |  12 +-
 tests/plugin/mem.c                       |  27 ++-
 MAINTAINERS                              |   1 +
 contrib/plugins/Makefile                 |   1 +
 tests/acceptance/tcg_plugins.py          | 148 +++++++++++++++
 tests/tcg/i386/Makefile.softmmu-target   |  10 +
 tests/tcg/i386/Makefile.target           |   7 +
 tests/tcg/x86_64/Makefile.softmmu-target |  10 +
 36 files changed, 769 insertions(+), 215 deletions(-)
 create mode 100644 contrib/plugins/hwprofile.c
 create mode 100644 tests/acceptance/tcg_plugins.py


-- 
2.20.1


