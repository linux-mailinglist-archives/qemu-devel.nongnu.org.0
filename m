Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A46673229
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:10:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIOy5-0005T7-Kg; Thu, 19 Jan 2023 02:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOxc-0005K9-6s
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:03:44 -0500
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOxY-0000Ka-DK
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:03:43 -0500
X-IronPort-RemoteIP: 209.85.219.197
X-IronPort-MID: 250579176
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qm25vKP8lR4jREjvrR0blcFynXyQoLVcMsEvi/4bfWQNrUoig2cEz
 DAeUDqAbvveMGKhftl1aYvg/UgPuZfRx9BmSAZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656CEmjslkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimEc3l48sfrZ80s25aWq4Vv0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE5PBXDFEqNrEk4rxyGnxf9
 qweeWoKV0XW7w626OrTpuhEg80iKIz6NtpatCgxknfWCvEpRZ2FSKLPjTNa9G1o14YeQLCEP
 ptfMGswBPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvjCOk10oj+aF3Nz9f4WKY8pSt12kg
 V3dpFTrXUg5bfOhxm/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR6yB36KZrpRPtQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjNsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:TS1j6KBOWyB+vBnlHel655DYdb4zR+YMi2TDGXoBLSC9Ffbo6/
 xG+c5w6faaskd2ZJhNo6HjBEDEewKmyXcX2/htAV7dZniehILAFugLhvqA/9SjIVyFygc078
 ddmsNFebrN5DZB/KPHyTj9OfobhPe8zICUqdH380pNJDsaFJ2ILD0UNu9YKCBLrcV9a6bRbK
 DsnvavbgDOGEgqUg==
Received: from mail-yb1-f197.google.com ([209.85.219.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 02:03:38 -0500
Received: by mail-yb1-f197.google.com with SMTP id
 z17-20020a256651000000b007907852ca4dso1294740ybm.16
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLs7a7Ftr7qo3BjjTUcGQbWcDFtsi0J+OZS3/qg35qk=;
 b=ZEaXmUT0oisNOTb1d9/nvdptFJjUdKzUJAhBTHRJBDnuTMO/lB1ie8ZDSpZ/diCG+2
 NuK/1DnMDPoFy8WbcrDd9be36qlIyiciDU5/y2VETvI1kKFbznQgucDYpGscXr9IMppb
 lw2Umc9g8Qv1/2RinRWl0nxdJx48de+jxqymuwAiKQbj70wVB8AHoKKKLzkwBenqR8Y0
 NvziZbe7RPe0cu7astLOuown88TXmKf4xHZ1ln+kwHiB949fysOoeMwW7R+aECIsqMhw
 T/VNJlv8hzhUoZ7PJA2Sg3IX/EbKiZWZp61WDafpXeWu70C1HS0jICH9Rs96o5mmWuJt
 K6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLs7a7Ftr7qo3BjjTUcGQbWcDFtsi0J+OZS3/qg35qk=;
 b=bmaSfIws83ssNuWyo1y07b77SOSBna08CX+tAf8LfVEwTNEKYLnJnwhf5jQATp8dRl
 WNuZXOztc6e+/phwBWcdAwOiuIHnXH8XKl5ExMJuHT8dceH6mvZ9rGVd8FuY0JmpC5lx
 AFsiFUeP/m8q4wv5KVAkqWOqipTQVA1FeVEA1ssD12zygcQfIjc9Y6ntwlsiAktH1dw7
 pgAnrncz2fmWtMSkPD1e6w2zsjrG5+BmMYGLIkYMTecyD1yQIkrXiJlOCNR196gRWjTb
 yOf6jxbh4cF+79lhxr7oEHRhXlAHVo2fG2vNGb4vzHYjtEFTciratvuYeBdTX2S9mnlV
 pWKQ==
X-Gm-Message-State: AFqh2kpg+oq8mnJ9W8IadnzphpnWUdGLD3Dpua+NMSj/yMA1BPDSi5q6
 TmqFmU17cvsliB+Ar6VUwNsAjj740lCmBOqPW/akFeDT8wZTeFcqAzRiFSxBpVcLat5lYSa9dlD
 Nn3MfdDfuKeaWCU/jhjxxCXTR/XTsJg==
X-Received: by 2002:a25:d08b:0:b0:7b9:15c0:22e9 with SMTP id
 h133-20020a25d08b000000b007b915c022e9mr8057743ybg.21.1674111816317; 
 Wed, 18 Jan 2023 23:03:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuS3PWZ6duXyiqcprWo5W+4lvv1cTJZQ74VPBu5XLRbQ+xbwPdhxAsxAdQ8tgFZep4CGXgS6w==
X-Received: by 2002:a25:d08b:0:b0:7b9:15c0:22e9 with SMTP id
 h133-20020a25d08b000000b007b915c022e9mr8057717ybg.21.1674111815991; 
 Wed, 18 Jan 2023 23:03:35 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 az31-20020a05620a171f00b006fbbdc6c68fsm23714281qkb.68.2023.01.18.23.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:03:35 -0800 (PST)
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
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v4 1/3] memory: prevent dma-reentracy issues
Date: Thu, 19 Jan 2023 02:03:06 -0500
Message-Id: <20230119070308.321653-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119070308.321653-1-alxndr@bu.edu>
References: <20230119070308.321653-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_MSPIKE_H2=-0.001,
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
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/hw/qdev-core.h |  7 +++++++
 softmmu/memory.c       | 15 +++++++++++++++
 softmmu/trace-events   |  1 +
 3 files changed, 23 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 35fddb19a6..8858195262 100644
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
index e05332d07f..90ffaaa4f5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -533,6 +533,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     uint64_t access_mask;
     unsigned access_size;
     unsigned i;
+    DeviceState *dev = NULL;
     MemTxResult r = MEMTX_OK;
 
     if (!access_size_min) {
@@ -542,6 +543,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    /* Do not allow more than one simultanous access to a device's IO Regions */
+    if (mr->owner &&
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
+        if (dev->mem_reentrancy_guard.engaged_in_io) {
+            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+            return MEMTX_ERROR;
+        }
+        dev->mem_reentrancy_guard.engaged_in_io = true;
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -556,6 +568,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                         access_mask, attrs);
         }
     }
+    if (dev) {
+        dev->mem_reentrancy_guard.engaged_in_io = false;
+    }
     return r;
 }
 
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


