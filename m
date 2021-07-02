Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163373B9E36
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:27:21 +0200 (CEST)
Received: from localhost ([::1]:50678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFSC-0007LQ-1F
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzFPl-0004l7-4t
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzFPh-0001Yn-Fw
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625217883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n/hqzYAC//daplOCzVObo5prYyh3dJkonmQtf/N/Iug=;
 b=K9iusvtNfH0Gain8KzivaaV3jluZ92inqzrnucTFoKY4j70p/sLO0lUoEUhKkIvzM1xDsK
 66IveoiYDZGcj4JPxCop0ECl1vVr6y7ipCwUZOMrD04+BwhSFX5/qNLBtoQ71ptuoAuo0o
 UVahQzAEZ3dBsD9Lo0Am8gta8k/Oy2A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-RikuAFZ3MXqTP35kh4QfHQ-1; Fri, 02 Jul 2021 05:24:42 -0400
X-MC-Unique: RikuAFZ3MXqTP35kh4QfHQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f11-20020a05600c154bb02901e0210617aaso2748076wmg.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 02:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Et95+y7ioKqD5BlXWiEb9PuIZGdlZ1Z1s+eWJIvKvWc=;
 b=RXNRu6Mk0B8yuDG/ZO+EUu6GAmZLpKdAR+BPG1jvFvjWJbP0BX43PDWdR6l6w2QkJx
 9UoDXI4dJrP6yQ5rq49yGtQjlVV3vnVsQ2GyhWRWsjnShVit+4956R42Jw4G1WDUcmQc
 2TIxRyphbTFfowCK48bnF7fli5IGhJAmfoLhMpB/xYyy4X6wDrvTrDd+G1bFHQZmqPXT
 vHtQ5eAOykKS0sCIuVZN8nIIbakje01YB+iPzSdlJP78zSYaKGzryM0X9yGHSnrxDaT+
 fjm2teBb4KeCVNNfnUkHtDrya3G7zqdGlVwdR33W3OSEGz+QCUcUhlRq7eN/PwNOQmNv
 SyfA==
X-Gm-Message-State: AOAM532wfi+V0e5ERnR01buELm6BdFIkEs3OC8YW0rohrNVzYm6X9n45
 RJ7CiLAI7GGbDJ2Rzb/zXMDSWN1rGIx2M6a1kPtAGdwDCS+jpnTY/+/2HFJf7g6p6ZbOG6VRHtc
 N1hJudfP1ZHcU9I0L+nsAojnDdrMsuJMrWRkFexidA0YgqiboN918nH39463Qbmk3
X-Received: by 2002:adf:c511:: with SMTP id q17mr4686887wrf.60.1625217881106; 
 Fri, 02 Jul 2021 02:24:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMDu1Hj9zaJ7E5pxb5pCqiju6n0Fg3wgdl41RJuwvqUDxqnTeyEx8+vd3FF4KZzde5VqI88Q==
X-Received: by 2002:adf:c511:: with SMTP id q17mr4686869wrf.60.1625217880928; 
 Fri, 02 Jul 2021 02:24:40 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id 2sm2379510wmn.44.2021.07.02.02.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:24:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] hw: Let the DMA API take a MemTxAttrs argument
Date: Fri,  2 Jul 2021 11:24:33 +0200
Message-Id: <20210702092439.989969-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm going to send yet another series aiming to fix the DMA=0D
reentrancy problem, which is based on these patches. Since=0D
they are already reviewed, send them apart as a preparatory=0D
series.=0D
=0D
Since v2:=0D
- Rebased, fixing conflicts in:=0D
  . hw/display/virtio-gpu.c=0D
  . hw/ide/ahci.c=0D
  . hw/net/allwinner-sun8i-emac.c=0D
  . hw/pci-host/pnv_phb4.c=0D
  . hw/sd/sdhci.c=0D
=0D
Supersedes: <20201001172519.1620782-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  dma: Let dma_memory_valid() take MemTxAttrs argument=0D
  dma: Let dma_memory_set() take MemTxAttrs argument=0D
  dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument=0D
  dma: Let dma_memory_rw() take MemTxAttrs argument=0D
  dma: Let dma_memory_read/write() take MemTxAttrs argument=0D
  dma: Let dma_memory_map() take MemTxAttrs argument=0D
=0D
 include/hw/pci/pci.h          |  6 +++--=0D
 include/hw/ppc/spapr_vio.h    | 11 +++++---=0D
 include/sysemu/dma.h          | 50 ++++++++++++++++++++++-------------=0D
 hw/arm/musicpal.c             | 13 ++++-----=0D
 hw/arm/smmu-common.c          |  3 ++-=0D
 hw/arm/smmuv3.c               | 14 ++++++----=0D
 hw/core/generic-loader.c      |  3 ++-=0D
 hw/display/virtio-gpu.c       | 10 ++++---=0D
 hw/dma/pl330.c                | 12 ++++++---=0D
 hw/dma/sparc32_dma.c          | 16 ++++++-----=0D
 hw/dma/xlnx-zynq-devcfg.c     |  6 +++--=0D
 hw/dma/xlnx_dpdma.c           | 10 ++++---=0D
 hw/hyperv/vmbus.c             |  8 +++---=0D
 hw/i386/amd_iommu.c           | 16 ++++++-----=0D
 hw/i386/intel_iommu.c         | 28 ++++++++++++--------=0D
 hw/ide/ahci.c                 |  8 +++---=0D
 hw/ide/macio.c                |  2 +-=0D
 hw/intc/spapr_xive.c          |  3 ++-=0D
 hw/intc/xive.c                |  7 ++---=0D
 hw/misc/bcm2835_property.c    |  3 ++-=0D
 hw/misc/macio/mac_dbdma.c     | 10 ++++---=0D
 hw/net/allwinner-sun8i-emac.c | 18 ++++++++-----=0D
 hw/net/ftgmac100.c            | 25 +++++++++++-------=0D
 hw/net/imx_fec.c              | 32 +++++++++++++---------=0D
 hw/net/npcm7xx_emc.c          | 20 ++++++++------=0D
 hw/nvram/fw_cfg.c             | 12 ++++++---=0D
 hw/pci-host/pnv_phb3.c        |  5 ++--=0D
 hw/pci-host/pnv_phb3_msi.c    |  9 ++++---=0D
 hw/pci-host/pnv_phb4.c        |  5 ++--=0D
 hw/sd/allwinner-sdhost.c      | 14 +++++-----=0D
 hw/sd/sdhci.c                 | 35 +++++++++++++++---------=0D
 hw/usb/hcd-dwc2.c             |  8 +++---=0D
 hw/usb/hcd-ehci.c             |  6 +++--=0D
 hw/usb/hcd-ohci.c             | 28 ++++++++++++--------=0D
 hw/usb/hcd-xhci.c             | 18 ++++++++-----=0D
 hw/usb/libhw.c                |  3 ++-=0D
 hw/virtio/virtio.c            |  6 +++--=0D
 softmmu/dma-helpers.c         | 11 ++++----=0D
 38 files changed, 305 insertions(+), 189 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


