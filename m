Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3292B6C8908
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 00:11:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfqXu-0002WX-O2; Fri, 24 Mar 2023 19:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3si0eZAgKCq0jhUNbgfUTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXf-0002Pt-Ji
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:51 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3si0eZAgKCq0jhUNbgfUTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXZ-00082k-ES
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 19:09:50 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 i26-20020aa796fa000000b006261da7aeceso1641708pfq.5
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 16:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679699378;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GW1i0fzjy9krw/J8Fwvuf1eW6UpjAYNZjXERaYDHLzg=;
 b=T3Z3Ou6XFyazcpC07uS3ac1jV9bbTVMeXKEoHvDbGsiBQl50H2/LHz7X94+57+gcbT
 JYdXpznvFMYrwThQOo63yc4DJgMsZ9RYE+qiW38U9TrZqrd1Mh00nf2Zxs1696ichYHf
 VJqUKM6IeJzAoGbpbeNzL6q/3EU8oOjf1FFA80ok6aCp0C6/GhxZkwXdw/aRfI5KukoO
 Nv+mvL3PJwQQxzucllXHGNDqiTMouf43B6lfK0BJIzVAYlmzUwhi7RPN0ldpclGfA5aI
 BWZaw1Vx1A3q9W5zKVjZOcmVqCpCmJ/ZodCaGPs/hOjtof/eQ4RcR2flj7r8dMsOVOWK
 B3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679699378;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GW1i0fzjy9krw/J8Fwvuf1eW6UpjAYNZjXERaYDHLzg=;
 b=IFj/fNjjMD5o405nim62fAeP0AYcNYIftpcEQfYnmqgCT/kmYbZGbT4BRUl1EWZwle
 MHGqjIuKR+u5Toi6XGToXiOX31WO4iDwiF/iOl3sxpG97OeObyJxCGpK3RL80cz+GLSa
 eUjYX3QggUnaJ2sEoKXrxQrWY3KmSLw5yoYHrTxD/i700VsQAZiXCcA9uloZrGlblzup
 lvPQjrTu/9BmxU6PbfTXrM4Cs9VOmZplf7nQsJWSux7hcsQtlECVJE1pQdTj4dw/0sET
 jXhntKJ4O08J1HUXN7+6xXAzfKXtelKKZZPTJqXfTJkPzAx5OnIQDRH1xiQjfSvgkB8P
 TZgQ==
X-Gm-Message-State: AAQBX9dsNMRfL46XPukI+HT//vFzWK6TKVQEIRooSgt67fueeuUNYkt5
 O7wZtzRHblqyYNrKliy5kdO/uV0L4/EjdA==
X-Google-Smtp-Source: AKy350Z2AmAjYdm4q33Sb7ttu+kpyCMme9STMo2qhLWwVm/ph2clStR3qCAszaV3F6zp9RX/cE/egITzmZMnbw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a65:5a4a:0:b0:50f:b887:1637 with SMTP id
 z10-20020a655a4a000000b0050fb8871637mr1135773pgs.7.1679699378117; Fri, 24 Mar
 2023 16:09:38 -0700 (PDT)
Date: Fri, 24 Mar 2023 16:08:57 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230324230904.3710289-1-wuhaotsh@google.com>
Subject: [PATCH v2 0/7] Handling IPMI for emulated BMC
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3si0eZAgKCq0jhUNbgfUTbbTYR.PbZdRZh-QRiRYabaTah.beT@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

This patch set is follow-up to our BMC side IPMI
code that was sent our 18 months ago. It addresses
Corey's comments.

Baseboard Management Controllers (BMCs) are special
processors that monitors state of a computer, often
used in data center servers. They often communicate
via IPMI. As a result, it is important to emulate
the IPMI interface so that they can connect to host
machines.

This patch set aims to refactor the existing hw/ipmi
and make it handles both Core side and BMC side
emulations. We also added the implementation of the
KCS module for NPCM7XX BMC boards that work as a backend.
We have tested this patch on various NPCM7xx based
systems and they can communicate with a host that runs
pmi-bmc-extern

The structure is as follows:
Patch 1-3 contains some documentation written by
Havard Skinnomoen that how the emulation of existing
host-side IPMI and the new BMC-side IPMI works.
Patch 4-5 refactors the current IPMI code so that
they work for both host-side and BMC-side.
Patch 6 adds a new ipmi-host-extern which represents
BMC-side emulation that is similar to the current
ipmi-bmc-extern.
Patch 7 implements the KCS device in NPCM7XX boards. It
works as a backend to the ipmi-host-extern device. Since
the direction is different we can't directly use ipmi-kcs.c
for BMC emulation.

-- Changes since v1 --

1. Use the terms Corey suggested in patch v7 throughout
   the patch set.
2. Squash the original patch 6 into patch 4 so that
   the structure is clearer.
3. Addressed other comments from Corey in the original
   patch set.

Hao Wu (4):
  hw/ipmi: Refactor IPMI interface
  hw/ipmi: Take out common from ipmi_bmc_extern.c
  hw/ipmi: Add an IPMI external host device
  hw/ipmi: Add a KCS Module for NPCM7XX

Havard Skinnemoen (3):
  docs: enable sphinx blockdiag extension
  docs/specs: IPMI device emulation: main processor
  docs/specs: IPMI device emulation: BMC

 configs/devices/arm-softmmu/default.mak |   2 +
 docs/conf.py                            |   6 +-
 docs/specs/index.rst                    |   1 +
 docs/specs/ipmi.rst                     | 170 +++++++
 docs/system/arm/nuvoton.rst             |   1 -
 hw/acpi/ipmi.c                          |   4 +-
 hw/arm/npcm7xx.c                        |  10 +-
 hw/ipmi/Kconfig                         |   4 +
 hw/ipmi/ipmi.c                          |  60 ++-
 hw/ipmi/ipmi_bmc_extern.c               | 439 ++----------------
 hw/ipmi/ipmi_bmc_sim.c                  |  78 ++--
 hw/ipmi/ipmi_bt.c                       |  33 +-
 hw/ipmi/ipmi_extern.c                   | 432 +++++++++++++++++
 hw/ipmi/ipmi_extern.h                   |  90 ++++
 hw/ipmi/ipmi_host_extern.c              | 170 +++++++
 hw/ipmi/ipmi_kcs.c                      |  31 +-
 hw/ipmi/isa_ipmi_bt.c                   |  18 +-
 hw/ipmi/isa_ipmi_kcs.c                  |  13 +-
 hw/ipmi/meson.build                     |   4 +-
 hw/ipmi/npcm7xx_kcs.c                   | 590 ++++++++++++++++++++++++
 hw/ipmi/pci_ipmi_bt.c                   |   8 +-
 hw/ipmi/pci_ipmi_kcs.c                  |   8 +-
 hw/ipmi/smbus_ipmi.c                    |  26 +-
 hw/ipmi/trace-events                    |   8 +
 hw/ipmi/trace.h                         |   1 +
 hw/ppc/pnv.c                            |   4 +-
 hw/ppc/pnv_bmc.c                        |  22 +-
 hw/smbios/smbios_type_38.c              |  11 +-
 include/hw/arm/npcm7xx.h                |   2 +
 include/hw/ipmi/ipmi.h                  | 139 ++++--
 include/hw/ipmi/ipmi_bt.h               |   2 +-
 include/hw/ipmi/ipmi_kcs.h              |   2 +-
 include/hw/ipmi/npcm7xx_kcs.h           | 103 +++++
 include/hw/ppc/pnv.h                    |  12 +-
 meson.build                             |   1 +
 35 files changed, 1939 insertions(+), 566 deletions(-)
 create mode 100644 docs/specs/ipmi.rst
 create mode 100644 hw/ipmi/ipmi_extern.c
 create mode 100644 hw/ipmi/ipmi_extern.h
 create mode 100644 hw/ipmi/ipmi_host_extern.c
 create mode 100644 hw/ipmi/npcm7xx_kcs.c
 create mode 100644 hw/ipmi/trace-events
 create mode 100644 hw/ipmi/trace.h
 create mode 100644 include/hw/ipmi/npcm7xx_kcs.h

-- 
2.40.0.348.gf938b09366-goog


