Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F430B8E2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 08:48:01 +0100 (CET)
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6qPo-00015F-5s
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 02:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l6qOg-0000eC-Pu
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:46:50 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l6qOe-0004wy-UY
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 02:46:50 -0500
Received: by mail-ed1-x530.google.com with SMTP id s11so21825800edd.5
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 23:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WnJjUGlF3oyJVgYgl2ukszOe9gQko7NaxCjNxZKJP+E=;
 b=RBFGd7XmwFyMZ3a0Acmle59WbLt+PkotnpN+JjWsG52Rh4sZ4P8NVtmVl4ZWtgF3Gy
 TIo7Q0i02TsYCBZBM59LP3/NnlCFfuH6YqZbB5yJXTq3cjHFikCQ0sLmfVUh+Ud3p0R5
 icsRiJLMN8xOBWJtWPt8eYKfXSImf7ZNkQrGHnyfKGxgZgGY6oRpNQ4bmWT/4t9F8ChZ
 lVvi2uwLs5/XDV5l6dDRO96N4kiuN9hxJQZU5H6b12n2yVANOg6zKAnRfIuJrSM5mh1y
 I15X0RKxHw+RaoRT1+gfxvSFTZkGdqb5GqyaSc6946hh6MpotWbpJH46uWdnDJolcW1s
 flmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WnJjUGlF3oyJVgYgl2ukszOe9gQko7NaxCjNxZKJP+E=;
 b=cL0zW+ky4RObrUDlta1JF7Yl9Gd1j7MzZp1nG+hNxiqo0v+RaoJLkiZSPK6bmlL2gd
 1NOV0G4kS0qkQEMkKpYwauOWUsXXsR2xHn1zqg4y4RnU+s2rkOB+ql5rZPxkCIP9sVGp
 dK3GAOgQFIofhpMtuiQjz06KcHYDUhHpbFum3AAvwaWD+9CxqNCpowjnjy9Syw2Z1oL3
 y4q5oYDgmmLBmBuc3O9mYHJ1y0SS3EgQG++/PiC49zxTcZw3wxV39b2Lu/j5VnrhOHDH
 PAc2LLQDUldsnFIWy+ZBKOX0UtQ9X88Tb2cDygHnAczHAf6r34NWSSJGk0NP+MfZaiFh
 9ERw==
X-Gm-Message-State: AOAM5319qy6lC2PpX0xvAKasLWgI27wzGOApEHQ8G6cfjC8NYmM7/ou/
 f4dWXqOv00C+H6kDovgb4oBDvcOX4VpSfQ==
X-Google-Smtp-Source: ABdhPJz1K6Baw6AqGLl+81EqhOYuS9sdsstW/Ft2R3+XI71t/eTP4+nRMLg0X0thrqTKuq4eyw/6ZQ==
X-Received: by 2002:aa7:c991:: with SMTP id c17mr14496790edt.289.1612252006611; 
 Mon, 01 Feb 2021 23:46:46 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r26sm10257936edc.95.2021.02.01.23.46.45 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 23:46:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/38] Misc patches (buildsys, i386, fuzzing) for 2021-01-29
Date: Tue,  2 Feb 2021 08:46:44 +0100
Message-Id: <20210202074644.89637-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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

The following changes since commit 74208cd252c5da9d867270a178799abd802b9338:

  Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-pull-request' into staging (2021-01-29 19:51:25 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to a365bda83444f142bb1b9c1b5fdcdefade87981d:

  pc-bios/descriptors: fix paths in json files (2021-02-01 17:30:52 +0100)

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

v2->v3: rebased

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

Marc-André Lureau (1):
      slirp: update to git master

Maxim Levitsky (2):
      virtio-scsi: don't uninitialize queues that we didn't initialize
      event_notifier: handle initialization failure better

Paolo Bonzini (5):
      target/i386: do not set LM for 32-bit emulation "-cpu host/max"
      meson: accept either shared or static libraries if --disable-static
      meson: honor --enable-rbd if cc.links test fails
      target/i86: implement PKS
      build-sys: make libslirp a meson subproject

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

