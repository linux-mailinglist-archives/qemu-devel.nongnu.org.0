Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E682F3660
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:01:54 +0100 (CET)
Received: from localhost ([::1]:35336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzN3I-0003Ng-TZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:01:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMza-0001Tr-3s
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:02 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzY-0006xW-Jb
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id 190so2526133wmz.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=J4L022TzDpwIjVuY3iJsZtRyyv98RdYaVw0aN/TPG5k=;
 b=ajHua4KodR4yKG/LcKBdAsCfamQif8CdhDH3tD+EMT1NvcYsQAfRd3n5+hWzWgzpqP
 HJhlQ6sk7OmWt7MMdwCBebAKp9ms92eoc2fhhO/VcM1C2j7KJW3qdnW7FiWgQzJKIBbl
 Gtlacfc7aJ9RHi8ahjzlIJKyLMLxN96/amxRRuwwGmmKtaf4BwSPGOmkdBKpcKyJeGo9
 PbkAQaGR+tnVYv3NRtDhe3d5/ZmeNufGMCLuLwHws4sVqcoQcOcr84t6tm4vY23/YH8/
 fPuKI2M75PhxXNMTGZ72c9WBVpTg131xFgnhl0V9Kz85TIcJYmWFfz/8faGhqGS5H6KT
 /xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J4L022TzDpwIjVuY3iJsZtRyyv98RdYaVw0aN/TPG5k=;
 b=NZFH/FgROdv0XVuvLQRG4oYhKG8Q6A2YBowsULbHQNffl4VP8llskwPPg6sBp8vghQ
 UPL9YY5X8gXcMAq+j1Bo9NHFNeCHsRp3BevZXmmTMEhX4K0okr2CbD2d1Pk9t+HImtU8
 +Om72WXFWhTPbh19nczqnu+GgM8gkiv8etWwn6l9V2zEto5PLttfAOJfYd0FZfXsldW4
 ogtPH52uiUCy5aN/RCHZr+gZRbQXW4EnGC8HxhR1B9UfJVAvnt/jCtxJKMQFHIxTDpnh
 f8JANok/asNsxGBWhXul0b3HS1hg8X/nx5tM0gZ95vQ5rt+kk4rg2CVz03p2DyeUNiyW
 qMeQ==
X-Gm-Message-State: AOAM532EhkNM/VcWtRvsmNe3s5aN/mzW6nny5Iw96DNMFgniVhu5Hqa8
 rHJHjy19/B5DF0MPpWqwNDGtMUROxfYQ5w==
X-Google-Smtp-Source: ABdhPJzdjokEAHTOqQ10H3upP/Pk0TN/fxzXHryh+0EdjA1rJmUuqI0/s6Qc0V5zEG0zOw1EeVpfPg==
X-Received: by 2002:a7b:cbd0:: with SMTP id n16mr195982wmi.162.1610470679063; 
 Tue, 12 Jan 2021 08:57:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.57.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:57:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/21] target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1,
 CTR_EL0 to cpu.h
Date: Tue, 12 Jan 2021 16:57:35 +0000
Message-Id: <20210112165750.30475-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leif Lindholm <leif@nuviainc.com>

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Message-id: 20210108185154.8108-5-leif@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0795c4cc06a..9c1872f2686 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1736,6 +1736,37 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
 /*
  * System register ID fields.
  */
+FIELD(CLIDR_EL1, CTYPE1, 0, 3)
+FIELD(CLIDR_EL1, CTYPE2, 3, 3)
+FIELD(CLIDR_EL1, CTYPE3, 6, 3)
+FIELD(CLIDR_EL1, CTYPE4, 9, 3)
+FIELD(CLIDR_EL1, CTYPE5, 12, 3)
+FIELD(CLIDR_EL1, CTYPE6, 15, 3)
+FIELD(CLIDR_EL1, CTYPE7, 18, 3)
+FIELD(CLIDR_EL1, LOUIS, 21, 3)
+FIELD(CLIDR_EL1, LOC, 24, 3)
+FIELD(CLIDR_EL1, LOUU, 27, 3)
+FIELD(CLIDR_EL1, ICB, 30, 3)
+
+/* When FEAT_CCIDX is implemented */
+FIELD(CCSIDR_EL1, CCIDX_LINESIZE, 0, 3)
+FIELD(CCSIDR_EL1, CCIDX_ASSOCIATIVITY, 3, 21)
+FIELD(CCSIDR_EL1, CCIDX_NUMSETS, 32, 24)
+
+/* When FEAT_CCIDX is not implemented */
+FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
+FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 10)
+FIELD(CCSIDR_EL1, NUMSETS, 13, 15)
+
+FIELD(CTR_EL0,  IMINLINE, 0, 4)
+FIELD(CTR_EL0,  L1IP, 14, 2)
+FIELD(CTR_EL0,  DMINLINE, 16, 4)
+FIELD(CTR_EL0,  ERG, 20, 4)
+FIELD(CTR_EL0,  CWG, 24, 4)
+FIELD(CTR_EL0,  IDC, 28, 1)
+FIELD(CTR_EL0,  DIC, 29, 1)
+FIELD(CTR_EL0,  TMINLINE, 32, 6)
+
 FIELD(MIDR_EL1, REVISION, 0, 4)
 FIELD(MIDR_EL1, PARTNUM, 4, 12)
 FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
-- 
2.20.1


