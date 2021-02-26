Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEDA325EA3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:09:35 +0100 (CET)
Received: from localhost ([::1]:33230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYBq-0003hm-MP
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7v-0001iF-RV
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:31 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY7t-00042f-E6
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:31 -0500
Received: by mail-wm1-x32e.google.com with SMTP id w7so6658293wmb.5
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nhyrt9miXVBA8hYvxALmnS327G1kfNFMu1YE/qK0HZA=;
 b=EqOQ17K0QREwWDU++jiJUjpkZBzij6NPAM8fp1GEQxJ+Z/EK4IBmTvBwJ+iRqVkVxi
 U7SHhUwiMcD8ErPzUArR1ATAjrwwLJdjL0139MnydnVWvQoykyVtKr83a9jWXMvsMtQR
 gepyYEq4mAs9DvtG0JTBgVlDxYtTXDQsjGTjst4enCBRr6weCe1/j3wgR9Su5So5CTHx
 MZO87Ljl5NCLi1Mv6U9OFiDB2wRJTQcR96iaJ6/qcs+TO23t5QcnOO2k3KWakd+vyAZe
 qIGTkjIwhCjmHBgeT1jcFFNLonu0FfeVUMhF6mOLdOeZgEURjaknqdnb81Ou9Pd/1h2J
 H2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nhyrt9miXVBA8hYvxALmnS327G1kfNFMu1YE/qK0HZA=;
 b=Mfu0Kq7wOByRXvfmqv2ifmDesrz7ke3NxUgsGDgzgK25/bCg9fQEPlxKkA0ZJYQMoS
 /RaR8hnVD4Mn+qazQKQlVRlfnz8kOX1KHLUWVdbN0EyNWpUK2UpNAAu8YA0DKNH2Q4XZ
 Vhmn1Jy+NhdAxZR+kvSpzovX+4eVZRZk5UGwvMealeRFiZRj0N+SM0lptRtVheeypyt2
 By6Hs3GD8EYOpPQkjxfa+AaOqpeUej5td4N5gSs4ruVaAsr0SiOLULaEM0pUQrgmadD1
 gaOP2e8eOqUzRjJOCsKDxMrJsCktGDnk8wu6N0dgQDN67Pf/BB62dJCTqYnH+950Upw8
 3cYw==
X-Gm-Message-State: AOAM530IvNvzoOH6CqEjv/5jYJ114JT7DIurCANQw6F1dbCRl+uRPadA
 oqku6dIcwwJp488E1bxTtila3vJINUo=
X-Google-Smtp-Source: ABdhPJwFgnx6GVSI3vt5Coti3S2qYbRDaW3JCJt9cUUNy8q1atIhIdDtEg6CFh2u3ciUCPSQ2I04hQ==
X-Received: by 2002:a1c:4b16:: with SMTP id y22mr1512560wma.99.1614326727895; 
 Fri, 26 Feb 2021 00:05:27 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/29] Misc patches for 2021-02-25
Date: Fri, 26 Feb 2021 09:04:57 +0100
Message-Id: <20210226080526.651705-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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

The following changes since commit 00d8ba9e0d62ea1c7459c25aeabf9c8bb7659462:

  Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-20210221' into staging (2021-02-21 19:52:58 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to b7ea7d82903f125e393b7957d1add25cf6b522dd:

  tcg/i386: rdpmc: fix the the condtions (2021-02-25 14:49:01 +0100)

----------------------------------------------------------------
* fix --enable-fuzzing linker failures (Alexander)
* target/i386: Add bus lock debug exception support (Chenyi)
* update documentation for preferred boolean option syntax (Daniel)
* make SCSI io_timeout configurable (Hannes)
* fix handling of guest recoverable SCSI errors (myself)
* misc fixes (Pavel, Zheng Zhan Liang, Zihao)
* fix installation of binaries with entitlements (Akihiko)

----------------------------------------------------------------
Akihiko Odaki (1):
      hvf: Sign the code after installation

Alexander Bulekov (1):
      configure: fix --enable-fuzzing linker failures

Chenyi Qiang (1):
      target/i386: Add bus lock debug exception support

Daniel P. Berrangé (10):
      gdbstub: use preferred boolean option syntax
      qemu-options: update to show preferred boolean syntax for -chardev
      qemu-options: update to show preferred boolean syntax for -spice
      qemu-options: update to show preferred boolean syntax for -netdev
      qemu-options: update to show preferred boolean syntax for -incoming
      qemu-options: update to show preferred boolean syntax for -vnc
      docs: update to show preferred boolean syntax for -chardev
      docs: update to show preferred boolean syntax for -vnc
      docs: update to show preferred boolean syntax for -cpu
      target/i386: update to show preferred boolean syntax for -cpu

Doug Evans (1):
      qom/object.c: Fix typo

Hannes Reinecke (3):
      scsi: make io_timeout configurable
      scsi: add tracing for SG_IO commands
      scsi: drop 'result' argument from command_complete callback

Maxim Levitsky (1):
      virtio-scsi: don't process IO on fenced dataplane

Paolo Bonzini (8):
      multiprocess: move feature to meson_options.txt
      scsi-disk: move scsi_handle_rw_error earlier
      scsi-disk: do not complete requests early for rerror/werror=ignore
      scsi: introduce scsi_sense_from_errno()
      scsi-disk: pass SCSI status to scsi_handle_rw_error
      scsi-disk: pass guest recoverable errors through even for rerror=stop
      vl: deprecate -writeconfig
      chardev: do not use short form boolean options in non-QemuOpts character device descriptions

Pavel Dovgalyuk (1):
      char: don't fail when client is not connected

Zheng Zhan Liang (1):
      tcg/i386: rdpmc: fix the the condtions

Zihao Chang (1):
      scsi: allow user to set werror as report

 chardev/char-socket.c                  |  13 ++-
 configure                              |  24 +++--
 docs/COLO-FT.txt                       |  12 +--
 docs/ccid.txt                          |   6 +-
 docs/colo-proxy.txt                    |  16 +--
 docs/devel/writing-qmp-commands.txt    |   2 +-
 docs/interop/firmware.json             |   2 +-
 docs/interop/live-block-operations.rst |   4 +-
 docs/interop/qmp-intro.txt             |   4 +-
 docs/system/cpu-hotplug.rst            |   2 +-
 docs/system/cpu-models-x86.rst.inc     |   4 +-
 docs/system/deprecated.rst             |   7 ++
 docs/system/s390x/3270.rst             |   2 +-
 docs/system/target-avr.rst             |   2 +-
 docs/system/vnc-security.rst           |   8 +-
 docs/tools/qemu-storage-daemon.rst     |   4 +-
 gdbstub.c                              |   2 +-
 hw/scsi/esp-pci.c                      |   5 +-
 hw/scsi/esp.c                          |   7 +-
 hw/scsi/lsi53c895a.c                   |   6 +-
 hw/scsi/megasas.c                      |   6 +-
 hw/scsi/mptsas.c                       |   5 +-
 hw/scsi/scsi-bus.c                     |   2 +-
 hw/scsi/scsi-disk.c                    | 172 ++++++++++++++++-----------------
 hw/scsi/scsi-generic.c                 |  28 ++++--
 hw/scsi/spapr_vscsi.c                  |  12 +--
 hw/scsi/trace-events                   |   4 +
 hw/scsi/virtio-scsi-dataplane.c        |  24 +++--
 hw/scsi/virtio-scsi.c                  |   5 +-
 hw/scsi/vmw_pvscsi.c                   |   4 +-
 hw/usb/dev-storage.c                   |   6 +-
 hw/usb/dev-uas.c                       |   7 +-
 include/hw/scsi/esp.h                  |   2 +-
 include/hw/scsi/scsi.h                 |   6 +-
 include/scsi/utils.h                   |   2 +
 meson.build                            |  18 +++-
 meson_options.txt                      |   2 +
 qapi/char.json                         |   4 +-
 qemu-options.hx                        | 138 +++++++++++++-------------
 qom/object.c                           |   2 +-
 scripts/entitlement.sh                 |  19 +++-
 scripts/qmp/qemu-ga-client             |   2 +-
 scsi/utils.c                           |  51 ++++++++--
 softmmu/vl.c                           |   1 +
 target/i386/cpu.c                      |   4 +-
 target/i386/cpu.h                      |   2 +
 target/i386/tcg/misc_helper.c          |   3 +-
 tests/guest-debug/run-test.py          |   8 +-
 tests/qtest/test-x86-cpuid-compat.c    |  52 +++++-----
 tests/test-char.c                      |   4 +-
 50 files changed, 405 insertions(+), 322 deletions(-)
-- 
2.29.2


