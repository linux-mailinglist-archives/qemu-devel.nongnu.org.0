Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89386AA128
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 22:29:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYCxJ-0004b5-4l; Fri, 03 Mar 2023 16:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxH-0004ar-JA; Fri, 03 Mar 2023 16:28:43 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pYCxF-00028U-Uh; Fri, 03 Mar 2023 16:28:43 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-176261d7f45so4511481fac.11; 
 Fri, 03 Mar 2023 13:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g9VB58YfkhgHyd+kDNup+BBOgwCjG9b6PLRv+uGvebw=;
 b=UF9S/zPiFyf9vB+ihWk9A616G1VKDAtNpPW3DTg0LYy0PhF0fUkcDuhJaPGYnDcz6f
 tCuRL4LZR2F/Q9o7rObOpwsmCPu0EE4+dXenTSr5VRX3cvM4agvH87j/gCp2ms+Nl93O
 /ABDZ+m+AR25KpJnipouDAyvI0HTsuI17K/CxfL1OVj9yXrmGRhekZnRdAjlzOg0cGMc
 +bgwLSQmrXVBZs6UW4N/Y4C04P9sfBLon7917WnvJhcozIQ7GBqTDmV+qBqEyj0xTUvy
 6BOiaV0ayDZvv1bMfSMGw9ZKahEJfJ9J8I98vfNjUTTeXC490CkFHuAsJbPZN/nGtMtj
 FpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g9VB58YfkhgHyd+kDNup+BBOgwCjG9b6PLRv+uGvebw=;
 b=8HZZdzTxmMVq6ShUaGn1HwwhsJiREYs8TGteBV/qY7J/DeXvO1JkAADWEuuH2U0joS
 G6cYQAT3n+6B+Aq/gjY+aOJsSTiLDAw+WbiHx3fCh9D3EvoaooUpaxs7nPnX/zi60s5j
 PC62ehBeEmA2pxMlicGs/ijFPDp3GVobobvPM+zLXMThQZrZuLXNHBluOYO/hO5rB3zU
 SZfgNg8dRMF1A0KPUPetP6PS/sLGtxYUQGBok34u9JGaiupQdSJqIdFSpkHVb1ToJqpV
 Lterq7lOEcO6nzWHo85PSWbftxzlWeELdk1dAwAcBJGXWkqx3CjEOKEKVNOuNLCQgNxO
 G1jQ==
X-Gm-Message-State: AO0yUKW4FDyuRtXTSTU0VddKwoNzhFmq8yz2XBEgZpW7JijRpTCN0qB/
 1/VuhfYPGY+ufdtwHVPKU4qpne8Gt4E=
X-Google-Smtp-Source: AK7set8GKjrKQl18gA7wl32f+wVaX3P038+2Dam2EM5OKdlJZ3N6HR5RqY6R7/uPO27iiJ+wtxcLgA==
X-Received: by 2002:a05:6870:c22a:b0:172:55cc:a3be with SMTP id
 z42-20020a056870c22a00b0017255cca3bemr1979623oae.7.1677878919935; 
 Fri, 03 Mar 2023 13:28:39 -0800 (PST)
Received: from grind.. ([177.189.53.31]) by smtp.gmail.com with ESMTPSA id
 k4-20020a0568301be400b0068d4649bedasm1473635otb.67.2023.03.03.13.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 13:28:39 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	danielhb413@gmail.com,
	peter.maydell@linaro.org
Subject: [PULL 0/5] ppc queue
Date: Fri,  3 Mar 2023 18:28:26 -0300
Message-Id: <20230303212831.830278-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 66577e9e1caee48c6ebc1a2161b5d9857fcde8b3:

  Merge tag 'for_upstream' of https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2023-03-03 13:35:54 +0000)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20230303

for you to fetch changes up to ddf0676f1ade90026483a91823d86db4096a40ef:

  pnv_phb4_pec: Simplify/align code to parent user-created PHBs (2023-03-03 16:50:17 -0300)

----------------------------------------------------------------
ppc patch queue for 2023-03-03:

This queue includes a stub implementation for the dcblc instruction to
avoid an illegal instrunction exception when using u-boot with mpc85xx.
It also includes a PHB fix with user-created pnv-phb devices and
Skiboot.

----------------------------------------------------------------
Bernhard Beschow (1):
      target/ppc/translate: Add dummy implementation for dcblc instruction

Frederic Barrat (4):
      pnv_phb4_pec: Keep track of instantiated PHBs
      pnv_phb4_pec: Only export existing PHBs to the device tree
      pnv_phb4_pec: Move pnv_phb4_get_pec() to rightful file
      pnv_phb4_pec: Simplify/align code to parent user-created PHBs

 hw/pci-host/pnv_phb.c          | 11 ++++++-
 hw/pci-host/pnv_phb4_pec.c     | 61 +++++++++++++++++++++++++++++++-----
 hw/ppc/pnv.c                   | 70 +++++-------------------------------------
 include/hw/pci-host/pnv_phb4.h |  3 ++
 include/hw/ppc/pnv.h           |  2 +-
 target/ppc/translate.c         |  9 ++++++
 6 files changed, 85 insertions(+), 71 deletions(-)

