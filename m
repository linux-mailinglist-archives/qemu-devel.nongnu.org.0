Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947F15365E2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:23:00 +0200 (CEST)
Received: from localhost ([::1]:47350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucjr-0000DB-MI
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nucgt-0005dc-SW
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:19:56 -0400
Received: from esa16.hc2706-39.iphmx.com ([216.71.140.205]:52679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1nucgs-0000st-1C
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:19:55 -0400
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 200272541
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:c8t3SalzSvhEZahc/18dlabo5gwKJERdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMXWyCb6uNMzH0c993b9jl8h5TuJGAnIQ2QQRrrn02ES4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlnS4
 YiaT/D3YzdJ5RYlagr41Ire8HuDjNyq0N/PlgVjDRzjlAa2e0g9VfrzF4noR5fLatA88tqBe
 gr25OrRElU1XvsaIojNfr7TKiXmS1NJVOSEoiM+t6OK23CuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljpHgUTcrJ633nO0MajNbUD5xNrF5weqSSZS/mZT7I0zudnLtx7B3EhhzM9NJvOlwBm5K+
 LoTLzVlghKr3brnhuLmDLM114J9faEHP6tG0p1k5TjdHfAqW7jJXuPH6cIwMDIY3JgWR6mEO
 pZAAdZpREmZZS8fJFw3M8odncuwpWa4ViZI9HvA8MLb5ECWlmSdyoPFKdfQZ5mGSNtYmm6eo
 WTJ+Xm/BQsVXOFz0hKA+3Oow/bRxGb1BtNUG7q/+fpnxlaUwwT/FSEraLdymtHh4mbWZj6VA
 xB8FvYGxUTqyHGWcw==
IronPort-HdrOrdr: A9a23:QRyuOa9mjj/giU8N/6luk+AHI+orL9Y04lQ7vn2ZKCYlDvBw8v
 rEoB11737JYUkqKRcdcLy7VJVoAkmsjKKdmLNhR4tKBTOWxVdAT7sSkrcKoQeBJ8SkzJ8k6U
 4IScEXYuEYa2IUsS+Q2mSF+rgbruVujciT9JzjJqNWPGNXg90J1XYfNu/iKDwUeOCwP+tcKH
 M03Lsjmwad
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 May 2022 12:19:51 -0400
Received: by mail-qv1-f69.google.com with SMTP id
 e3-20020a056214110300b0045abb0e1760so3884206qvs.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l6ibSFcAKzpFoUndDsjwlNGe/8TZpKz1WAMs2g5onDY=;
 b=ZniVgY8kbVk4noOgdND4x73abtrFX6cD8K3iQwroTaLCDrACqCq5r6rxiXr4gcCItM
 yPmW3yDIpwtotDzTE0TELqRU+xxV8thEVS/B4tmiy3F+JSCNywTcUPjrTDfKKweFiRLV
 bDp7tDmB/MUlHMO4CmHh/n4is7/U9j4fJ1fHOFlbBZ+bhYkHEakVkaiLInVvSLxXrsFh
 jufUBhB0C5Qp2GFoWFVAIX3wkJXOmVZ/Becx+xuGapyJJlZl3ap46hB4PIVl+Y6m3NBl
 sLQzjkyMlQtaZyiX2TIZFPBzav8mgdBM+FmIFIajz2jVxv7s+wBefx/nt+Z7cLPmT9ID
 rTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l6ibSFcAKzpFoUndDsjwlNGe/8TZpKz1WAMs2g5onDY=;
 b=ESE0byop0uzkfh8YWfKyxRR9pGgHrwhbYh/FNZ3Q/RMrS7OkOOAyppPbS2FwvoMeyK
 JgorBD27eg/FkoS7YvXrasOj8tCmu22qb1V4YYCweVikPSEcZqu2+BCGGKtXxz+Jrol+
 YLpAKB9slMHRbDi/EosK8SAKcubp3K+1+9wWGxd1B2AySbTugI4GUHReXziygsQp7A6s
 h07WqL6eZTbHfUM7G6eWmgbsnsUQIEYCaocGJf9bvvmU9YLUNpMqWXloQtS5NOcNZF+2
 rg6lGUG/1dKltCnBiFlGPFY0qwM1l9giEp/sowkA1SBfbv5sLHDYSAtvVCh8cFNEn6ev
 N9bQ==
X-Gm-Message-State: AOAM533gibAaPydrRxJtSqpzxTtDdSOrvfunBv2bbmQo1pYxMOuVoTK0
 2VxNvPacvw1JVD3tn1m8Ke5Y7hvT3CYykoJMD77PhJXey1zZGniQvXTjo3/a63KjZcp1n62ilmG
 DdTmlNL0nqyDCG+VrZIJXSzUWtP1s2A==
X-Received: by 2002:a05:622a:199d:b0:2f3:cbbd:186f with SMTP id
 u29-20020a05622a199d00b002f3cbbd186fmr33957360qtc.92.1653668390673; 
 Fri, 27 May 2022 09:19:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPYr6P9QupYdD3nwSFPi1Aqg0JwJ0IxxYsn+V7gnzWG08Brm99q7NRVhQ9+ZbxdkU4ESh2nA==
X-Received: by 2002:a05:622a:199d:b0:2f3:cbbd:186f with SMTP id
 u29-20020a05622a199d00b002f3cbbd186fmr33957332qtc.92.1653668390385; 
 Fri, 27 May 2022 09:19:50 -0700 (PDT)
Received: from stormtrooper.vrmnet (pool-72-70-35-75.bstnma.fios.verizon.net.
 [72.70.35.75]) by smtp.gmail.com with ESMTPSA id
 x190-20020a3763c7000000b006a33c895d25sm2993777qkb.21.2022.05.27.09.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:19:49 -0700 (PDT)
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
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 3/3] memory: fix bh-initiated dma-reentracy issues
Date: Fri, 27 May 2022 12:19:37 -0400
Message-Id: <20220527161937.328754-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220527161937.328754-1-alxndr@bu.edu>
References: <20220527161937.328754-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.205; envelope-from=alxndr@bu.edu;
 helo=esa16.hc2706-39.iphmx.com
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

This patch leverages the DeviceState engaged_in_io flag to prevent
issues due to accesses similar to bh -> dma -> mmio.
e.g.  CVE-2021-3929

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/hw/pci/pci.h  | 13 +++++++++++--
 softmmu/dma-helpers.c | 12 ++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 44dacfa224..ab1ad0f7a8 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -834,8 +834,17 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                                      void *buf, dma_addr_t len,
                                      DMADirection dir, MemTxAttrs attrs)
 {
-    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
-                         dir, attrs);
+    bool prior_engaged_state;
+    MemTxResult result;
+
+    prior_engaged_state = dev->qdev.engaged_in_io;
+
+    dev->qdev.engaged_in_io = true;
+    result = dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
+                           dir, attrs);
+    dev->qdev.engaged_in_io = prior_engaged_state;
+
+    return result;
 }
 
 /**
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7820fec54c..7a4f1fb9b3 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -288,8 +288,16 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
     uint8_t *ptr = buf;
     dma_addr_t xresidual;
     int sg_cur_index;
+    DeviceState *dev;
+    bool prior_engaged_state;
     MemTxResult res = MEMTX_OK;
 
+    dev = sg->dev;
+    if (dev) {
+        prior_engaged_state = dev->engaged_in_io;
+        dev->engaged_in_io = true;
+    }
+
     xresidual = sg->size;
     sg_cur_index = 0;
     len = MIN(len, xresidual);
@@ -302,6 +310,10 @@ static MemTxResult dma_buf_rw(void *buf, dma_addr_t len, dma_addr_t *residual,
         xresidual -= xfer;
     }
 
+    if (dev) {
+        dev->engaged_in_io = prior_engaged_state;
+    }
+
     if (residual) {
         *residual = xresidual;
     }
-- 
2.33.0


