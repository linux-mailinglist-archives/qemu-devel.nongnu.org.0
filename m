Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 288AE422F51
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:38:04 +0200 (CEST)
Received: from localhost ([::1]:42692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoOB-0002Se-6p
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnY7-0007kR-99
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:15 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnY4-0003s2-V4
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:14 -0400
Received: by mail-ed1-x533.google.com with SMTP id p13so1228527edw.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0sNVCMbj+gifz1DONfXRn0tIE21HuEQwiAG17MYtnsE=;
 b=nXBAv/A36o5r2Dzk/tEEm6A91YvfZhuN16x3Dvty+/ZXs7av+GsWRMXobkCCbyARh8
 iwFwi/13hrNRfppC1ayWU3YijAl7t+2Vujook0CNo8PxkDQsoQ3RsrqF2MfP6mYSwT1J
 Uv/U7b5//zDSqyQXhczXTCXojwfhmbnOgYaOF36c6NzQmXARQc5Zqo4qReK7n2aG4C2J
 cqHRJkd5FwtuovCkVHXPvQ9DmKJTfopNFaoU0KdrcgRpaSiU8ox3m2CuRmu9x5BVMEUw
 MDoEDwTmNn6zppklzr7CzpedN+lKuOoHZfw2UEmt5W5eeTlHTKFHDw7J1SLZ0RbwnH2M
 5JSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=0sNVCMbj+gifz1DONfXRn0tIE21HuEQwiAG17MYtnsE=;
 b=SN41ZDvs1298pWQKW3bUbKxdfBsBDSSlyCnR+6FeEg0f9Lwpc1AFx9a8YHnw1FholS
 rxg1bhr/D55zGVqphDCDSN18Cm+0bj59t+CtPil2DM6Ji3tn7d2WgIOfcRjzxOD9X+L6
 kKZhJCyqRtFlp/ghGgFbQj6kOkaKV6Gm+mCk+lBtvTkFzFVYbLq1IftsBxALeO1XklPo
 zFbQMTuj3B766B+FuY1XHj6BwjcmLEe/CucQUx3r3ZdPt4cbCSwwNM90Ac8KOrJ1Best
 cVLu6bt718AbwbhciwZta4Twz+wkbFgX9oZbmu8o96twnJd/LYMXZ2qEYdd+uugcZW8F
 dTRw==
X-Gm-Message-State: AOAM533ruIp7ZnWNnhZgaoEjvDpvaHz2rBfutQLDEQWs0ow9BWP/8Dv2
 MhIajyxVb1LTNK8cmlqNPZzTQf3ELMA=
X-Google-Smtp-Source: ABdhPJyQm+E+8FgnZk29Q5wLbbyEHUhwxa5yYEWXpfKDTGGnE+bbHtcpyl2SEBebbfL87anHWvD2KA==
X-Received: by 2002:a17:906:3a58:: with SMTP id
 a24mr26790645ejf.67.1633452251035; 
 Tue, 05 Oct 2021 09:44:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm6101392edd.25.2021.10.05.09.44.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:44:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] Misc changes for 2021-10-05
Date: Tue,  5 Oct 2021 18:43:56 +0200
Message-Id: <20211005164408.288128-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

The following changes since commit 9618c5badaa8eed25259cf095ff880efb939fbe7:

  Merge remote-tracking branch 'remotes/vivier/tags/trivial-branch-for-6.2-pull-request' into staging (2021-10-04 16:27:35 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to bb647c49b8f1f986d8171dd61db65e8a8d255be0:

  meson: show library versions in the summary (2021-10-05 13:10:29 +0200)

----------------------------------------------------------------
* Meson version update
* fix search path when configuring with --cpu
* support for measured SEV boot with -kernel (Dov)
* fix missing BQL locks (Emanuele)
* retrieve applesmc key from the host (Pedro)
* KVM PV feature documentation (Vitaly)

----------------------------------------------------------------
Dov Murik (2):
      sev/i386: Introduce sev_add_kernel_loader_hashes for measured linux boot
      x86/sev: generate SEV kernel loader hashes in x86_load_linux

Emanuele Giuseppe Esposito (2):
      migration: block-dirty-bitmap: add missing qemu_mutex_lock_iothread
      migration: add missing qemu_mutex_lock_iothread in migration_completion

Paolo Bonzini (6):
      configure, meson: move CPU_CFLAGS out of QEMU_CFLAGS
      meson: bump submodule to 0.59.2
      meson: switch minimum meson version to 0.58.2, minimum recommended to 0.59.2
      hexagon: use env keyword argument to pass PYTHONPATH
      target/xtensa: list cores in a text file
      meson: show library versions in the summary

Pedro Tôrres (1):
      hw/misc: applesmc: use host osk as default on macs

Vitaly Kuznetsov (1):
      i386: docs: Briefly describe KVM PV features

 configure                      |  19 ++--
 docs/meson.build               |  14 +--
 docs/system/i386/kvm-pv.rst    | 100 +++++++++++++++++++++
 docs/system/target-i386.rst    |   1 +
 hw/i386/x86.c                  |  25 +++++-
 hw/misc/applesmc.c             | 192 ++++++++++++++++++++++++++++++++++++++++-
 meson                          |   2 +-
 meson.build                    | 166 +++++++++++++++++------------------
 migration/block-dirty-bitmap.c |   5 +-
 migration/migration.c          |   3 +
 plugins/meson.build            |   4 +-
 scripts/mtest2make.py          |   7 +-
 target/hexagon/meson.build     |   3 +-
 target/i386/sev-stub.c         |   5 ++
 target/i386/sev.c              | 137 +++++++++++++++++++++++++++++
 target/i386/sev_i386.h         |  12 +++
 target/xtensa/cores.list       |   9 ++
 target/xtensa/import_core.sh   |   3 +
 target/xtensa/meson.build      |   4 +-
 tests/qapi-schema/meson.build  |   4 +-
 tests/qtest/meson.build        |   2 +-
 tests/unit/meson.build         |   2 +-
 trace/meson.build              |   4 +-
 23 files changed, 597 insertions(+), 126 deletions(-)
 create mode 100644 docs/system/i386/kvm-pv.rst
 create mode 100644 target/xtensa/cores.list
-- 
2.31.1


