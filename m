Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03429536614
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:41:33 +0200 (CEST)
Received: from localhost ([::1]:56312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nud1n-0001aI-4z
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nucgs-0005cE-N2
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:19:54 -0400
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197]:15056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nucgq-0000ss-WE
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:19:54 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 202288507
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pPwajqggoO+uh3s7Py9036KBX1616xIKZh0ujC45NGQN5FlHY01je
 htvXm2Ab6qKZTb0LtxyYIm1oBkDuJbWzYBqQABt/iEzEHsW8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW17X5
 oupyyHiEATNNwBcYzp8B52r9UsHUMTa4Fv0aXRnOJinFHeH/5UkJMt3yZOZdhMUcaENdgKOf
 Nsv+Znilo/vE7bBPfv++lrzWhVirrc/pmFigFIPM0SpqkEqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZOIeAZzObbCo7siTjNDLxhEOfxMw7CSdBBTseTLp6HHW37lwvErFV9veINHo6B4BmZB8
 fFeIzcIBvyBr7jukfTrF68235Vlc5CD0IA34xmMyRnQCeYgTYrrSbiM6NNFtNs1rpoWR6yON
 5dBNlKDajztOAVAN25LS64Pme2r3XC4Qj53mmq88P9fD2/7iVYZPKLWGMPYf8HPSchLk0Kwo
 GXA8GLkRBYAO7SiJSGt93utgqrWg3q+Vt1LUrK/8fFujRuYwWl75AAqaGZXaMKR0iaWM++z4
 WREksbyhcDeLHCWc+Q=
IronPort-HdrOrdr: A9a23:0EtXKKPG4LUiXMBcTsyjsMiBIKoaSvp037BN7TETdfU1SKylfq
 WV954mPHDP+VQssQ4b6LS90cW7LE80lqQV3WByB8bGYOCOggLBEGgF1+ffKlbbdREWmNQz6U
 5oSdkYNOHN
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 May 2022 12:19:49 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 kl23-20020a056214519700b0046200065604so3838020qvb.19
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l7XtZsacMV05bRDC10NuSoJ7iik7K91pUwHSZfB6tS0=;
 b=OXguDsr6C5UQ2pwRgL1FOhtuI0lRo16QmVgyoClUK9oOuhGhu6ZQ2d6xwh1DbD2fJ4
 TOOJyyCQ+kOwQbF04St+spcoN1m2TwyBG7rgkYk7AMUoms39cIWWExThyO41Q54nZ+xu
 gZ+WuMLDXLuNHcjox8dNtDaDJ1qBIzBEFrSq4dwsHQGXhjLH4R5FNXGVAbxnXHtyOn/l
 6Ws/1pzXCxtRAANngehy2wU0nQ0EXaHEm0y/rCos5R/ejWNJlEwoxz9wJYKA+lEw1sBo
 4Yf9jn9hUcJLPVYgCg8ksx5goNq+tG3TksmPKPBcZ03xtUCwXCYvP0DLhMxWnokfF3SG
 zTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l7XtZsacMV05bRDC10NuSoJ7iik7K91pUwHSZfB6tS0=;
 b=Hi4Fmfo9aR7N7LhNXr5CJ7s1NwpjA1oj8/jOp9fgPkg+sMYp2Q1kfMdkoINo5tU3ZI
 hpMr/BtS13b2CL8YxyzVAFnYKizFI/EbyACNYX/J+XFoIs3dpRrlzj2DCrdk/nbR1VkU
 R+VwBpCnHpXA0LGHsyViPDXEOzulvvOTClSwfjnXeerTtD4ZMUPENc4s0h3ViZMcvC3z
 U/m4RkU9axMd0rpaDlqsaYX4OeUecYMUhe7XB9TanFb4zt+dE3dRtaDEJthoN2AUHCDC
 DnSM1V3JeFVfkREw43dLX5CroDVKeaCZo6aDaOHaYv3C1qdH7QZ3IQMonNoFch4V8kpK
 ZN3Q==
X-Gm-Message-State: AOAM5320tymzQGeJ7MGnLTuL4jDcrdztUkSmBjUoG8oe44+MydZAAjlA
 qoG1Np9KCsh11KWrQCp2H30PMpDDItTihyFuj/hA4D5tdXXDWwv+7JyjIAZgX7tzJ5whtiYCeyy
 yApVmmz0ucp/fB+TkDTroa32DzrWYxw==
X-Received: by 2002:ac8:7e8c:0:b0:2f9:db5:614b with SMTP id
 w12-20020ac87e8c000000b002f90db5614bmr34012832qtj.602.1653668388930; 
 Fri, 27 May 2022 09:19:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytHyQwSfXi4LnPJgBrBRXgXwNP8wDwd42jkTXbPD1qXwpVbOUN75InPGcC5MaihO8TdEvJLA==
X-Received: by 2002:ac8:7e8c:0:b0:2f9:db5:614b with SMTP id
 w12-20020ac87e8c000000b002f90db5614bmr34012798qtj.602.1653668388679; 
 Fri, 27 May 2022 09:19:48 -0700 (PDT)
Received: from stormtrooper.vrmnet (pool-72-70-35-75.bstnma.fios.verizon.net.
 [72.70.35.75]) by smtp.gmail.com with ESMTPSA id
 x190-20020a3763c7000000b006a33c895d25sm2993777qkb.21.2022.05.27.09.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:19:48 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 2/3] memory: fix PIO/MMIO-initiated dma-reentracy issues
Date: Fri, 27 May 2022 12:19:36 -0400
Message-Id: <20220527161937.328754-3-alxndr@bu.edu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220527161937.328754-1-alxndr@bu.edu>
References: <20220527161937.328754-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set/check the engaged_in_io DeviceState flag, prior to calling
MemoryRegion handlers.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 softmmu/memory.c     | 15 +++++++++++++++
 softmmu/trace-events |  1 +
 2 files changed, 16 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7ba2048836..44a14bb4f5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     uint64_t access_mask;
     unsigned access_size;
     unsigned i;
+    DeviceState *dev = NULL;
     MemTxResult r = MEMTX_OK;
 
     if (!access_size_min) {
@@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    /* Do not allow more than one simultanous access to a device's IO Regions */
+    if (mr->owner &&
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
+        if (dev->engaged_in_io) {
+            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+            return MEMTX_ERROR;
+        }
+        dev->engaged_in_io = true;
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                         access_mask, attrs);
         }
     }
+    if (dev) {
+        dev->engaged_in_io = false;
+    }
     return r;
 }
 
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 9c88887b3c..d7228316db 100644
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
2.33.0


