Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1E8407F00
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:36:53 +0200 (CEST)
Received: from localhost ([::1]:54576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTPQ-0007f3-OZ
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHF-0006dC-AD
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:25 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHD-0004hQ-SD
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:25 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so4964326wml.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GnKfjoq+otyiJmny5QHC7t7xnub0O32xM8y+f0O0Xns=;
 b=fvZ1raDWHNYEPHPuFsOUWYcKnAir3fmbXOYiWoV2B3kcccQ1ox2jIVUVV3yfMyvWyD
 E9e4T4+vMLesi+nZbYRKofmo+gYAaTGSVrIhAyLwK8VgV7ei1+bMLaf0dbjLgNr7lhAF
 cFYjyHSbWvKuYlXwE8pDUyxFK5G8qrXIMDxRkFq60AeU1+fnU4IdsDUs9wAWnCH5Rn1E
 xO7mnCApQun4+ZspwcoMd9Ugf7J7tF1+hsed/qkKx2YK1inl/p7L8pnG38RYt1iuLSo0
 cN6Wst7UW0wzxyFfcX0jU0S9Afmz7yiSrtxI+yD4gk5qK95EKvjkTfxEeoZtvtsx+LNB
 RNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GnKfjoq+otyiJmny5QHC7t7xnub0O32xM8y+f0O0Xns=;
 b=QVdydvl/0enKCxm5WMoj4dBwARhm5ZU9BaLMk4Nd6XDff6/y69BWp1IkYi+KBm1vJ3
 Y/PKByNWDt/pTMmYDS3ISqX9lyRwxMBvszr7h+SFV3reccA39bBTXBa/UcMgmAX9IRN7
 QRXKnHBpJIP1tmAiRgMIYo/nEBiCqpVlIUH3lj/0sSyOHQcJRNXCC6tHDm4+LIH8R//b
 t3T2qfvZURcnEWTthHFJy3etP0CdNIhG9krHRF2/Q8kpMYFcawgM/DlmWicVtVO5knk4
 8fzNbpxIInO5SPp8l2lyufYwuYitjoJ4Yn49tYkjInVk7dDg18g3jKiM7FVSQuXZDAB6
 0qqw==
X-Gm-Message-State: AOAM532sC4RM7cubw2P2yS0Pe9f5lvsTjlB5v6K3nOQYe8lZUg8FTw5n
 ON+j0DNLnVMjaI87fxQgW7QaH2nsKV0=
X-Google-Smtp-Source: ABdhPJxd2m/tBYqLU2IjQq7F1eibLzJWFITygbKLB1jlNJC7iRUjxN22RSZQkDwxFsda6+Yrtccszw==
X-Received: by 2002:a1c:c913:: with SMTP id f19mr7478643wmb.86.1631467702370; 
 Sun, 12 Sep 2021 10:28:22 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id 129sm4622080wmz.26.2021.09.12.10.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/30] target/avr: Restrict has_work() handler to sysemu
Date: Sun, 12 Sep 2021 19:27:11 +0200
Message-Id: <20210912172731.789788-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
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


