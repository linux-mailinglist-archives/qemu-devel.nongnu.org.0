Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4BD67C43B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 06:25:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKuks-0005xW-PE; Thu, 26 Jan 2023 00:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKukr-0005ww-2M
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:24:57 -0500
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKukp-00089v-8i
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:24:56 -0500
X-IronPort-RemoteIP: 209.85.219.72
X-IronPort-MID: 254442015
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CoYTgKuF1K7GkkjKJ+vH3QiOC+fnVOtcMUV32f8akzHdYApBsoF/q
 tZmKTqAOavfN2SjKNBybN7n8hlVu8DcytRqGlFl+SlkQnxD9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS93uDgNyo4GlD5gVkO6gS1LPjvyJ94Kw3dPnZw0TQH9E88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IPM0SQqkEqSh8ai87XAMEhhXJ/0F1lqTzQJ
 OJl7vRcQS9xVkHFdX90vxNwSkmSNoUfkFPLzOTWXWV+ACQqflO1q8iCAn3aMqUB/+9lHkVP5
 cYBFxMxSTC+2+Ps3YqSH7wEasQLdKEHPasas3BkiCjHVLMoHsqFTKLN6ttVmjw3g6iiH96EP
 5tfOWcpNk2RJUIVUrsUIMtWcOOAj33vdTFCgFiI46c7/gA/ySQrjeSxbICNI4HiqcN9vFmGg
 VLb9GHDCT4CMZuw7ge10Feqibqa9c/8cMdIfFGizdZzjViOg2AeFhASfV28p/a/lwi5Qd03F
 qAP0i8nrKx37VLyC9eiBVu3p3mLuhNaUN1VewEn1DywJmPvy17xLgA5ovRpMbTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:tj+hkKOUYjMascBcTtCjsMiBIKoaSvp037BN7SxMoH1uH/Bw+P
 rPoB12737JYVUqMk3I8OroUMK9qBXnhPxICKYqU4tKNzOW3VdAQrsSjrcKuweOJxHD
Received: from mail-qv1-f72.google.com ([209.85.219.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jan 2023 00:24:52 -0500
Received: by mail-qv1-f72.google.com with SMTP id
 r10-20020ad4522a000000b004d28fcbfe17so524619qvq.4
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 21:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2fvZBfcUqsjpFn92K26Tpk/RWG9o4R6pw3ChYz/AcXA=;
 b=QUr7foR99At8e4W8Ezt2KTmlYuAMsHVm3Ev1Cjj1KZ/KuzhXN/wDS2N0j8YMzrFJ+Y
 maCH3h6RuYGA/iyIfz8cvIYIsJHEFGD6v1HObMwf9kZElPZ9SH47nQ3x4s4XvVfJYzqz
 iivOKA53+cm27zGNnWOj7fyIhDdvSEjRTbP+aBqw77FC06hEhUmaNou7SQl6iCkLM9Dj
 vqoZ1udOB2s5gc5ZhIZW3khYGcR1TACjE1OFSK30amOnVmLnWtbo69SDlIu0Om97xmpo
 1pkbd/xQ/NNSGL/DH4fihsSTYdrp8eKjoZr3BjogEf9EpsX2mnEnVCta1cry/eilBC4M
 aayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2fvZBfcUqsjpFn92K26Tpk/RWG9o4R6pw3ChYz/AcXA=;
 b=07gxNCE/Y6GJ9YoOg3b/MtpzFa17Y46fNRohEEjRbhpALMetINQzjL5zoj+jobi+kr
 K2oQvfITZcJcmfsIvD90qLzh6tbDOV6l+Bx40BvQFMrLpgw1QskY+9uLVOs8tRaRNZl6
 mU+BZNQuS3cfOOhlACfWSdzf399pTHxZiKo+F1QinKbfN+/idsOn11RwZPoeB7R5Jhw5
 CFLq2E1VAl392hkIgfX54U1gnZt+4KmKXgja89SFb7qT0MWvQokPtlFOEwl3dGcjF7VY
 orB65drEO/K/yz8xJJuL1mMGVMbASEot/rc6iKt7uD6JydbicJqIWrRg/xW4g3Fz7g8P
 4P+g==
X-Gm-Message-State: AFqh2ko75uC0CnYVe4vu8IQH/3BUYQL1KcUJnTAOOZhtC3/4YIyLQN/+
 g+8upjsyTqRiFTkgD1EXbfEEt7Hr/gvRkm6n8crSNQ/MkS6+0A7cLwX9raM5/cZBfM6+isqNefl
 0285Frhet9pq+GhJAuS5fkinUVu6W2A==
X-Received: by 2002:ac8:5ed0:0:b0:3b6:37dc:cb13 with SMTP id
 s16-20020ac85ed0000000b003b637dccb13mr48785094qtx.51.1674710691773; 
 Wed, 25 Jan 2023 21:24:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsWf4ZLRApDtMjKqTTS0ll5+KWQt4OudgLupdbehgZ5JFQHiruDzGR0LkbXJTSW7dr7GM3bGg==
X-Received: by 2002:ac8:5ed0:0:b0:3b6:37dc:cb13 with SMTP id
 s16-20020ac85ed0000000b003b637dccb13mr48785062qtx.51.1674710691527; 
 Wed, 25 Jan 2023 21:24:51 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a05620a080600b006faf76e7c9asm325973qks.115.2023.01.25.21.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 21:24:50 -0800 (PST)
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
Date: Thu, 26 Jan 2023 00:24:43 -0500
Message-Id: <20230126052447.572504-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
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


