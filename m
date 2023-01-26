Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1BA67C443
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 06:26:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKumE-0007Kr-No; Thu, 26 Jan 2023 00:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKumA-0007Jo-M1
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:26:18 -0500
Received: from esa11.hc2706-39.iphmx.com ([216.71.137.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKum8-0000qf-TD
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:26:18 -0500
X-IronPort-RemoteIP: 209.85.216.72
X-IronPort-MID: 254891556
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WuwqeanO8pbHr8E/CX/Mkb7o5gw8JERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXDWHTPv/eZWDzctF/OY/loUoEuZ7XyYMxSgFo+S1gRi4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5AJmPJingXeF/5UrJMNHTU2OByagKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0xK6aYD76vRxjnVaPpIACRYpQRw/ZwNlPjxG4
 I4lWZSYEW/FN0BX8QgXe0Aw/ypWZMWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eJqc1q+lFM0N39
 MMBDTsvSQy4jfuq3+fuIgVsrpxLwMjDOYoevjR4z2icA6l8B5/ERKrO6JlT2zJYasJmR66PI
 ZpEL2A2MlKfOXWjOX9OYH46tO6sln/zaRVStRSYqbdfD237llEtgOm0bYeLEjCMbehkv1zIu
 UvbxW/SHjY1OOaA0Dqa60v504cjmgu+Aur+DoaQ7/NvnRify3IeDDUQUl20p+T/jVSxM++zM
 GQR8ysq6LAwrQmlEYO7UBq/r3qJ+BUbXrK8DtEH1e1E8YKMiy7xO4TOZmQphAAO3CPueQEX6
 w==
IronPort-HdrOrdr: A9a23:Mm03PaM7B/Tc0MBcThujsMiBIKoaSvp037Dk7TEUdfUzSL3jqy
 nKpp4mPHDP+VAssR0b6LK90cq7MAjhHOBOkPAs1N6ZNWGMyQiVxelZjbcKqAeQfBEWmNQtsJ
 tIQuxVJOe1I2JHrfvX1iGFLvdI+qj7zElqv4vjJrVWID2Cp5sP0+4AMHfiLqS+fmYmOaYE
Received: from mail-pj1-f72.google.com ([209.85.216.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jan 2023 00:26:14 -0500
Received: by mail-pj1-f72.google.com with SMTP id
 x12-20020a17090abc8c00b0022bfadb3a4dso453391pjr.0
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 21:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2fvZBfcUqsjpFn92K26Tpk/RWG9o4R6pw3ChYz/AcXA=;
 b=YKf0VxKj1HBijcgM4Hz25xjetpnVkqTOTYF5jSCThmmE1GEEJjK+jZ8UTBhaVy+b0c
 6M8J9XkgpURRRiJ5w4EnRC2aFTFX6IplUB7UUm9yu34/PZVSo5VBhV5G7ca61c2STBks
 eSEJpg5Spromu8hR/axLIkaTYEdiySHgwb0mSCNLV4QUe4EAOA4g3Wz/i+EF1pxNnrcd
 Q0Zj38ux2gEcE9sqeZ898lwjBsNzEa4PiE6KYAuFOLRoZt5d+ehP3iz5j7rWyP5jd6q9
 SRUrRf7xWXBju6RAp/+1fff9+rm5+yxPzVtUXbIdea28xI00CaJz3p6/Yvsqw049zfXr
 WDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2fvZBfcUqsjpFn92K26Tpk/RWG9o4R6pw3ChYz/AcXA=;
 b=MzkpIys1YrrguZG3oQNQKXpPU+BY+KOnZCehpPpcOpsGrlk068Q0yCSU7O4x8mnXf8
 oBC5qMA2oeyExO5dSNLIZI7FdHTWn3wxe8IJKyCvkzLikiX53lv6dHFSj5QQORqLqgOP
 x/dFn0arz2hDQZLc7hMBnyUmupBwJEIUEh6iGx1sdmjwtD9ZnnbTpKTwivYJECKV1LPw
 VUQ1zGnPSthK3Eg9ZXSETuPDHXWqU5QQG89740c6waVtMYAoQDJcuS0062o8YR3Ef2xl
 JQEn+JyFQEVFYok46xmQShGCwtEcfR6ktTqnux1UQKNskuemwl6dV0Lz3WzKW5qip/WE
 JA9Q==
X-Gm-Message-State: AFqh2kp/qs+hBUU+AaV3KCh65MppF7q0au+wGprgrPD4icBvnseA7HDJ
 WROxB6j3Nl9KxpXmYF+R5aSZzYRjirVMhmezIxYPSLVsJ8BuTQORwyiuk3sGTdqKnK5uAk9BVz5
 EmiiLnYad+yd4/x3LfyZmLD8grlk8vw==
X-Received: by 2002:a0c:dd04:0:b0:537:706e:2ca with SMTP id
 u4-20020a0cdd04000000b00537706e02camr8779999qvk.29.1674710763300; 
 Wed, 25 Jan 2023 21:26:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+LELP6UIv6Nofin5RmXv4yTKXzeppxzSbWk6f+GJIb+qNnjU0/U+hOZKGa+aL1oSN2Z2IoOQ==
X-Received: by 2002:a0c:dd04:0:b0:537:706e:2ca with SMTP id
 u4-20020a0cdd04000000b00537706e02camr8779973qvk.29.1674710763046; 
 Wed, 25 Jan 2023 21:26:03 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 z25-20020ae9c119000000b007064fa2c616sm351532qki.66.2023.01.25.21.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 21:26:02 -0800 (PST)
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
Subject: [PATCH v5 0/4] memory: prevent dma-reentracy issues
Date: Thu, 26 Jan 2023 00:25:54 -0500
Message-Id: <20230126052558.572634-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.81; envelope-from=alxndr@bu.edu;
 helo=esa11.hc2706-39.iphmx.com
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

v4-> v5: 
    - Add corresponding checkpatch checks
    - Save/restore reentrancy-flag when entering/exiting BHs
    - Improve documentation
    - Check object_dynamic_cast return value

v3 -> v4: Instead of changing all of the DMA APIs, instead add an
    optional reentrancy guard to the BH API.

v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
    attempting to guess DeviceStates in BHs.

Alexander Bulekov (4):
  memory: prevent dma-reentracy issues
  async: Add an optional reentrancy guard to the BH API
  checkpatch: add qemu_bh_new/aio_bh_new checks
  hw: replace most qemu_bh_new calls with qemu_bh_new_guarded

 docs/devel/multiple-iothreads.txt |  7 +++++++
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
 scripts/checkpatch.pl             |  8 ++++++++
 softmmu/memory.c                  | 17 +++++++++++++++++
 softmmu/trace-events              |  1 +
 tests/unit/ptimer-test-stubs.c    |  3 ++-
 util/async.c                      | 18 +++++++++++++++++-
 util/main-loop.c                  |  5 +++--
 util/trace-events                 |  1 +
 36 files changed, 150 insertions(+), 43 deletions(-)

-- 
2.39.0


