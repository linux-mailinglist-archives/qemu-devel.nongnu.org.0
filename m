Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2216EACEE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:30:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprlt-0008VH-3k; Fri, 21 Apr 2023 10:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprlr-0008SS-Ay
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:29:55 -0400
Received: from esa11.hc2706-39.iphmx.com ([216.71.137.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pprlp-0008NB-Dn
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:29:55 -0400
X-IronPort-RemoteIP: 209.85.160.198
X-IronPort-MID: 274548085
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rdnd6a0spAf89K5II/bD5Wtzkn2cJEfYwER7XKvMYLTBsI5bp2YHn
 2VMDDuHOfbfYDfwLo8gO4zloxlT68eHm99qTgs4qSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv666yE6jfrSLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglYwr414rZ8Ek05Kio4WtB1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1SKBEnGM4/1twnIlhX8
 9hDMxxKRRK60rfeLLKTEoGAh+wmJcjveZoD4zRulGCJS/khRp/HTuPB4towMDUY3JgfW6aDI
 ZNHMXw2PUSojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKMkFEtgOC9bbI5fPSLTOR+z1mH+
 ljMpX/jIhNEDPm7kT68pyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m83sfF3+hX6Hp/yWBq3pHPCtRkZMzZNL9AHBMi24vK8y26k6qIsFGYaADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:UyF896rY5U/vK4yiIEL/ehEaV5rxeYIsimQD101hICG9vPbo8/
 xG+85rryMc7Qx6ZJhOo6HnBEDtewK/yXcX2/hrAV7dZniehILAFugLhvqA/9SJIU3DH4VmpM
 BdmsZFebjNJGk/p+rBpCeDL/Yc7O+uzJ2I7N2uskuFjjsHV0ij1WpE48qgfHGePDM2fabR3a
 Dyh/Z6mw==
X-Talos-CUID: 9a23:oyPb223Unk5CMNppQW2mXLxfJuR1Y1ie61vqc2yBEGBNE6a5DnSSwfYx
X-Talos-MUID: 9a23:BneLgQnxB+Fz5HPfAJ6adnpjPeZDsruxVHoHy44cm8vaDQlUYzOk2WE=
Received: from mail-qt1-f198.google.com ([209.85.160.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2023 10:27:55 -0400
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-3ed80d7bf28so12390411cf.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 07:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682087274; x=1684679274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BwrQkjgDEx217oznv4rlHYskYvBVJxw2mRkXwtO67Lw=;
 b=J9kkdm7xSVo/bE9QrnpVSFq0Un2us6CxXI6LRTQKSz4OPyOia5hdFBeFmWg+NUPlXF
 Kfj8XEloFgK5VaomVZvTAkzONykRwrWHRYzU9H5QlmsjlWqxvm+jNvuTmVl5CwqpHckV
 qIewM8nWg7E0wg2JAQ8PZsXSzYYXKmN8Ay9FdkfdJeGZ9Fylk3HIWilwLXeKqL8g1xSe
 8rbb5kjXvgxVsDyz9gefSARtydpZWOVTQeLfsu7z8YexhEsYDSuFNvoVYZM3Fl/L491A
 rToR/sBtQXCLQbJFXkUAxIO+mhsRBQNl3x2sR5cqXA7IsxqNEU6l70ZeWkthiW/h5vv9
 9UqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682087274; x=1684679274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BwrQkjgDEx217oznv4rlHYskYvBVJxw2mRkXwtO67Lw=;
 b=WMjwKcUxCRiQ4akebOzxp2/q0PevU+5Om/rdoIo//IVg2qzkQluo/dGbRtE9YwXD6I
 AxXHncIdkPTyCFbsJwkVEi2qr42y+RPiv2/4NqGqciksEhmJOimsu6fF3W6HDOFul5pk
 C8xuzHdBZIQGoFEtpDuRqD2nkj9TZLcRgaSVvOzOShDi1JcVufDGpaT5KPv5CJu0Vtzk
 gkrZn/V3fTxOZU34joKWOSQgfm/N8A9uwEEoFEF7eh8lfcoSk5WSOkx/xs7cfthKhlOP
 +FjzpeKlnezRbR0vIqJ/brp8mPUsj8lvEoSjyV7N8emqYrm4zcWxJoDaYbdFRitG675j
 NrhA==
X-Gm-Message-State: AAQBX9frVxjuY0aMVRAqdMocE2zoFESe1dOQi2HV3f5O8xX8yy60Day/
 SP3ySwGk4BVfKbn+5TcP4fhygVkGAZjq4q6t/3RNjSGqIOf6DUnu4AZJYDBimdq++7ldX5goUUu
 9tfS2AShLWS7pK5aDKPjSA6ETdGONZfmvXE6p0ucAuVY=
X-Received: by 2002:a05:622a:1711:b0:3bf:e15f:935c with SMTP id
 h17-20020a05622a171100b003bfe15f935cmr8967969qtk.14.1682087274093; 
 Fri, 21 Apr 2023 07:27:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350bCtpa/n4ZdTRsiOVH6NnAhxNo+tCtjI5kzROaQWZ1FRfcW/X304RYtQV8TVw4eOAhNUbJOIQ==
X-Received: by 2002:a05:622a:1711:b0:3bf:e15f:935c with SMTP id
 h17-20020a05622a171100b003bfe15f935cmr8967916qtk.14.1682087273739; 
 Fri, 21 Apr 2023 07:27:53 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 b142-20020ae9eb94000000b0074cd846d215sm1368657qkg.64.2023.04.21.07.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 07:27:53 -0700 (PDT)
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
Subject: [PATCH v8 0/8] memory: prevent dma-reentracy issues
Date: Fri, 21 Apr 2023 10:27:28 -0400
Message-Id: <20230421142736.2817601-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.81; envelope-from=alxndr@bu.edu;
 helo=esa11.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
  memory: Allow disabling re-entrancy checking per-MR
  lsi53c895a: disable reentrancy detection for script RAM
  bcm2835_property: disable reentrancy detection for iomem
  memory: abort on re-entrancy in debug builds

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
 39 files changed, 171 insertions(+), 41 deletions(-)

-- 
2.39.0


