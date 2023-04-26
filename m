Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B93D6EF853
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:22:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhuJ-0003u3-9w; Wed, 26 Apr 2023 12:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhuH-0003q4-Jl
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:22:13 -0400
Received: from esa6.hc2706-39.iphmx.com ([216.71.137.79])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhuE-00062o-QT
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:22:12 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 278852838
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1hWYx6l17Ck4pqBo183zWdvo5gw+JERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLXm6OPv6IM2Pyf4gkaom/8h4O6MDVnNZkSAU++SpmFS4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tE5AJmP5ingXeF/5UrJMNHTU2OByagKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0xK6aYD76vRxjnVaPpIACRYpQRw/ZwNlPjxG4
 I4lWZSYEW/FN0BX8QgXe0Aw/ypWZMWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eIKYz18tSPlN18
 98dMiEONw28hv256efuIgVsrpxLwMjDOYoevjR502icA6l/B5/ERKrO6JlT2zJYasJmR66PI
 ZpEL2A2PVKfOnWjOX9OYH46tO6sln/zaRVStRSYqbdfD237llMhgOW3YIGFEjCMbZh3gVvH+
 0Dew0fgCDoCM5+V9zeIy1v504cjmgu+Aur+DoaQ7/NvnRify3IeDDUQUl20p+T/jVSxM++zM
 GQR8ysq6LEsrQmlEYC7UBq/r3qJ+BUbXrK8DtEH1e1E8YKMiy7xO4TOZmUQOLTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:QF4mJano4Ss5RjVmDrk7b5VfpGjpDfIi3DAbv31ZSRFFG/Fw9v
 re+8jzsCWftN9/YhAdcLy7V5VoIkmsl6Kdg7NhWYtKNTOO0AeVxedZnOjfKlXbcBEWndQy6U
 4PSchD4Y3LYGSTz67BkWyFL+o=
X-Talos-CUID: 9a23:mijpKm/axRWBGAkBWwGVv1M/Me0IV0Lv93HzJlWpCj90d7yKRnbFrQ==
X-Talos-MUID: 9a23:zohsCgh/fmOMD1d8Ds9Pk8MpaeV3/vvzKlgxsowMkNGDdiZONjqkpWHi
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 12:20:01 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-5ef5e31f3f5so47282106d6.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682526000; x=1685118000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIPG2iyayBlt4p6H01QYAbvbIBO5K/+RNbOuzH/t0Fs=;
 b=XbuXcj6P9eeh6mj+PCo2MViD46uk0CxUC2ZBJHdlnleJBjw8/L68YonOm1Mm9vmrSV
 KGtJK6rjp8b88dVGHjZZuVCkUxd2hJjMwHGiMzubpqeUq8dzJAt5dn/akqv1YhefxN44
 k4iYCfki/eJPMZmwQdJLUlM/g6tBowvV2eMTb5gtAR9DqZf8JjnFZlgMhbMHDfx1PAp/
 ZW9BWY9KdfsbPjvhs9T9LJpPuGq6Hki8lVXJdYo1cwDEIT3Jo/Zl//Pau/2LE4XxAMr7
 OOihpT/9y5UIA8GexMTNS/O2ujhRpOugwPmSN4/asvC04kuAfwW/ttimV3j1sF+iktub
 ZfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526000; x=1685118000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIPG2iyayBlt4p6H01QYAbvbIBO5K/+RNbOuzH/t0Fs=;
 b=CpxNv+8Ft7zlaSfxx28MUJh57M/d+M0o2coaAZ7rY7B7iEbogc/Gs2ZyXwI5qEDxe8
 9HyyeSJvQwOKC49KusHzWNxwZEjpsWyLDblBYDrbTQfoYRNb10yg9plkFLFbrJ1Ibtc3
 YivVwl1DwfHDyoJEX0zI1fxLX02Vgsyt+XcTXrR6D8IyC0IQTDGRfzpw1pg/cJ4+PdL/
 0kj93WEpVhSq3gdPbL3GL16X7aoZPSb3Lx6rgKDx0OzAYWVDZz+rTuqb3pLkX2phIOPC
 2MLMbktlp761rdL3nENPGTjyHO5UTHzmTNynU3y1Ws4bU2bgFXRX2cew7e8zahTneopJ
 rM9Q==
X-Gm-Message-State: AAQBX9eN7lWvTRpaiuN6f7IOeVqyr7rWPG5OiScv8v+UQScFqyCJXiR4
 Dw0hJ2iD6R8ykn0zHc1bE9BSZeJmyDPo1fLlCYSuHUsUP5AB39Ke9AaXUkb6fIoNAI5lynfJYp8
 uBtcnjvyeupat/TWymOPQHQwewVVu3FIk2dMPtldISqY=
X-Received: by 2002:a05:6214:da1:b0:5ee:a282:d38e with SMTP id
 h1-20020a0562140da100b005eea282d38emr40169104qvh.10.1682526000661; 
 Wed, 26 Apr 2023 09:20:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZfSboGfnlCQARBsmZy+n2/aCxVP4eWny8aIGwdSNNPuSvCfkoIx5GHCDJ7mR/YtCwF/U+hdg==
X-Received: by 2002:a05:6214:da1:b0:5ee:a282:d38e with SMTP id
 h1-20020a0562140da100b005eea282d38emr40169054qvh.10.1682526000317; 
 Wed, 26 Apr 2023 09:20:00 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a0ce1c2000000b005e95c46e42asm4963544qvl.74.2023.04.26.09.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:20:00 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH v9 1/8] memory: prevent dma-reentracy issues
Date: Wed, 26 Apr 2023 12:19:44 -0400
Message-Id: <20230426161951.2948996-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230426161951.2948996-1-alxndr@bu.edu>
References: <20230426161951.2948996-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.79; envelope-from=alxndr@bu.edu;
 helo=esa6.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
This flag is set/checked prior to calling a device's MemoryRegion
handlers, and set when device code initiates DMA.  The purpose of this
flag is to prevent two types of DMA-based reentrancy issues:

1.) mmio -> dma -> mmio case
2.) bh -> dma write -> mmio case

These issues have led to problems such as stack-exhaustion and
use-after-frees.

Summary of the problem from Peter Maydell:
https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
Resolves: CVE-2023-0330

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/exec/memory.h  |  5 +++++
 include/hw/qdev-core.h |  7 +++++++
 softmmu/memory.c       | 14 ++++++++++++++
 softmmu/trace-events   |  1 +
 4 files changed, 27 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 15ade918ba..e45ce6061f 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -767,6 +767,8 @@ struct MemoryRegion {
     bool is_iommu;
     RAMBlock *ram_block;
     Object *owner;
+    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR access hotpath */
+    DeviceState *dev;
 
     const MemoryRegionOps *ops;
     void *opaque;
@@ -791,6 +793,9 @@ struct MemoryRegion {
     unsigned ioeventfd_nb;
     MemoryRegionIoeventfd *ioeventfds;
     RamDiscardManager *rdm; /* Only for RAM */
+
+    /* For devices designed to perform re-entrant IO into their own IO MRs */
+    bool disable_reentrancy_guard;
 };
 
 struct IOMMUMemoryRegion {
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bd50ad5ee1..7623703943 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -162,6 +162,10 @@ struct NamedClockList {
     QLIST_ENTRY(NamedClockList) node;
 };
 
+typedef struct {
+    bool engaged_in_io;
+} MemReentrancyGuard;
+
 /**
  * DeviceState:
  * @realized: Indicates whether the device has been fully constructed.
@@ -194,6 +198,9 @@ struct DeviceState {
     int alias_required_for_version;
     ResettableState reset;
     GSList *unplug_blockers;
+
+    /* Is the device currently in mmio/pio/dma? Used to prevent re-entrancy */
+    MemReentrancyGuard mem_reentrancy_guard;
 };
 
 struct DeviceListener {
diff --git a/softmmu/memory.c b/softmmu/memory.c
index b1a6cae6f5..af9365bb81 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -542,6 +542,16 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    /* Do not allow more than one simultaneous access to a device's IO Regions */
+    if (mr->dev && !mr->disable_reentrancy_guard &&
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
+            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+            return MEMTX_ACCESS_ERROR;
+        }
+        mr->dev->mem_reentrancy_guard.engaged_in_io = true;
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -556,6 +566,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                         access_mask, attrs);
         }
     }
+    if (mr->dev) {
+        mr->dev->mem_reentrancy_guard.engaged_in_io = false;
+    }
     return r;
 }
 
@@ -1170,6 +1183,7 @@ static void memory_region_do_init(MemoryRegion *mr,
     }
     mr->name = g_strdup(name);
     mr->owner = owner;
+    mr->dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
     mr->ram_block = NULL;
 
     if (name) {
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 22606dc27b..62d04ea9a7 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, u
 memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
 memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
+memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" size %u"
 memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
-- 
2.39.0


