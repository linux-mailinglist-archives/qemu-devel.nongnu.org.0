Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66856508C68
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:48:51 +0200 (CEST)
Received: from localhost ([::1]:54412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCZW-0002Pw-Fk
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:48:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLP-00010q-5D
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:17 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLN-0000sx-Aj
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id q20so1466245wmq.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4OugLISHCLmbcnTDyDBON/b+AD08b0Hkx2IvJhtc5WY=;
 b=AgToFUXviJrVQ0fbfne3HuoS5HCRfPE+ihOIc6CGnIA4Pyw01RftKHrSfJLT24lwI+
 Bn5bKadmc0EvtTB+HyLzMpC1wKOJ9sdHFxe/qOAcc8ObmXDbQOOiMNSjZCNi/fb6aXuK
 4Jgeua+MsDE+PcbIba2QvdqXq3yU8ylf+n5WRO1/2289zg266nSWojMZKlY9dTNXLpmZ
 po0gQUF6fqxFpk+W/lQFNnLD3D/6mdgZCpNtCXKgx856efio//4Xsyaswt4+GQlxLGbW
 /uo6bZ2FkAGoVc2IVcNmJdVYvpq2UhdwRPjIwFXJ7NUaqvZtyFg2MQ9zFWoVjrcQwKqx
 0E3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4OugLISHCLmbcnTDyDBON/b+AD08b0Hkx2IvJhtc5WY=;
 b=Rj/rq4brCSuztWC4Ix6ja3HQFmhHHf+k8y3cbHumXTpruk0BfENUiHqKRiGqUSBpY5
 g2qMYXxe7Pu+UM9rkzJtaXn6EVFbIgg1Lrq1iI7PElp+sH4gUXey1DRvV3hnWByLV4oW
 nDpR+4dEt6hZowpDk6Bfi+3VD+FLbHqIXuUncHXJmTtRr84xuO2XHF1OzMuWfYJd7zxM
 QtuysKx1CD6FbTzc8Olr9sPAdXN62MzmsALs0zku2AZGUsmnn7u0aoOMCrn6lx4jcPuq
 KvdcpfoozD9iH6UcMZIcRYvA4v2yTC3gPJpxhbVRmjfLfxlxVv+qCOzOekvzSpE8baZJ
 7s9g==
X-Gm-Message-State: AOAM532fSLnhUfLJzrfFtieefM5MbFEmg/vmJg6t/RUNKl0ApiHhpxAv
 kBeF5vkLN/22vMxDFgOLI/oL15VK7Lcv0A==
X-Google-Smtp-Source: ABdhPJw2cvKo0JkOjuyBpQLBkIEbB6UOO8CaQh6EsBCn+UbBEzV1RmIQnAkC+SqX9PyjS40/wiwaFw==
X-Received: by 2002:a05:600c:3d87:b0:38f:eb0c:fc54 with SMTP id
 bi7-20020a05600c3d8700b0038feb0cfc54mr4325747wmb.55.1650468851662; 
 Wed, 20 Apr 2022 08:34:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/34] Misc meson conversions for QEMU 7.1
Date: Wed, 20 Apr 2022 17:33:33 +0200
Message-Id: <20220420153407.73926-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
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

The more interesting bits here are:

* move all remaining dependencies except glib to Meson (glib depends on
  https://github.com/mesonbuild/meson/pull/10206/)

* many more options are parsed from introspection data, including
  string options

* make all -D options optional on the meson command line

Paolo Bonzini (34):
  meson: show final set of compiler flags
  configure: remove dead code
  qga: wixl: get path to sysroot from pkg-config as intended
  configure: pc-bios/qemu-icon.bmp does not exist
  configure: gcov should not exclude fortify-source
  configure: move --enable/--disable-debug-info to second option parsing pass
  configure, meson: move OpenGL check to meson
  meson, configure: move RDMA options to meson
  meson, configure: move keyctl test to meson
  meson, configure: move usbfs test to meson
  meson, configure: move libgio test to meson
  meson: move CONFIG_XEN_PCI_PASSTHROUGH to config-host.h
  meson, configure: move --enable-module-upgrades to meson
  meson, configure: move Xen detection to meson
  meson-buildoptions: add support for string options
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
  configure: simplify vhost-net-{user,vdpa} configuration
  build: move vhost-vsock configuration to Kconfig
  build: move vhost-scsi configuration to Kconfig
  build: move vhost-user-fs configuration to Kconfig
  meson: create have_vhost_* variables
  meson: use have_vhost_* variables to pick sources
  configure, meson: move vhost options to Meson

 Kconfig.host                    |    3 -
 backends/meson.build            |   10 +-
 configure                       | 1010 ++-----------------------------
 contrib/rdmacm-mux/meson.build  |    4 +-
 crypto/meson.build              |    4 +-
 docs/meson.build                |    2 +-
 hw/net/meson.build              |    8 +-
 hw/scsi/Kconfig                 |    5 +
 hw/virtio/Kconfig               |   18 +-
 hw/virtio/meson.build           |   34 +-
 hw/xen/meson.build              |   20 +-
 include/hw/virtio/virtio-scsi.h |    2 -
 meson.build                     |  406 ++++++++++---
 meson_options.txt               |   40 +-
 migration/meson.build           |    2 +-
 net/meson.build                 |   12 +-
 qga/meson.build                 |    2 +-
 scripts/meson-buildoptions.py   |   86 ++-
 scripts/meson-buildoptions.sh   |   93 ++-
 scripts/qemu-stamp.py           |   24 +
 scripts/xen-detect.c            |  203 +++++++
 tests/meson.build               |    2 +-
 tests/qtest/meson.build         |    9 +-
 tools/meson.build               |    2 +-
 ui/meson.build                  |   24 +-
 util/meson.build                |    2 +-
 26 files changed, 873 insertions(+), 1154 deletions(-)
 create mode 100644 scripts/qemu-stamp.py
 create mode 100644 scripts/xen-detect.c

-- 
2.35.1


