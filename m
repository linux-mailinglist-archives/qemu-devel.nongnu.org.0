Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161823F94F1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 09:18:02 +0200 (CEST)
Received: from localhost ([::1]:39566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJW7k-0001re-Rp
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 03:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJVzy-0000qy-LA; Fri, 27 Aug 2021 03:09:58 -0400
Received: from ozlabs.org ([203.11.71.1]:44191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mJVzv-0007Jt-4T; Fri, 27 Aug 2021 03:09:58 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GwrSY5dZYz9sPf; Fri, 27 Aug 2021 17:09:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630048189;
 bh=VnVzv6b5PYxmxBHBsKU3ygBVv97Y3zR1Ypi5Cn14e9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iyJgplgiUfSCWGt3Y919TNpANZ7NMqbDqJaUR8+HXwqfwmnF1TxwDy2CAEb31pWhg
 nvlhLFyoS4S4GWKImylWU8gMjXw0wvkhsasOuhdz6+6PPVjjEhhp/qolCi5/JRZN5P
 iTYpbi10P3MrLpFZYxADcL6+ruYXezFGqq+ec2oU=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 01/18] xive: Remove extra '0x' prefix in trace events
Date: Fri, 27 Aug 2021 17:09:29 +1000
Message-Id: <20210827070946.219970-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827070946.219970-1-david@gibson.dropbear.id.au>
References: <20210827070946.219970-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

Cc: thuth@redhat.com
Fixes: 4e960974d4ee ("xive: Add trace events")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/519
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210809085227.288523-1-clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/trace-events | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index e56e7dd3b6..6a17d38998 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -219,14 +219,14 @@ kvm_xive_source_reset(uint32_t srcno) "IRQ 0x%x"
 xive_tctx_accept(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x CPPR=0x%02x NSR=0x%02x ACK"
 xive_tctx_notify(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x CPPR=0x%02x NSR=0x%02x raise !"
 xive_tctx_set_cppr(uint32_t index, uint8_t ring, uint8_t ipb, uint8_t pipr, uint8_t cppr, uint8_t nsr) "target=%d ring=0x%x IBP=0x%02x PIPR=0x%02x new CPPR=0x%02x NSR=0x%02x"
-xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0x%"PRIx64" IRQ 0x%x val=0x0x%"PRIx64
-xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0x0x%"PRIx64" IRQ 0x%x val=0x0x%"PRIx64
+xive_source_esb_read(uint64_t addr, uint32_t srcno, uint64_t value) "@0x%"PRIx64" IRQ 0x%x val=0x%"PRIx64
+xive_source_esb_write(uint64_t addr, uint32_t srcno, uint64_t value) "@0x%"PRIx64" IRQ 0x%x val=0x%"PRIx64
 xive_router_end_notify(uint8_t end_blk, uint32_t end_idx, uint32_t end_data) "END 0x%02x/0x%04x -> enqueue 0x%08x"
 xive_router_end_escalate(uint8_t end_blk, uint32_t end_idx, uint8_t esc_blk, uint32_t esc_idx, uint32_t end_data) "END 0x%02x/0x%04x -> escalate END 0x%02x/0x%04x data 0x%08x"
-xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
-xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x0x%"PRIx64" sz=%d val=0x%" PRIx64
+xive_tctx_tm_write(uint64_t offset, unsigned int size, uint64_t value) "@0x%"PRIx64" sz=%d val=0x%" PRIx64
+xive_tctx_tm_read(uint64_t offset, unsigned int size, uint64_t value) "@0x%"PRIx64" sz=%d val=0x%" PRIx64
 xive_presenter_notify(uint8_t nvt_blk, uint32_t nvt_idx, uint8_t ring) "found NVT 0x%x/0x%x ring=0x%x"
-xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x/0x%x @0x0x%"PRIx64
+xive_end_source_read(uint8_t end_blk, uint32_t end_idx, uint64_t addr) "END 0x%x/0x%x @0x%"PRIx64
 
 # pnv_xive.c
 pnv_xive_ic_hw_trigger(uint64_t addr, uint64_t val) "@0x%"PRIx64" val=0x%"PRIx64
-- 
2.31.1


