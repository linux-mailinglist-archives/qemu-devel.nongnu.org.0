Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B2130884B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:33:39 +0100 (CET)
Received: from localhost ([::1]:52444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5S1y-0006Ad-TV
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnA-00047x-0y
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:20 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rn8-0005s1-3J
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:19 -0500
Received: by mail-ej1-x629.google.com with SMTP id by1so12486452ejc.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6w2hYmc794Pv7xj0TAyYhcpyoZipCrPipEz+iMTDRMI=;
 b=H8riDyiL6WkdQZGwgxbjOBZeBX7izLsble95nTHmcDgmM21Vq0rOKZLhDHUW4Wsp/G
 FC2cDYlgZOcjJ0+x2vyhIVObCkRzXc9yF6z27rtUxlZWMu/snYHTholZsHoNUX5qgEeN
 SpZ4oDvLb4k1aG9lRDGrq2h8UG6QWF7OY2Bm2m8jmUSgK2nRMsagMlljYqEwqqJSEK+3
 6vO10sO7sERuiF4cW2/y99V+2NqoFGQH12vaPFJaBhdffSvBA3E2mJ/5O7Kj5heqHvzg
 ZzuAvGYmf3hbqEFsWhpYQEWX1UD0iDH8SRgQfVCc9xrLGL67FcsyucE3YKrXC4t3LIhG
 65MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6w2hYmc794Pv7xj0TAyYhcpyoZipCrPipEz+iMTDRMI=;
 b=bKXX2ULVttx9Ay2bUL+TWLs8CC1D9f9JO62OgQJJdaepbnqDuiA9aC6yHWZXztH3r+
 5+6Xm40F3U6n9ZQXVJ40Zcc+jdwANCJ3w2d2NK+N0ZL6+HXN8xO642nwLHUZVDv+ksRh
 aeF9GvBxYSrlEHjOHannVhnMfQjhUgyOyTDCQteTHcTTg+lvMIb4myyAWb/r1+ic+Civ
 jwZ2iLJvO1fGj1daSeQAe7pgJaDcvtNwvxk1N+hdol4Gc3AOUuvga9EHMfFWEk8fT2+S
 zOdIVMAWAkZQ7o7NTXBt6EJ0nnaRABOG4b9Se/r1MKufasmk1GBkwl/uRed5RsZwdHl7
 tmkg==
X-Gm-Message-State: AOAM531iwyrqNkNJItBIRZ3+ZbST6N3yhuNMoirisMbJavRx0T3CfdtW
 fKDlzKhD0+qrehOIOI6srrp0+gpvwKcIkw==
X-Google-Smtp-Source: ABdhPJy+SDeLslAU5xg8Ovaa9EurcAXfHjhNldaab8HDVCgElz8WEGyojRhfcGreg0WwluYvqEmE2Q==
X-Received: by 2002:a17:906:fa9a:: with SMTP id
 lt26mr4081771ejb.439.1611919095581; 
 Fri, 29 Jan 2021 03:18:15 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/36] Misc patches (buildsys, i386, fuzzing) for 2021-01-29
Date: Fri, 29 Jan 2021 12:17:38 +0100
Message-Id: <20210129111814.566629-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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

for you to fetch changes up to 6c52f4644c9c8a18b8495e169e539632a897f135:

  accel/kvm/kvm-all: Fix wrong return code handling in dirty log code (2021-01-29 10:38:38 +0100)

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

Stefan Reiter (1):
      docs: don't install corresponding man page if guest agent is disabled

Thomas Huth (1):
      accel/kvm/kvm-all: Fix wrong return code handling in dirty log code

Wei Huang (1):
      x86/cpu: Populate SVM CPUID feature bits

 .gitmodules                              |   4 +-
 MAINTAINERS                              |   1 +
 accel/kvm/kvm-all.c                      |  21 ++-
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
 pc-bios/meson.build                      |   1 +
 qapi/meson.build                         |  34 ++--
 qemu-options.hx                          |  26 ++-
 scripts/oss-fuzz/minimize_qtest_trace.py |   2 +-
 slirp                                    |   2 +-
 softmmu/memory.c                         |   5 +-
 softmmu/physmem.c                        |   4 +-
 stubs/meson.build                        |   2 +
 stubs/qdev.c                             |  23 +++
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
 37 files changed, 468 insertions(+), 250 deletions(-)
 create mode 100644 stubs/qdev.c
-- 
2.29.2


