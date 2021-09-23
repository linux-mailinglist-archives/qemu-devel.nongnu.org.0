Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD13415DF7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 14:16:32 +0200 (CEST)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTNeR-0002Ft-Eh
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 08:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTNa8-0008DC-2v
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:12:04 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTNa2-00005L-9i
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 08:12:03 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t8so16688942wri.1
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwqSp4NfwhapBv3/a8JefaUXdQf/crQA0Zbcnsp/acU=;
 b=l7GJ7OPdXaOcerwJ3ymzQhNM+ZcFcugQ5xnk4cf2Cu885JuBu+PEIUY0kL0Ajj7WI1
 EpYBVa9brQaL8c/GKsQdBzLystbgPcYq6RzkT1cnFUZugu/7zX2Tt3t1mYjIRexdN2WI
 RbzU/BS5PP4RrGU7hByJVU58DgeT5SurDRox4y0eVZ0A+fJ0ZZ3mQpbs4ofF0uGezUZn
 yN82PyebSanK34XwJn9GMq5Nt9Dk1jIrW+doW7gAUR7fcZmXi9030qV3twDMQAe41HOu
 xUilfN6jBXhbsSlD9rmh/tJoUA1eNy1pkITS/rpYT2WNPVqbFjYIVqCW1ph7KUp+HXbw
 tn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwqSp4NfwhapBv3/a8JefaUXdQf/crQA0Zbcnsp/acU=;
 b=KpnKYrM5F1fo0qWKO8ifutNHw5vIu5Ac6ZRL9aKy63ubrON9CQrWjx7gipPY6QMVe9
 64pEkX11ZHh1k8Lp84AAXyYMkZWZ3Jq50cvTkxjIuN00dycpXKmvgQ370mB9/bV7BukL
 vptMJW/w3+NdlamsG0AZSdG/F5ToVh5kKZMWuJsvYsJY+EH8P8GnbOSSsLkrqg90HgxL
 wJdDQU2ufWsTb+G2baqRxMsTK5LtEDQI/kO01pd39zrNTXR90i0YyWjsVJPm80cSsqaM
 SMtQIfJTcgT16oBQ0Gl4AxDnn/bcwUDvZ0Sk27SsJi2WbtyTrnAC3JbVy7y/Ht+MIDm5
 BzdQ==
X-Gm-Message-State: AOAM533uwMzx01VGWgsgrlZZCX0yOA2m1UqZ9SziT0Pyz9TMw/l/JK6U
 9dCAc8BQx0EZeBkVDKIxEDqngGIxuOFmEA==
X-Google-Smtp-Source: ABdhPJx4Mf0QGhbTSm9t4JxyU52jfGwMzjLdxqd6/YEG1uHS2IEvuDzRLvt6nQ9bUre3e4lq10JYaQ==
X-Received: by 2002:adf:aacb:: with SMTP id i11mr4886695wrc.296.1632399116253; 
 Thu, 23 Sep 2021 05:11:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t22sm1382349wmj.30.2021.09.23.05.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:11:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] Improve consistency of bus init function names
Date: Thu, 23 Sep 2021 13:11:47 +0100
Message-Id: <20210923121153.23754-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Alberto Garcia <berto@igalia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we have a bit of a mishmash of different function
names for bus creation. There are two basic patterns: you
can have a function that allocates and returns a new bus
object; or you can have a function that takes a pointer to
a bus object and initializes it in-place. We have to some
extent a convention for those: the allocate-and-return
function is 'foo_new()', and the 'init in-place' function
is 'foo_init()'. However many of our bus creation functions
don't follow that; some use 'foo_new' vs 'foo_new_inplace';
some use 'foo_new' for the in-place init version; and
the bottom level qbus functions are 'qbus_create' vs
'qbus_create_inplace'. This series tries to bring at least
scsi, ipack, pci, ide, and qbus into line with the
_new-vs-_init naming convention.

The other issue with bus creation functions is that some
of them take a 'name' argument which can be NULL, and some
do not. Generally "pass in a specific name" should be the
rare case, but our API design here is easy to misuse, and
so a lot of callsites (especially for i2c, sd, ssi) pass
in names when they should not. Untangling that mess is
going to be tricky (see other thread for more), but as
a first step, this series proposes a split between
foo_bus_new() and foo_bus_new_named() where the latter
takes a name parameter and the former does not. I do
this only for scsi (and implicitly ide, whose ide_bus_new
function already doesn't take a name argument) for the
moment, as the other bus types have more of a mess of
"pass name when they should not" callsites, so I didn't
want to put in too much work before finding out if we
had agreement on this as a naming convention.

There are definitely more buses that can be cleaned up
to follow the init vs new convention, but this series is
already touching 70 files and trying to do every bus in
one series seems like a recipe for merge conflicts.
So this seemed like enough to be going on with...

thanks
-- PMM

Peter Maydell (6):
  scsi: Replace scsi_bus_new() with scsi_bus_init(),
    scsi_bus_init_named()
  ipack: Rename ipack_bus_new_inplace() to ipack_bus_init()
  pci: Rename pci_root_bus_new_inplace() to pci_root_bus_init()
  qbus: Rename qbus_create_inplace() to qbus_init()
  qbus: Rename qbus_create() to qbus_new()
  ide: Rename ide_bus_new() to ide_bus_init()

 include/hw/ide/internal.h     |  4 ++--
 include/hw/ipack/ipack.h      |  8 ++++----
 include/hw/pci/pci.h          | 10 +++++-----
 include/hw/qdev-core.h        |  6 +++---
 include/hw/scsi/scsi.h        | 30 ++++++++++++++++++++++++++++--
 hw/audio/intel-hda.c          |  2 +-
 hw/block/fdc.c                |  2 +-
 hw/block/swim.c               |  3 +--
 hw/char/virtio-serial-bus.c   |  4 ++--
 hw/core/bus.c                 | 13 +++++++------
 hw/core/sysbus.c              | 10 ++++++----
 hw/gpio/bcm2835_gpio.c        |  3 +--
 hw/hyperv/vmbus.c             |  2 +-
 hw/i2c/core.c                 |  2 +-
 hw/ide/ahci.c                 |  2 +-
 hw/ide/cmd646.c               |  2 +-
 hw/ide/isa.c                  |  2 +-
 hw/ide/macio.c                |  2 +-
 hw/ide/microdrive.c           |  2 +-
 hw/ide/mmio.c                 |  2 +-
 hw/ide/piix.c                 |  2 +-
 hw/ide/qdev.c                 |  4 ++--
 hw/ide/sii3112.c              |  2 +-
 hw/ide/via.c                  |  2 +-
 hw/ipack/ipack.c              | 10 +++++-----
 hw/ipack/tpci200.c            |  4 ++--
 hw/isa/isa-bus.c              |  2 +-
 hw/misc/auxbus.c              |  2 +-
 hw/misc/mac_via.c             |  4 ++--
 hw/misc/macio/cuda.c          |  4 ++--
 hw/misc/macio/macio.c         |  4 ++--
 hw/misc/macio/pmu.c           |  4 ++--
 hw/nubus/mac-nubus-bridge.c   |  2 +-
 hw/nvme/ctrl.c                |  4 ++--
 hw/nvme/subsys.c              |  3 +--
 hw/pci-host/raven.c           |  4 ++--
 hw/pci-host/versatile.c       |  6 +++---
 hw/pci/pci.c                  | 30 +++++++++++++++---------------
 hw/pci/pci_bridge.c           |  4 ++--
 hw/ppc/spapr_vio.c            |  2 +-
 hw/s390x/ap-bridge.c          |  2 +-
 hw/s390x/css-bridge.c         |  2 +-
 hw/s390x/event-facility.c     |  4 ++--
 hw/s390x/s390-pci-bus.c       |  2 +-
 hw/s390x/virtio-ccw.c         |  3 +--
 hw/scsi/esp-pci.c             |  2 +-
 hw/scsi/esp.c                 |  2 +-
 hw/scsi/lsi53c895a.c          |  2 +-
 hw/scsi/megasas.c             |  3 +--
 hw/scsi/mptsas.c              |  2 +-
 hw/scsi/scsi-bus.c            |  6 +++---
 hw/scsi/spapr_vscsi.c         |  3 +--
 hw/scsi/virtio-scsi.c         |  4 ++--
 hw/scsi/vmw_pvscsi.c          |  3 +--
 hw/sd/allwinner-sdhost.c      |  4 ++--
 hw/sd/bcm2835_sdhost.c        |  4 ++--
 hw/sd/pl181.c                 |  3 +--
 hw/sd/pxa2xx_mmci.c           |  4 ++--
 hw/sd/sdhci.c                 |  3 +--
 hw/sd/ssi-sd.c                |  3 +--
 hw/ssi/ssi.c                  |  2 +-
 hw/usb/bus.c                  |  2 +-
 hw/usb/dev-smartcard-reader.c |  3 +--
 hw/usb/dev-storage-bot.c      |  3 +--
 hw/usb/dev-storage-classic.c  |  4 ++--
 hw/usb/dev-uas.c              |  3 +--
 hw/virtio/virtio-mmio.c       |  3 +--
 hw/virtio/virtio-pci.c        |  3 +--
 hw/xen/xen-bus.c              |  2 +-
 hw/xen/xen-legacy-backend.c   |  2 +-
 70 files changed, 156 insertions(+), 142 deletions(-)

-- 
2.20.1


