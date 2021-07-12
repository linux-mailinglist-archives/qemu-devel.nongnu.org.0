Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71FA3C5C93
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:48:09 +0200 (CEST)
Received: from localhost ([::1]:42702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vM0-0005uD-SU
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1t-0004RQ-Op
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1s-0008E5-8F
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:21 -0400
Received: by mail-wr1-x436.google.com with SMTP id i94so25337439wri.4
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NwsUwBTLZFfTsKglJpuTCG7rL3bqmkHOdoMoH79RLik=;
 b=xIr/u/hDJxP5B/JgezcRz07IiklTl7wtn7qrIbP6dMJD9cgT2a0j2k/lXTVij1wMzP
 BXj07fYG8I1WX4i3YCvIzp3msymoYCprBd4K67pkUyszkfl1QRqR7X1wLbsUg3Gg6nJi
 ZbY9I7MBzVdJBkxxxRRGZDEA1KnfVZxTz+LvN1aq7AJb/tl9NMIKz71drvtJiMycm3Xc
 +6JReQgenl/HtTZ9Sjygn+eZRFPni+WMK7Hoa625bYT6/PHNuwHIiCzsU1Eo37Qtc7OQ
 7+H0aFPZvHoaB00Fo2WksP10VTM4pJffro+f/JItop/AY/RtbLcySQmjWaTgEq3T0CrD
 LI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NwsUwBTLZFfTsKglJpuTCG7rL3bqmkHOdoMoH79RLik=;
 b=Ijn7Min1VuAvbpg+QziLzniqt3GXT87NnsxwS+ZaC4S0qRQL1SkqFcM8KNxzmgLnsG
 sOuj5KCXViMtZdtzoAbzP6zwrR1A7rANL6QCHZS6A4ehHWS2em9EaqXbyMtDd/1tq/ZB
 jXccFXh9YR3DZR0BnB54dqPXWp0wKftQa5XtoRusGxmKaFijU7m9F3Vi4IUvk1mMfvIb
 GzYzibN5mzXoU+nseGUwekFc0nu47c9/nJwxlEEOKdhvhmaEjXKkqTF6xSXm29pW7wxs
 e+DOsUXyeUbEUb97of/WsPgJtEigPTlLGwbc9rSEvLwBf1EfWWuVR/qCXjI4FHB34ymd
 ULDw==
X-Gm-Message-State: AOAM533dW3s4bTIDjiE00zI6h0UL2aivaANbV6eHpo0GVoQW/gk6gYfY
 zeK74mfOQhKG/gwOr7Zj0RuBuQ==
X-Google-Smtp-Source: ABdhPJzkS01HAyLuMQSs/R0bHGY1HwuMJ6dwJ8+Hty/i88VgbvEmLKEE6zgT8krzrPLZXSTdnAAAQw==
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr22363333wrx.114.1626092838547; 
 Mon, 12 Jul 2021 05:27:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x17sm14587472wru.6.2021.07.12.05.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B4EB21FFB3;
 Mon, 12 Jul 2021 13:26:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 27/40] plugins: fix-up handling of internal hostaddr for 32 bit
Date: Mon, 12 Jul 2021 13:26:40 +0100
Message-Id: <20210712122653.11354-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compiler rightly complains when we build on 32 bit that casting
uint64_t into a void is a bad idea. We are really dealing with a host
pointer at this point so treat it as such. This does involve
a uintptr_t cast of the result of the TLB addend as we know that has
to point to the host memory.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210709143005.1554-28-alex.bennee@linaro.org>

diff --git a/include/qemu/plugin-memory.h b/include/qemu/plugin-memory.h
index b36def27d7..0f59226727 100644
--- a/include/qemu/plugin-memory.h
+++ b/include/qemu/plugin-memory.h
@@ -18,7 +18,7 @@ struct qemu_plugin_hwaddr {
             hwaddr    offset;
         } io;
         struct {
-            uint64_t hostaddr;
+            void *hostaddr;
         } ram;
     } v;
 };
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b6d5fc6326..b4e15b6aad 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1728,7 +1728,7 @@ bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
             data->v.io.offset = (iotlbentry->addr & TARGET_PAGE_MASK) + addr;
         } else {
             data->is_io = false;
-            data->v.ram.hostaddr = addr + tlbe->addend;
+            data->v.ram.hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
         }
         return true;
     } else {
diff --git a/plugins/api.c b/plugins/api.c
index 332e2c60e2..78b563c5c5 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -308,11 +308,11 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
         if (!haddr->is_io) {
             RAMBlock *block;
             ram_addr_t offset;
-            void *hostaddr = (void *) haddr->v.ram.hostaddr;
+            void *hostaddr = haddr->v.ram.hostaddr;
 
             block = qemu_ram_block_from_host(hostaddr, false, &offset);
             if (!block) {
-                error_report("Bad ram pointer %"PRIx64"", haddr->v.ram.hostaddr);
+                error_report("Bad host ram pointer %p", haddr->v.ram.hostaddr);
                 abort();
             }
 
-- 
2.20.1


