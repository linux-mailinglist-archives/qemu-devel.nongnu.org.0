Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D518A515BEF
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 11:27:16 +0200 (CEST)
Received: from localhost ([::1]:35572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkjNj-0001Dc-Eg
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 05:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkjLz-0000BM-C3
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 05:25:27 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkjLx-000323-Bn
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 05:25:26 -0400
Received: by mail-ed1-x52e.google.com with SMTP id a1so11548956edt.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 02:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pFFswriyYo57mKsHnuT9ZLshFaQW1d/aR7Vl9G4KNik=;
 b=U7FTyu/IfQ3YHkLgDeMg2BMQ0JKIIFdsNOIZfwI2GC8v/0UmcTMMkM4yo8Xt/Dhd8w
 lZso9Ql8cgJr9dP6jejzKAC9Poc6NLE86piIFRpQFxq/uJjvtaEJC0cjuE/BfpsniHxa
 HeE5SfZUmlA+0iO/Hv+D6/mtfi7M0SJzHbiPTkXNhFAbo+jy2OohmWKkDNd6yPuTPvKo
 UfbRbMtZwDcEyj5iK+AvQ2plSF43falroG43GUCJEaUrgeKmuul8NOsH8R+zNKhFIkWi
 zkIyl8t/IX/V87+EleprIs4hzzypI0JAkiqJiqybLMkVbgPWY43IGxuQOzQh5nY52eMZ
 7a6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pFFswriyYo57mKsHnuT9ZLshFaQW1d/aR7Vl9G4KNik=;
 b=7Lsi+LRzIakHAYLSFFgwbnzkON/HbkMmSyMEItsAmRlDgDZSTF909WbmKvMErpPzN1
 lHXNCFAazn2M93muu35SllJui7RYX8o338GjQgiZD7LPg8f6S+flsPGbWMRbGW+iqPM0
 Vg8dSQq2vdG1psXe3qHDj4zPf2x7rNENvUfZAt9fJKndGdoo7wjhHab+1z7zfEl85YZu
 Xi83xoYWnn884xYUFc+CUZ47v6y7m5cQkzybLFkX74DSVA5Unj/OOjE3AdfM9Dh4WmCo
 qTQxymamC2kCEf2gt4nMJ4SK333vOt869+nYEXI75I5wS0Hjlhf7/Irhp7abYqDRR4F5
 oi2w==
X-Gm-Message-State: AOAM5316Fi3jm6o6/2L32cyCbL/WdEU7FoHBFZWN+5TofU+E1vfiPPch
 6Z+5HUf8194ENzK2mqxGb8zZB8EyPsvQKQ==
X-Google-Smtp-Source: ABdhPJwKchiGQQZ8zDHg+nCHWvfCjlXNOKKNwOA/NTp/U6cMn/SilLOEKCvod82554Pu/f0iwFAaWw==
X-Received: by 2002:a05:6402:e:b0:423:d5ff:8fce with SMTP id
 d14-20020a056402000e00b00423d5ff8fcemr3574272edu.407.1651310723666; 
 Sat, 30 Apr 2022 02:25:23 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a170906845a00b006f3ef214e6csm1427676ejy.210.2022.04.30.02.25.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 02:25:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/25] Misc patches for 2022-04-29
Date: Sat, 30 Apr 2022 11:25:21 +0200
Message-Id: <20220430092522.440466-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit 731340813fdb4cb8339edb8630e3f923b7d987ec:

  Merge tag 'pull-riscv-to-apply-20220429' of github.com:alistair23/qemu into staging (2022-04-29 08:46:55 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 189fad0006dd4f2f336e05a99d981cc1ecab1b33:

  pc: remove -soundhw pcspk (2022-04-30 10:10:05 +0200)

----------------------------------------------------------------
* WHPX support for xcr0
* qga-wss fixes
* Meson conversions
* Removed -soundhw pcspk

----------------------------------------------------------------
v1->v2: fix WHPX build

Konstantin Kostiuk (2):
      configure: Add cross prefix for widl tool
      qga-vss: always build qga-vss.tlb when qga-vss.dll is built

Paolo Bonzini (22):
      meson-buildoptions: add support for string options
      meson, configure: move Xen detection to meson
      configure, meson: move iasl detection to meson
      configure: move Windows flags detection to meson
      configure: switch string options to automatic parsing
      meson, configure: move --tls-priority to meson
      meson, configure: move bdrv whitelists to meson
      meson, configure: move --with-pkgversion, CONFIG_STAMP to meson
      meson, configure: move --interp-prefix to meson
      meson: always combine directories with prefix
      configure: switch directory options to automatic parsing
      meson: pass more options directly as -D
      configure: omit options with default values from meson command line
      meson, virtio: place all virtio-pci devices under virtio_pci_ss
      configure: simplify vhost-net-{user, vdpa} configuration
      build: move vhost-vsock configuration to Kconfig
      build: move vhost-scsi configuration to Kconfig
      build: move vhost-user-fs configuration to Kconfig
      meson: create have_vhost_* variables
      meson: use have_vhost_* variables to pick sources
      configure, meson: move vhost options to Meson
      pc: remove -soundhw pcspk

Sunil Muthuswamy (1):
      WHPX: support for xcr0

 Kconfig.host                     |   3 -
 backends/meson.build             |   8 +-
 configure                        | 673 ++-------------------------------------
 docs/meson.build                 |   2 +-
 hw/audio/pcspk.c                 |  10 -
 hw/audio/soundhw.c               |  27 +-
 hw/net/meson.build               |   8 +-
 hw/scsi/Kconfig                  |   5 +
 hw/virtio/Kconfig                |  18 +-
 hw/virtio/meson.build            |  34 +-
 include/hw/audio/soundhw.h       |   3 -
 include/hw/virtio/virtio-scsi.h  |   2 -
 meson.build                      | 256 +++++++++++----
 meson_options.txt                |  28 +-
 net/meson.build                  |  12 +-
 qga/vss-win32/meson.build        |   4 +-
 scripts/meson-buildoptions.py    |  86 ++++-
 scripts/meson-buildoptions.sh    |  74 ++++-
 scripts/qemu-stamp.py            |  24 ++
 scripts/xen-detect.c             | 203 ++++++++++++
 target/i386/whpx/whpx-all.c      |  89 ++++++
 target/i386/whpx/whpx-internal.h |   3 +
 tests/meson.build                |   2 +-
 tests/qtest/meson.build          |   4 +-
 tools/meson.build                |   2 +-
 25 files changed, 778 insertions(+), 802 deletions(-)
 create mode 100644 scripts/qemu-stamp.py
 create mode 100644 scripts/xen-detect.c
-- 
2.35.1


