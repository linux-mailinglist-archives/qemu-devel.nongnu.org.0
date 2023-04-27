Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E24F6F0DA8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:12:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8tU-0005yq-1x; Thu, 27 Apr 2023 17:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tR-0005xy-2A
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:11:09 -0400
Received: from esa6.hc2706-39.iphmx.com ([216.71.137.79])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tB-0005Nd-Fo
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:11:08 -0400
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 279188979
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:f9VQKqojZFaZePpwFs9PcA6fqgVeBmKkZxIvgKrLsJaIsI4StFCzt
 garIBmAbP+OY2umfY8la46z80hSuMWEzdNmT1c5+SkwF39A+ZacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiP68T5zcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4rYvAkJw7
 twjN3MpdEHZici37rDhc7w57igjBJGD0II3v3hhyXTAE69jT86SBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk6ZMlsRaz/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiue8aYqFK4PbLSlTtmenl
 l3K0zjoOy4hKtWh4j681G2cnvCayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVW1F5zzAUz+r3mDsRoRHdFXFoXW9T2w90Yd2C7BbkBsc9KLQIF43CPqbVTGD
 mO0ou4=
IronPort-HdrOrdr: A9a23:DzzTSKt0+NVdR9vAgMNRJz4v7skDrNV00zEX/kB9WHVpmwKj5q
 STdZMgpGXJYVMqMk3I9urwXpVoLUmsl6KdgrNhRotKIjOWwVdARbsKheCSoAEIcxefygc379
 YGT0ERMqyUMXFKyezX2k2XKeoB/fWw2JyUpI7lvgpQpMJRB52ILT0VNu9WKCNLrXF9dOIE/V
 Oniat6mwY=
X-Talos-CUID: =?us-ascii?q?9a23=3AH4Dkh2kbmAiRbwheHZ+xK3HpWUPXOWWNlHTzHVS?=
 =?us-ascii?q?YMnkqbKfEE1G6+Y1myfM7zg=3D=3D?=
X-Talos-MUID: 9a23:EH9qYQlFxodzcGmcWgpZdnpDC/dX74jyGXkyqosPheKADApvCy+C2WE=
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 17:10:25 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-5ef5e31f3f5so58173116d6.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 14:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682629825; x=1685221825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H+MNZbyxsaO5V04u2s0QZGITFzRAE5qsQ7x4EV6Qms8=;
 b=XuaD5HkyeA3WojPDzFGjkhbJt6/uubUaWI5Hk2NvRy/+FQp5cTVYZ1kx9cyR/D6eq5
 sH+BBSQUQg8/QPXGRgshaaYRuYw50HCcIePmrQC68WmaiVsccBnE82RIUwrbQHN2eqaW
 eTVhrfRtpIxZPPTFtj8KXTNhuNjsrIsy58v7LjHOFKxu0GYMkf1lqSU+xCQOEI2exQxD
 g2df+6J8v/kStvtz1qc6gXTqRQkSQYkpPCD+xA/SkOYOw6nqosuyRPOdS3UgNmDO9kq9
 L+LY1so1x1bydYhrB1ifNV0Llo3G07/YJbOdHdg75RIpW/6GH0A9Sf4z+35GsSOSCXrU
 EyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629825; x=1685221825;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H+MNZbyxsaO5V04u2s0QZGITFzRAE5qsQ7x4EV6Qms8=;
 b=Fljlm+r1anz8ABO9/IXl+1WZcjTmULs8wdFhDou20aFyppXqxhnipKVQwY/k/GmE6W
 F8CoyIzhJwhM2+2NI/OvZFvI/sSUzuN34mYhMXIh7bdEcyPAqKCp9z919S4UhqFysy4Z
 QQ8yG7DaiQNQhVbnv45yzEZcxGIop+Om+HLssLaGDnBTJBlUWQEJ8jO/RQ2ajZwNxgff
 qspf9gDhnTF9cuWvrZYNTeWMBoMLfRglCuCV+o2ibZfEH6vInUm1sVxDYGla6WgXfKDM
 xY3dengVDDXY5HuqcK2d5dzOXCKUJwLnSlQDkDwCQcn+xvmkEXX85FQRn2lMu7cSuhz9
 Ir4Q==
X-Gm-Message-State: AC+VfDwpC1hU77gQayqVE00q6jUooYsgcY+GBOrl8cNXzI9DripqU95m
 MDHurG7Qt3W1i+7b4O2qCzWoh6NNz1YB+k3rqqi5aqXIQPSitmEVofda160W+1V+r/yV7KW9shn
 6WD8LGePCaB43to6B2A8wO8re5gpiIfiHm9Unz6wUZDU=
X-Received: by 2002:a05:6214:1bc6:b0:5e0:e52c:5d7a with SMTP id
 m6-20020a0562141bc600b005e0e52c5d7amr5171973qvc.38.1682629824766; 
 Thu, 27 Apr 2023 14:10:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4GceXMFY5c1nEehhX42iGP22zadKo+Y2315BTQFXjCQ/y7ohNOjTqYrJMhnqTydO/Zyia4aQ==
X-Received: by 2002:a05:6214:1bc6:b0:5e0:e52c:5d7a with SMTP id
 m6-20020a0562141bc600b005e0e52c5d7amr5171916qvc.38.1682629824396; 
 Thu, 27 Apr 2023 14:10:24 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a0c8f02000000b005ef524ea9f1sm5853504qvd.141.2023.04.27.14.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:10:24 -0700 (PDT)
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
Subject: [PATCH v10 0/8] memory: prevent dma-reentracy issues
Date: Thu, 27 Apr 2023 17:10:05 -0400
Message-Id: <20230427211013.2994127-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.79; envelope-from=alxndr@bu.edu;
 helo=esa6.hc2706-39.iphmx.com
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
    - Replace trace-events and attempt at making re-entrancy fatal with
      a warn_report message. This message should only be printed if a
      device is broken (and needs to be marked re-entrancy safe), or if
      something in the guest is attempting to trigger unintentional
      re-entrancy.
    - Added APIC change to the series

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
  raven: disable reentrancy detection for iomem
  apic: disable reentrancy detection for apic-msi

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
 hw/intc/apic.c                    |  7 +++++++
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
 softmmu/memory.c                  | 16 ++++++++++++++++
 tests/unit/ptimer-test-stubs.c    |  3 ++-
 util/async.c                      | 18 +++++++++++++++++-
 util/main-loop.c                  |  5 +++--
 util/trace-events                 |  1 +
 40 files changed, 180 insertions(+), 41 deletions(-)

-- 
2.39.0


