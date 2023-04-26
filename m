Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EAD6EF851
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:22:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhtH-0000tg-8W; Wed, 26 Apr 2023 12:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhtF-0000sz-4y
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:21:09 -0400
Received: from esa14.hc2706-39.iphmx.com ([216.71.140.199])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhtC-0005vf-Qr
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:21:08 -0400
X-IronPort-RemoteIP: 209.85.219.199
X-IronPort-MID: 298806943
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ikhvl611xIYzVcuDhvbD5Wtzkn2cJEfYwER7XKvMYLTBsI5bpzdUz
 mRKDz/Ta66Na2vxfd10aojloEkCvZ+DztNlHFA/qSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv666yE6jfrSLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglYwr414rZ8Ek05Kio5mtC1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN11HEcXD6Y/wd8mOj9q7
 fEWeToPYguc0rfeLLKTEoGAh+wmJcjveZIV4zRulGCIS/khRp/HTuPB4towMDUY3JgfW6aDI
 ZBAOHw2PUWojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKCnFwpjumxa7I5fPTVVeN3jmm9g
 VmBvHv5LhQ8O4We7GCspyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m8/p/F3+hX6H5/yWBq3pHPCtRkZMzZNL9AHBMi24vK8y26k6qIsFGUeADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:Y6QKvKwNfwtF1aoXkAS2KrPw9r1zdoMgy1knxilNoNJuA6ilfq
 eV7Y4mPHrP4gr5N0tQ/+xoVJPwI080lqQFmrX5Q43SJTUO0VHAROoSjrcKqweBJ8SUzJ876U
 4PSdkaNPTASXJXt4LV2jWZLvoX6OW70cmT9JrjJrRWIT2CqZsM0+60MGim+zVNNXF77FMCe/
 uh2vY=
X-Talos-CUID: 9a23:54ac5W4uj21d7crSWdss714SO/IOVUbknUyOB1e1BzdjSrGOVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AEaQmmAxvRzHcFHMzKh/KjnFanvmaqPu+LmIdvrA?=
 =?us-ascii?q?hgI7HKixcPhGS1TWSGKZyfw=3D=3D?=
Received: from mail-yb1-f199.google.com ([209.85.219.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 12:20:18 -0400
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-b92309d84c1so36263126276.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682526018; x=1685118018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+qF0yfx8hJ+dFOt8TCjBvztU8SdaSZZb2/fSXggtSGs=;
 b=WikY4yBy3cOuh8pz9kCSl86zfAmm/XK+2vBLBxSrib5QqPJiSE8zNcH4uFWlfk8pTt
 geeR4Khz8UzKqyaefprhjZEuYzr9RvkU7B1McVTQbg2mm6T8zbi/j3UfpjmUCz2PxrUx
 wBM3OJekBlxqBqOE3p41QXCfyLVxRfMCsDdKNE8wgV7lDruZLaI3fvi5lTFRmH2rl5KT
 GnnyUvzfbW6gPJH42CDehrqPvgs/uhFnKbridR32qbEAQ5/jB+i50EFSrEMn38DP4BkF
 3cpB29CREoC4oAo/phPl6HPlnBoT3O/ePHJmT1UkREHRxPBCdPoIGCh2FmmMz2+RMAJ/
 X1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526018; x=1685118018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+qF0yfx8hJ+dFOt8TCjBvztU8SdaSZZb2/fSXggtSGs=;
 b=CVCPybNAVxSjILaHlQK5SZJCSfa0AXx8/Xce0bMRG1dB2Ca0Hq4boQMonTmTTOSDPj
 MXYcUI+yC5P0yHnI9KKG94bYX7rJO/YPGLsv7fgAfOepx7iZWDy3v849GgimzDMQMjIo
 mvagWjM/YkcdbYnLqzo24C7h1p26zpb5wfF6Iwre2qgkXH+5oOcQVcezqLNtaPdZV7m/
 N7yNb2sgfFOuIkjb9LpiOfjzVb2R9ngbOmsx7nQ+PuBRZeN04nvsUGiA/xbuiQH/2pMV
 27A6eol3+vthnwj9JBGN6qJEwSQDqWZne/ydVX76S0TNBAxTumjs9q3LQBnyOXGA6VW6
 H97Q==
X-Gm-Message-State: AC+VfDyfSMx8vCIRzzBRB++QVo8uNsvl5nFcRp9LYV+yK+kAADqGWP3x
 o7Pk6mBOmw2cGPyYAiHxVjS9FpSsbcqt5N54BqdRhkNTOPFyADalxjOY/E6UqqTPjyKqIJLNcdH
 YWMHMSdU1FVg9k9uk/fS+hUpTa63H4oY8esoFNnwUD+8=
X-Received: by 2002:ad4:5b87:0:b0:5ee:e18d:3ec with SMTP id
 7-20020ad45b87000000b005eee18d03ecmr3789170qvp.26.1682525997045; 
 Wed, 26 Apr 2023 09:19:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vgKVjjAJlR648XADSx8YRyjyVk87X94Hrm/hgeVxP5Q5PRtqM84xfN+oW2NKz5NFtjV4SZw==
X-Received: by 2002:ad4:5b87:0:b0:5ee:e18d:3ec with SMTP id
 7-20020ad45b87000000b005eee18d03ecmr3789118qvp.26.1682525996723; 
 Wed, 26 Apr 2023 09:19:56 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a05620a089300b0074de92520b1sm5216902qka.83.2023.04.26.09.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:19:56 -0700 (PDT)
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
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH v9 0/8] memory: prevent dma-reentracy issues
Date: Wed, 26 Apr 2023 12:19:43 -0400
Message-Id: <20230426161951.2948996-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.199; envelope-from=alxndr@bu.edu;
 helo=esa14.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v8-> v9:
    - Disable reentrancy checks for raven's iomem (Patch 8)
    - Fix non-bisectable disable_reentrancy_guard patch by squashing it
      into Patch 1.
    - Fix trailing whitespace

v7 -> v8:
    - Disable reentrancy checks for bcm2835_property's iomem (Patch 7)
    - Cache DeviceState* in the MemoryRegion to avoid dynamic cast for
      each MemoryRegion access. (Patch 1)
    - Make re-entrancy fatal for debug-builds (Patch 8)

v6 -> v7:
    - Fix bad qemu_bh_new_guarded calls found by Thomas (Patch 4)
    - Add an MR-specific flag to disable reentrancy (Patch 5)
    - Disable reentrancy checks for lsi53c895a's RAM-like MR (Patch 6)
    
    Patches 5 and 6 need review. I left the review-tags for Patch 4,
    however a few of the qemu_bh_new_guarded calls have changed.
  
v5 -> v6:
    - Only apply checkpatch checks to code in paths containing "/hw/"
      (/hw/ and include/hw/)
    - Fix a bug in a _guarded call added to hw/block/virtio-blk.c
v4-> v5:
    - Add corresponding checkpatch checks
    - Save/restore reentrancy-flag when entering/exiting BHs
    - Improve documentation
    - Check object_dynamic_cast return value
    
v3 -> v4: Instead of changing all of the DMA APIs, instead add an
    optional reentrancy guard to the BH API.
    
v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
    attempting to guess DeviceStates in BHs.
    
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
except for the ones where the DeviceState was not trivially accessible.

Alexander Bulekov (8):
  memory: prevent dma-reentracy issues
  async: Add an optional reentrancy guard to the BH API
  checkpatch: add qemu_bh_new/aio_bh_new checks
  hw: replace most qemu_bh_new calls with qemu_bh_new_guarded
  lsi53c895a: disable reentrancy detection for script RAM
  bcm2835_property: disable reentrancy detection for iomem
  memory: abort on re-entrancy in debug builds
  raven: disable reentrancy detection for iomem

 docs/devel/multiple-iothreads.txt |  7 +++++++
 hw/9pfs/xen-9p-backend.c          |  5 ++++-
 hw/block/dataplane/virtio-blk.c   |  3 ++-
 hw/block/dataplane/xen-block.c    |  5 +++--
 hw/char/virtio-serial-bus.c       |  3 ++-
 hw/display/qxl.c                  |  9 ++++++---
 hw/display/virtio-gpu.c           |  6 ++++--
 hw/ide/ahci.c                     |  3 ++-
 hw/ide/ahci_internal.h            |  1 +
 hw/ide/core.c                     |  4 +++-
 hw/misc/bcm2835_property.c        |  7 +++++++
 hw/misc/imx_rngc.c                |  6 ++++--
 hw/misc/macio/mac_dbdma.c         |  2 +-
 hw/net/virtio-net.c               |  3 ++-
 hw/nvme/ctrl.c                    |  6 ++++--
 hw/pci-host/raven.c               |  7 +++++++
 hw/scsi/lsi53c895a.c              |  6 ++++++
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
 include/exec/memory.h             |  5 +++++
 include/hw/qdev-core.h            |  7 +++++++
 include/qemu/main-loop.h          |  7 +++++--
 scripts/checkpatch.pl             |  8 ++++++++
 softmmu/memory.c                  | 17 +++++++++++++++++
 softmmu/trace-events              |  1 +
 tests/unit/ptimer-test-stubs.c    |  3 ++-
 util/async.c                      | 21 ++++++++++++++++++++-
 util/main-loop.c                  |  5 +++--
 util/trace-events                 |  1 +
 40 files changed, 178 insertions(+), 41 deletions(-)

-- 
2.39.0


