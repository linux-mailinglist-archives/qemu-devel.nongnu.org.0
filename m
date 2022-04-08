Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249484F984B
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:39:04 +0200 (CEST)
Received: from localhost ([::1]:45308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncplP-0000wh-8q
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPY-0007Fb-2N
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPW-0002RO-B2
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id r64so5567725wmr.4
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uV/e+BBmbxBdtYd8klSJiLxOGkKS0wc1pLrl5b3TSlU=;
 b=PmQJXd6tnrebowx1MY9vtVMLNJJdwq9OvG4dOMxrBLVzULoeR2lMrebbF1pYY1uDqF
 G0PZWtILqyQubJm+kCMNmqryltnCJbobXpZBToqiFPT4N2y4KRIGrXABDyXdM0RroXF4
 qEp+3+cjMV6E9PyhgRyz0fv4K6vJ5qSikl3LEdBzb5Fk9JyB6R4NYOKcmuSfonRqflH9
 RPF6diAthfxozLJbpPjnOBOIxDWwrapR5yL2r+rueoV9/JanqZt4e9b8fGQWo8o42Y8O
 RFQf5HchyAiBhiSwxvOKGWRGAostip/CevHc+E7WpVnJqlE+YPCbkfU/BQVWwm5z9wS5
 BxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uV/e+BBmbxBdtYd8klSJiLxOGkKS0wc1pLrl5b3TSlU=;
 b=L2MWaqkQjgOiV368Hi6LDxXDiEWq37usCm+T1MMQvcODp/4/GAh+s4o18pc40ofbRp
 Nnyg3GHbsahfpZiR2UzUoi/NRNsLWG16xRqPbN2mz2G/gcPg481pBotigFDX6jKX6vAv
 vuLInHemproe7bl5r69pLmEBcy2uXhXdk4q4DnXx2c5QV9l3j+o/ocjpNC6zIblZpTC5
 uVER7nOdk0ogEt3absa1p51TazRDXNFJixBsGu9VqcRryQ/wrwq4B7/jZjW6cHF28BEv
 ZOWnmS+hdLiUlgzXcnI9MuWGK3GjBv5lfldUOgglJfCK6PvOqonu2N7EFULNofpS2kcO
 jktg==
X-Gm-Message-State: AOAM531TeruTlO12IKvFm/J0wT9/fLkbF2mVDGtbi/nk7xUP0Zv1VJC/
 NB7QRLYi+7vPwwslhakoBBCkpg==
X-Google-Smtp-Source: ABdhPJwOLoSap9dI5PceNLciLga5gsVMlGkUPJhrJF8rOwoxLBgjaMMj7hd0hV4ahmoNHX/CDyAwoA==
X-Received: by 2002:a7b:cc15:0:b0:38c:8af7:f47c with SMTP id
 f21-20020a7bcc15000000b0038c8af7f47cmr16998997wmh.177.1649427383616; 
 Fri, 08 Apr 2022 07:16:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 33/41] hw/intc/arm_gicv3_redist: Use set_pending_table_bit()
 in mov handling
Date: Fri,  8 Apr 2022 15:15:42 +0100
Message-Id: <20220408141550.1271295-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can use our new set_pending_table_bit() utility function
in gicv3_redist_mov_lpi() to clear the bit in the source
pending table, rather than doing the "load, clear bit, store"
ourselves.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index eadf5e8265e..3127af3e2ca 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -909,11 +909,9 @@ void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq)
      * we choose to NOP. If LPIs are disabled on source there's nothing
      * to be transferred anyway.
      */
-    AddressSpace *as = &src->gic->dma_as;
     uint64_t idbits;
     uint32_t pendt_size;
     uint64_t src_baddr;
-    uint8_t src_pend;
 
     if (!(src->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) ||
         !(dest->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
@@ -932,15 +930,10 @@ void gicv3_redist_mov_lpi(GICv3CPUState *src, GICv3CPUState *dest, int irq)
 
     src_baddr = src->gicr_pendbaser & R_GICR_PENDBASER_PHYADDR_MASK;
 
-    address_space_read(as, src_baddr + (irq / 8),
-                       MEMTXATTRS_UNSPECIFIED, &src_pend, sizeof(src_pend));
-    if (!extract32(src_pend, irq % 8, 1)) {
+    if (!set_pending_table_bit(src, src_baddr, irq, 0)) {
         /* Not pending on source, nothing to do */
         return;
     }
-    src_pend &= ~(1 << (irq % 8));
-    address_space_write(as, src_baddr + (irq / 8),
-                        MEMTXATTRS_UNSPECIFIED, &src_pend, sizeof(src_pend));
     if (irq == src->hpplpi.irq) {
         /*
          * We just made this LPI not-pending so only need to update
-- 
2.25.1


