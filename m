Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF94763D8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:59:59 +0100 (CET)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbNX-0004jB-03
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:59:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbL5-0001Qv-1L
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbKw-00059B-IH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639601837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSQRyRj2GbkDloms+3kG1uqQcojtiwJxAy2G0BkB6EI=;
 b=jM278o4wITRECFw9UPzaPGE+dDlvuZNjxtpKfP3zCRXuhnlcuQe87zOgEkFxyLtk8WclC4
 3kBvEZ0fgZe9JaUER5CodIwgDDn5OwFoSTeqA66cKVgtB1U1v2uzzMVwvQnYSjdlB80Bxc
 flBYz0wLgUgxgBUEAYBxf76U3BRUqKI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-tBp-NpvSObCXeIqFPxnomw-1; Wed, 15 Dec 2021 15:57:16 -0500
X-MC-Unique: tBp-NpvSObCXeIqFPxnomw-1
Received: by mail-wr1-f71.google.com with SMTP id
 p3-20020a056000018300b00186b195d4ddso6189203wrx.15
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:57:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oSQRyRj2GbkDloms+3kG1uqQcojtiwJxAy2G0BkB6EI=;
 b=RynDzuEi7SsptnBwEsfzw5w85NSD0iEKVaZkiLG/3vt9TvtPt1KncLZwR8NHLJZLvj
 8kVStVwJRoYhnozaievFZgHNIbizaUv+vDR3rdL+EAA70BFjYdJTocbGNsWjjA7STfgn
 e2b/IxV1QxzvsxQlVkTyF1GRBcu2XjT/BIbGKO8lZ+aV8f7Bb/Y3uRFl8tPhMhW6ORKi
 hwoH1una7OHMQuL9M+JRnl/PyDyN1ZI7XyFjs8w+XRxbModRCpUjIpvMSDusJ0+CCY88
 Ax28nTLwXifIQRMm/NcinWuCmXByIIJKBRw0vsTC61jFBVuqIZDS6CzMDXRsOdx518x4
 ewfQ==
X-Gm-Message-State: AOAM5324Cx0pMZFi9zS6twZwZWOlv5At+e6X8+4XTYFI6RrsTNqIMm7W
 bts8hrx7xCbV+4osmOS3+NgmX18UL9jLg9mKY10/3gN1LUSDnzKndlXzyKngMsbYkTtdS1du6d1
 15Mx1VUXoCkntqTIto2s+YkLWrquc4IuQGNDK07Ty+VlyqpfDEYQWG3S7+l6UQS42
X-Received: by 2002:a05:600c:19cc:: with SMTP id
 u12mr1981863wmq.24.1639601835462; 
 Wed, 15 Dec 2021 12:57:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb8G+oMVd86cvwguQJsJmKfSEz09jDT1yPJwprMX48giyS9Rnw06hdOAozhRSrnIbC+jMqDg==
X-Received: by 2002:a05:600c:19cc:: with SMTP id
 u12mr1981830wmq.24.1639601835155; 
 Wed, 15 Dec 2021 12:57:15 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g124sm5980438wme.28.2021.12.15.12.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:57:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/3] hw/sd/sdhci: Prohibit DMA accesses to devices
Date: Wed, 15 Dec 2021 21:56:55 +0100
Message-Id: <20211215205656.488940-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215205656.488940-1-philmd@redhat.com>
References: <20211215205656.488940-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The issue reported by OSS-Fuzz produces the following backtrace:

  ==447470==ERROR: AddressSanitizer: heap-buffer-overflow
  READ of size 1 at 0x61500002a080 thread T0
      #0 0x71766d47 in sdhci_read_dataport hw/sd/sdhci.c:474:18
      #1 0x7175f139 in sdhci_read hw/sd/sdhci.c:1022:19
      #2 0x721b937b in memory_region_read_accessor softmmu/memory.c:440:11
      #3 0x72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
      #4 0x7216f47c in memory_region_dispatch_read1 softmmu/memory.c:1424:16
      #5 0x7216ebb9 in memory_region_dispatch_read softmmu/memory.c:1452:9
      #6 0x7212db5d in flatview_read_continue softmmu/physmem.c:2879:23
      #7 0x7212f958 in flatview_read softmmu/physmem.c:2921:12
      #8 0x7212f418 in address_space_read_full softmmu/physmem.c:2934:18
      #9 0x721305a9 in address_space_rw softmmu/physmem.c:2962:16
      #10 0x7175a392 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
      #11 0x7175a0ea in dma_memory_rw include/sysemu/dma.h:132:12
      #12 0x71759684 in dma_memory_read include/sysemu/dma.h:152:12
      #13 0x7175518c in sdhci_do_adma hw/sd/sdhci.c:823:27
      #14 0x7174bf69 in sdhci_data_transfer hw/sd/sdhci.c:935:13
      #15 0x7176aaa7 in sdhci_send_command hw/sd/sdhci.c:376:9
      #16 0x717629ee in sdhci_write hw/sd/sdhci.c:1212:9
      #17 0x72172513 in memory_region_write_accessor softmmu/memory.c:492:5
      #18 0x72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
      #19 0x72170766 in memory_region_dispatch_write softmmu/memory.c:1504:16
      #20 0x721419ee in flatview_write_continue softmmu/physmem.c:2812:23
      #21 0x721301eb in flatview_write softmmu/physmem.c:2854:12
      #22 0x7212fca8 in address_space_write softmmu/physmem.c:2950:18
      #23 0x721d9a53 in qtest_process_command softmmu/qtest.c:727:9

A DMA descriptor is previously filled in RAM. An I/O access to the
device (frames #22 to #16) start the DMA engine (frame #13). The
engine fetch the descriptor and execute the request, which itself
accesses the SDHCI I/O registers (frame #1 and #0), triggering a
re-entrancy issue.

Fix by prohibit transactions from the DMA to devices. The DMA engine
is thus restricted to memories.

Reported-by: OSS-Fuzz (Issue 36391)
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/451
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index fe2f21f0c37..0e5e988927e 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -741,6 +741,7 @@ static void sdhci_do_adma(SDHCIState *s)
 {
     unsigned int begin, length;
     const uint16_t block_size = s->blksize & BLOCK_SIZE_MASK;
+    const MemTxAttrs attrs = { .memory = true };
     ADMADescr dscr = {};
     MemTxResult res;
     int i;
@@ -794,7 +795,7 @@ static void sdhci_do_adma(SDHCIState *s)
                     res = dma_memory_write(s->dma_as, dscr.addr,
                                            &s->fifo_buffer[begin],
                                            s->data_count - begin,
-                                           MEMTXATTRS_UNSPECIFIED);
+                                           attrs);
                     if (res != MEMTX_OK) {
                         break;
                     }
@@ -823,7 +824,7 @@ static void sdhci_do_adma(SDHCIState *s)
                     res = dma_memory_read(s->dma_as, dscr.addr,
                                           &s->fifo_buffer[begin],
                                           s->data_count - begin,
-                                          MEMTXATTRS_UNSPECIFIED);
+                                          attrs);
                     if (res != MEMTX_OK) {
                         break;
                     }
-- 
2.33.1


