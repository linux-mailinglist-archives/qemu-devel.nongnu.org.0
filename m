Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7D52EF7B9
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:53:48 +0100 (CET)
Received: from localhost ([::1]:44048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwtP-0003rX-8l
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:53:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrh-00025w-Cd
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:01 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrf-0000tO-5r
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:01 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 91so9969636wrj.7
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=His0BTVqpkxUWnuh2zB20a08QgRZucIAGlzkuVBHQw8=;
 b=NpxhsKMmh298L34oB2RbvEmviBUMbnsGzkA0xxITwvtMV4o8n6HoSQppY+lp4BR80T
 DBX0LNTENyUFFrAFoBWWMHvoa8Ixipz8mH4aPVWjmtrQFYMfX7l8Fq8PMtBZhw1ZKyX9
 tn+EDJ1kWOTy+mNYSdwcZ9Jqhy6mbOTfRPICJDntXjwwcT/ho4EdYUEd8xXaByF6PAW2
 6gkfGWn0l5xbur/Y7+z/4nK+gk4hkoA2ht9BGhu7F3W10bFlCeqhqJoeSfTr1lGJB7/T
 kn2lQ5FvAoJqjKKjaaXeHL+5rYb5NecXrukSsUpAEI3LSImBznkOMl/o7UEKJaTrsddk
 hWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=His0BTVqpkxUWnuh2zB20a08QgRZucIAGlzkuVBHQw8=;
 b=LEeiYsHh65E0qdYuedTKcsrY5anIrytl4Wr1DN091G6JPHQEttC8IzgHquGq27sSKo
 X1MwKCzBUIkbCjsguqRrsBEOxfk45SjG68yxL0BW3M4pBlOFic3/if1T2GoVHknffS40
 yDrBu6Kkj+zqg2pIv8lATslR6ljFO0zPM/TKGFul9c2Z+L1vdrAu+Y0IU9O2WmPIfFID
 9a45ZgD5jkcEfOf29ITG0ulh4o6HkEfjCe9HlsbRa1PZG/9WDD0NUTyIqbAzB8nHR/z3
 WTH6KyA9uoImB36ovtobKdIVyJMKAjG32sr6Gpw/Ud8QCoZR8VMIVZhwFDDcvvfphCXK
 Fc+Q==
X-Gm-Message-State: AOAM531p9clTaRWGtJ8S23x/kLFV8GRxH05SiPGGrixALP2pIzgk5LVq
 zxvstTXz3rlFBWA30iMjzEUjBFk9n5r3Y8qeicB/Dbwdl1HAivro89XMAv0aZSwMjFnsN/Sa3m7
 mhUKlRVt6tNo+dWoQNuwoZJrPNDkolf7JXqBNkq12SIjtbfkOTtGwXL838LDPMot5lmOr3A==
X-Google-Smtp-Source: ABdhPJzIIQftpfU779wAGJgK6CwRkHCv2kkoYPCblbsKhpZelMBNDbxICxG4cUQKICWQOE+nrz3wJg==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr5039201wrt.209.1610131917585; 
 Fri, 08 Jan 2021 10:51:57 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:51:56 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] target/arm: make ARMCPU.clidr 64-bit
Date: Fri,  8 Jan 2021 18:51:50 +0000
Message-Id: <20210108185154.8108-3-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
References: <20210108185154.8108-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AArch64 view of CLIDR_EL1 extends the ICB field to include also bit
32, as well as adding a Ttype<n> field when FEAT_MTE is implemented.
Extend the clidr field to be able to hold this context.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5e3cf77ec7..fadd1a47df 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -938,7 +938,7 @@ struct ARMCPU {
     uint32_t id_afr0;
     uint64_t id_aa64afr0;
     uint64_t id_aa64afr1;
-    uint32_t clidr;
+    uint64_t clidr;
     uint64_t mp_affinity; /* MP ID without feature bits */
     /* The elements of this array are the CCSIDR values for each cache,
      * in the order L1DCache, L1ICache, L2DCache, L2ICache, etc.
-- 
2.20.1


