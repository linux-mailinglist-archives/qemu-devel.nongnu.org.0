Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C1E320AF7
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:38:27 +0100 (CET)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDpsQ-0000Am-H6
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpq1-0006ov-7i
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:57 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDppz-0002z7-Gw
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:35:56 -0500
Received: by mail-wm1-x336.google.com with SMTP id m25so2579341wmi.3
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tPkF9LN3MCz1YIoG8cZ34rc1Sah2fHk5nIfuBciZdSU=;
 b=kVTHHJUBDVtUidxrAzcFp44lszCy/6gk5SYk8NCc1O3Zzc9+sXluPSniI7PXtWt4Xj
 h/UW7IVz5a97Es8sMRZF7C+Diw5gVdPqdWrDRCbx0PvdqhGdJ1jB4BbgVG1a7oJhVZYq
 MxWFslp7TrHSNbsuPXLmzmQdXXvoLeeAmsIEZBg3aSvhAaq3EUXi1Bf3RxX9VqXTBxA4
 dqSdpd/YEaqKw2ymXVh8xn+qLcQesjZxJ5g4ContxRcu0J5XHAVtcNXgOajN5aj0cikV
 IHirvX/2UJn80DR5xc5VcycSAwm5cneplNPoSMVO8u9+U/jRANCHckpIL0wonup5IZD1
 y0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tPkF9LN3MCz1YIoG8cZ34rc1Sah2fHk5nIfuBciZdSU=;
 b=k+DS+wTWAO4TIzvfEf4PxXqvOg0gtfKwVlX817l1T8UDpRMvs3q/Q7kOrfRwzrlXHK
 JNyi9Gq+SEeyC0ZGyPd9iHxs6tZhOHHJuW9Elh4SfHpWxsxOrU5dJ3yKT5Gxg3VeiDM4
 y/xgQL4q9K/JUAd44SrRz5qv/meiKAJklV5l4P0jPl3ueWGi8OVGJjxqXecYab8p9KEn
 c93pQ0QkoB+3bxnfA/qpmHgauiyj8L6QItaC4cZZBmDGu5GZUOk6+XqEPwQFaK3HCWGn
 G0n6sNRutalEj0fx5nOgv5YSj52XVNxVCbNcJI0F3GZyJc8n9Yoq0YjtbXO58uQlF5mc
 WSFQ==
X-Gm-Message-State: AOAM532clPsH8s5F67kBdj0BtWMg4yoKtTOuXdPHUkpOQ5/hXF+OQI+X
 Z0WH8Sj2fBOggeRWf8CkK1hvRdsYBos=
X-Google-Smtp-Source: ABdhPJyt/T8eun1LPzCiVwQWBPEyYVHYU4Mbj4FjnITCS3wOrckY2GLOcDmmI8jQq/lqamawd4PptA==
X-Received: by 2002:a1c:5419:: with SMTP id i25mr16878734wmb.166.1613918153815; 
 Sun, 21 Feb 2021 06:35:53 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e1sm24940417wrd.44.2021.02.21.06.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:35:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/43] target/mips: Let cpu_mips_translate_address() take
 MMUAccessType arg
Date: Sun, 21 Feb 2021 15:34:05 +0100
Message-Id: <20210221143432.2468220-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The single caller, do_translate_address(), passes MMUAccessType
to cpu_mips_translate_address(). Let the prototype use it as
argument, as it is stricter than an integer.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210128144125.3696119-10-f4bug@amsat.org>
---
 target/mips/internal.h   | 2 +-
 target/mips/tlb_helper.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index d09afded5ea..34915c275c4 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -146,7 +146,7 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     int mmu_idx, MemTxAttrs attrs,
                                     MemTxResult response, uintptr_t retaddr);
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
-                                  int rw);
+                                  MMUAccessType access_type);
 #endif
 
 #define cpu_signal_handler cpu_mips_signal_handler
diff --git a/target/mips/tlb_helper.c b/target/mips/tlb_helper.c
index 9216c7a91b3..9bb635885dd 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tlb_helper.c
@@ -903,17 +903,17 @@ bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
 
 #ifndef CONFIG_USER_ONLY
 hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
-                                  int rw)
+                                  MMUAccessType access_type)
 {
     hwaddr physical;
     int prot;
     int ret = 0;
 
     /* data access */
-    ret = get_physical_address(env, &physical, &prot, address, rw,
+    ret = get_physical_address(env, &physical, &prot, address, access_type,
                                cpu_mmu_index(env, false));
     if (ret != TLBRET_MATCH) {
-        raise_mmu_exception(env, address, rw, ret);
+        raise_mmu_exception(env, address, access_type, ret);
         return -1LL;
     } else {
         return physical;
-- 
2.26.2


