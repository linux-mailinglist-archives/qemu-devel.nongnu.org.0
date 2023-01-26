Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0577467C43D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 06:25:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKulF-000633-Dv; Thu, 26 Jan 2023 00:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKulD-00062k-Qv
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:25:19 -0500
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pKulB-0008MU-Lu
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 00:25:19 -0500
X-IronPort-RemoteIP: 209.85.219.72
X-IronPort-MID: 252273453
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7oYtuK/RlbaQpJb+DwLbDrUDPXyTJUtcMsCJ2f8bNWPcYEJGY0x3m
 2ZKXzvXbKqINGf9eYtyPouw8xkC68LWzYBlHABurCAxFiIbosf7XuiUfxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yI6jeTQHOGU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNLg06/gEk35q+q4WlG5gVWic1j5zcyqVFEVPrzGonsdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVHmZkh+AsBOsTAbzsAG6ZvXAdJHAathZ5RlqPgqo
 DlFncTYpQ7EpcQgksxEO/VTO3gW0aGrZNYriJVw2CCe5xSuTpfi/xlhJEQGD6wpqsNROl5xy
 78dMi1dcT6FgMvjldpXSsE07igiBMziPYdao285iD+GV7ApRpfMR6iM7thdtNsyrpoWTLCOO
 oxDMGspM06ojx5nYz/7DLo3mPeuimPXeSAepV6IzUYyyzKOllYui+Swa7I5fPSpSO90rkK8m
 1jdvH2pBDM0bPW10hyKpyfEaujn2HmTtJgpPKS18+MvjFCNy2g7DhoQWl2m5/6jhSaDt8l3L
 kUV/m83s/F3+hPxCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:PCZBya90mEKt1qk3Lcxuk+AOI+orL9Y04lQ7vn2ZhyYlFvBw8P
 re4MjzsCWftN9/YgBHpTntAtjjfZqYz+8P3WBzB8beYOCZghrQEGgK1+KLqEyCJ8S9zJ8m6U
 4JSchD4bbLfD9HZKjBkWyFOudl6vW8tI6Tucfi40FEcTxKApsQkDuRyTz2LqS1fmR77FYCeq
 Z0nvA33wZIsE55D/iGOg==
Received: from mail-qv1-f72.google.com ([209.85.219.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jan 2023 00:25:13 -0500
Received: by mail-qv1-f72.google.com with SMTP id
 j12-20020a056214032c00b0053782e42278so171641qvu.5
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 21:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykJeQRTFAEO+rqm5i63fQBnRe0PX7SJNCz89jYNpgLY=;
 b=iH5korafuMe/td2I7UKGpxRSOnESpsCYqJGviMZ23milrSTvRqLIQhrimliGJCR81X
 2qqmxOKNSv6DPJ2nMsVDEPqYUyX9t2qdbpBb8FUOfjZg4MZl9sIKEFFiVLb8ke+LzfaA
 Ui3r1faCfjMnkbBm+1L0RDBaOkvTOyodO3X9hCyvyIQq2PA0CCeNWsKW7PrvQxn+jtJI
 c6//KDepnHHBDaTIGc6DS9J2m0Nx8Qvnly1RGVab8D6ZRQJfE9BsH3Dp10zpscZNkOiw
 zNm55jLcIB4RiyCqJHn5kgXVW0BUKw9PcljLmyWDMrOKPZuBKyGK+xJhzrKISG6p2hR0
 bzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ykJeQRTFAEO+rqm5i63fQBnRe0PX7SJNCz89jYNpgLY=;
 b=VLAoar3lOVal8JNLSWxcMhxZcwoMOf0+Q1zSdpZ6E1U3shNs2plMfhfmd3g20AJOTT
 9am7zm5dQnaFnua+lrf88/KIlCpR5yI8an30n/qCpoXTn5tD/bH0d+SL604OS0iMf13u
 +nRsY7si5fn3u+wdpK95xQ1EToAGzcRJ9MuLlsdHow9LuWjsiRVDT9zHP8OwXrpE3OLr
 yM4iorgEOud+1y0M1zhc9nqA0drmt3pUBmJOLNIO3BEejaifoMHrw7RoVMjQLLYcBX0l
 04WMPrDeG6kmJvhQv4KH4VQYy+CVHn4uls8IajXtpaQBYDOLRcQ1WemrInfoTZdSzA0I
 sfEQ==
X-Gm-Message-State: AO0yUKXt6QPMpwJxVARWsi/HAvPtxrUPDqXWOfc/DDGz3hsAL6JwnZGD
 P2whl05d0j3o8EsJC/jRCjS+HdLFf2yajYhoLln23wvJtuD0vphuOBGrptoXbDDoGtLkGPmj72k
 ET24Sg5yCEwfFZ+GMjYgSqcsnANs5rg==
X-Received: by 2002:ac8:5f10:0:b0:3b6:438e:d5ba with SMTP id
 x16-20020ac85f10000000b003b6438ed5bamr9570119qta.35.1674710711488; 
 Wed, 25 Jan 2023 21:25:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9AjcF3DQH7g0WBiqNUD+8m1OQvJ98+VpzaEylbDn7LjHBtlYzI2sMnPRd+TeLGfm+XDE5lYw==
X-Received: by 2002:ac8:5f10:0:b0:3b6:438e:d5ba with SMTP id
 x16-20020ac85f10000000b003b6438ed5bamr9570084qta.35.1674710711142; 
 Wed, 25 Jan 2023 21:25:11 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a0a5000b00706aeebe71csm329432qka.108.2023.01.25.21.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 21:25:10 -0800 (PST)
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
Subject: [PATCH v5 1/4] memory: prevent dma-reentracy issues
Date: Thu, 26 Jan 2023 00:24:44 -0500
Message-Id: <20230126052447.572504-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126052447.572504-1-alxndr@bu.edu>
References: <20230126052447.572504-1-alxndr@bu.edu>
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

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/hw/qdev-core.h |  7 +++++++
 softmmu/memory.c       | 17 +++++++++++++++++
 softmmu/trace-events   |  1 +
 3 files changed, 25 insertions(+)

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
index e05332d07f..daffb48493 100644
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


