Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7602B611AC7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:19:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUrA-0001gs-QW; Fri, 28 Oct 2022 15:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUr8-0001g6-Ji
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:26 -0400
Received: from esa10.hc2706-39.iphmx.com ([216.71.140.198])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUr5-00031O-QU
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:26 -0400
X-IronPort-RemoteIP: 209.85.166.200
X-IronPort-MID: 235579293
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:z9sd96tjiB1rCFDcPCN9IDVsqufnVORcMUV32f8akzHdYApBsoF/q
 tZmKTiDOv+KMTD1fY0lO4Sy90tVucCDx9dmTgNr/3sxEiwT9ZOVVN+UEBzMMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNJg06/gEk35q6r4GlI5gdWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJAIdGokFxscwPX5f2
 PUGKSkwRQyCif3jldpXSsE07igiBMziPYdau3U5iD+DVa5gTpfETKHHo9Rf2V/chOgURaeYN
 5dfMGQxKk6YO3WjOX9OYH46tO6sln/zaRVStRSYqbdfD237llcsjee8aouOEjCMbehWm2eIi
 k/rxjy6DRUxBtOn7QGD/G3504cjmgu+Aur+DoaQ7/NvnRify3IeDDUQUl20p+T/jVSxM++zM
 GQR8ysq6Kk2rQmlFIGlGRK/p3GAs1gXXN84//AG1TxhA5H8u26xblXohBYaADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:o6yudKi+ay339+FYna0SUpiRiXBQXrUji2hC6mlwRA09TyX4ra
 CTdZsgvyMc5Ax9ZJhCo7G90cu7Lk80nKQdieIs1NyZMjUO1lHFEL1f
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 15:17:14 -0400
Received: by mail-il1-f200.google.com with SMTP id
 i8-20020a056e0212c800b002f9a4c75658so5780105ilm.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RsEApOYgJmSDnt3tpUpETyCg4QSWVIS3JX2hY7/l8vo=;
 b=B2cou2TgmMI99n7jCQ0EcFSES+ecBVorZXZjPnwsEJaptmojzrisoEG/XykxGNjrv8
 r/NfzIRIx4KXLDKeqj48cCa+b5o3HfIuZ0MFiG50101A1uoc2Lrwehr8+4uIjdwdTv2h
 /agwN/zuZgOnOO9UfGhNFZzD2XcjIokLBXvkYpUErB5qvNgBYdw5rC9pT/YZs/ilir56
 +n1DvFTTVIynV1mr90kbqdnLk7xkLSYPULeIXjMbKkw+5IkwpLdmZwJDo2Wm/+fRviMz
 9xnsy40V5azlSmr7h5Gbd8ASXJ++JMTClGPRE57YXESSjVwzDGt8kxU+d9RVKhRFfnC1
 /9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RsEApOYgJmSDnt3tpUpETyCg4QSWVIS3JX2hY7/l8vo=;
 b=PyAd76qQNHSzDbXgV/oEs5baaf7wE6YwMIRYkh1mK7hF+fUzVaeK3ZlxVCeRuEb+He
 9KPFe2QQGRHVlBcD45ZOffQggJC83B6ig32ul8RGxUr3Y09QXLoIugIaih3czefkd2ki
 K4rjdM0dNacu6CR3c5NBHimQopgC9qWvqKtRLZMDpmwGMqEeirGgc0rHp531q9x8v4kT
 LUehFvACKNZLf9IyNjz8pf2sslc30QsOZ5K62qQzaaSmxLNZSvAYFNK1IO/8URZ87Sl6
 G3SWlkBdo01kTXw+ukPAFGH5HJU7Ybis9fm6yQOyScSFbQGFYLGnZC3B4nxHDr1u9s+z
 g2CA==
X-Gm-Message-State: ACrzQf1QwM8php2iLkVhuInM9mmkpMF5CqEDuvUKvXlABkAWu+6+bZVt
 VXH+BvfsKJH/5Fb5sDMV6wnU0pceHPE5b9aGBIbo+m/k//vfCBJFj72X/2Pa6rpU8TUKoK9Ml3L
 lqm5Gd5i7qKEGSYnm9kkyd8gJHBvopg==
X-Received: by 2002:a5e:8517:0:b0:6c6:fbe7:1c0e with SMTP id
 i23-20020a5e8517000000b006c6fbe71c0emr489574ioj.95.1666984633563; 
 Fri, 28 Oct 2022 12:17:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49tQmmocWVYdn2xvfEQPX2dg2+wGStWGO3N10yBcyJrL0bS70QhG3GhAssHlFIfpI/dhUGoQ==
X-Received: by 2002:a5e:8517:0:b0:6c6:fbe7:1c0e with SMTP id
 i23-20020a5e8517000000b006c6fbe71c0emr489551ioj.95.1666984633323; 
 Fri, 28 Oct 2022 12:17:13 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056e021c0500b002fff117027dsm1878505ilh.13.2022.10.28.12.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 12:17:12 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v3 0/7] memory: prevent dma-reentracy issues
Date: Fri, 28 Oct 2022 15:16:41 -0400
Message-Id: <20221028191648.964076-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.198; envelope-from=alxndr@bu.edu;
 helo=esa10.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These patches aim to solve two types of DMA-reentrancy issues:

1.) mmio -> dma -> mmio case
To solve this, we track whether the device is engaged in io by
checking/setting a flag within APIs used for MMIO access.

2.) bh -> dma write -> mmio case
This case is trickier, since we dont have a generic way to associate a
bh with the underlying Device/DeviceState. Thus, this version introduces
a change to QEMU's DMA APIs to associate each request with the
origiantor DeviceState. In total, the affected APIs are used in
approximately 250 locations:

dma_memory_valid (1 usage)
dma_memory_rw (~5 uses)
dma_memory_read (~92 uses)
dma_memory_write (~71 uses)
dma_memory_set (~4 uses)
dma_memory_map (~18 uses)
dma_memory_unmap (~21 uses)
{ld,st}_{le,be}_{uw,l,q}_dma (~10 uses)
ldub_dma (does not appear to be used anywhere)
stb_dma (1 usage)
dma_buf_read (~18 uses)
dma_buf_write (~7 uses)

It is not trivial to mechanically replace all of the invocations:
For many cases, this will be as simple as adding DEVICE(s) to the
arguments, but there are locations where the code will need to be
slightly changed. As such, for now I added "_guarded" versions of most
of the APIs which can be used until all of the invocations are fixed.

The end goal is to go through all of hw/ and make the required changes
(I will need help with this). Once that is done, the "_guarded" APIs can
take the place of the standard DMA APIs and we can mecahnically remove
the "_guarded" suffix from all invocations.

These changes do not address devices that bypass DMA apis and directly
call into address_space.. APIs. This occurs somewhat commonly, and
prevents me from fixing issues in Virtio devices, such as:
https://gitlab.com/qemu-project/qemu/-/issues/827
I'm not sure what approach we should take for these cases - maybe they
should be switched to DMA APIs (or the DMA API expanded).

v2 -> v3: Bite the bullet and modify the DMA APIs, rather than
    attempting to guess DeviceStates in BHs.

Alexander Bulekov (7):
  memory: associate DMA accesses with the initiator Device
  dma-helpers: switch to guarded DMA accesses
  ahci: switch to guarded DMA acccesses
  sdhci: switch to guarded DMA accesses
  ehci: switch to guarded DMA accesses
  xhci: switch to guarded DMA accesses
  usb/libhw: switch to guarded DMA accesses

 hw/ide/ahci.c          | 16 +++++++++-------
 hw/sd/sdhci.c          | 43 ++++++++++++++++++++++--------------------
 hw/usb/hcd-ehci.c      |  8 ++++----
 hw/usb/hcd-xhci.c      | 24 +++++++++++------------
 hw/usb/libhw.c         |  4 ++--
 include/hw/qdev-core.h |  2 ++
 include/sysemu/dma.h   | 41 ++++++++++++++++++++++++++++++++++++++++
 softmmu/dma-helpers.c  | 15 ++++++++-------
 softmmu/memory.c       | 15 +++++++++++++++
 softmmu/trace-events   |  1 +
 10 files changed, 117 insertions(+), 52 deletions(-)

-- 
2.27.0


