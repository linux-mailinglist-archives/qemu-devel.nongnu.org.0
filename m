Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B02492592
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:18:26 +0100 (CET)
Received: from localhost ([::1]:46060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nRR-0004xr-6q
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:18:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nCB-0005zp-Op; Tue, 18 Jan 2022 07:03:56 -0500
Received: from [2a00:1450:4864:20::32b] (port=35357
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nC5-0005ih-KL; Tue, 18 Jan 2022 07:02:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso5289708wmj.0; 
 Tue, 18 Jan 2022 04:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PYwSQCgbWwHN18RRSE3TF7hUzh6EZtI/KZxU1I7jB/I=;
 b=eAZKCbJryMUng9/11+KzwrtHDVdWcoSoIfys0d8OR1TPg2HBh5bu6ycE7fG+uBG13F
 Qa61nxDnCX1SEupz+vOq4wp/wDihCKlzhcBQGwoa7wE+zHOjD+aSeublPjigPI8IuCmX
 d4XKR/K475EgMprOVFwAXmAEwX88coC+L3F4GPG/vHaQOaei0tyxHyMOR2tAquZvBFPo
 81KZHqGwopA2VodmETdowJ6YuGwrnu4kDpV45hdGsiY5kEOOQyCECk63xkKVDvXyNS16
 f0Fi86Duj5K44EdJMX/MnaVIuYi44ewnmgiwQwXaMLADcL41/JQTYsOZM25+nqbZXJXj
 lkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=PYwSQCgbWwHN18RRSE3TF7hUzh6EZtI/KZxU1I7jB/I=;
 b=lVWGbBDgpiyg4IErO2/cZOZqFQc8tc1ILrBfktKDiM0L5L3EiLTHa0SinLS6fWrBfG
 m6QSuv/TCX54+3/hykxLFy2ulaXifY+FHkonnxU+a4YH3AVFuuEYeAF1XKcHq+K0c0sQ
 LP7k16w4Chlq/gGWe/lcw++mCKCCAhVicq7TkWm1GzoiraJIZ1ASSZNj0vpiKQAnzLGm
 5nwXZJjQJpDkY6Ov4bhdToH22PeZiXzc6cTFH8Q3sF00uyzjwL+r9jxY6R00kIYHG1+t
 lgzs0auNiFx72d8KRXr8go2RZtkqoe5gKzQXALo89eP7ZKFGOJTdlrqiTnNL5Nq2r7Ay
 HGAg==
X-Gm-Message-State: AOAM532Pmoexih1IszXP1gKCYKXysAnVB5/XqCohWV9Ul1gd6dq/3sdp
 DWBD7URzlUQbmSONxtybFXRu0g7VCSs=
X-Google-Smtp-Source: ABdhPJy6637iaPTWDUBGdQ+UKAwqBN7jt271MZiUIRP7Y7Hm/Ka769mnZMUfSl/obZyrBdWRe6VZLA==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr23474336wri.193.1642507350862; 
 Tue, 18 Jan 2022 04:02:30 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 a6sm16163567wrq.22.2022.01.18.04.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:02:30 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 00/19] Memory API patches for 2022-01-18
Date: Tue, 18 Jan 2022 13:02:10 +0100
Message-Id: <20220118120229.196337-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

The following changes since commit 6621441db50d5bae7e34dbd04bf3c57a27a71b32:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20220115' into staging (2022-01-16 20:12:23 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/memory-api-20220118

for you to fetch changes up to 9d696cd50442327fd71ec7309e7b0c6fee693b1d:

  docs/devel: add some clarifying text for aliases (2022-01-18 12:56:29 +0100)

----------------------------------------------------------------
Memory API patches

- Directly dispatch MemoryRegion alias accesses
- Remove duplicated Address Space information in 'info mtree'
- Cleanups around memory_region_is_mapped()
- Fix incorrect calls of log_global_start/stop()
- Use dma_addr_t type definition when relevant
- Let dma_buf_read() / dma_buf_write() propagate MemTxResult
- Clarify MemoryRegion aliases documentation

----------------------------------------------------------------

Alex Bennée (1):
  docs/devel: add some clarifying text for aliases

David Hildenbrand (3):
  machine: Use host_memory_backend_is_mapped() in
    machine_consume_memdev()
  memory: Make memory_region_is_mapped() succeed when mapped via an
    alias
  memory: Update description of memory_region_is_mapped()

Peter Xu (1):
  memory: Fix incorrect calls of log_global_start/stop

Philippe Mathieu-Daudé (14):
  memory: Directly dispatch alias accesses on origin memory region
  memory: Split mtree_info() as mtree_info_flatview() + mtree_info_as()
  memory: Have 'info mtree' remove duplicated Address Space information
  stubs: Restrict fw_cfg to system emulation
  hw/nvram: Restrict fw_cfg QOM interface to sysemu and tools
  hw/pci: Restrict pci-bus stub to sysemu
  hw/pci: Document pci_dma_map()
  hw/dma: Remove CONFIG_USER_ONLY check
  hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len' argument
  hw/scsi: Rename SCSIRequest::resid as 'residual'
  hw/dma: Fix format string issues using dma_addr_t
  hw/dma: Move ScatterGatherEntry / QEMUSGList declarations around
  hw/dma: Use dma_addr_t type definition when relevant
  hw/dma: Let dma_buf_read() / dma_buf_write() propagate MemTxResult

 docs/devel/memory.rst  |  14 +--
 hw/rdma/rdma_utils.h   |   2 +-
 include/exec/memory.h  |   4 +-
 include/hw/pci/pci.h   |  12 +++
 include/hw/scsi/scsi.h |   4 +-
 include/sysemu/dma.h   |  31 ++++---
 hw/core/machine.c      |   2 +-
 hw/ide/ahci.c          |  10 +--
 hw/nvme/ctrl.c         |   6 +-
 hw/rdma/rdma_utils.c   |  14 +--
 hw/scsi/megasas.c      |  85 ++++++++++++------
 hw/scsi/scsi-bus.c     |  12 +--
 hw/scsi/scsi-disk.c    |   4 +-
 softmmu/dma-helpers.c  |  34 +++----
 softmmu/memory.c       | 200 +++++++++++++++++++++++++++++------------
 hw/nvram/meson.build   |   6 +-
 hw/rdma/trace-events   |   2 +-
 stubs/meson.build      |   4 +-
 18 files changed, 291 insertions(+), 155 deletions(-)

-- 
2.34.1


