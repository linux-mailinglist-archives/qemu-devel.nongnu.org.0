Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E17C6F2891
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 13:27:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pt5Bw-0001BX-3A; Sun, 30 Apr 2023 07:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pt5Bt-0001BD-91
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 07:26:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pt5Br-0000d5-Rh
 for qemu-devel@nongnu.org; Sun, 30 Apr 2023 07:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682853962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7vKPYJbYOlTkZzTEI2/5U+oPZX630r900sjv9Gc53SY=;
 b=TKrA27dV3DNAs3m9wO7m8F4U+w0k6S8LxRBfNRfLhBO2AgNSmFwAbfQ0Abn3p73u1d2Ntp
 a09sL8nOjPyn/sdLklzW4KlK33Li0CcDoH/bC51opDgO/u86Q0IFj0qOK9lM7dUPv1ZvHT
 NQcrwmbwmNobq3HL7f5V2hXGNM3HafA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-bEebjB7ZMhqF3xHMgvXqXA-1; Sun, 30 Apr 2023 07:26:01 -0400
X-MC-Unique: bEebjB7ZMhqF3xHMgvXqXA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f21e35dc08so4531905e9.2
 for <qemu-devel@nongnu.org>; Sun, 30 Apr 2023 04:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682853959; x=1685445959;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7vKPYJbYOlTkZzTEI2/5U+oPZX630r900sjv9Gc53SY=;
 b=djZSqu4cA+Pi3SvyShwk6p2EhJubzswfUNS4i2tG8Su1T4vJ+W7UVMC5Whc3p8CrF0
 FwfiXfbOQGx0zdWwthSaBVynxJMVz3z64RGv4/Z7IGvYf10iYAUu6thiypBPbMc42jW/
 Y8MNpF6mEhQWMzvtjb7+W/Gjv0qfFwokL65DPDy2v/1BE940+qVU0cJWISju89gqu8oD
 6AWJLU3dFeGNhutFUUrrGJSkjFk1vkzNmvPa7RcQ2cZbwlaRd3Vuo/qh56aEBHJ7pPjy
 TxiHZ8Tm5WB23KzTUW+H/pLQSgpZoRQaOmRkmBCh76ktdD6izT47PzZYzCg4pMlNs/8m
 aDEA==
X-Gm-Message-State: AC+VfDwc9lIMEIa192WIig7/19Bi9w2ni8tk4arDUtajY+gPrio7aIwN
 Wcnj7+bfEIwfcIJTbvFrrByv7o/obPifwfukUddLZAaz0t7CgAskktSlyWWfksbRwC2gK8r+Li5
 dxLUSXGGGQ6VOdfWdeXyHH/hNqC9sgOWjkK5kzpLVrqXZPKkV/xxiKFF/vPmqc+rxcp9BtE4lfs
 g=
X-Received: by 2002:adf:fe92:0:b0:2cf:ec6c:f253 with SMTP id
 l18-20020adffe92000000b002cfec6cf253mr7515917wrr.20.1682853959439; 
 Sun, 30 Apr 2023 04:25:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VS9qXCMhz8LztI8JoA0XwSeoUldwMSnf4wvegl3lp1k2bh9XLUbf/9xPxDNWjvYlPobvULA==
X-Received: by 2002:adf:fe92:0:b0:2cf:ec6c:f253 with SMTP id
 l18-20020adffe92000000b002cfec6cf253mr7515910wrr.20.1682853959090; 
 Sun, 30 Apr 2023 04:25:59 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 r17-20020adfdc91000000b002ff2c39d072sm25648134wrj.104.2023.04.30.04.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 04:25:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PATCH] tb-maint: do not use mb_read/mb_set
Date: Sun, 30 Apr 2023 13:25:57 +0200
Message-Id: <20230430112557.240261-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The load side can use a relaxed load, which will surely happen before
the work item is run by async_safe_run_on_cpu() or before double-checking
under mmap_lock.  The store side can use an atomic RMW operation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/tb-maint.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index cb1f806f00d4..0dd173fbf048 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -746,7 +746,7 @@ static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
 
     tcg_region_reset_all();
     /* XXX: flush processor icache at this point if cache flush is expensive */
-    qatomic_mb_set(&tb_ctx.tb_flush_count, tb_ctx.tb_flush_count + 1);
+    qatomic_inc(&tb_ctx.tb_flush_count);
 
 done:
     mmap_unlock();
@@ -758,7 +758,7 @@ done:
 void tb_flush(CPUState *cpu)
 {
     if (tcg_enabled()) {
-        unsigned tb_flush_count = qatomic_mb_read(&tb_ctx.tb_flush_count);
+        unsigned tb_flush_count = qatomic_read(&tb_ctx.tb_flush_count);
 
         if (cpu_in_exclusive_context(cpu)) {
             do_tb_flush(cpu, RUN_ON_CPU_HOST_INT(tb_flush_count));
-- 
2.40.0


