Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096BE67320F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 08:03:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIOvD-00073q-QK; Thu, 19 Jan 2023 02:01:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOuc-0006a8-4x
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:00:38 -0500
Received: from esa6.hc2706-39.iphmx.com ([216.71.137.79])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pIOuS-0008Eo-N0
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 02:00:37 -0500
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 256113964
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PqFUUqiVkXwgXaIRQdxUCXttX1613RIKZh0ujC45NGQN5FlHY01je
 htvDWmFaPqJajTyeo9/bo3jo0hSsJ7UnYNrSwtq+HxhFyMW8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5wVvPakjUGL2zBH5MrpOfcldEFOlGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiM+t5qK23CulQRrukoPD8fwXG8M49m/c3Gd/
 /0W3XC4YV9B0qQhA43xWTEBe811FfQuFLMqvRFTGCFcpqHLWyKE/hlgMK05FdY/08hOHVBzy
 b8VOjAMZyHEpNCd2IvuH4GAhux7RCXqFIYWu3Ul1C+ASPh4ENbMRKLF4dIe1zA17ixMNayGN
 oxJNHw1NUWGPUwn1lQ/UfrSmM+hgmn5fydwok/TqKYqi4TW5FYsjuG0a4uLJrRmQ+1QmVfGo
 WnZzVjiOQsFa/Ck1GXU8i6F07qncSTTHdh6+KeD3udnhUDWymENBRk+U1y9rv+kzEmkVLpix
 1c8/yMvqe0r6hXuQIesGRK/p3GAs1gXXN84//AG1TxhA5H8u26xblXohBYbADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:5GAnKKinJiLJx1Fzku92EzXMT3BQXsUji2hC6mlwRA09TyX4rb
 HNoB1173HJYVoqN03I+urqBEDjexLhHPdOiOEs1NGZMDUOl1HJEGgI1+bfKlPbak7DH5Zmv5
 tdTw==
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 02:00:14 -0500
Received: by mail-qv1-f69.google.com with SMTP id
 mi16-20020a056214559000b005346c5c1f81so563375qvb.15
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 23:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLs7a7Ftr7qo3BjjTUcGQbWcDFtsi0J+OZS3/qg35qk=;
 b=Dkl/rw8YW4PrexchfEa1cdodkCNjebkQUyRlegNyiAIffXEi/SZ3A0JdYVb780DbRV
 RGnbP1Jf2TjtB3rMqGBQ8F3h3erR7Z4XcKcIRNbDiXeTqsyRsRKBX5zvC7yP5Y2D7HSO
 +zdNNvXCiz8hflRBoAZmN6IFn557ITgktHbkizDw/uSdxqmpvmHIPZkWKN8MQ5OYsqyi
 NOagz/pmmHja0fj7US6TNs8aqtXD8LeZ9TTz2pG1+yA3NauJLDZFZmtjcRA028oNTwjD
 TRGAs9j3MEjd+WNm2peX/IyvcGuCfWdYVnJXEJIR/FFB7TFKuRVZYeY7JPESLix98m7o
 L+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLs7a7Ftr7qo3BjjTUcGQbWcDFtsi0J+OZS3/qg35qk=;
 b=Zqep4z3qhjipVCYm2SXm4p3/a4IQrk5DbAd0UyAXOm35jBfd6pplXBUbGKxgMPCCLx
 tigaoFCm/8hwKbLF8a/3y2NOVlFevpn01yJlmNyC6dy2GYREfsuzCEAwcNVKeWJYCNHe
 XJCDE3rBykWQg1zk0qyP9h3mmNVv8cqbKSO7NzeLA/hz4mZKRPE5udskDICFeQfx0zBZ
 ejx/XN1AppnWeMhIaf7NhzARnCYXUiAM9zZXDEPAVg+vS5FV4/1M9I9gQANs3KaFWF+s
 MmdmtDWq8P12Y6lqBmed0TzKmMYnx8Hr3rrH+J9tVbB01g1LKiDHYrmyiM6HwDcGaOkU
 81BQ==
X-Gm-Message-State: AFqh2kqVh7FTN8FlhBYFgqhVFm2OE4Iw8Jr/90sGbnDquoIOl0poD5p7
 T4oSxbk+dVScJbQCxyh5JFF6+f12Z5A5rZoCqyzgZmAVQOFeDyG8J11psyhEHvBQ0i6U40xeL/U
 aIwrYPiE538YJ5oBf3XmMwMK/wufI1g==
X-Received: by 2002:ac8:747:0:b0:3b6:3a28:3377 with SMTP id
 k7-20020ac80747000000b003b63a283377mr11875496qth.58.1674111614115; 
 Wed, 18 Jan 2023 23:00:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvwA978uCprfY6bpfQV9iH6zkANxtOu4Yb+ACuERRhnPXx3XpUfEAtAdFHlOaxvJqdMai4oMg==
X-Received: by 2002:ac8:747:0:b0:3b6:3a28:3377 with SMTP id
 k7-20020ac80747000000b003b63a283377mr11875452qth.58.1674111613702; 
 Wed, 18 Jan 2023 23:00:13 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a37f910000000b00704df12317esm23706394qkj.24.2023.01.18.23.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 23:00:13 -0800 (PST)
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
Date: Thu, 19 Jan 2023 02:00:02 -0500
Message-Id: <20230119070004.321358-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119070004.321358-1-alxndr@bu.edu>
References: <20230119070004.321358-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.79; envelope-from=alxndr@bu.edu;
 helo=esa6.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
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


