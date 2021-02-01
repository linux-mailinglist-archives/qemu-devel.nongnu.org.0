Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D17030AA68
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:05:04 +0100 (CET)
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6alD-0006QQ-5J
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:05:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l6agw-0002yV-1T
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:00:39 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l6agn-0002eh-6Q
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:00:31 -0500
Received: by mail-wr1-x42e.google.com with SMTP id c12so16911714wrc.7
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 07:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O1TGQ2JjCREFZPRphDc5O/gEQZd9BLukiaVzF7wxf3E=;
 b=mrHbrQts/dqQ/N6RmBLE61F6jJmLdG085LV4LbBQDk/tC9cA9Efrfj//eGRWYIiPRQ
 dGza8C7syK0ssfJT6WH7iuwHQ2yfpBQ6EKP7cZD54rvbmbc3WrHQ1zP+rkEu3VpHHPe3
 wstRGDjhh1FqnwC0QjwfPMFgHcgm6phSXqkRA2MrVQQ3cpMP70Z9uJwb5OCQluqpXzZz
 iGa2JRgnrfNIpCsoy9LcMpaDnfPnsYw3ntAAuNRYPXszb9BsCiJ0qjafmj/kFRh/cDNY
 Eq0FIvBNogT8nKFNoHFZr8QdEV8Oba4ohjPZMmIO/D1ZbShhacKmcmKRL/tTg4QO4Nbc
 Tm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=O1TGQ2JjCREFZPRphDc5O/gEQZd9BLukiaVzF7wxf3E=;
 b=DnPuu4NazMIOXCYGoyVMYj1btWECTsDJgATqgDvRbgk5WmgJO2+1jJpqbfzG92pe5d
 evdREpuUWHGDz/oij9EDVDq4opUSuUnxHHB2VNnEKPVEh6cB905ZAlait+Gg1HVi2/YM
 CjZe25ITj75QWYp7nCbL0oIPlXdDWJauzETOoKmd7zNMdnHoQiF0Lmyv2+6Hob/hLBkS
 I2Tyr+fyAPgyGCWAfYFNYPCVX3TX9to6oWREqJP8FeDqlI3+hRMQ1zgBsjdsWRZdX8aM
 MmIgVoEUWLZ5zNlqNuiqCJNuqQW3uQkEiKjM74rSQH4M8JFOPFv4Iw2U8UCymFcbcbcp
 VAUA==
X-Gm-Message-State: AOAM533kkBxp7RegncVOWqdg+gyPnZF1G9y6r4d0icF5Dp5j5LC/m2RY
 0s2PGrNNeOPgIVF3Zus+sYmaw8PmpxX5RQ==
X-Google-Smtp-Source: ABdhPJy/RCGoFSf0gwoJxa+QU4BfjkSCauJtST+czf6mF2+/k+BgLIfxLUAowbmBQc73G/N0XqxENw==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr18649279wrq.49.1612191623744; 
 Mon, 01 Feb 2021 07:00:23 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 q6sm25879813wrw.43.2021.02.01.07.00.22 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 07:00:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/38] Misc patches (buildsys, i386, fuzzing) for 2021-01-29
Date: Mon,  1 Feb 2021 16:00:18 +0100
Message-Id: <20210201150021.53398-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
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

The following changes since commit 0bcd12fb1513bad44f05f2d3a8eef2a99b3077b6:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2021-01-28 12:30:30 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to e2c7c4a3f5ce0e2e529fb50e56017572c221182b:

  pc-bios/descriptors: fix paths in json files (2021-02-01 13:05:51 +0100)

----------------------------------------------------------------
* Fuzzing improvements (Qiuhao, Alexander)
* i386: Fix BMI decoding for instructions with the 0x66 prefix (David)
* slirp update (Marc-André)
* initial attempt at fixing event_notifier emulation (Maxim)
* i386: PKS emulation, fix for "qemu-system-i386 -cpu host" (myself)
* meson: RBD test fixes (myself)
* meson: TCI warnings (Philippe)
* Leaner build for --disable-guest-agent, --disable-system and
  --disable-tools (Philippe, Stefan)
* --enable-tcg-interpreter fix (Richard)
* i386: SVM feature bits (Wei)
* HVF bugfix (Alex)
* KVM bugfix (Thomas)

----------------------------------------------------------------

v1->v2: two extra bugfix patches, do move slirp/ to subprojects/libslirp/.

Alexander Bulekov (7):
      fuzz: ignore address_space_map is_write flag
      fuzz: refine the ide/ahci fuzzer configs
      docs/fuzz: fix pre-meson path
      fuzz: log the arguments used to initialize QEMU
      fuzz: enable dynamic args for generic-fuzz configs
      docs/fuzz: add some information about OSS-Fuzz
      fuzz: add virtio-9p configurations for fuzzing

Alexander Graf (1):
      hvf: Fetch cr4 before evaluating CPUID(1)

David Greenaway (1):
      target/i386: Fix decoding of certain BMI instructions

Igor Mammedov (1):
      machine: add missing doc for memory-backend option

Marc-André Lureau (2):
      slirp: update to git master
      build-sys: make libslirp a meson subproject

Maxim Levitsky (2):
      virtio-scsi: don't uninitialize queues that we didn't initialize
      event_notifier: handle initialization failure better

Paolo Bonzini (4):
      target/i386: do not set LM for 32-bit emulation "-cpu host/max"
      meson: accept either shared or static libraries if --disable-static
      meson: honor --enable-rbd if cc.links test fails
      target/i86: implement PKS

Pavel Dovgalyuk (1):
      replay: fix replay of the interrupts

Philippe Mathieu-Daudé (13):
      configure: Improve TCI feature description
      meson: Explicit TCG backend used
      meson: Warn when TCI is selected but TCG backend is available
      tests/meson: Only build softfloat objects if TCG is selected
      pc-bios/meson: Only install EDK2 blob firmwares with system emulation
      meson: Restrict block subsystem processing
      meson: Merge trace_events_subdirs array
      meson: Restrict some trace event directories to user/system emulation
      meson: Restrict emulation code
      qapi/meson: Restrict qdev code to system-mode emulation
      qapi/meson: Remove QMP from user-mode emulation
      qapi/meson: Restrict system-mode specific modules
      qapi/meson: Restrict UI module to system emulation and tools

Qiuhao Li (1):
      fuzz: fix wrong index in clear_bits

Richard Henderson (1):
      configure: Fix --enable-tcg-interpreter

Sergei Trofimovich (1):
      pc-bios/descriptors: fix paths in json files

Stefan Reiter (1):
      docs: don't install corresponding man page if guest agent is disabled

Thomas Huth (1):
      accel/kvm/kvm-all: Fix wrong return code handling in dirty log code

Wei Huang (1):
      x86/cpu: Populate SVM CPUID feature bits

 .gitmodules                              |   4 +-
 MAINTAINERS                              |   1 +
 accel/kvm/kvm-all.c                      |  21 ++-
 accel/tcg/tcg-cpus-icount.c              |   8 +-
 backends/hostmem.c                       |  10 ++
 configure                                |   9 +-
 docs/devel/build-system.rst              |   2 +-
 docs/devel/fuzzing.rst                   |  35 +++-
 docs/meson.build                         |   6 +-
 hw/scsi/virtio-scsi-dataplane.c          |   8 +-
 include/exec/memory.h                    |   8 +-
 include/exec/memory_ldst_cached.h.inc    |   6 +-
 include/qemu/event_notifier.h            |   1 +
 memory_ldst.c.inc                        |   8 +-
 meson.build                              | 277 ++++++++++++++-----------------
 meson_options.txt                        |   2 +-
 pc-bios/descriptors/meson.build          |   2 +-
 pc-bios/meson.build                      |   1 +
 qapi/meson.build                         |  34 ++--
 qemu-options.hx                          |  26 ++-
 scripts/oss-fuzz/minimize_qtest_trace.py |   2 +-
 slirp                                    |   1 -
 softmmu/memory.c                         |   5 +-
 softmmu/physmem.c                        |   4 +-
 stubs/meson.build                        |   2 +
 stubs/qdev.c                             |  23 +++
 subprojects/libslirp                     |   1 +
 target/i386/cpu.c                        |  15 +-
 target/i386/cpu.h                        |  29 ++--
 target/i386/helper.c                     |   3 +
 target/i386/hvf/hvf.c                    |   4 +
 target/i386/machine.c                    |  24 ++-
 target/i386/tcg/excp_helper.c            |  32 ++--
 target/i386/tcg/misc_helper.c            |  14 ++
 target/i386/tcg/translate.c              |   2 +-
 tests/meson.build                        |  11 +-
 tests/qtest/fuzz/fuzz.c                  |  11 +-
 tests/qtest/fuzz/generic_fuzz.c          |  19 ++-
 tests/qtest/fuzz/generic_fuzz_configs.h  |  41 ++++-
 util/event_notifier-posix.c              |  16 ++
 40 files changed, 476 insertions(+), 252 deletions(-)
 delete mode 160000 slirp
 create mode 100644 stubs/qdev.c
 create mode 160000 subprojects/libslirp
-- 
2.29.2


