Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200D7673224
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:07:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIOwi-0001r6-LV; Thu, 19 Jan 2023 02:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOwI-0001TR-E9
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:02:22 -0500
Received: from esa14.hc2706-39.iphmx.com ([216.71.140.199])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOwE-0000EZ-BU
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:02:20 -0500
X-IronPort-RemoteIP: 209.85.222.199
X-IronPort-MID: 274242831
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+uyRRaCxLc03FRVW/5fhw5YqxClBgxIJ4kV8jS/XYbTApGwqgWNWz
 WsfUD2COPqNNGvxf4oiPY7jpBsEvpeAytRqTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCk9SMnvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0hFaYDkpOs/jY8Eo27ayr0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPrw/AwMkgqFLQq2d0mOmsT/
 9ofF3MkO0Xra+KemNpXS8Fpj8UnadDoZcYR4yAxiz7eCvkiTNbIRKCiCd1whm9hwJATW6yEP
 YxAOGsHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBovzKPllwqidABNvLXfNmuWtUSwHrfm
 Vn3/UT+WRwfF4aQnG/tHnWEw7WncTnAcJsfEaD9+vN0jVm7wGsVBxsLE1yhrpGEZlWWXtteL
 wkN+XNro/FjpQqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxXADokhYphAQaifIL
IronPort-HdrOrdr: A9a23:sFpiIKk0XjViTPvkDzfH+RoL+7XpDfIc3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBED4ewK4yXcW2+ks1MaZPTUO0VHAROsO0WKF+UyDJ8SUzJ8/6U
 4PSdkZNPTASXR8kMbm8E2ZPr8bsaC6GXmT9IPjJqFWPGZXV50=
Received: from mail-qk1-f199.google.com ([209.85.222.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 02:02:09 -0500
Received: by mail-qk1-f199.google.com with SMTP id
 bk14-20020a05620a1a0e00b00706774f14cbso884274qkb.4
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FSQLcBOaxi4ec1ZLLBTEmbLjcknf+fmz9dGZaj/lG9Q=;
 b=A+QbcObaktT4M8Ml43XY4cqjcOKW1+SFTe6HJOB79hr6He+OqsgW+NCyikAhMfaUJq
 up3D+qhzgrKnNA0b1C/0md+U50u5Aw+4vrejgQLn+7yDOPvGWlSnNuXxRA/D25cqf4wt
 ua0x6v8IwG0sddLVoJnEbXCUYZV/BqZhlsVCXCiDVeqYrVTnepyx+7Nq9iFK7IWxUjbF
 M/z9Ii3fmhUSdFRiuw2doUNeXq6zJdxf2+HdH5k+f2/+duL9Rc5plQ3lazuL74PX3JL6
 y6zUWDMJegy/Px2ZsMiHveN8JHklmWSpFeQXRXOeWWWsawYnn26/NMjJoZNjR+IBf6a6
 IHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FSQLcBOaxi4ec1ZLLBTEmbLjcknf+fmz9dGZaj/lG9Q=;
 b=pPCxTjXQLVHS6DB4JPl18+zAflFemd3vXegjMNW0GcTBLfYrC2deyAFS1w5J2rtQZ0
 VPKSgpfbCsUJSM3YJwkwtHW6LRclMpKsHMg7PK9AzGli11ecAYhj/fmUiA1aAtHX7buR
 iAV+roKjF7J91Dlu6Jtisvpbyb8VKUEhv1YWuDV4tf1KxM++qp5PcyygulJv0l1BzhCM
 We8QIhXFm9+R8hQOPww61vvCs7p19z5sxGWMIFFDaT9srwxyumWc2m97Asvq4yET8pnt
 R/BYfRa401iAyvs+T9CsS83scq8l0C4WwNyEQnl7cFVEwqHBRiovqE5vf2OjBGW+oBaM
 HOrw==
X-Gm-Message-State: AFqh2kogZd3XxTmTE/SKeN6VTWTca+b2mulCYTjm4UII93/Ma661dWq4
 WhjQlo+0E4wcAwbz95ct6u0eRHe/49+w+vNzKgKnxMHIWlqt/G+LaoVA8XwFLg7CbM50hY87YuF
 iHPy/NPsERI/XJ44rwa08T9ZErISC+Q==
X-Received: by 2002:ac8:4b53:0:b0:3ad:14d0:e8b8 with SMTP id
 e19-20020ac84b53000000b003ad14d0e8b8mr12521771qts.26.1674111728833; 
 Wed, 18 Jan 2023 23:02:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuOg4cr6E1IJeIxVMhHJ1PiVNcNeoBTmPH2xbxXvxJTNcxHjeMxldDVExeY7p7DrvlVJAwniA==
X-Received: by 2002:ac8:4b53:0:b0:3ad:14d0:e8b8 with SMTP id
 e19-20020ac84b53000000b003ad14d0e8b8mr12521740qts.26.1674111728542; 
 Wed, 18 Jan 2023 23:02:08 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 b24-20020ac86798000000b0039cc944ebdasm18529810qtp.54.2023.01.18.23.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:02:08 -0800 (PST)
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
Date: Thu, 19 Jan 2023 02:01:57 -0500
Message-Id: <20230119070200.321519-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.199; envelope-from=alxndr@bu.edu;
 helo=esa14.hc2706-39.iphmx.com
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


