Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A62673217
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:06:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIOvB-00071I-7s; Thu, 19 Jan 2023 02:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOub-0006Z5-BK
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:00:37 -0500
Received: from esa13.hc2706-39.iphmx.com ([216.71.137.83])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOuR-0008Im-J4
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:00:37 -0500
X-IronPort-RemoteIP: 209.85.166.197
X-IronPort-MID: 252305591
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:faWgpaNMCf2EtCTvrR0blcFynXyQoLVcMsEvi/4bfWQNrUoh1WYCy
 jBMDTvQb62KajPweN53bIi1pkMP6sWGzYJhTQZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656CEmjslkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimEc3l48sfrZ80s25aWq4Vv0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE0u9RBwYrIIAhxud2EWUNr
 vMYFQgjYUXW7w626OrTpuhEg80iKIzqONpatCgxknfWCvEpRZ2FSKLPjTNa9G1o14YeQLCHO
 ZRfMGswBPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvjKIlFEsgeGF3Nz9XeaKFPt8t3Sh+
 zjU4Fz/OhQdEpvA8G/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR+y536KZrpRPtQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjFsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:jWUBvKnKTJ3wsULXfpH6m4DTUxLpDfL23DAbv31ZSRFFG/FwWf
 re+MjzsiWE8gr5PUtLpTnuAtjnfZqxz+8W3WBzB8bYYOCZghrQEGgK1+KLqEyCJ8SXzI5gPM
 xbAs9D4bPLfD1HpPe/yiWDV/gb/Pm73JaBudr+pk0dMD2CqJsN0+66MGum+4FNKjWufaBJbK
 Z0L/ApxgadRQ==
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 02:00:25 -0500
Received: by mail-il1-f197.google.com with SMTP id
 r6-20020a92cd86000000b00304b2d1c2d7so1014215ilb.11
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FSQLcBOaxi4ec1ZLLBTEmbLjcknf+fmz9dGZaj/lG9Q=;
 b=AL0y8VVP+3Gl+x3iqHseLyciH+5RyhshzDYmTdEgybJVfw5rcdGidJjPRb+EIo8HGf
 NhQyS0BasFynNNmEqttr+jPHrjq1p0BFU/Oscr61RaGRRt1zubA+Cd3BKapFpqBb0bGO
 QDdUAL37QCbaDqGdHP0LI3rCAFZDwcwgJNTlgRXNa86McUDu+L0ffdVIyPd+9C+8l501
 fHegKJH5iYP9IiSdddx3emQw20VMASTTlXdWvOa0X4vVZ+IQ7kKQOrnyLXEjojtMs+vp
 8MOsP08lnEXYrmr/TpjSCR6Ex9N9xM3P1Ntjlq28LvjQXdEx0qVKttB0o0BWtjEP7EpF
 9a9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FSQLcBOaxi4ec1ZLLBTEmbLjcknf+fmz9dGZaj/lG9Q=;
 b=ouV9Xw6N/9gWf9Sm2kCikoKN/FwAbtKkGxy4Wl4Ltiy0avoaa6sjs1ycLp72+ufQPm
 3Dop9orj6pHz3L8GAcmJKRAuH1o8hE25wPlkdLLoFjWDusayaclWffaYc0RWhWnlhnvM
 DqgwzkEEsPbGeRNqrDszYjPeTc7+M4Cv6XK7LWQSjs2sNRSJMQMU7FIXoemc2wYMcThy
 o9lgwc80fGubJA4olR1c8eOUsjY304DqYacMTHhGiaaqJmk99Uk/sz6Peq3C8+fcUOGE
 MaTUohmvq876YI4kGS3Sn7VgsXIOeJK/0zoPxa33IRnrj1AoI7ebuXg6P6BlP83755Ht
 sAxQ==
X-Gm-Message-State: AFqh2koWYSazTIrJNk37QdJXM1tdAumqjd4GqKRDKj4VVFMJUzBwIcJm
 pTOmLkfiOCV/fqiZ6AAKsV21ikPoIbPPzO0ehcmLV3qPMCUztsX1TzTT7MyRmwo+DtQEqLFoZqv
 2tY12ESjATbqjbXByGp5uqLttoq/dOQ==
X-Received: by 2002:a05:622a:400e:b0:3a8:15d2:6e8b with SMTP id
 cf14-20020a05622a400e00b003a815d26e8bmr13690369qtb.33.1674111612071; 
 Wed, 18 Jan 2023 23:00:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsIABUHBRfgEs6zrFXZbtIZ4hXld0DIroMrpwhU+4Q/NTiiI9fU1QIwFZmahPYbtS8Ay4ZNng==
X-Received: by 2002:a05:622a:400e:b0:3a8:15d2:6e8b with SMTP id
 cf14-20020a05622a400e00b003a815d26e8bmr13690319qtb.33.1674111611715; 
 Wed, 18 Jan 2023 23:00:11 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a37f910000000b00704df12317esm23706394qkj.24.2023.01.18.23.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:00:11 -0800 (PST)
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
Date: Thu, 19 Jan 2023 02:00:01 -0500
Message-Id: <20230119070004.321358-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.83; envelope-from=alxndr@bu.edu;
 helo=esa13.hc2706-39.iphmx.com
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


