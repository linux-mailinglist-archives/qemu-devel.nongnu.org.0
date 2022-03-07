Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBAC4D0065
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:47:55 +0100 (CET)
Received: from localhost ([::1]:45238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDiE-00063k-1F
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:47:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDem-0004CI-9C
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:12 -0500
Received: from [2607:f8b0:4864:20::1031] (port=45020
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDei-0006r4-9A
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:11 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so14033186pjb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=duoF7jSBeAxTbwRvjPxzId67sxJ3hAMNSaLT18nYiaM=;
 b=ZM55HeY9rBCNfbptHrlC+chMOviMytrQLpSMnKX5Slax9RjbFq8L1G+57d68rdhvQf
 xpV7xvhp+RNer0tYp/lEHvcEhwHBGAoEIQkxbu8YG3B5a1feCIE5jgVXcY0xTyBHIEPd
 /4Npn6Yaq9Uql1Zeo4fMuOH71xmWb63PRFEzuEePn4aBC5fNT3sHrqXUgOAYpF/Gck6m
 vn/RWYxroPd1N5MSKDb2Andndt8H7ljQdtcbbqaHAYceohTAiEJbJ8O0BNcq/io7qGS0
 HzQ+oEmnnp5O6avvEV3Ctik3HujLURZHM5eNZ/2PwkQxiXI90RYE/RuqdTfD0kMT61zX
 64pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=duoF7jSBeAxTbwRvjPxzId67sxJ3hAMNSaLT18nYiaM=;
 b=H6x3V3ybJ4CoJuy6a+cEb26NNE8+lqducEBfpdVUHZOMKf9FMSmUydLafh97OcJC9G
 AM5aDIWNHUEuknmULPiyulrOx4wglV8mkIC70CCmhAlhZAx6oo2FxtQb1d/gtM519xlV
 PBRf3PUEDafbNiSM/lYdfLcPFqofdbwfNxtC4Lr3+nUROeYG01eZO6+NANjWje1txv+N
 0jqsjXf0hsIoBXtMaaaAtwyQXji5j+5iUNgtFjX7RiAE+1N3ssW3bE24wjbDa9YwqY0n
 YyAtj3i4L7DV7DGLgV4FvykJfz89VviSB9a+d/34Qe/LioSHmDDtMz36NLDQVBHSHJoR
 pukQ==
X-Gm-Message-State: AOAM532sAivp2D3L04grttQ7VewAC6VjEIFdyEHbBKEbL185J0KfSas5
 bsqo4Nb1j3yZGvcqDs5yj8E=
X-Google-Smtp-Source: ABdhPJzoDdDMT6hvKUSXxpP+gCOUY90pcLxnQp9WO4iqyZMSV0JIWoyrHUq/0+VQJSr/LzXdMw6diA==
X-Received: by 2002:a17:90b:fd4:b0:1bc:1bf2:6fc9 with SMTP id
 gd20-20020a17090b0fd400b001bc1bf26fc9mr13061043pjb.97.1646660639859; 
 Mon, 07 Mar 2022 05:43:59 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a056a00170300b004f104c635e4sm16607040pfc.99.2022.03.07.05.43.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:43:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 00/13] hw: ISA & MIPS patches from Bernhard Beschow
Date: Mon,  7 Mar 2022 14:43:40 +0100
Message-Id: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This is a combination of 2 series posted by Bernhard Beschow:

"malta: Fix PCI IRQ levels to be preserved during migration" v4
https://lore.kernel.org/qemu-devel/20220217101924.15347-1-shentey@gmail.com/

"isa: Resolve unneeded IRQ attributes from ISADevice" v3
https://lore.kernel.org/qemu-devel/20220301220037.76555-1-shentey@gmail.com/

Bernhard, can you check if the 2nd series got rebased properly?

Thanks,

Phil.

Bernhard Beschow (13):
  hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be preserved during
    migration
  malta: Move PCI interrupt handling from gt64xxx_pci to piix4
  hw/isa/piix4: Resolve redundant i8259[] attribute
  hw/isa/piix4: Pass PIIX4State as opaque parameter for piix4_set_irq()
  hw/isa/piix4: Resolve global instance variable
  hw/isa/piix4: Replace some magic IRQ constants
  hw/mips/gt64xxx_pci: Resolve gt64120_register()
  hw/rtc/mc146818rtc: QOM'ify IRQ number
  hw/rtc/m48t59-isa: QOM'ify IRQ number
  hw/input/pckbd: QOM'ify IRQ numbers
  hw/isa/isa-bus: Remove isabus_dev_print()
  hw/isa: Drop unused attributes from ISADevice
  hw/isa: Inline and remove one-line isa_init_irq()

 hw/audio/cs4231a.c            |  2 +-
 hw/audio/gus.c                |  2 +-
 hw/audio/sb16.c               |  2 +-
 hw/block/fdc-isa.c            |  2 +-
 hw/char/parallel.c            |  2 +-
 hw/char/serial-isa.c          |  2 +-
 hw/ide/isa.c                  |  2 +-
 hw/input/pckbd.c              | 26 ++++++++++--
 hw/ipmi/isa_ipmi_bt.c         |  2 +-
 hw/ipmi/isa_ipmi_kcs.c        |  2 +-
 hw/isa/isa-bus.c              | 37 +---------------
 hw/isa/piix4.c                | 56 +++++++++++++++++++++---
 hw/mips/gt64xxx_pci.c         | 80 +++--------------------------------
 hw/mips/malta.c               |  7 +--
 hw/net/ne2000-isa.c           |  2 +-
 hw/rtc/m48t59-isa.c           |  9 +++-
 hw/rtc/mc146818rtc.c          | 13 +++++-
 hw/tpm/tpm_tis_isa.c          |  2 +-
 include/hw/isa/isa.h          |  3 --
 include/hw/mips/mips.h        |  3 --
 include/hw/rtc/mc146818rtc.h  |  1 +
 include/hw/southbridge/piix.h |  2 -
 tests/qemu-iotests/172.out    | 26 ------------
 23 files changed, 114 insertions(+), 171 deletions(-)

-- 
2.34.1


