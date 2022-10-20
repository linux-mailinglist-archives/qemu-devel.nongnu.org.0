Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E02606B5E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:40:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oleDF-0005gp-3R
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:40:29 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ole9p-00079z-UM
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9h-0006TU-3v
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:49 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9f-00011s-HK
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:48 -0400
Received: by mail-pg1-x52b.google.com with SMTP id bh13so872567pgb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GPM9sD1J7LDvJDVQg9T/5F8YfP6ZpygL4aiMX7D6XJM=;
 b=h5g3GBQhIgjHVtNRD6buP7LdCjYVLtiLR/y602pz/if7Qs9pg7K96VLInSc0MAudIq
 beqUKs5vlGihs65Yf0Bk/jmybZLa3NSD5QqgyF6/KJWByqUwllkDe0MrxK3+nvhVApfj
 gy9wdzGjRHq6108KfFDyR0CBtKVFdHK2bniDIEZBk6oNssUEspAptmr7KiFtJzElF4L+
 yCivAGvxhdcFQfI3S8jf+0+32DVLc3DpB/5Qy7cypI1G1OiDbxNSl6DJhE+KMEifDyEB
 QXBugaR+xmciZRfVFLi9cxtRAG9qUIXyAhmArCiZjIJTugM7MFznQz2tQsZzxq9QXmqq
 6oWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GPM9sD1J7LDvJDVQg9T/5F8YfP6ZpygL4aiMX7D6XJM=;
 b=HnPQwnEH+MN4jLuFBXogN0pI5s5Ox1TujR9QY4v3tZ1W5IIOxnwgMOG7F24JOiBXsy
 PeR9B1hn/SpVr9wpmEdGIn29OXg+Lm6Xld37ilRw/LOJpGT3GxtwZ5czl6DmrVGMbYtW
 /Un7WiTtnn0tKBz2Zo0J9otXcQ74roNeyJyLKQRYBH4be6jt7yN3UcYxto2cWybmv8Nw
 HwPCvSEg5o3JSO5FO/XFQ2PVihrcNwXQBkJdxHr7Zpj5Wa1yWKa/EorSV4eVopK0xhXq
 ogOJj7HBLy7qEWN0Za1AVu0HCjL//Bgmwxq4+R6uLFoeQIQ4R5xu/Vwtb7yEjTAag8Xo
 m8oA==
X-Gm-Message-State: ACrzQf0s+8aE2XAUpadO1tjM1Mxl6hF3cd0XNJ+zZ/kzm4JFrVNSxDIs
 lwqJ6+HfA2eSyBSCzBELPFe6nSfhfexYmwpv
X-Google-Smtp-Source: AMsMyM7P8ueS3dVRw7Bfqn7GnfJQAQyKfTsyb12K/1VT06S4VwSoSeCVSzkagB+7dQWJPY/COGKLKA==
X-Received: by 2002:a05:6a00:22d1:b0:562:5d7d:5588 with SMTP id
 f17-20020a056a0022d100b005625d7d5588mr16108302pfj.58.1666305406282; 
 Thu, 20 Oct 2022 15:36:46 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 06/14] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Fri, 21 Oct 2022 08:35:40 +1000
Message-Id: <20221020223548.2310496-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 16d7989604..a5ef5f6054 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -338,6 +338,7 @@ typedef enum ARMFaultType {
     ARMFault_AsyncExternal,
     ARMFault_Debug,
     ARMFault_TLBConflict,
+    ARMFault_UnsuppAtomicUpdate,
     ARMFault_Lockdown,
     ARMFault_Exclusive,
     ARMFault_ICacheMaint,
@@ -524,6 +525,9 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_TLBConflict:
         fsc = 0x30;
         break;
+    case ARMFault_UnsuppAtomicUpdate:
+        fsc = 0x31;
+        break;
     case ARMFault_Lockdown:
         fsc = 0x34;
         break;
-- 
2.34.1


