Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B6B673228
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIOy5-0005UG-Kg; Thu, 19 Jan 2023 02:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOxW-0005Gx-T6
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:03:43 -0500
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOxU-0000K9-EN
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:03:37 -0500
X-IronPort-RemoteIP: 209.85.219.199
X-IronPort-MID: 252685565
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2ph/C6xyJLStx2o6WCh6t+eJxCrEfRIJ4+MujC+fZmUNrF6WrkVTy
 GFLCmGGMv7YNGKgeIhyYYjg/EMB6JCAzNBqTgo++y00HyNBpPSeOdnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9j8kkPnSHdIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz18B56r8ks156yr4WJA5zTSWNgQ1LPgvyhNZH4gDfzpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZGBiuFIPM0SRqkEqShgJ70oOHKF0hXG7Ktm+t4sZJ
 N1l7fRcQOqyV0HGsL11vxJwSkmSMUDakVNuzLfWXcG7liX7n3XQL/pGAHkYHYwW2MtMDnAQr
 qdBLDQ9ax+PrrfjqF67YrEEasULKcDqOMYOsCglw2iIXLApRpfMR6iM7thdtNsyrpoWTLCOO
 oxDMGspNUWRC/FMEg5/5JYWleO4gHXlWzdF7l+ZuMLb5kCJkVYvgOWwboe9ltqiG+lwuXayu
 nj9pXXEWEBDEPCn9j237Sf57gPItWahMG4IL5Wh+/t3xVGe2GEXIBsRU1S9vL++kEHWZj5EA
 0kd+y5rvKJrsULyH4i7UBq/r3qJ+BUbXrK8DtEH1e1E8YKMiy7xO4TOZmcphAAO3CPueQEX6
 w==
IronPort-HdrOrdr: A9a23:zHndkKEahP/NXChqpLqE1ceALOsnbusQ8zAXP+Abc3Jom62j5r
 iTdZEgvnXJYVkqKRMdcO67Scq9qB/nhPlICPAqUYtKPzOWwVdATrsC0WKK+VSJdhEWkNQts5
 uIGJIObeEYY2IK6foSNDPZLz6pq+PpzJyV
Received: from mail-yb1-f199.google.com ([209.85.219.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 02:03:34 -0500
Received: by mail-yb1-f199.google.com with SMTP id
 81-20020a250b54000000b007c002e178dfso1302694ybl.9
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FSQLcBOaxi4ec1ZLLBTEmbLjcknf+fmz9dGZaj/lG9Q=;
 b=kOHN267EDXQFbaHI4GN1O58nx3ydv912uype8Q3QMt8WZttrEpwD8gwkY1shW0XDSF
 A7bMKyjvw5bQQzDRoW+AJeRdOn3C7LGFHiHTOzvRGIbxrr70hQyNiUXGnR9UBiK2BRlF
 MqKLNy7xVIoYqQMuMIBnyiVgcVnJT0q6HzZ+6EAFPsbCxcPyJaEBSgzq3q6oEaJPS+yd
 FD0fRp/OLDEsWGWumPJAwYdo45CSYiZnYCeLSHFzlzOtskkupJgyen4w5S/00WgFU1Ez
 nBCmq46lvec6NPEvl+k9qKM5I1OaT+HT1vD3PFa70ikPySxmOb3LjHFXgxKYZyob7RYm
 UvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FSQLcBOaxi4ec1ZLLBTEmbLjcknf+fmz9dGZaj/lG9Q=;
 b=beBSlfLVaKhP6E2T+aXhABOHWJrqKp8RsN6tvtCAHSM3X7ryPg470R8misveeiObqF
 ZkFC9ye/5HhiNZ9REr35l3rYJGfYzAXDqahe0zd+/9zSxCluvevqbZk1zCxFoiRfIV5f
 15srBcOHW2Z14e0DjGpHB4UiLBAHVUyBtZAF3s7QdDbr3U+fouXyQpQKjGLdSkNA9Ilw
 yLW31TT36zpMMEb2VK8EQhxSlTR4/c8gaNoxBd7guuHV4zJw8nIiBLZn0z9m0mjDgPEB
 93whQe84TM6Y5FSziowYB04aEHz1yhYXBCZY5Fjbrfpm8FiqD+Z5PzFb7EYTRR2TT6n9
 IYxQ==
X-Gm-Message-State: AFqh2kpmfI7+U2FuiPWumR4QyTrc/mw93a0+CMEfip0UL6LSnClgT8NM
 RTla2yqtCy/hLy9aW5SOlxP+ubUHxwjkcP29hk/Uc0jsp1DnEMbR//wU7m9z0YlklO+0RlIm30A
 bMbw312G/kjPimf4AOpG5Y1Didxa9Yg==
X-Received: by 2002:a05:622a:1f8f:b0:3b1:ca9c:6c38 with SMTP id
 cb15-20020a05622a1f8f00b003b1ca9c6c38mr16843433qtb.51.1674111802690; 
 Wed, 18 Jan 2023 23:03:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtdYWJeR8hc2O4F3ulIceRwuvX5SFdrDk8GYb5Zm/tbjU9amCHjbPzLiwm6qo6fH3P7+KXf4g==
X-Received: by 2002:a05:622a:1f8f:b0:3b1:ca9c:6c38 with SMTP id
 cb15-20020a05622a1f8f00b003b1ca9c6c38mr16843351qtb.51.1674111801857; 
 Wed, 18 Jan 2023 23:03:21 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 bp37-20020a05620a45a500b006e99290e83fsm23675926qkb.107.2023.01.18.23.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:03:21 -0800 (PST)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v4 0/3] memory: prevent dma-reentracy issues
Date: Thu, 19 Jan 2023 02:03:05 -0500
Message-Id: <20230119070308.321653-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These patches aim to solve two types of DMA-reentrancy issues:

1.) mmio -> dma -> mmio case
To solve this, we track whether the device is engaged in io by
checking/setting a reentrancy-guard within APIs used for MMIO access.

2.) bh -> dma write -> mmio case
This case is trickier, since we dont have a generic way to associate a
bh with the underlying Device/DeviceState. Thus, this version allows a
device to associate a reentrancy-guard with a bh, when creating it.
(Instead of calling qemu_bh_new, you call qemu_bh_new_guarded)

I replaced most of the qemu_bh_new invocations with the guarded analog,
except for the ones where the DeviceState was not trivially accessible

Unlike v3, these changes should address issues in devices that bypass
DMA apis and directly call into address_space.
e.g. https://gitlab.com/qemu-project/qemu/-/issues/827

v3 -> v4: Instead of changing all of the DMA APIs, instead add an
    optional reentrancy guard to the BH API.

v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
    attempting to guess DeviceStates in BHs.


Alexander Bulekov (3):
  memory: prevent dma-reentracy issues
  async: Add an optional reentrancy guard to the BH API
  hw: replace most qemu_bh_new calls with qemu_bh_new_guarded

Alexander Bulekov (3):
  memory: prevent dma-reentracy issues
  async: Add an optional reentrancy guard to the BH API
  hw: replace most qemu_bh_new calls with qemu_bh_new_guarded

 docs/devel/multiple-iothreads.txt |  2 ++
 hw/9pfs/xen-9p-backend.c          |  4 +++-
 hw/block/dataplane/virtio-blk.c   |  3 ++-
 hw/block/dataplane/xen-block.c    |  5 +++--
 hw/block/virtio-blk.c             |  5 +++--
 hw/char/virtio-serial-bus.c       |  3 ++-
 hw/display/qxl.c                  |  9 ++++++---
 hw/display/virtio-gpu.c           |  6 ++++--
 hw/ide/ahci.c                     |  3 ++-
 hw/ide/core.c                     |  3 ++-
 hw/misc/imx_rngc.c                |  6 ++++--
 hw/misc/macio/mac_dbdma.c         |  2 +-
 hw/net/virtio-net.c               |  3 ++-
 hw/nvme/ctrl.c                    |  6 ++++--
 hw/scsi/mptsas.c                  |  3 ++-
 hw/scsi/scsi-bus.c                |  3 ++-
 hw/scsi/vmw_pvscsi.c              |  3 ++-
 hw/usb/dev-uas.c                  |  3 ++-
 hw/usb/hcd-dwc2.c                 |  3 ++-
 hw/usb/hcd-ehci.c                 |  3 ++-
 hw/usb/hcd-uhci.c                 |  2 +-
 hw/usb/host-libusb.c              |  6 ++++--
 hw/usb/redirect.c                 |  6 ++++--
 hw/usb/xen-usb.c                  |  3 ++-
 hw/virtio/virtio-balloon.c        |  5 +++--
 hw/virtio/virtio-crypto.c         |  3 ++-
 include/block/aio.h               | 18 ++++++++++++++++--
 include/hw/qdev-core.h            |  7 +++++++
 include/qemu/main-loop.h          |  7 +++++--
 softmmu/memory.c                  | 15 +++++++++++++++
 softmmu/trace-events              |  1 +
 tests/unit/ptimer-test-stubs.c    |  3 ++-
 util/async.c                      | 12 +++++++++++-
 util/main-loop.c                  |  5 +++--
 34 files changed, 128 insertions(+), 43 deletions(-)

-- 
2.39.0


