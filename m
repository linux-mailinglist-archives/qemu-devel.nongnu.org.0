Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3831C3B456B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:20:25 +0200 (CEST)
Received: from localhost ([::1]:57610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmgx-0005Ry-PA
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmf5-0002qx-Pd
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:27 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmf3-00037d-OY
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:27 -0400
Received: by mail-ej1-x633.google.com with SMTP id bu12so15471820ejb.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hg5NyDLWvLI4XLF1FyYufQInEiXh4+0YYuzNnvI5x38=;
 b=YtpyR3GO4BGcg2zbm3KXl7U4cEX21t+WnBatQKRZDioS6sOjBDdcsU1b+qt8SyiMFr
 Y8zzwRPnpgD1qBdrHUUQCszuy7W5JIcI0sylsm4tpOTfidbEqmJ0Vv6rPI5APJhVejAD
 zwmKBNbq1lXrSTyL56Ga1jPRwgPqUo4xywCLebPT17eGSFySYMyoxlFy+0WXamy5PrkH
 FQsiM0Pfk2J5qYKp007J3IY2IKH4dFmBrUGOs3h9BXvDbv2Bb+XO2RMNna8IFjAOaIG0
 EjwU8yZNjJ9Hp4/5iL06tuscdPLBlzJM/GCz0Lgvzf8lbj7CDsVE0qsUlPxnD89R/3oW
 esag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hg5NyDLWvLI4XLF1FyYufQInEiXh4+0YYuzNnvI5x38=;
 b=RGwpZr5qhZJnLeLFIsWjhGB4tvgP4CH8oYwTmZc31D3A3g76m7c3t8cqfDDGBp2XMg
 eEkwbWqBCC2p5bSQJTnliedmYh39fKSct+o+/WkHL5U/+u/ixBcQfUmdD29sXc/vPR5r
 1cdydLRqfNVvjwgBFAfZEGrhBRDix7dmK1Eq0rXtaFSZ2bDOOrvfB3Dm+V2hAOwiIbZT
 H7vDHAcDmBdHYb/h8qf7XEpgfBhBrtZekwTFnPFkh0078OTDb+8tE6PKw2yUB3NNJ9h6
 5oy/ZIpUEx3g3SXwMUY8pYvQPXgdludMRWQ+oFf0B8JeRsUF35qaQV2ettxjMlbNkqm3
 IzMQ==
X-Gm-Message-State: AOAM531CVuphczxczdcgMZXPPq0XOejSwg2rXWXtryBed+TQ3OchEfyI
 UAXL8IAlKdxDW4DWwm84rWgZG44axvA=
X-Google-Smtp-Source: ABdhPJwFlyUkwDPD0MVcHvjZgcoEbhLw4P31ADmtMKjIVANxuGnuiTkNJgfdFDLh+DpYEWDnWlOrHw==
X-Received: by 2002:a17:907:2623:: with SMTP id
 aq3mr11413054ejc.292.1624630704230; 
 Fri, 25 Jun 2021 07:18:24 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/28] Misc (including block file-posix) for 2021-06-23
Date: Fri, 25 Jun 2021 16:17:54 +0200
Message-Id: <20210625141822.1368639-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

The following changes since commit ecba223da6215d6f6ce2d343b70b2e9a19bfb90b:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210624' into staging (2021-06-24 15:00:34 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 0aebebb561c9c23b9c6d3d58040f83547f059b5c:

  machine: reject -smp dies!=1 for non-PC machines (2021-06-25 16:16:11 +0200)

Starting to flush my own queue before 6.1 soft freeze.  The
block/file-posix.c patches have been reviewed/acked by Max.

----------------------------------------------------------------
* Some Meson test conversions
* KVM dirty page ring buffer fix
* KVM TSC scaling support
* Fixes for SG_IO with /dev/sdX devices
* (Non)support for host devices on iOS
* -smp cleanups

----------------------------------------------------------------
Joelle van Dyne (3):
      block: feature detection for host block support
      block: check for sys/disk.h
      block: detect DKIOCGETBLOCKCOUNT/SIZE before use

Paolo Bonzini (24):
      target/i386: kvm: add support for TSC scaling
      meson: drop unused CONFIG_GCRYPT_HMAC
      configure: drop unused variables for xts
      meson: remove preadv from summary
      tests: remove QCRYPTO_HAVE_TLS_TEST_SUPPORT
      configure, meson: convert crypto detection to meson
      configure, meson: convert libtasn1 detection to meson
      configure, meson: convert pam detection to meson
      configure, meson: convert libusb detection to meson
      configure, meson: convert libcacard detection to meson
      configure, meson: convert libusbredir detection to meson
      file-posix: fix max_iov for /dev/sg devices
      scsi-generic: pass max_segments via max_iov field in BlockLimits
      osdep: provide ROUND_DOWN macro
      block-backend: align max_transfer to request alignment
      block: add max_hw_transfer to BlockLimits
      file-posix: try BLKSECTGET on block devices too, do not round to power of 2
      block: try BSD disk size ioctls one after another
      file-posix: handle EINTR during ioctl
      machine: move dies from X86MachineState to CpuTopology
      machine: move common smp_parse code to caller
      machine: add error propagation to mc->smp_parse
      machine: pass QAPI struct to mc->smp_parse
      machine: reject -smp dies!=1 for non-PC machines

Peter Xu (1):
      KVM: Fix dirty ring mmap incorrect size due to renaming accident

 accel/kvm/kvm-all.c                   |   4 +-
 authz/meson.build                     |   2 +-
 block.c                               |   2 +-
 block/block-backend.c                 |  19 +-
 block/file-posix.c                    | 144 +++++++++------
 block/io.c                            |   2 +
 configure                             | 326 +++-------------------------------
 crypto/meson.build                    |  41 ++---
 hw/core/machine.c                     | 140 +++++++++------
 hw/i386/pc.c                          | 110 +++++-------
 hw/i386/x86.c                         |  15 +-
 hw/scsi/scsi-generic.c                |   6 +-
 hw/usb/meson.build                    |   6 +-
 include/block/block_int.h             |   7 +
 include/hw/boards.h                   |   3 +-
 include/hw/i386/pc.h                  |   3 -
 include/hw/i386/x86.h                 |   1 -
 include/qemu/osdep.h                  |  28 ++-
 include/sysemu/block-backend.h        |   1 +
 meson.build                           | 159 ++++++++++++-----
 meson_options.txt                     |  14 ++
 qapi/block-core.json                  |  14 +-
 qapi/machine.json                     |  28 +++
 target/i386/cpu.c                     |   2 +-
 target/i386/cpu.h                     |   1 +
 target/i386/kvm/kvm.c                 |  12 +-
 tests/unit/crypto-tls-psk-helpers.c   |   6 -
 tests/unit/crypto-tls-psk-helpers.h   |   4 -
 tests/unit/crypto-tls-x509-helpers.c  |   4 -
 tests/unit/crypto-tls-x509-helpers.h  |  11 +-
 tests/unit/meson.build                |  10 +-
 tests/unit/pkix_asn1_tab.c            |   3 -
 tests/unit/test-crypto-tlscredsx509.c |  12 --
 tests/unit/test-crypto-tlssession.c   |  12 --
 tests/unit/test-io-channel-tls.c      |  12 --
 35 files changed, 501 insertions(+), 663 deletions(-)
-- 
2.31.1


