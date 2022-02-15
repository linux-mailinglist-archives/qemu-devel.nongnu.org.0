Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAEE4B67B2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:35:22 +0100 (CET)
Received: from localhost ([::1]:33736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuEz-0006mf-6F
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:35:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCD-0003j0-Hq
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:29 -0500
Received: from [2a00:1450:4864:20::52b] (port=45811
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCA-0008PM-WF
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:29 -0500
Received: by mail-ed1-x52b.google.com with SMTP id z13so12788506edc.12
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dd26NKrT61RjpLU7Rt855gwV8Et+6ujvDGZLdFJMrkY=;
 b=WInWzpYVgiExSeDJyZJ+onzJqF4hX/fi1XEud0vQU0qHfOgm3xXiAW+1NRgY/k9C5s
 71R0aUXx5RNNkVHiTnn9fFrF4z3SGcH3kg1b1NSYadalcZE68GSLECE0yHRHySGncUxy
 l7268IvYfhftjePmJTc/rctnrevTWOP3XEwl1KLMar0soimL3G0r2IitkrGp9IOOAonP
 fHsyLV0P7K7/Um799UqNEUNcoKpq0H9FGEU7vbTlCtCtijgFg244LRS2aPwxULtOunKN
 9P4x3xtOGxn+s0T7FsEv40Gh3cboaXw0vHyYLT951qbpztJHv0VutAH7VjlJIc8h2ldi
 C38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=dd26NKrT61RjpLU7Rt855gwV8Et+6ujvDGZLdFJMrkY=;
 b=I8FQUkYPopFbmWExidtbdsBL11B48S1oRTwVEVtazXcB2KC2PKK2Cj8409RvG8Bd9e
 ZMqPWYsu/RN/DFghGEg/VUk4iyFuEZG0YdBt6tqkEqe/176NaJtlkKgJ6m3tatTQcAUh
 ehT6Fj0vMfuSh00/l8vhbv3htiwq7DCsf9OUf4wgQZcDXWVZzvEolZm/6D9OORT+fEKZ
 S/pf1c/CUzJAyB//KBLRvnrEiTKmL036pOrbW+Pjro9lhBU/uZKL0f7yxYcWv9TxAQqU
 C+17iN0oz3JmfUCdS1bfTKRsYIEwxC2EqGkNrhlYuSIqwJtNt2ZvGJevrYDZQdtbmD8d
 KSsg==
X-Gm-Message-State: AOAM533HP0efnXeUDn6u6z8BNiuUtdr1BwEHqi24sEJvMLCKI1U2fMsd
 v5BQR+WQv6+WKKPdmWFVrC8PmOcfoEc=
X-Google-Smtp-Source: ABdhPJzvlBtYdQ2V/DcX048IoetUE4EhYlj6lMskPkM9hHspCjG2cWvdb3trEscBWR9e8tU6OziMZw==
X-Received: by 2002:a05:6402:34d3:: with SMTP id
 w19mr2915937edc.377.1644917545472; 
 Tue, 15 Feb 2022 01:32:25 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/30] Misc mostly build system patches for 2022-02-15
Date: Tue, 15 Feb 2022 10:31:53 +0100
Message-Id: <20220215093223.110827-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit 2d88a3a595f1094e3ecc6cd2fd1e804634c84b0f:

  Merge remote-tracking branch 'remotes/kwolf-gitlab/tags/for-upstream' into staging (2022-02-14 19:54:00 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 3dd33fd665e7fb041350849e35408f679dfa7383:

  configure, meson: move CONFIG_IASL to a Meson option (2022-02-15 09:36:13 +0100)

----------------------------------------------------------------
* More Meson conversions (0.59.x now required rather than suggested)
* UMIP support for TCG x86
* Fix migration crash
* Restore error output for check-block

----------------------------------------------------------------
Gareth Webb (1):
      target/i386: add TCG support for UMIP

Marc-André Lureau (9):
      qga/vss-win32: fix midl arguments
      meson: drop --with-win-sdk
      qga/vss-win32: use widl if available
      qga/vss: use standard windows headers location
      configure, meson: replace VSS SDK checks and options with --enable-vss-sdk
      meson: do not make qga/vss-win32/meson.build conditional on C++ presence
      qga/vss-win32: require widl/midl, remove pre-built TLB file
      meson: require dynamic linking for VSS support
      meson, configure: move ntddscsi API check to meson

Paolo Bonzini (18):
      meson: use .allowed() method for features
      meson: use .require() and .disable_auto_if() method for features
      configure, meson: move AVX tests to meson
      configure, meson: move membarrier test to meson
      configure, meson: move AF_ALG test to meson
      configure, meson: move libnuma detection to meson
      configure, meson: move TPM check to meson
      configure, meson: cleanup qemu-ga libraries
      configure, meson: move image format options to meson_options.txt
      configure, meson: move block layer options to meson_options.txt
      meson: define qemu_cflags/qemu_ldflags
      configure, meson: move some default-disabled options to meson_options.txt
      configure, meson: move coroutine options to meson_options.txt
      configure, meson: move smbd options to meson_options.txt
      configure, meson: move guest-agent, tools to meson
      meson: refine check for whether to look for virglrenderer
      configure, meson: move OpenGL check to meson
      configure, meson: move CONFIG_IASL to a Meson option

Peter Xu (1):
      memory: Fix qemu crash on starting dirty log twice with stopped VM

Thomas Huth (1):
      tests/qemu-iotests/testrunner: Print diff to stderr in TAP mode

 backends/tpm/meson.build           |  14 +-
 block/meson.build                  |  51 ++-
 configure                          | 638 +------------------------------------
 contrib/vhost-user-gpu/meson.build |   3 +-
 crypto/meson.build                 |   6 +-
 docs/devel/kconfig.rst             |   2 +-
 docs/meson.build                   |   2 -
 hw/acpi/meson.build                |   4 +-
 meson.build                        | 445 +++++++++++++++++---------
 meson_options.txt                  |  66 ++++
 migration/meson.build              |   4 +-
 net/slirp.c                        |  16 +-
 qga/commands-win32.c               |   6 +-
 qga/meson.build                    |  55 +++-
 qga/vss-win32/install.cpp          |   2 +-
 qga/vss-win32/meson.build          |  52 +--
 qga/vss-win32/provider.cpp         |   4 +-
 qga/vss-win32/qga-vss.tlb          | Bin 1528 -> 0 bytes
 qga/vss-win32/requester.cpp        |   4 +-
 qga/vss-win32/vss-common.h         |   6 +-
 scripts/meson-buildoptions.py      |   2 +
 scripts/meson-buildoptions.sh      |  92 ++++++
 softmmu/memory.c                   |  65 ++--
 softmmu/meson.build                |   5 +-
 target/i386/cpu.c                  |   2 +-
 target/i386/cpu.h                  |   4 +-
 target/i386/helper.c               |   8 +-
 target/i386/tcg/translate.c        |  15 +
 tests/Makefile.include             |   2 +-
 tests/check-block.sh               |   4 -
 tests/meson.build                  |   2 +-
 tests/qemu-iotests/meson.build     |   2 +-
 tests/qemu-iotests/testrunner.py   |   5 +-
 tests/unit/meson.build             |   6 +-
 tools/meson.build                  |  31 +-
 ui/meson.build                     |  16 +-
 util/meson.build                   |   4 +-
 37 files changed, 714 insertions(+), 931 deletions(-)
 delete mode 100644 qga/vss-win32/qga-vss.tlb
-- 
2.34.1


