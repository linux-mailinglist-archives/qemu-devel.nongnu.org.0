Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD676514F66
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:27:51 +0200 (CEST)
Received: from localhost ([::1]:50118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSX8-0005xw-V7
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSj-0001aB-8u
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:17 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSh-00067F-AC
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:16 -0400
Received: by mail-ej1-x631.google.com with SMTP id r13so16099618ejd.5
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QtWiM6wJXWX0z9Xw8l9PwQw3iByS/aoemS8FD1mTYcI=;
 b=LwKst6PijlyblXmbkA9EXKhZQRvV3ktJdg2V+1rnfoZfd5DOoymE6v6CkN7P8jeimF
 G0C52QK4T/yHVwvgCEwiHPVm2qbgqBqMQuUqRYGkXGNAioWYcDZFJFaWcuZEMx+Oxk2b
 zqqZdgpEiWDav2KXDaZffdUB8aKBDH5mOOwLNjr1GvDIO2XUatbhFJue6qZQhBOK475K
 4l81Pn0lC8mzxp5Vp1FKSKHxN+tn7vGm0vV/3EiupT04jRe/+hDLReHq/wsEa6gVYTA8
 3rxPTMAunn7uvCtOZN16mbmW00k8Mw7lqtpPSrqcVRLWAc5HERC23SwExqLowP+BKCJp
 Wefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QtWiM6wJXWX0z9Xw8l9PwQw3iByS/aoemS8FD1mTYcI=;
 b=uQLC6Wh8zd8yAop0rACCtoTdm4es5uNHb0e/9qmF0ZMKhDgu1/IxFviDSn9K9Ljyin
 GPau3ADvEL9Fzrz/41+HaCpZP8AduYJjP3T/moSjfGSgPWm8e0QhwoTWx+NwQopkdwfS
 JSYNbxHx0Stajv7jduvRBlsHJly/jlyJKwjzS1HS/YvnrOnGmhOQmOqHQvfP1EbHeKMi
 verQoJy+ldvzefeLSSTGsC+K1wfHQfON+nj4wT/rlS/9NncBodob1mP86//FhL9wZxDT
 0Kh8+Iaqp8M+J40a/veUjSiJObPVEmFerui6UXvGt5ZRTS/box7x4QjVTdtpN1Ur2uwz
 6ZYg==
X-Gm-Message-State: AOAM533XLU2irHY2HI2XLoEFlP7hr7tQulObYzl+ckcUoKSue6tqnydZ
 R6PE35/89UIhKfAb4AFF7xs5i87ixAcO/A==
X-Google-Smtp-Source: ABdhPJzMmLHVPXd6155NlGAin7kV54VR6sEPt8AqVLAEhXzd/S28ds2UKN2s8rkmua2ErX7uXwusYQ==
X-Received: by 2002:a17:906:fca:b0:6f3:e2d8:7c57 with SMTP id
 c10-20020a1709060fca00b006f3e2d87c57mr7721911ejk.320.1651245793675; 
 Fri, 29 Apr 2022 08:23:13 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/25] Misc patches for 2022-04-29
Date: Fri, 29 Apr 2022 17:22:47 +0200
Message-Id: <20220429152312.335715-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
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

The following changes since commit f22833602095b05733bceaddeb20f3edfced3c07:

  Merge tag 'pull-target-arm-20220428' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-04-28 08:34:17 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to ec31a2f9b5b128c06a499ad076d8b29d664d3896:

  pc: remove -soundhw pcspk (2022-04-29 15:07:21 +0200)

----------------------------------------------------------------
* WHPX support for xcr0
* qga-wss fixes
* Meson conversions
* Removed -soundhw pcspk

----------------------------------------------------------------
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


