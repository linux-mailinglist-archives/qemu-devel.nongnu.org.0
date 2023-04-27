Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0486F0DAF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 23:12:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8tD-0005uD-2U; Thu, 27 Apr 2023 17:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8tA-0005su-NK
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:10:52 -0400
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ps8t8-0005N6-KC
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 17:10:52 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 273505165
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4tiX7KjNxohiUjvd89uIo3zKX1613BIKZh0ujC45NGQN5FlHY01je
 htvCzjSMvaJZ2SgKo0kao6y8x4G68PUm4NrSAA6rS82EC8W8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gZhPasjUGL2zBH5MrpOfcldEFOlGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiM+t5qK23CulQRrukoPD8fwXG8M49m/c3Gd/
 /0W3XC4YV9B0qQhA43xWTEBe811FfQuFLMqvRFTGCFcpqHLWyKE/hlgMK05FZUc8MllAnxoz
 PEjLjAuS0qSlvy8kJvuH4GAhux7RCXqFIYWu3Ul1C+ASPh5GNbMRKLF4dIe1zA17ixMNayGN
 oxJNHw1NUWGPEQn1lQ/UfrSmM+hgmn5fydwok/TqKYqi4TW5FYui+W1bYOLJ7RmQ+17w3mZh
 zP59l3CJUg8DI22xB2Uqi+V07qncSTTHdh6+KeD3udnhUDWymENBRk+U1y9rv+kzEmkVLpix
 1c8/yMvqe0r6hXuQIakGRK/p3GAs1gXXN84//AG1TxhA5H8u26xblXohBYdNLTKaOdeqeQW6
 2K0
IronPort-HdrOrdr: A9a23:l/LavKsXNq7SikfMrEYWrP9O7skDoNV00zEX/kB9WHVpmwKj5q
 STdZMgpGPJYVMqMk3I9urwXpVoLUmsl6KdpLNhRotKPzOWxVdAUrsSlLcKqgeIc0aOldK1l5
 0QCZSWYOeRMbEQt7ec3ODXKadE/PC3tIqFv6Px9UtMcC1dQ51czm5Ce3mm+45NKDWux6BVKH
 NR3KR6TkKbCAwqhw2AaRg4Y9Q=
X-Talos-CUID: 9a23:YdciMWN5chC8N+5DQC1t21wXB+Ycf0bbzFT1eV6pF2w5YejA
X-Talos-MUID: 9a23:YHIW4Qpn89fWhdCoI3Aezx8/C8ZJspunMXsqyLM+6uCJEj0oZg7I2Q==
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 17:10:29 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-5ef5fe13973so60531196d6.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 14:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682629828; x=1685221828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S5GA8Y1UMhuzqKrQy3ytJIXFWBXaejHanlC6dTX2Ipg=;
 b=Q4BOLKNFXYM9xz7kImvgEA3RG8m018gsEEiw60e8NFmlQ0yDXHTPIm8bo9j3LKftUh
 pWnlFeG7macRXXc8QY5bxKVzwUOLGxEC0TxjBUaUZ2E1y8GDRjwhbmWbHRNQJK4RDV0L
 AGR3/60+Sq3rwD+uhPZYPTLfR7qWsYZC0beoTjslIjJwj8rvzPZQabxr7h7OG1fPXMYm
 TbKM3xzwXXYja9We7LPBVY3+Fc9XgJNh1SLmZEXHXeF0ZAjnGxoW4nau+Awwy3rI1Owx
 3K+w2TumTHeh1mDlaRI80iOxbwysrMgqyW1qC8hW1j2l6GdSqXqKuGdNFLP9HVyQm5jd
 pM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629828; x=1685221828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S5GA8Y1UMhuzqKrQy3ytJIXFWBXaejHanlC6dTX2Ipg=;
 b=J20GPBE2X6if08lMvPU6ayd9eCaBWNO/amLVYsbTTR4Xe0q4e3Ie+cHK3GGAfwfKhR
 B6MkyVH8KDqnWGosZgVcao8gx/cqVBQHJWSgyWy1+zeWaZCXmJ4Q9y+Kgtk4NzhJAcz2
 ZXpB2wdol1H/CwE21ZrKAWTRMOA+gjjr1szOE5hg6I9b9stwVkK/DdMum/F2G29gdmll
 dROroy6Dm+7shIp34fJXGHQ3xnvQe0WBAxzzBoTzWTwpI2ExOsR0idQtpERwC1NKQmBJ
 AhGFVRhTpnG2UT1u/nuPZsjX1dVaKcwX4JFwAEfwyw1TF8kMSY0Gk7NyGvzkOcMSC3/X
 fQsA==
X-Gm-Message-State: AC+VfDy/1JYYswP6FyuW5NEnzgFaEnED6hdS0QFYafeJSLrP/Viar9kI
 twYI8oODPteEWIrPf4dRBm1pOU08IcLhnc4WTdb11ku/DscG391qbLVcUWoYzNvnyrSIRZIWDA9
 UsIuexbau998TgqlQVyo5Un4FUugYQb++g+pqb6ybyXE=
X-Received: by 2002:a05:6214:212d:b0:5e7:f7eb:d87 with SMTP id
 r13-20020a056214212d00b005e7f7eb0d87mr4589029qvc.47.1682629828215; 
 Thu, 27 Apr 2023 14:10:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Ik6U0VsaJkRAhW1VCGgiYCavtRYM7GbThgwIQ0FXZz4wj7/3BMvznECDE4EIq7G5Cpcw3+Q==
X-Received: by 2002:a05:6214:212d:b0:5e7:f7eb:d87 with SMTP id
 r13-20020a056214212d00b005e7f7eb0d87mr4588993qvc.47.1682629827942; 
 Thu, 27 Apr 2023 14:10:27 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 dz16-20020a05620a2b9000b0074df16f36f1sm6204726qkb.108.2023.04.27.14.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 14:10:27 -0700 (PDT)
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
Subject: [PATCH v10 1/8] memory: prevent dma-reentracy issues
Date: Thu, 27 Apr 2023 17:10:06 -0400
Message-Id: <20230427211013.2994127-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230427211013.2994127-1-alxndr@bu.edu>
References: <20230427211013.2994127-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 softmmu/memory.c       | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)

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
index b1a6cae6f5..fe23f0e5ce 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -542,6 +542,18 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    /* Do not allow more than one simultaneous access to a device's IO Regions */
+    if (mr->dev && !mr->disable_reentrancy_guard &&
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
+            warn_report("Blocked re-entrant IO on "
+                    "MemoryRegion: %s at addr: 0x%" HWADDR_PRIX,
+                    memory_region_name(mr), addr);
+            return MEMTX_ACCESS_ERROR;
+        }
+        mr->dev->mem_reentrancy_guard.engaged_in_io = true;
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -556,6 +568,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                         access_mask, attrs);
         }
     }
+    if (mr->dev) {
+        mr->dev->mem_reentrancy_guard.engaged_in_io = false;
+    }
     return r;
 }
 
@@ -1170,6 +1185,7 @@ static void memory_region_do_init(MemoryRegion *mr,
     }
     mr->name = g_strdup(name);
     mr->owner = owner;
+    mr->dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
     mr->ram_block = NULL;
 
     if (name) {
-- 
2.39.0


