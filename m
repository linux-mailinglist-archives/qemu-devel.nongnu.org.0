Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F1C490B6D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:35:00 +0100 (CET)
Received: from localhost ([::1]:50446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9U27-0000NC-PG
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:34:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n9TT5-0005PE-NV; Mon, 17 Jan 2022 09:58:48 -0500
Received: from [2a00:1450:4864:20::32b] (port=35695
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1n9TT3-0001ky-Em; Mon, 17 Jan 2022 09:58:47 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso24391082wmj.0; 
 Mon, 17 Jan 2022 06:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=flI7GPjpjAi5fFLAr31EgyHvqL5FYwlRsk43Nb7Ao8Y=;
 b=jvNk8PZQqffTcKx2hrFObJ1JMgRmsmTaoAV3Q8lc+6YweMTGNVq+klqFVRQBFgswfX
 YXOuE4KO6E+GdGZZ0d/kUoKsZqX5IeL+3ZwQw0fkcpTYRVNsTN4mwa8Spi7imNOnDL4m
 0yfHCoWlGQtH77z73nEhFAZlxjA0f/f9sXFLMSlYV4FQ4BSx4RF85e+CgkyFQbnICTmL
 GzWB43ruIDGyI7HQkvLz4tCYU2kkw+TZuIUZGyqwcz4z14I4usE0lWmg4YSfiR9nwPH5
 IrBbcrqaZwWg3Wq5dKcXJJcd2TgXYV99LLViLHO5buiV8vDXkoEIV4Rgk9RLpGv1mfv5
 jJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=flI7GPjpjAi5fFLAr31EgyHvqL5FYwlRsk43Nb7Ao8Y=;
 b=mOCFBndRJM1x5+JBPsGLeIerYK4TT9Z4SReH9aBife4x+OyfILkxQU6u7lWe7i6cJh
 UYDSnWV384Ec4mvCsmLlACSgUTzGtjdfkmPcsc+fdZ9hFPVwKKxkkOKq9fksRG07HhjS
 XpqA4pU8y1aXVShno9MXO/KDzqMT2C/VKF404KSUpE7Lh10hlC7GOBsBQ9sn/VThEi34
 EswLP2ue+eMCs/1JESoH1qjMyKNXFQy3PknEOeDBTw/U6JJn88pUTdMQ7KXPk+NmKyPM
 zhNVWTHuzVBtEQQbTd5GaFU5aPg1gjjpgMCRF0JxSbqzZIV836HjtHV3le1hIg0lphDx
 tlow==
X-Gm-Message-State: AOAM532wKgCnHrCSBWgxobCrm4A7XIxlfkUv+rMBD3gN8IDHRevmfVZj
 +I9LrEhTHzE24n6JvWa2kMe4THLtVvFl6cg8hgo=
X-Google-Smtp-Source: ABdhPJxFHhMzUX8ALjp74E3HUfbMSMtNirT80aT2q8BhDvznfRBPKsLzH9zY6i/V1MJBXLSHn00OIQ==
X-Received: by 2002:a7b:cd02:: with SMTP id f2mr26692279wmj.68.1642431516926; 
 Mon, 17 Jan 2022 06:58:36 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-014-042-014.89.14.pool.telefonica.de. [89.14.42.14])
 by smtp.gmail.com with ESMTPSA id m20sm14155593wms.4.2022.01.17.06.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 06:58:36 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Mark remaining global TypeInfo instances as const
Date: Mon, 17 Jan 2022 15:58:03 +0100
Message-Id: <20220117145805.173070-1-shentey@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Applied review comments:
* Mention the sed-expression used for the cleanup in the commit message
* Have checkpatch.pl error on further non-const TypeInfo introduction

Bernhard Beschow (2):
  Mark remaining global TypeInfo instances as const
  checkpatch: Ensure that TypeInfos are const

 hw/core/generic-loader.c   | 2 +-
 hw/core/guest-loader.c     | 2 +-
 hw/display/bcm2835_fb.c    | 2 +-
 hw/display/i2c-ddc.c       | 2 +-
 hw/display/macfb.c         | 4 ++--
 hw/display/virtio-vga.c    | 2 +-
 hw/dma/bcm2835_dma.c       | 2 +-
 hw/i386/pc_piix.c          | 2 +-
 hw/i386/sgx-epc.c          | 2 +-
 hw/intc/bcm2835_ic.c       | 2 +-
 hw/intc/bcm2836_control.c  | 2 +-
 hw/ipmi/ipmi.c             | 4 ++--
 hw/mem/nvdimm.c            | 2 +-
 hw/mem/pc-dimm.c           | 2 +-
 hw/misc/bcm2835_mbox.c     | 2 +-
 hw/misc/bcm2835_powermgt.c | 2 +-
 hw/misc/bcm2835_property.c | 2 +-
 hw/misc/bcm2835_rng.c      | 2 +-
 hw/misc/pvpanic-isa.c      | 2 +-
 hw/misc/pvpanic-pci.c      | 2 +-
 hw/net/fsl_etsec/etsec.c   | 2 +-
 hw/ppc/prep_systemio.c     | 2 +-
 hw/ppc/spapr_iommu.c       | 2 +-
 hw/s390x/s390-pci-bus.c    | 2 +-
 hw/s390x/sclp.c            | 2 +-
 hw/s390x/tod-kvm.c         | 2 +-
 hw/s390x/tod-tcg.c         | 2 +-
 hw/s390x/tod.c             | 2 +-
 hw/scsi/lsi53c895a.c       | 2 +-
 hw/sd/allwinner-sdhost.c   | 2 +-
 hw/sd/aspeed_sdhci.c       | 2 +-
 hw/sd/bcm2835_sdhost.c     | 2 +-
 hw/sd/cadence_sdhci.c      | 2 +-
 hw/sd/npcm7xx_sdhci.c      | 2 +-
 hw/usb/dev-mtp.c           | 2 +-
 hw/usb/host-libusb.c       | 2 +-
 hw/vfio/igd.c              | 2 +-
 hw/virtio/virtio-pmem.c    | 2 +-
 qom/object.c               | 4 ++--
 scripts/checkpatch.pl      | 1 +
 40 files changed, 43 insertions(+), 42 deletions(-)

-- 
2.34.1


