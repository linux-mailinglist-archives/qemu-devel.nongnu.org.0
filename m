Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2800E559ACD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:59:48 +0200 (CEST)
Received: from localhost ([::1]:54646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jqd-00025L-7x
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4ja9-0001EO-Er; Fri, 24 Jun 2022 09:42:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4ja7-0005Cu-VT; Fri, 24 Jun 2022 09:42:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d091GelZN55eLOKLN7CO3SRnApYux7pBjnrtS2LpbW0=; b=0TEsVdnCgxyaEIQLrsjZj424lo
 YOtE0Qpf1lU3IdaDSdkk6aK8YvMU2or2YWHBBh6VXx8haI6hYDYizD6hAX3CH6KcCgr0rNJq7ZYs8
 00NTLci6+yvlDrueKK20ceRqwISyby1wdD7NE6nIQnm7wNT4o7GHqvDeeVWrywwHnWD50k732rQ2c
 O6U03orHi/hWRSbXaBHBgaLFyTMF4gJg1xWhlXD4hg8wH7CSu62Itim2TZ72Rv7Sr2w/u6THUNgSv
 3gzIOgxVbVC8SYKTPwxnzcHw9A7iEDnk1AfIyD4Dxigag/OYzcVhWzM0gDkC3rHCTpEJraO3ZJ68z
 6nn1pkWDAsJTwNfWoaMMTfipdraiyEmZOAXDBgJZKWD6xb7cNQB2gqbbtwltwNltScBb62yW3/vNA
 K4XxTvxAOx0xhgmtqdKClYVW4UX8EnekndK5om+RBQikQhPoW/2p4ZZpuXp+PwG3BxqiS+3jvwBPd
 +D8x9E4HYba72G7xBHowcSwOFrhzvOY8/cbZzXKhrbod+HS/nhmn52rQZBBa2vuAkYvyUijr3Vv34
 TphhpMr4BVn19gRXeIkcEfrAwX4TGNO04dOhRNk6NisEfWFUr8tIRMFvTB8AWEFXOr/6T+1HxO908
 ROd6xtlL9jubPMShfks27nlVmt6IOIyaitLMUDePA=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYU-00037t-JJ; Fri, 24 Jun 2022 14:41:06 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:31 +0100
Message-Id: <20220624134109.881989-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 16/54] lasips2: spacing fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This helps improve the readability of lasips2.c.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/lasips2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 94f18be4cd..2ac3433014 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -205,7 +205,6 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
         break;
 
     case REG_PS2_STATUS:
-
         ret = LASIPS2_STATUS_DATSHD | LASIPS2_STATUS_CLKSHD;
 
         if (port->control & LASIPS2_CONTROL_DIAG) {
@@ -238,9 +237,9 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
                       __func__, addr);
         break;
     }
+
     trace_lasips2_reg_read(size, port->id, addr,
                            lasips2_read_reg_name(addr), ret);
-
     return ret;
 }
 
@@ -257,6 +256,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
 static void ps2dev_update_irq(void *opaque, int level)
 {
     LASIPS2Port *port = opaque;
+
     port->irq = level;
     lasips2_update_irq(port->parent);
 }
-- 
2.30.2


