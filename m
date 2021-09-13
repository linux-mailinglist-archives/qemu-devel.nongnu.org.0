Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E54A408AA0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:00:47 +0200 (CEST)
Received: from localhost ([::1]:57890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkdg-0005cL-Ov
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkat-0002lP-PQ
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:52 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkaq-0005kd-HO
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:57:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id q26so14260768wrc.7
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cHYPlPyLmBcJBp60pMHYRGeaaqP3us2RVbwBJrcnjmc=;
 b=iSCS6ow12c89Uy/a6dhKLjnxKNO+tAEEvN9q2BL/T0aNX+tif10rIgEruGu2Jq/dHl
 eOx0aY+PWgFV5e8tokBx3uCh5Q2BnwK9SMBfpKyOib3RsnZbbeakXQ31icsc6E5GiG2K
 w51QDvRi6qrGouq5JPY7MFzXix5NFedfeGx2b8NFQtphWvfshM9Cv94xHTqvPmdTAaLb
 GHO4wJCKloiILQMkUaMFkuUZez9/U3Z0j0qbsuwPvvvbvMMwwJYRJRV9QFqWTT4uSwqp
 tnRlBkBm1GNscu3W3wkDnqYH8f7EVBRMEnltewRjF7cOiJ+lfhIvrX8ooKBdaOG4uKt1
 TzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cHYPlPyLmBcJBp60pMHYRGeaaqP3us2RVbwBJrcnjmc=;
 b=G1/KAyY708yynPoTxiZ0wcJIOr4X7BU9y9QFUW6lRTVJ2GO6NZYX6emqUuioiGiBbe
 detxgrPRNUcBgLJgjyRJaJXMpwioyYoYxjELd5VbZjFqCrimI0qXY9w5YgKml7qtKVnz
 6PdZ6ueq3Bn/3jyEVECz6rV8eP80YxRPl2C65lFugUXsV3qKeMR1975/7HoYzjUA68Q/
 BZ1FTsKVT296RxbQSYis/HK0ltKd7psPk5I9+XRrsoVUxVRdE1DU6ZPD/KOhpkICyxZI
 AZohj3IcH6xJgblLEmHXxuLK0LFbBzc0mc5GCEq41jUaPdBI4b66QBK7Z4fs6ch/Nm0j
 RGyA==
X-Gm-Message-State: AOAM532Rd3gcaK/A0de4SLWXL08KI6WQXkwZu48kgwJMv+RY7PzfM/uB
 hJeGVTP+h9mC0utVwBNRgcuxokuK/OI=
X-Google-Smtp-Source: ABdhPJwIu0p8ncuCJMxSZ6bsdgX8Ge/+cIXX+ZMSi96Rf+/BujZzUbm7q5UZUz0qs2mqxkuLIn4moA==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr1591705wrs.262.1631534266682; 
 Mon, 13 Sep 2021 04:57:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.57.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:57:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] x86, docs, meson changes for 2021-09-13
Date: Mon, 13 Sep 2021 13:57:21 +0200
Message-Id: <20210913115742.533197-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit bd662023e683850c085e98c8ff8297142c2dd9f2:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20210908' into staging (2021-09-08 11:06:17 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 8d97327342ea8b32ede19fadaf8290dc29fcfa048:

  docs: link to archived Fedora code of conduct (2021-09-13 09:33:27 +0200)

----------------------------------------------------------------
* Fixes for "-cpu max" on i386 TCG (Daniel)
* vVMLOAD/VMSAVE and vGIF implementation (Lara)
* Reorganize i386 targets documentation in preparation for SGX (myself)
* Meson cleanups (myself, Thomas)
* NVMM fixes (Reinoud)
* Suppress bogus -Wstringop-overflow (Richard)
----------------------------------------------------------------

I dropped the SGX patches for now.

Paolo

Daniel P. Berrangé (1):
      target/i386: add missing bits to CR4_RESERVED_MASK

Lara Lazier (7):
      target/i386: VMRUN and VMLOAD canonicalizations
      target/i386: Added VGIF feature
      target/i386: Moved int_ctl into CPUX86State structure
      target/i386: Added VGIF V_IRQ masking capability
      target/i386: Added ignore TPR check in ctl_has_irq
      target/i386: Added changed priority check for VIRQ
      target/i386: Added vVMLOAD and vVMSAVE feature

Paolo Bonzini (9):
      docs: standardize book titles to === with overline
      docs: standardize directory index to --- with overline
      docs/system: standardize man page sections to --- with overline
      docs/system: move x86 CPU configuration to a separate document
      meson: look up cp and dtrace with find_program()
      meson: do not use python.full_path() unnecessarily
      meson: remove dead variable
      fw_cfg: add etc/msr_feature_control
      docs: link to archived Fedora code of conduct

Reinoud Zandijk (2):
      Only check CONFIG_NVMM when NEED_CPU_H is defined
      Fix nvmm_ram_block_added() function arguments

Richard Henderson (1):
      util: Suppress -Wstringop-overflow in qemu_thread_start

Thomas Huth (1):
      meson.build: Do not look for VNC-related libraries if have_system is not set

 docs/about/index.rst                 |   3 +-
 docs/devel/code-of-conduct.rst       |   4 +-
 docs/devel/index.rst                 |   3 +-
 docs/index.rst                       |   1 +
 docs/interop/index.rst               |   3 +-
 docs/specs/index.rst                 |   3 +-
 docs/system/cpu-models-x86.rst.inc   |   4 +-
 docs/system/i386/cpu.rst             |   1 +
 docs/system/index.rst                |   3 +-
 docs/system/qemu-block-drivers.rst   |   4 ++
 docs/system/qemu-cpu-models.rst      |  10 ++-
 docs/system/qemu-manpage.rst         |  10 ++-
 docs/system/target-i386.rst          |   8 ++-
 docs/tools/index.rst                 |   3 +-
 docs/tools/qemu-img.rst              |   1 +
 docs/tools/qemu-nbd.rst              |   1 +
 docs/tools/qemu-pr-helper.rst        |   1 +
 docs/tools/qemu-storage-daemon.rst   |   1 +
 docs/tools/qemu-trace-stap.rst       |   1 +
 docs/user/index.rst                  |   3 +-
 hw/nvram/fw_cfg.c                    |   1 +
 include/sysemu/nvmm.h                |   7 +-
 meson.build                          |   2 +-
 pc-bios/keymaps/meson.build          |   3 +-
 target/i386/cpu.c                    |  31 +++++----
 target/i386/cpu.h                    |  23 +++++++
 target/i386/machine.c                |  22 ++++++-
 target/i386/nvmm/nvmm-all.c          |   5 +-
 target/i386/svm.h                    |   8 +++
 target/i386/tcg/seg_helper.c         |   2 +-
 target/i386/tcg/sysemu/excp_helper.c |   2 +-
 target/i386/tcg/sysemu/misc_helper.c |  11 +++-
 target/i386/tcg/sysemu/svm_helper.c  | 121 ++++++++++++++++++++++++-----------
 trace/meson.build                    |   5 +-
 ui/meson.build                       |   4 +-
 util/qemu-thread-posix.c             |  19 ++++++
 36 files changed, 251 insertions(+), 83 deletions(-)
 create mode 100644 docs/system/i386/cpu.rst
-- 
2.31.1


