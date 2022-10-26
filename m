Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131B60D894
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 02:50:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onUbI-0002OJ-Kv; Tue, 25 Oct 2022 20:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1onUb1-000217-9H
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:48:46 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1onUay-0003Tv-Sh
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 20:48:38 -0400
Received: by mail-qk1-x743.google.com with SMTP id b25so9499317qkk.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 17:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9pRJ+Cja9hGKvP9Uv81zKjO1XrsOT/gV10dj8HPGULI=;
 b=OUHzed6BTa1Vii+0mF+dyAQPkqwQz9PUyKz+jFraAJaz4Hlxa7WCTfOya5IHrXdMqQ
 7y3RGAK/5x6lOppqxoGsJbDFmbBcPXvqv3Y+mjO/FuIDxKXUwq257dINXNW7nmI8iW3j
 TQEQ0inBOEQYRsr4heEoCXskUHM2aY+PKSz2VXwKjdnc3oOsQ7V004oy7hJhvNGVRj3X
 HNOMbNubbe4U+cgWu2MN6kJzIiIC+ZMKyMJGAi5ALcOXuYGhiz0uefjnEhUTfXSZy5t5
 GJrNwMa3PPqBeE1a1Vs80syUSdLxzohFUK1dMBlbbr+7sTiw4gpKTSDtEqRWcV+m7t5g
 fvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9pRJ+Cja9hGKvP9Uv81zKjO1XrsOT/gV10dj8HPGULI=;
 b=MoYUWNzOLPkq/+ZRp+7XYawTJzz97OVDIV6g2KkiH7NZSpy65l77bMNa8nG50bpfuB
 eqM5zMRPTx9Ed2i0gZf5w6PQRWb9U/csWvkmkIRDbtMOk/2lAqmaXPEDmEm4Eg3i//9y
 b2KD9CmRv2HpbJMr/XjrZlM6rEKfz0Z5Gsav+b82ZnKYHrq+N+pNVHgMM7m7X4tfSjhB
 b0UJncrmMaWhl+IlFn7X/jWS3RRiKNDilSIFSOxP2Omud0L0KdAbOnlHN4XOceAzpeDP
 TBaoVVLo978Myz4i8+YFQ0zrcE14eaQLo4pKdljexiugQX1hB+8HMw0dFVKizxGAok0M
 0wfg==
X-Gm-Message-State: ACrzQf0hX9UOv96O5PkMCLIR4XsaEFbdnfS3Inj6C6vnwxyioTrEBqMr
 NAW1PhG01TgM2gbb4EfUkzVp444Uyw==
X-Google-Smtp-Source: AMsMyM7/Q/kn4Ts0Em/8Uuw1vWpdkIYCyjwK4MQvuKnFzD3/UIcjSbYjIIFMYVBxnj909hHuPIZBeQ==
X-Received: by 2002:a05:620a:c4f:b0:6cf:33cd:2bc9 with SMTP id
 u15-20020a05620a0c4f00b006cf33cd2bc9mr29455547qki.99.1666745310325; 
 Tue, 25 Oct 2022 17:48:30 -0700 (PDT)
Received: from fedora.mshome.net (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 j15-20020ac8550f000000b0039a610a04b1sm2408651qtq.37.2022.10.25.17.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 17:47:58 -0700 (PDT)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org
Cc: jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org, mst@redhat.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [PATCH 0/4 v3] Multi-Region and Volatile Memory support for CXL
 Type-3 Devices
Date: Tue, 25 Oct 2022 20:47:33 -0400
Message-Id: <20221026004737.3646-1-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qk1-x743.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Submitted as an extention to the multi-feature branch maintained
by Jonathan Cameron at:
https://gitlab.com/jic23/qemu/-/tree/cxl-2022-10-24 


Summary of Changes:
1) E820 CFMW Bug fix.  
2) Add CXL_CAPACITY_MULTIPLIER definition to replace magic numbers
3) Multi-Region and Volatile Memory support for CXL Type-3 Devices
4) CXL Type-3 SRAT Generation when NUMA node is attached to memdev


Regarding the E820 fix
  * This bugfix is required for memory regions to work on x86
  * input from Dan Williams and others suggest that E820 entry for
    the CFMW should not exist, as it is expected to be dynamically
    assigned at runtime.  If this entry exists, it instead blocks
    region creation by nature of the memory region being marked as
    reserved.

Regarding Multi-Region and Volatile Memory
  * Developed with input from Jonathan Cameron and Davidlohr Bueso.

Regarding SRAT Generation for Type-3 Devices
  * Co-Developed by Davidlohr Bueso.  Built from his base patch and
    extended to work with both volatile and persistent regions.
  * This can be used to demonstrate static type-3 device mapping and
    testing numa-access to type-3 device memory regions.


This series brings 3 features to CXL Type-3 Devices:
    1) Volatile Memory Region support
    2) Multi-Region support (1 Volatile, 1 Persistent)
    3) (optional) SRAT Entry generation for type-3 device regions

In this series we implement multi-region and volatile region support
through 7 major changes to CXL devices
    1) The HostMemoryBackend [hostmem] has been replaced by two
       [hostvmem] and [hostpmem] to store volatile and persistent
       memory respectively
    2) The single AddressSpace has been replaced by two AddressSpaces
       [hostvmem_as] and [hostpmem_as] to map respective memdevs.
    3) Each memory region size and total region are stored separately
    4) The CDAT and DVSEC memory map entries have been updated:
       a) if vmem is present, vmem is mapped at DPA(0)
       b) if pmem is present
          i)  and vmem is present, pmem is mapped at DPA(vmem->size)
          ii) else, pmem is mapped at DPA(0)
       c) partitioning of pmem is not supported in this patch set but
          has been discussed and this design should suffice.
    5) Read/Write functions have been updated to access AddressSpaces
       according to the mapping described in #4
    6) cxl-mailbox has been updated to report the respective size of
       volatile and persistent memory regions
    7) SRAT entries may optionally be generated by manually assigning
       memdevs to a cpuless numa node

To support the Device Physical Address (DPA) Mapping decisions, see
CXL Spec (3.0) Section 8.2.9.8.2.0 - Get Partition Info:
  Active Volatile Memory
    The device shall provide this volatile capacity starting at DPA 0
  Active Persistent Memory
    The device shall provide this persistent capacity starting at the
    DPA immediately following the volatile capacity

Partitioning of Persistent Memory regions may be supported on
following patch sets.


Gregory Price (4):
  hw/i386/pc.c: CXL Fixed Memory Window should not reserve e820 in bios
  hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
  hw/cxl: Multi-Region CXL Type-3 Devices (Volatile and Persistent)
  hw/acpi/cxl.c: Fill in SRAT for vmem/pmem if NUMA node is assigned

 docs/system/devices/cxl.rst |  74 ++++++++--
 hw/acpi/cxl.c               |  67 +++++++++
 hw/cxl/cxl-mailbox-utils.c  |  23 +--
 hw/i386/acpi-build.c        |   4 +
 hw/i386/pc.c                |   2 -
 hw/mem/cxl_type3.c          | 274 +++++++++++++++++++++++++++---------
 include/hw/acpi/cxl.h       |   1 +
 include/hw/cxl/cxl_device.h |  11 +-
 tests/qtest/cxl-test.c      | 111 +++++++++++----
 9 files changed, 443 insertions(+), 124 deletions(-)

-- 
2.37.3


