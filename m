Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6344DAE58
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 15:28:03 +0200 (CEST)
Received: from localhost ([::1]:47586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL5ow-0003tB-7k
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 09:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33797)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iL5dd-0007xN-MJ
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:16:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iL5da-0005IP-CU
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:16:19 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41514)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iL5da-0005Ht-4c
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:16:18 -0400
Received: by mail-wr1-x444.google.com with SMTP id p4so2306748wrm.8
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 06:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f0tAv2/jAUxDhCTtiuArN1X2HmDUT/iHPyZZjUW76EY=;
 b=H0+q/acxPeEnQ8wg781ymQLeWxa7rvcDeY+edi4NMNvkxH84v9GwHiI+WEMCWMDYZw
 9E679+XkAt2DmAfUszo5QYlWbhruBpOxFUbACGVC4Fqy9N99U5eJ2+e8Fpph+tCjfw+P
 O5enLwn3S/Hzq8iudNCas1ADGuerfkrYw99BdNL200ifdAtxJrGzjevXKKMrcw94Plr4
 QyLUXxnYrHcdpA4W2lDeWeBZvAojbpAebJCE7Mh4rHC6cfto2ToCGr2VO916RM1q1EEq
 X+2WqJQfdnkN6GOTrQCICT8us9D0JmeZoFmWOVavf0QD6MFJlUbeyQmX5G1J3yMJqcfo
 rxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f0tAv2/jAUxDhCTtiuArN1X2HmDUT/iHPyZZjUW76EY=;
 b=chdTWARIqTxEE4d2cMGst9jrQ393vyV4lM8O3lbSvEUqz5c8+ZBnJL3LV5mM+IUC38
 01jIjTr8kNI4k0Tim5Sm5fdmz6Mv1HIMYEjE8AFUD9AqkEQvAgNSTxjPXS2UG1FqBz6c
 jrnjukJs6Wd+TWUwrcm7f9ZcU4F6E1QuUK9pCgOYPTQeNszKXLDQdkF9Oycor067c1Cw
 khM+I07/MCGLH5m9ahZj0VtSgA2ig5zpyXzJ1KZFpZm3SVH0/ZoBNpX/BZXAcY9FBsLx
 FT3rNIiVPB68nvxx+ZVk5QmwKtwZySsaPhYyG29phchjFBPZqKTbBuTaQGMdXlGEsHNE
 lhLg==
X-Gm-Message-State: APjAAAXNNg1qLO4lEqAnbI0NQDIRApqBIx55Q3jcm1XeC8IMQhCLgPOm
 20++vSo762u3PEFulLlLaIGWaA==
X-Google-Smtp-Source: APXvYqxtwd5AuhgV03jyKUP4W8yuMzUdOztDHMI9fzCfV0N2ABh/1hy3JBak4A3QHL5DM5xMWRCVuQ==
X-Received: by 2002:adf:f0cc:: with SMTP id x12mr3037271wro.326.1571318176949; 
 Thu, 17 Oct 2019 06:16:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g11sm2180583wmh.45.2019.10.17.06.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:16:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D4DBC1FF8C;
 Thu, 17 Oct 2019 14:16:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v6 01/54] trace: expand mem_info:size_shift to 4 bits
Date: Thu, 17 Oct 2019 14:15:22 +0100
Message-Id: <20191017131615.19660-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017131615.19660-1-alex.bennee@linaro.org>
References: <20191017131615.19660-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: robert.foley@futurewei.com,
 Richard Henderson <richard.henderson@linaro.org>, peter.puhov@futurewei.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

This will allow us to trace 32k-long memory accesses (although our
maximum is something like 256 bytes at the moment).

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
[AJB: expanded to 3->4 bits]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v5
  - return the tweaks to mem-internal.h
---
 trace-events         | 2 +-
 trace/mem-internal.h | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/trace-events b/trace-events
index 20821ba545..22133dfd3f 100644
--- a/trace-events
+++ b/trace-events
@@ -149,7 +149,7 @@ vcpu guest_cpu_reset(void)
 # Access information can be parsed as:
 #
 # struct mem_info {
-#     uint8_t size_shift : 2; /* interpreted as "1 << size_shift" bytes */
+#     uint8_t size_shift : 4; /* interpreted as "1 << size_shift" bytes */
 #     bool    sign_extend: 1; /* sign-extended */
 #     uint8_t endianness : 1; /* 0: little, 1: big */
 #     bool    store      : 1; /* wheter it's a store operation */
diff --git a/trace/mem-internal.h b/trace/mem-internal.h
index 3444fbc596..1a010c1b27 100644
--- a/trace/mem-internal.h
+++ b/trace/mem-internal.h
@@ -10,10 +10,10 @@
 #ifndef TRACE__MEM_INTERNAL_H
 #define TRACE__MEM_INTERNAL_H
 
-#define TRACE_MEM_SZ_SHIFT_MASK 0x7 /* size shift mask */
-#define TRACE_MEM_SE (1ULL << 3)    /* sign extended (y/n) */
-#define TRACE_MEM_BE (1ULL << 4)    /* big endian (y/n) */
-#define TRACE_MEM_ST (1ULL << 5)    /* store (y/n) */
+#define TRACE_MEM_SZ_SHIFT_MASK 0xf /* size shift mask */
+#define TRACE_MEM_SE (1ULL << 4)    /* sign extended (y/n) */
+#define TRACE_MEM_BE (1ULL << 5)    /* big endian (y/n) */
+#define TRACE_MEM_ST (1ULL << 6)    /* store (y/n) */
 
 static inline uint8_t trace_mem_build_info(
     int size_shift, bool sign_extend, MemOp endianness, bool store)
-- 
2.20.1


