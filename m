Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2F33BC968
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:19:06 +0200 (CEST)
Received: from localhost ([::1]:49774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iAT-0004kF-F9
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htm-0000XG-LL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:50 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htg-0002Bz-Ml
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:50 -0400
Received: by mail-wm1-x331.google.com with SMTP id w13so13162924wmc.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dDwCDcIKlGmZE1mwkQhd4S4vfOw97aRHvgn7cyDiubo=;
 b=IvSElYLEwOGpzAeb9QJhGeXlcHQXaDur5V8nhXA4vt9yxHLPkora0uQWuuqPmpZhuB
 UbBcMDUvRBj4J4W/7xcit7nqkgmXaRT3BZ4sOaRtkrr/qilY2Vwan+WbBKCOaGgsrF3W
 ePZi7i8Fga47upYlEvmmeZhdk3Bfx3KrriMpUyl2XsVtHNyQcvgfgLCP676N23MKdVqG
 DiFdZY66xeOLDUi39KCzakvwIq859C3dASvgXTG4TJMshIY0DMyie9E5qxWiQ9sn2jXB
 uvpguO/qQzHtIgZOHD2L1hD2gkT86ZQkgvDvnpBjF/RYNK/ZXZuNq388QQdfcslhKWjy
 qOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=dDwCDcIKlGmZE1mwkQhd4S4vfOw97aRHvgn7cyDiubo=;
 b=VcCU+sGJZiMz2iNsGiBHgfLI4XT2jZFcARmJaPuCfen17FL1PtnOYP86r8/trmMBeL
 UOtJmOgcaTg1qBO14wK95+r+jB4t7E8HBZu/elc6JUGt4J+pFTvwRWVBccVRFkAg6bQg
 EVafI1QRO4PIm2cMN4kOeRmZ1cyyTxbo5kMYcbJ514frG0//DevI3tZOFCp8XDIyuHlw
 s3kUhXoYrRU/+LSTZDCXLr3gnaUgHhL6znhTwQkbz+mfatxoyV2vjAr1GkevppMM3jh8
 UxVjJECdIRP42VWlvtVrbqJLP7Evese1aZeHPxS/yngeGbJ0is8oW4ghQGHL2f1K/b6S
 qgiA==
X-Gm-Message-State: AOAM533BHVMb5DUFJhME3y1vJASRk8YmkrA2MpQb2L2QpnoRrcdTM3EN
 BOxKnQbXvV4bxV5gyn7m84ZW2qBCk+s=
X-Google-Smtp-Source: ABdhPJxzist7mXFNV9y8gP+per6JeFy3QKvYE1tHYJ9Up9iDmTM2yvHndUgbU7O8Z+D5QQRVBCXPFQ==
X-Received: by 2002:a05:600c:3b0b:: with SMTP id
 m11mr3860764wms.25.1625565702943; 
 Tue, 06 Jul 2021 03:01:42 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.42 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/40] Misc patches for 2021-07-06
Date: Tue,  6 Jul 2021 12:01:01 +0200
Message-Id: <20210706100141.303960-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

The following changes since commit 715167a36c2b152f6511cff690180c1254ae039f:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-migration-20210705a' into staging (2021-07-05 12:45:24 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 7ca6f2ad375d32e81844788dbc2b05a04cc391b5:

  config-host.mak: remove unused compiler-related lines (2021-07-06 09:35:08 +0200)

----------------------------------------------------------------
* More Meson test conversions and configure cleanups
* Generalize XSAVE area offset so that it matches AMD processors on KVM
* Improvements for -display and deprecation of -no-quit
* Enable SMP configuration as a compound machine property ("-M smp.cpus=...")
* Haiku compilation fix
* Add icon on Darwin

----------------------------------------------------------------
David Edmondson (8):
      target/i386: Declare constants for XSAVE offsets
      target/i386: Consolidate the X86XSaveArea offset checks
      target/i386: Clarify the padding requirements of X86XSaveArea
      target/i386: Pass buffer and length to XSAVE helper
      target/i386: Make x86_ext_save_areas visible outside cpu.c
      target/i386: Observe XSAVE state area offsets
      target/i386: Populate x86_ext_save_areas offsets using cpuid where possible
      target/i386: Move X86XSaveArea into TCG

John Arbuckle (1):
      Set icon for QEMU binary on Mac OS

Paolo Bonzini (25):
      coverity-scan: switch to vpath build
      configure: drop vte-2.90 check
      configure, meson: convert vte detection to meson
      configure, meson: convert virgl detection to meson
      configure, meson: convert libdaxctl detection to meson
      configure, meson: convert libpmem detection to meson
      configure, meson: convert liburing detection to meson
      configure, meson: convert libxml2 detection to meson
      meson: sort existing compiler tests
      meson: store dependency('threads') in a variable
      configure, meson: move CONFIG_IVSHMEM to meson
      configure: convert HAVE_BROKEN_SIZE_MAX to meson
      configure: convert compiler tests to meson, part 1
      configure: convert compiler tests to meson, part 2
      configure: convert compiler tests to meson, part 3
      configure: convert compiler tests to meson, part 4
      configure: convert compiler tests to meson, part 5
      configure: convert compiler tests to meson, part 6
      qom: export more functions for use with non-UserCreatable objects
      keyval: introduce keyval_merge
      keyval: introduce keyval_parse_into
      vl: switch -M parsing to keyval
      machine: add smp compound property
      qemu-option: remove now-dead code
      config-host.mak: remove unused compiler-related lines

Philippe Mathieu-Daudé (1):
      coverity-scan: Remove lm32 / unicore32 targets

Thomas Huth (5):
      Makefile: Remove /usr/bin/env wrapper from the SHELL variable
      softmmu/vl: Remove obsolete comment about the "frame" parameter
      ui: Fix the "-display sdl,window_close=..." parameter
      ui: Mark the '-no-quit' option as deprecated
      qemu-options: Improve the documentation of the -display options

 Makefile                                |    2 +-
 configure                               | 1023 +------------------------------
 docs/devel/kconfig.rst                  |    2 +-
 docs/system/deprecated.rst              |   12 +
 hw/core/machine.c                       |  108 ++--
 hw/display/meson.build                  |    6 +-
 include/hw/boards.h                     |    1 -
 include/qemu/option.h                   |    6 +-
 include/qom/object.h                    |   23 +
 meson.build                             |  231 +++++--
 meson_options.txt                       |   12 +
 qemu-options.hx                         |   50 +-
 qom/object_interfaces.c                 |   58 +-
 scripts/coverity-scan/COMPONENTS.md     |    6 -
 scripts/coverity-scan/run-coverity-scan |    8 +-
 scripts/entitlement.sh                  |   10 +-
 softmmu/vl.c                            |  359 +++++------
 target/i386/cpu.c                       |   18 +-
 target/i386/cpu.h                       |   41 +-
 target/i386/hvf/hvf-cpu.c               |   29 +
 target/i386/hvf/hvf.c                   |    9 +-
 target/i386/hvf/x86hvf.c                |   19 +-
 target/i386/kvm/kvm-cpu.c               |   30 +
 target/i386/kvm/kvm.c                   |   59 +-
 target/i386/tcg/fpu_helper.c            |    1 +
 target/i386/tcg/tcg-cpu.c               |   20 +
 target/i386/tcg/tcg-cpu.h               |   57 ++
 target/i386/xsave_helper.c              |  273 +++++++--
 tests/qtest/numa-test.c                 |   22 +-
 tests/unit/test-keyval.c                |   58 ++
 tests/unit/test-qemu-opts.c             |   35 --
 util/keyval.c                           |  123 +++-
 util/meson.build                        |    5 +-
 util/qemu-option.c                      |   51 +-
 34 files changed, 1179 insertions(+), 1588 deletions(-)
-- 
2.31.1


