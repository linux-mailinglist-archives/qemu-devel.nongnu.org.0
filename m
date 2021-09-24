Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B02416F7C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:49:26 +0200 (CEST)
Received: from localhost ([::1]:44668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThpd-0002Lf-Ga
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgs-000595-3Y
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:23 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgq-00075B-EI
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t7so25376727wrw.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GnKfjoq+otyiJmny5QHC7t7xnub0O32xM8y+f0O0Xns=;
 b=Vh6th4kwtGT1ClLOlEmkYiqpBcvwQz7Fng3nKOaxYPtsV9/wr1/F7i9kWLO68+3Ij1
 TNFjy87wyG3bfRy/BEBbP5pNZluPh71lKPY90szCF7cCvliyVzYC2xsORpcQ+8XOjvTq
 UQEMxCIbgxMnRAOPeu6G+98edadCo8U6jFX6pMBqiHr7ZMw8AMwJXrEwqHarTg/8MdVD
 GuPtSxsXsMgGR/TnXhYwm+Ex8IyJtcB/4S+3BrCQW0rfsHJVZ5IqcB6oi5V/twsYGqT9
 xz7h4m5LRNUYTBy5celyyQkxEoHHR5Hlil5x+53dYGaZBfcC4USkbpFH7g9sMQc2SHwt
 WoPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GnKfjoq+otyiJmny5QHC7t7xnub0O32xM8y+f0O0Xns=;
 b=nVzHjkuLPh3VGwsxaiYqPLgfDnjmMDfTaRCAFOPKLLkqgC8T+oV2XiPps0+Y95nrdb
 140uD56YXIwr8qnCLJdgvkQekydOJeNPhb+HvxrNzvJ3ODmna2BORx9fVJ8G9uan+dO1
 R7JKJiq+6NMVI89krAYc7b9pNpPzji55k1bBC16/ZMPD6arHRNciDGnjhoyw8K8dGkD6
 3GKt8Of4Uq8UHpcARHsGMI77XnaYibb64IDJJKGhVBYcvIP4oVo4jvdegrNM8o97MU8x
 xqRwWe4JmtvWr1tP4c7nV1APX3XnyPOBiLwSiBQbG4Yl7prDVN0mCqA5IjVOVUvE2+CB
 DW0w==
X-Gm-Message-State: AOAM533RbWz9HSS52WJAW/zDRBHCyhwux3ei+MXn6JY+BWFMZ8sxdt2g
 R8WiC0zyT9hL3u0y7FICLIsqWJR6Yyc=
X-Google-Smtp-Source: ABdhPJzS8EO/ffcbUl8Bd+UlNs0/QoNwM838HgPxDoQJzPaTt9z+x+bCyY44QH32FfFAKTQPFv70Iw==
X-Received: by 2002:a05:600c:1d18:: with SMTP id
 l24mr1094046wms.98.1632476418930; 
 Fri, 24 Sep 2021 02:40:18 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 d5sm7932898wra.38.2021.09.24.02.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 19/40] target/avr: Restrict has_work() handler to sysemu
Date: Fri, 24 Sep 2021 11:38:26 +0200
Message-Id: <20210924093847.1014331-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 5d70e34dd54..6d51f91ca2c 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -195,6 +195,7 @@ static const struct SysemuCPUOps avr_sysemu_ops = {
 static const struct TCGCPUOps avr_tcg_ops = {
     .initialize = avr_cpu_tcg_init,
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
+    .has_work = avr_cpu_has_work,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
     .do_interrupt = avr_cpu_do_interrupt,
@@ -211,7 +212,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = avr_cpu_class_by_name;
 
-    cc->has_work = avr_cpu_has_work;
     cc->dump_state = avr_cpu_dump_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
-- 
2.31.1


