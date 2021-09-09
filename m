Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A723E405FED
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 01:14:51 +0200 (CEST)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOTFq-0006WJ-OC
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 19:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nZM6YQgKCr40ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8V-0004Wf-Ij
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:15 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:47044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nZM6YQgKCr40ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com>)
 id 1mOT8S-0003VF-Lu
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 19:07:15 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 u3-20020a17090abb0300b0019567f8a277so88895pjr.1
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 16:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=rVJ1VxbyIUxfIoxlACN+EEQraZUzQ4oIXvT42LkdnR0=;
 b=taz/ymydJkOjMiVN8+iLW8G0cBbNFQ/dQ8z1tBoyufK/D8YVPFwkUGF/P+dICrV6Ft
 QtrORoewOj/o2+lVhvYVyUreffSQqebdrhzEM7T9bpJhIC7UvK1jY/Ovh2EEymdmeAHp
 yTI+yiodSnnxkhsDeyZeQpiAHWTV8HxWWpljIm1+IaBw2auaHW6i9C2sFg1RTt4VR/VO
 TDmpQvl3cOOvtGGPExjTyyaMPBHgUGZs3yG9gnvAWqmU8BZO2tu9P33jCP5cOL5VJOnJ
 tQcRzO7eGjzCogxur1/TgUM+0cqz1+KsKunNJy0nfJ/kdyC7OWl0dgAbBpaBRuJ4XkBg
 U2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=rVJ1VxbyIUxfIoxlACN+EEQraZUzQ4oIXvT42LkdnR0=;
 b=N3z5DwSWqf0WjBQLk+ICWYFh+6h+pxa9bdkWFyy+sD5oWdSdJtOJCNUKujaAUGgIqN
 tg30CqI2Ftn+UlOzfpJBax3SNKR5ILbMKBGzmasBHc5QDTG7dJBv+EHUuqrIm4nVIG2K
 98ncaxmom22pSK9yaa4nIgrktsnj8fzMuFFbb45+rQ+wAcD4a/2bYE2vaD3bkq8cP21o
 nKdLJJlwbTmlVRSFeRhDbhnVplg0kK0ZL1HS6Q2h6c/duY0H0C2O6obQBwifpkIXtPRH
 AgSk3lgIPaNmDXi9FOX/gY6LiorL7bLwD1i4m6p6Ooh4TTLmsxfeudTyY1ySdf9xYdUU
 kepA==
X-Gm-Message-State: AOAM530A7c0/zP3oRIumaUMfMua199Gr0Gqq4YyM1laViw3ZCw5Ik86H
 +HhZKe4BHZixcfSRC0OlHDRgnFhydiTonQ==
X-Google-Smtp-Source: ABdhPJwQoLG+akPagjWMy38t1K9A6WXegp2GNvfvqSsbxeUEW36az4uw995eWfaOcee1WX9wKJ4nfHQckJIetQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:69a4:: with SMTP id
 s33mr6022689pjj.217.1631228829502; Thu, 09 Sep 2021 16:07:09 -0700 (PDT)
Date: Thu,  9 Sep 2021 16:06:12 -0700
Message-Id: <20210909230620.511815-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH 0/8] Handing IPMI for emulating BMC
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3nZM6YQgKCr40ylesxwlksskpi.gsquiqy-hiziprsrkry.svk@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
`ipmi-bmc-extern`.

The structure is as follows:
Patch 1-3 contains some documentation written by
Havard Skinnomoen that how the emulation of existing
host-side IPMI and the new BMC-side IPMI works.
Patch 4-6 refactors the current IPMI code so that
they work for both host-side and BMC-side.
Patch 7 adds a new ipmi-host-extern which represents
BMC-side emulation that is similar to the current
ipmi-bmc-extern.
Patch 8 implements the KCS device in NPCM7XX boards. It
works as a backend to the ipmi-host-extern device. Since
the direction is different we can't directly use ipmi-kcs.c
for BMC emulation.

Hao Wu (5):
  hw/ipmi: Refactor IPMI interface
  hw/ipmi: Take out common from ipmi_bmc_extern.c
  hw/ipmi: Move handle_command to IPMICoreClass
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
 hw/arm/npcm7xx.c                        |  10 +-
 hw/ipmi/Kconfig                         |   5 +
 hw/ipmi/ipmi.c                          |  15 +-
 hw/ipmi/ipmi_bmc_extern.c               | 417 ++---------------
 hw/ipmi/ipmi_bmc_sim.c                  |  47 +-
 hw/ipmi/ipmi_bt.c                       |   6 +-
 hw/ipmi/ipmi_extern.c                   | 429 +++++++++++++++++
 hw/ipmi/ipmi_extern.h                   |  90 ++++
 hw/ipmi/ipmi_host_extern.c              | 170 +++++++
 hw/ipmi/ipmi_kcs.c                      |   8 +-
 hw/ipmi/isa_ipmi_bt.c                   |   4 +-
 hw/ipmi/isa_ipmi_kcs.c                  |   4 +-
 hw/ipmi/meson.build                     |   4 +-
 hw/ipmi/npcm7xx_kcs.c                   | 588 ++++++++++++++++++++++++
 hw/ipmi/pci_ipmi_bt.c                   |   4 +-
 hw/ipmi/pci_ipmi_kcs.c                  |   4 +-
 hw/ipmi/smbus_ipmi.c                    |  12 +-
 hw/ipmi/trace-events                    |   8 +
 hw/ipmi/trace.h                         |   1 +
 include/hw/arm/npcm7xx.h                |   2 +
 include/hw/ipmi/ipmi.h                  |  54 ++-
 include/hw/ipmi/npcm7xx_kcs.h           | 103 +++++
 meson.build                             |   1 +
 28 files changed, 1733 insertions(+), 433 deletions(-)
 create mode 100644 docs/specs/ipmi.rst
 create mode 100644 hw/ipmi/ipmi_extern.c
 create mode 100644 hw/ipmi/ipmi_extern.h
 create mode 100644 hw/ipmi/ipmi_host_extern.c
 create mode 100644 hw/ipmi/npcm7xx_kcs.c
 create mode 100644 hw/ipmi/trace-events
 create mode 100644 hw/ipmi/trace.h
 create mode 100644 include/hw/ipmi/npcm7xx_kcs.h

-- 
2.33.0.309.g3052b89438-goog


