Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A05551C8B6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:10:35 +0200 (CEST)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmgrx-0006g1-JP
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgYC-0002Ht-DZ; Thu, 05 May 2022 14:50:08 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:33573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmgY9-0004KL-VT; Thu, 05 May 2022 14:50:07 -0400
Received: by mail-oi1-x22f.google.com with SMTP id l203so5284655oif.0;
 Thu, 05 May 2022 11:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=njVStiJZTdD00E/hsajQ9El7TBvd0RvJ9CrPKI5QohA=;
 b=lrOg+lPvpQuexoawqLRW1GyJObZO3H9q/NnZQqNS3olCUDb+4VO3uFbU7Pa8DDGjXH
 FIXQ7BJcUTc2TwAttuXiqyEyw76MgID4XyvJV//VFSEV8bpO9LyOpPWFjD+8pQZ05r9Q
 zPAULAcC6B9aLlX63py/MfU84+YLjHY3urnWHd/Cucd++RkmDo57V5Fmz7nb7TwkjHUp
 acn3LDjmjnoRFEYaRTAkVDUF+wLGT8QXEAZpkKSBppXCZQHprYvVytGBXcPWURF+zhKe
 V0rzIuMKbP2EREe2Ww7KlJGw9ZIkFOPb3FIWxLMWsHt67x0UN38RuT8SwYQ75MUWVqNn
 mHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=njVStiJZTdD00E/hsajQ9El7TBvd0RvJ9CrPKI5QohA=;
 b=Xv3pJYbSBmUiSCUOQhYY9MwAmXlXx0AW/R+75CwesNC/yp+ghhdwK5erTs2cmXvQIA
 2WaNDgXkqbEtMYW8KU00Lhsi3VmmY6ItdFYvmGmFPJA6NJOA9wIQ2Hr3/oBswYa7TotP
 ImcT9kBH5M6DExMJAgZNCF+tNDqinHc0VWdr9qF2kqJo8rNJ/KPNAvULA7YsZattZSgI
 Urqho8wF8ryCd1L2DV+93O8xg35XEa0mdGrBezwtAHa5+7cV04ZOrz5x9w1vImFUz731
 AhTLe2sXOEK/skOaVR6bbiDK67YBjW4/Po7WARvpRzm4/wGTI110dfSa2fStvdJe3Jjk
 Ir4Q==
X-Gm-Message-State: AOAM532c+OUtLk//cQyIicMkQKo97biLRZxh2zvFHVGTXThfPAVodWbV
 eZD0zwqEGxRJbHsc8rk8u6G7f5FDGD4=
X-Google-Smtp-Source: ABdhPJzSvaBd6BEdWnK2TIGGG33z6JF5YL+onvuC61ZxQMV8c4e5KQ4ZwGz7sjj8SQNwat8IphgA3A==
X-Received: by 2002:a05:6808:220c:b0:325:c254:9b0a with SMTP id
 bd12-20020a056808220c00b00325c2549b0amr3044837oib.239.1651776604248; 
 Thu, 05 May 2022 11:50:04 -0700 (PDT)
Received: from balboa.ibmuc.com (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 n67-20020aca4046000000b00325cda1ff94sm917146oia.19.2022.05.05.11.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:03 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PULL 00/30] ppc queue
Date: Thu,  5 May 2022 15:49:08 -0300
Message-Id: <20220505184938.351866-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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

The following changes since commit e91b8994115d2f093e7556c9af2d051a26a98cfb:

  Merge tag 'pull-target-arm-20220505' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-05-05 11:30:33 -0500)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220505

for you to fetch changes up to bf3dd1e6d0d7c5c4906f89776e15dddc22af784b:

  target/ppc: Change MSR_* to follow POWER ISA numbering convention (2022-05-05 15:36:17 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-05-05:

The star of the show in this PR is the 'Remove hidden usages of *env'
work done by Víctor, which impacts a lot of target/ppc code and we want
to get it landed ASAP so future target/ppc contributions can be based on
it.

Other changes:

- XIVE fixes in guest interrupt handling
- BookE debug interrupt fix
- vhost-user TARGET_PPC64 macro fix
- valgrind fixes in kvmppc functions

----------------------------------------------------------------
Bin Meng (1):
      target/ppc: Fix BookE debug interrupt generation

Daniel Henrique Barboza (4):
      target/ppc: initialize 'val' union in kvm_get_one_spr()
      target/ppc: init 'lpcr' in kvmppc_enable_cap_large_decr()
      target/ppc: init 'sregs' in kvmppc_put_books_sregs()
      target/ppc: init 'rmmu_info' in kvm_get_radix_page_info()

Frederic Barrat (2):
      ppc/xive: Always recompute the PIPR when pushing an OS context
      ppc/xive: Update the state of the External interrupt signal

Murilo Opsfelder Araujo (1):
      vhost-user: Use correct macro name TARGET_PPC64

Víctor Colombo (22):
      target/ppc: Remove fpscr_* macros from cpu.h
      target/ppc: Remove unused msr_* macros
      target/ppc: Remove msr_pr macro
      target/ppc: Remove msr_le macro
      target/ppc: Remove msr_ds macro
      target/ppc: Remove msr_ile macro
      target/ppc: Remove msr_ee macro
      target/ppc: Remove msr_ce macro
      target/ppc: Remove msr_pow macro
      target/ppc: Remove msr_me macro
      target/ppc: Remove msr_gs macro
      target/ppc: Remove msr_fp macro
      target/ppc: Remove msr_cm macro
      target/ppc: Remove msr_ir macro
      target/ppc: Remove msr_dr macro
      target/ppc: Remove msr_ep macro
      target/ppc: Remove msr_fe0 and msr_fe1 macros
      target/ppc: Remove msr_ts macro
      target/ppc: Remove msr_hv macro
      target/ppc: Remove msr_de macro
      target/ppc: Add unused msr bits FIELDs
      target/ppc: Change MSR_* to follow POWER ISA numbering convention

 hw/intc/xive.c           |  25 +++++-
 hw/intc/xive2.c          |  18 ++--
 hw/ppc/pegasos2.c        |   2 +-
 hw/ppc/spapr.c           |   2 +-
 hw/virtio/vhost-user.c   |   2 +-
 include/hw/ppc/xive.h    |   1 +
 target/ppc/cpu.c         |   2 +-
 target/ppc/cpu.h         | 220 ++++++++++++++++++++++-------------------------
 target/ppc/cpu_init.c    |  23 +++--
 target/ppc/excp_helper.c |  54 ++++++------
 target/ppc/fpu_helper.c  |  28 +++---
 target/ppc/gdbstub.c     |   2 +-
 target/ppc/helper_regs.c |  15 ++--
 target/ppc/kvm.c         |  16 ++--
 target/ppc/machine.c     |   2 +-
 target/ppc/mem_helper.c  |  23 ++---
 target/ppc/misc_helper.c |   2 +-
 target/ppc/mmu-radix64.c |  11 +--
 target/ppc/mmu_common.c  |  40 +++++----
 target/ppc/mmu_helper.c  |   6 +-
 20 files changed, 260 insertions(+), 234 deletions(-)

