Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F60A68AE35
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 05:09:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOWK5-0000Jf-9V; Sat, 04 Feb 2023 23:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWK3-0000JQ-Gy
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:08:11 -0500
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pOWK1-0002jX-OX
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 23:08:11 -0500
X-IronPort-RemoteIP: 209.85.214.199
X-IronPort-MID: 256812040
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dom0S6g7Myd65DncJX0xY68cX1613hIKZh0ujC45NGQN5FlHY01je
 htvUD/XaPuKNDCjLd11aIjioUkOuMWHyIRrSABl+XxhRisW8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5ARiPasjUGL2zBH5MrpOfcldEFOlGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiM+t5qK23CulQRrukoPD8fwXG8M49m/c3Gd/
 /0W3XC4YV9B0qQhA43xWTEBe811FfQuFLMqvRFTGCFcpqHLWyKE/hlgMK05FbUH9L1oJT5Oy
 dwJCDIBNjOHu/CV6r3uH4GAhux7RCXqFIYWu3Ul1TWASPh/EMGFTKLN6ttVmjw3g6iiH96EP
 5tfOWcpNk2cJUQeaz/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiuWzYIOPIoDSLSlTtmW85
 Wf2/G7QPjRAaoGS7GqB8TXrotaayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVSvF5zzBkzp5nGDuREYVpxbFOhSBByx95c4Kj2xXgAsJgOtovR/3CPqbVTGD
 mO0ou4=
IronPort-HdrOrdr: A9a23:5NDjmqkr8LoQ5hbM/aC6Iu0KDkHpDfL/3DAbv31ZSRFFG/Fw9v
 re+8jzsCWbtN9/YhAdcO67SdK9qB/nlaKdgrNhWYtKPjOW2ldARbsKheDfKlbbakjDH4BmpM
 Rdm9AVMqyIMbB85fyW3OHue+xQuuVu4siT6ds33B9WPHxXQpAl0gt8EwOSD0Eefng/OXIofK
 D32iJczwDORZxvBP7LYEU4Yw==
Received: from mail-pl1-f199.google.com ([209.85.214.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Feb 2023 23:08:04 -0500
Received: by mail-pl1-f199.google.com with SMTP id
 f1-20020a170902ce8100b00198b01b40f7so4400370plg.1
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 20:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KW9Iz3lkd2lPueoULE/k2E6E33uCUwVjqTnY0C5yamU=;
 b=O1j+e/56gNlTsLXLI5oRhghW2GF0k/aB5UMcDVSNbsPO7gyEZ1ILnHToArSrzmiPWI
 yo/i4V09rN1EHgUqIOnwwB87UNgJBK9vdakGyrnDHMZ4MvNsXZdkXCGaaewu1smBTnDS
 Cq6+BRRxsHxA3r2tXWNH4d/ZW/rNJYzKpL6oA+Q8BAF7O+hfePKK0y5Dr4utavCmA829
 2WdN7bQht3sI4/N4hto7rMA63D9l/EJK2QlU3Ryq7Jjj/IIx+jPbbjDJNyLj50hg7dta
 K1a9tHhNGxMCh4FgX5fWpdOMdyRIupB0zmcl1Pb5Av46tNm8I3J0iLb775m+i8eWWc9Z
 6HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KW9Iz3lkd2lPueoULE/k2E6E33uCUwVjqTnY0C5yamU=;
 b=4pN46J3oG4srJn+84tOXVR6W5bqhB7tv0godclJ6tUhjcdhCFYX2pIZ4WFdYk5wFSW
 ck/QDFfRZkRVfIw2/3ESvZ6mjhpmoaYNDLBDnuRVZmd5UhcyDpczMufSs58ri79K9gmh
 RYuihbHr7qxUQ1XVgPsqAHko0L2KAaz3bVyro4ajaO2Vyy55PUUqQqz2dRWtJDY1EWNu
 mGIK9tRiUK0gptzamt8W4GeS6iAxvPxGrTl6pH2b6O10gTg9jDGBn4XnKnMPitljRuSI
 arJLHeK/P0oUP2s7HCa8nHMM25KqPIfI0Rf8ru3nmvnRI4e0u4+JDO/FF8APw0TLm1T8
 pnrA==
X-Gm-Message-State: AO0yUKUqmxk/fJHYxasdZ9a1UZSHz/XtIFrSnQ2TdyeBNdthtjwf0lzk
 1KYg5rlSQ3koeVsDQPZ3TLwspXRugGjSx3B3SfIzv9l4HT6FCcyuXExaK5XuWr73Rzc+Fbt7Vos
 aNLvfBPgzTkASZiAw8GoLDzer/QDsLg==
X-Received: by 2002:ac8:5b83:0:b0:3ba:2066:58dc with SMTP id
 a3-20020ac85b83000000b003ba206658dcmr462196qta.11.1675570072021; 
 Sat, 04 Feb 2023 20:07:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8D0qP72/5hujQq3dePcwSBp3iEZqlC4u48pqxoeeqHcChchmtVQRG4ZoFBqx8gLvoxDzM3sQ==
X-Received: by 2002:ac8:5b83:0:b0:3ba:2066:58dc with SMTP id
 a3-20020ac85b83000000b003ba206658dcmr462157qta.11.1675570071735; 
 Sat, 04 Feb 2023 20:07:51 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05620a0d4200b00731c30ac2e8sm1386208qkl.74.2023.02.04.20.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 20:07:51 -0800 (PST)
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
Subject: [PATCH v6 0/4] memory: prevent dma-reentracy issues
Date: Sat,  4 Feb 2023 23:07:33 -0500
Message-Id: <20230205040737.3567731-1-alxndr@bu.edu>
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
except for the ones where the DeviceState was not trivially accessible.

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

Alexander Bulekov (4):
  memory: prevent dma-reentracy issues
  async: Add an optional reentrancy guard to the BH API
  checkpatch: add qemu_bh_new/aio_bh_new checks
  hw: replace most qemu_bh_new calls with qemu_bh_new_guarded

 docs/devel/multiple-iothreads.txt |  7 +++++++
 hw/9pfs/xen-9p-backend.c          |  4 +++-
 hw/block/dataplane/virtio-blk.c   |  3 ++-
 hw/block/dataplane/xen-block.c    |  5 +++--
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
 35 files changed, 147 insertions(+), 41 deletions(-)

-- 
2.39.0


