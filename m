Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A492B6B711B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:26:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdUH-0000uB-Ba; Mon, 13 Mar 2023 04:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdUF-0000tr-Ab
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:24:55 -0400
Received: from esa5.hc2706-39.iphmx.com ([216.71.137.63])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pbdUD-0000Fi-Dz
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:24:55 -0400
X-IronPort-RemoteIP: 209.85.222.200
X-IronPort-MID: 276363307
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BOQOBKOGkK1Gp0vvrR0blcFynXyQoLVcMsEvi/4bfWQNrUpx1jRWn
 zQcUGnSPP2PYjDyfYpyPtvkoEtT6J/Xz9djQAZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656yEnj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjim4c3l48sfrZ80s05a+q4lv0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TEweppUHFsEYgkouNzKEFj3
 vImDQlXYUXW7w626OrTpuhEg80iKIzyP9patCs4lXfWCvEpRZ2FSKLPjTNa9G1o14YeQLCEP
 ZBfM2I3BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvDaIklcqiOeF3Nz9QdrNXtwPm2ui4
 X+B0mH7GiMWBOSN8G/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4yl36KZorBTtQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjFsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:ljHUEavc7r4B2uyYSUBQHDQ+7skDoNV00zEX/kB9WHVpmwKj5q
 STdZMgpGPJYVMqMk3I9urwXpVoLUmsl6KdpLNhRotKPzOWxVdAUrsSlLcKqgeIc0aOldK1l5
 0QCZSWYOeRMbEQt7ec3ODXKadE/PC3tIqFv6Px9UtMcC1dQ51czm5Ce3mm+45NKDWux6BVKH
 NR3KR6TkKbCAwqhw2AaRg4Y9Q=
Received: from mail-qk1-f200.google.com ([209.85.222.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Mar 2023 04:24:44 -0400
Received: by mail-qk1-f200.google.com with SMTP id
 o9-20020a05620a228900b0074585d47b77so901272qkh.0
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678695881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CSBiTaU29mfOM7fcf75/cx2KDjNGXwwMUJE2RxqvuY0=;
 b=WLmiPSIuSg16pch3q/N6mo3XzSMPKKK7yEfaPAIFmCknNE3FtnFhiIalryny6YuGU6
 /glJsTK1xnuzZWzx7kHjjSeARtBMMW8GLes74Eph41230tIVSbvoD+esEAMqKc4AZ04u
 qkNIskld4DtLMeliJoPzzU0WuK95/FuaA+vOWhLKDOvYnjf6SOmksCWMcALXQRk3/m5r
 WYMmEDIajcGKjsl6yZn0NZdLJnXfZDerarh+J9gioe+m8RHd/x0b9dYq0Iot6BE1DFiQ
 fdu9vVsnfSMg8APlkVLfCxh8PVk6kQ4NZSSzn1dt+jXuipoB1v8UgGAw5XZWvWTfF59P
 hfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678695881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CSBiTaU29mfOM7fcf75/cx2KDjNGXwwMUJE2RxqvuY0=;
 b=F+hLfYGLsFpQW08rizu+OxhynjfmfNeP7fZtVlbMkclzT4Z3zknpT2w30HdHOVXIso
 NFO0URzEjq9jpFDYVSsx4jRYGSoc+cDBgjEMs+GC6Eik7GqdExTdngXRr+hUkFjvSiaJ
 Cd63fVBqPVT8lXe9fEnzgJ4JN1Yy6WX6O07lXtXy65kTcq0aHO/KOl3ShqrzGmgwNp+i
 mHIRpC56Eb53Kl+lT0x0FSxbzLp+pD1SoZC9STBVK/bNC+1ZH+SWqwSB0feQc4Ijc9F3
 s8nQRoBVmSlS4nMXRMuJ5KNiFAWpBPWmDDax2nbETLa/8i8Kb29EuxzJOanq3i8cGjbS
 j57g==
X-Gm-Message-State: AO0yUKVuRct+4rNrW1G8Uqiifss4kiFhd35xI3hNskf1hD+jrucAXjfg
 ciFbSe4TgqZ/L6AlX359uyapDph1x3wbfZt78N0n3z5/0sYQRem+izFjw3XiVpQDbS566JDrTyr
 uB3WuswGsEUlt5AsCd6tEodjZ6BeZpwUo7yilcEKfVdA=
X-Received: by 2002:a05:6214:48e:b0:56e:a4c5:9d9d with SMTP id
 pt14-20020a056214048e00b0056ea4c59d9dmr12672888qvb.22.1678695881630; 
 Mon, 13 Mar 2023 01:24:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set8M7KuOsOtPqzU0mJFUTf/ug2PuTsJGn+hLfQJ8FmCKXETioyaiyuJRX9iVWGdXpaHtMf3UcQ==
X-Received: by 2002:a05:6214:48e:b0:56e:a4c5:9d9d with SMTP id
 pt14-20020a056214048e00b0056ea4c59d9dmr12672863qvb.22.1678695881340; 
 Mon, 13 Mar 2023 01:24:41 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 131-20020a370789000000b00742a252ba06sm4910772qkh.135.2023.03.13.01.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 01:24:41 -0700 (PDT)
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
Subject: [PATCH v7 1/6] memory: prevent dma-reentracy issues
Date: Mon, 13 Mar 2023 04:24:12 -0400
Message-Id: <20230313082417.827484-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230313082417.827484-1-alxndr@bu.edu>
References: <20230313082417.827484-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.63; envelope-from=alxndr@bu.edu;
 helo=esa5.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Acked-by: Peter Xu <peterx@redhat.com>
---
 include/hw/qdev-core.h |  7 +++++++
 softmmu/memory.c       | 17 +++++++++++++++++
 softmmu/trace-events   |  1 +
 3 files changed, 25 insertions(+)

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
index 4699ba55ec..57bf18a257 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -533,6 +533,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     uint64_t access_mask;
     unsigned access_size;
     unsigned i;
+    DeviceState *dev = NULL;
     MemTxResult r = MEMTX_OK;
 
     if (!access_size_min) {
@@ -542,6 +543,19 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    /* Do not allow more than one simultanous access to a device's IO Regions */
+    if (mr->owner &&
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
+        if (dev) {
+            if (dev->mem_reentrancy_guard.engaged_in_io) {
+                trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+                return MEMTX_ERROR;
+            }
+            dev->mem_reentrancy_guard.engaged_in_io = true;
+        }
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -556,6 +570,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
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


