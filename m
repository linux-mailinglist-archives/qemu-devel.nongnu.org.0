Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C679351E488
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 07:55:17 +0200 (CEST)
Received: from localhost ([::1]:33240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnDPQ-00053P-HF
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 01:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nnDLS-0002EW-Q6
 for qemu-devel@nongnu.org; Sat, 07 May 2022 01:51:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nnDLO-0003ek-Tn
 for qemu-devel@nongnu.org; Sat, 07 May 2022 01:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651902664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OHfuFo0x/Ljtf0tFeRQMKNc2uqJs55CyL+HuTtmoeIU=;
 b=Y4FnIZnHJYJnxCoVKSGzFjgauG9UTCRgry4+a0UA+lKE2SJjxlgunYUfmbwf0f9k5+nACy
 wTNumJSQb1v7vgGhIkX0P/LCdKa7B49OiZB5BvtTyMxiyy5GkDSDHd0qPAxpfHqfQT3oS7
 m7ZdMoO8TBMDNN2gBECgddAP6bRzvuM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-uM7v5oZ9M3uuMO-e9EJ3PQ-1; Sat, 07 May 2022 01:51:02 -0400
X-MC-Unique: uM7v5oZ9M3uuMO-e9EJ3PQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 oz9-20020a1709077d8900b006f3d9488090so5293365ejc.6
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 22:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OHfuFo0x/Ljtf0tFeRQMKNc2uqJs55CyL+HuTtmoeIU=;
 b=GkRN2s1bpdFohCTStwuQD5vcs9aJ5KjjhRjVjmWDLNqugC5waukzCbPjs1YnnRB11/
 OjgszJkY8v2fgIVDd4Uvx2s1OjxlgT93hTbP0i6D8vh3T4dTucSOcmNpA57eBWfP5+Uu
 K15c3zH8t+pa5JXj6GqRKWYoSVcHnEqWL+bqWrGRsnLRv9hYDhHDuaAKemB5/waomV/7
 WL3bXYsNqad9cx2UdH+JztDEfHLQkqTgJ/WKXUoPCc1xGMoIC2BbyCPQk7u6ZPLS/R6r
 67EDSTyizxLKGCOJfWYeJDpyC9MqCx9+UgqBqRd8vlZ0sk+eGeiPrqIk0S+wjL6rC7R2
 yOcA==
X-Gm-Message-State: AOAM530/POb+f3eMVUQgVnZeWM3kQBcnFfpkN7e34rs0Pn0fCKeu56qs
 eYwVEQ+tXlhZNBgkRo+OKXoHq3wxyDTiI0d8U80bP6uay0Trz/sQmYrCy4w/da2dCHL4oBrlNpL
 lIeiHp5jBqzLYC7UOSNoE2HeDjChB5JufyLaCEHlgf7DunBk8pXNCQITP/+J5vnnvxyU=
X-Received: by 2002:a17:906:314e:b0:6f0:659:963 with SMTP id
 e14-20020a170906314e00b006f006590963mr6273474eje.358.1651902661236; 
 Fri, 06 May 2022 22:51:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIpvWBMGjuTvpUnm0VkE2TpLd6wh8+ovqRz8N++EuOhFibacG3f+N7M66ncKDu9BDVl/AdLw==
X-Received: by 2002:a17:906:314e:b0:6f0:659:963 with SMTP id
 e14-20020a170906314e00b006f006590963mr6273454eje.358.1651902660895; 
 Fri, 06 May 2022 22:51:00 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 my50-20020a1709065a7200b006f3ef214e79sm2644713ejc.223.2022.05.06.22.51.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 22:51:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v5 00/25] Misc patches for 2022-04-29
Date: Sat,  7 May 2022 07:50:58 +0200
Message-Id: <20220507055059.125324-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 13220a46e27ef95159651acd5e408b6aac9dbf3e:

  Merge tag 'vfio-updates-20220506.1' of https://gitlab.com/alex.williamson/qemu into staging (2022-05-06 16:18:14 -0500)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 6033b9ecd4f6a26b78f44a94813e1e464f5b0549:

  pc: remove -soundhw pcspk (2022-05-07 07:46:59 +0200)

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

 Kconfig.host                                    |   3 -
 backends/meson.build                            |   8 +-
 configure                                       | 673 ++----------------------
 docs/meson.build                                |   2 +-
 hw/audio/pcspk.c                                |  10 -
 hw/audio/soundhw.c                              |  27 +-
 hw/net/meson.build                              |   8 +-
 hw/scsi/Kconfig                                 |   5 +
 hw/virtio/Kconfig                               |  18 +-
 hw/virtio/meson.build                           |  34 +-
 include/hw/audio/soundhw.h                      |   3 -
 include/hw/virtio/virtio-scsi.h                 |   2 -
 meson.build                                     | 256 ++++++---
 meson_options.txt                               |  28 +-
 net/meson.build                                 |  12 +-
 qga/vss-win32/meson.build                       |   4 +-
 scripts/ci/org.centos/stream/8/x86_64/configure |   3 -
 scripts/meson-buildoptions.py                   |  86 ++-
 scripts/meson-buildoptions.sh                   |  74 ++-
 scripts/qemu-stamp.py                           |  24 +
 scripts/xen-detect.c                            | 203 +++++++
 target/i386/whpx/whpx-all.c                     |  87 +++
 target/i386/whpx/whpx-internal.h                |   3 +
 tests/meson.build                               |   2 +-
 tests/qtest/meson.build                         |   4 +-
 tools/meson.build                               |   2 +-
 26 files changed, 776 insertions(+), 805 deletions(-)
 create mode 100644 scripts/qemu-stamp.py
 create mode 100644 scripts/xen-detect.c
-- 
2.35.1


