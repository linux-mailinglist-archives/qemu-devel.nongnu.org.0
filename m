Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30851225E7A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 14:25:17 +0200 (CEST)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxUr6-0002OV-9F
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 08:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jxUq4-0001za-60
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 08:24:12 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jxUq2-00030O-9d
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 08:24:11 -0400
Received: by mail-wr1-x444.google.com with SMTP id a15so2689582wrh.10
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 05:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z76pOWpfHunO7qOCNdFRDiJcQkv/jyIxJDuRUVM7bG4=;
 b=BdH4FPhpLhTiNNu0m+zBB5tkh2YbftFG2qt2z/sSODNpCj1DcCDYPSc8ngE0NzhS35
 UDfWZcEI/g6/S/q2YfVfTmiTjpER3M1OsaZjayerpvp1kMtTCXrsUT9RF1F68qdjzlMk
 RMjd2GBb8RJ3Wrqrda0rIuTCE6etHFGIT/QhoroA2NgT89ceBK2zZbYJyARJAwsZfpix
 jukN6pUDhM0tJ/wewg+Rk+R/OfpyWnGEHFQJhegvAIZHZ4nDKik0um+lPAA2nEd0w7SY
 IkcJsjEThWGyqyRAjQwe1fF2uJinPREW/2C1Zp1i2yEq9wZsg93SqSgnKZhRLztJJsVo
 ENtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z76pOWpfHunO7qOCNdFRDiJcQkv/jyIxJDuRUVM7bG4=;
 b=nSnMjzw/2Glxbfkn3PJnpB/xeDZesr/JxQR3JGkBP+d1XyKh3pTcw42KuD/dzS3UFq
 F4V92RXAx8xeRuRBzP+0l/DRJg/b8WV0DSG3SRmjbgpG50jQaUR6+avQCLWxDJbcS0z6
 Msd5w5upVjvafeYi7/YvwvGCSn5W6M4LoKy+vUANyISIsrb0SIBT0pcTqlRAz7SGYjZv
 almM+I4Hb4XNziLNazjFEFjFQ2kZqYTEVDiBsPJDt/UPz0TQoEqGgNjwZp9cOkVGoCrP
 5IdNvkNplYN68XlEub6421R4erXY9tZPNpBgTxHP2LTjeuNJXQ+lTWD9xYYDLqxZMTB1
 9pVg==
X-Gm-Message-State: AOAM5330QIRDq6KHVTCd2QJzFA0OkB7jTmYVZTwUYFYNBxleO0bmkuwS
 1P3PotDFaouOaxwqoPXo8zpGJw==
X-Google-Smtp-Source: ABdhPJzkunziiyLMl8v+sF5yk+4NJRXuIIo6Ja6SfEooZaHCuJLH9u0v7ATAIhEodes3HmCNnKmXvQ==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr1026072wrj.380.1595247847776; 
 Mon, 20 Jul 2020 05:24:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w1sm1115046wra.73.2020.07.20.05.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 05:24:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 850911FF7E;
 Mon, 20 Jul 2020 13:24:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: update comments for save_iotlb_data in cputlb
Date: Mon, 20 Jul 2020 13:23:58 +0100
Message-Id: <20200720122358.26881-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G . Cota" <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I missed Emilio's review comments:

  Message-ID: <20200718205107.GA994221@sff>

and the patch got merged. Correcting the comments now.

Reviewed-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cputlb.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index d370aedb475..56982927490 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1075,10 +1075,8 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
 
 /*
  * Save a potentially trashed IOTLB entry for later lookup by plugin.
- *
- * We also need to track the thread storage address because the RCU
- * cleanup that runs when we leave the critical region (the current
- * execution) is actually in a different thread.
+ * This is read by tlb_plugin_lookup if the iotlb entry doesn't match
+ * because of the side effect of io_writex changing memory layout.
  */
 static void save_iotlb_data(CPUState *cs, hwaddr addr,
                             MemoryRegionSection *section, hwaddr mr_offset)
@@ -1408,8 +1406,9 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
  * This almost never fails as the memory access being instrumented
  * should have just filled the TLB. The one corner case is io_writex
  * which can cause TLB flushes and potential resizing of the TLBs
- * loosing the information we need. In those cases we need to recover
- * data from a copy of the io_tlb entry.
+ * losing the information we need. In those cases we need to recover
+ * data from a copy of the iotlbentry. As long as this always occurs
+ * from the same thread (which a mem callback will be) this is safe.
  */
 
 bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
-- 
2.20.1


