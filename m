Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80D36B711D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:26:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdUI-0000uO-Bi; Mon, 13 Mar 2023 04:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdUG-0000u0-I5
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:24:56 -0400
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdUE-0000Fu-SH
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:24:56 -0400
X-IronPort-RemoteIP: 209.85.160.72
X-IronPort-MID: 265318209
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ixPc260GLOIfXkdlWfbD5W5zkn2cJEfYwER7XKvMYLTBsI5bpzEOx
 jZJXmGPa/6DNmDwfIsjOtm+/U4H7cODyNBgSgRrqSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv666yE6jfrSLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglYgr414rZ8Ek05K+r42tC1rADTasjUGH2xiF94K03ePnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aLVeS8oiM+t5uK23CukhcPPpMTb5LwX6v2ZwKhxLidw
 P0V3XC5pJxA0qfkwYzxWDEBe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1nPGcfAq0nxt1lOiZH6
 tcpFw4TSBeM0rfeLLKTEoGAh+wmJcjveYQW4zRukmufAvEhTpTOBa7N4Le03h9q3pEITauYP
 pRBL2U1BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvTWIlVwriOmF3Nz9Yu2Tdf51vQGhq
 H/P2X26ME0fBsKg1m/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR/SN36KZtrgqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxXQDokhYphAQaifIL
IronPort-HdrOrdr: A9a23:nZmbQaPXWWMWwsBcThujsMiBIKoaSvp037Dk7TEUdfUzSL3jqy
 nKpp4mPHDP+VAssR0b6LK90cq7MAjhHOBOkPAs1N6ZNWGMyQiVxelZjbcKqAeQfBEWmNQtsJ
 tIQuxVJOe1I2JHrfvX1iGFLvdI+qj7zElqv4vjJrVWID2Cp5sP0+4AMHfiLqS+fmYmOaYE
Received: from mail-oa1-f72.google.com ([209.85.160.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 04:24:50 -0400
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1765e2031ccso6848470fac.2
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678695890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XcaLZq09Hc3yOwOcAr2aTWdpY4It79wxQBzukuXEB2k=;
 b=HpodYEdqCiQ5/MrpJq8hwHfhiAj7OTnuY3Ral2FoFBCiOhLjD0cGX6ZU851P421v2+
 74Fi1Rm4r5N+469xUCyRnUT/SNfGO1PpnL1G7Lg9FJ69pRGH7z+gf94Rx0osYdem2hSt
 82boeEtjSGe8lY+Ki0VTX638bsmX7W7shI0+FvK8j23f/lWTwDYdu98pDCOWoj5vhXaD
 bgX4psRgDSCgNfzF+OjpXPY2kvjGXSwlO7c6zlY7QvGn5YPQ6r5V+zVynjMGjeLbnOqC
 8nbnsXrvztdHEQX6XYo32tKVqRD0ujBp7JXutqVpczixYbY20/rLj2TOv1Mn4lmfVKrB
 mC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678695890;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XcaLZq09Hc3yOwOcAr2aTWdpY4It79wxQBzukuXEB2k=;
 b=50jN4wf00H9uVFoeh3VFtiwdCGceYFfAuwlJGyUIJsObL7OQt1NhW3CmZQnVwbvtBc
 L1jrKGKj7TCnxTx44atI9ss1Spx/3sYjbic17P5QbessOMTaBr1wyfRRZJm6xIE9OMqH
 CUOjfKmoTSDUhQSltRtPeEC42Kjc+ZZ5faE8e2JbCzKGtgp10L9njYCMmfdYht6g4nd/
 /Tv1BDf1VcEVGg8pvk40fS6FZPTkpsAU8BDelIHoltSqKU9QED+AYBmf39c1vo0Z9jky
 IlZrqH+ZAN3MmjJrq3mowY/k/vdVlgDqjRU1tQjM8K+TBmzEgUcmZDsQNkLHYZlEJALU
 EjIA==
X-Gm-Message-State: AO0yUKU3QMwwG0z8mebrW9MvhnPTjXQQ4VihzBIvZHK2NU8U5n4PNFNu
 hEu9a7fn4E0MbtMZ3BC7g848hh1bZ9Uqe5rZUgrBeLDn6h2wbK3yZeaDDGVOoZAXSrumxtbidh1
 NgRLaUPq7wVgLCuiQHJr4ldcW+Uo9ma2TWgoa8yInLOg=
X-Received: by 2002:a05:622a:1ba8:b0:3bd:f03:5f12 with SMTP id
 bp40-20020a05622a1ba800b003bd0f035f12mr61284091qtb.42.1678695869006; 
 Mon, 13 Mar 2023 01:24:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set99Kl5tri4anTOWi67cAB5ZLl83/3wVQ468msw11sGJci7HXaz3liOIly+71i5GORBrG7luRg==
X-Received: by 2002:a05:622a:1ba8:b0:3bd:f03:5f12 with SMTP id
 bp40-20020a05622a1ba800b003bd0f035f12mr61284057qtb.42.1678695868674; 
 Mon, 13 Mar 2023 01:24:28 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 o191-20020a3741c8000000b0071a02d712b0sm4911259qka.99.2023.03.13.01.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 01:24:28 -0700 (PDT)
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
Subject: [PATCH v7 0/6] memory: prevent dma-reentracy issues
Date: Mon, 13 Mar 2023 04:24:11 -0400
Message-Id: <20230313082417.827484-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
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


Alexander Bulekov (6):
  memory: prevent dma-reentracy issues
  async: Add an optional reentrancy guard to the BH API
  checkpatch: add qemu_bh_new/aio_bh_new checks
  hw: replace most qemu_bh_new calls with qemu_bh_new_guarded
  memory: Allow disabling re-entrancy checking per-MR
  lsi53c895a: disable reentrancy detection for script RAM

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
 include/exec/memory.h             |  3 +++
 include/hw/qdev-core.h            |  7 +++++++
 include/qemu/main-loop.h          |  7 +++++--
 scripts/checkpatch.pl             |  8 ++++++++
 softmmu/memory.c                  | 17 +++++++++++++++++
 softmmu/trace-events              |  1 +
 tests/unit/ptimer-test-stubs.c    |  3 ++-
 util/async.c                      | 18 +++++++++++++++++-
 util/main-loop.c                  |  5 +++--
 util/trace-events                 |  1 +
 38 files changed, 159 insertions(+), 41 deletions(-)

-- 
2.39.0


