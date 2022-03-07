Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DBE4D049D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:54:50 +0100 (CET)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGdF-0001Xx-4L
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:54:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW3-0001fr-9y
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:23 -0500
Received: from [2a00:1450:4864:20::42c] (port=41971
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW1-0007km-Pu
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:23 -0500
Received: by mail-wr1-x42c.google.com with SMTP id i8so24262095wrr.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cuM6/+p90e9wLyBjLSQA/Njnuwiyeuurw2dGmJV2SRg=;
 b=MOllhC7TI+Mxey5Cl0jmwWdbv25DDA81Z/5GU+DSJocmnSwcvx4Mti+zVkrpkoGuyI
 zAZyw9VhMIkvrA0T7gU4zez/ox3pYrQ2xI2vK4+l8QsQjqFguv+RtDthaKcIxr7oT7J0
 WJUtF9WOxHNqwOTxHT9ja2OZJgAwETBy77IObgolt6Hn0x4w129+h9WWPwfFEYjnPcry
 MQWlFnQlY2t3WRyboXjZ0i7NRdm5JzhawRWMe2ZCCa5OiZ76bcbi+bQkZFuzz800AaKC
 HjFPbb76OltewSW76Mk1kvMCtSFRCzcoesqmryRy9qLS88le4OeMKPrADBLKJ2Mmc8gG
 Q6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cuM6/+p90e9wLyBjLSQA/Njnuwiyeuurw2dGmJV2SRg=;
 b=Zhp032pVODN/qErYbw6TklS33tqqM90HnXX1H6YaJUo49cStVU/Qn3RxcKi42G3Tuo
 ZKuIMdQFEgnvbeN2L0Hl7GtfE8uP413mfmPinTOnG5/0QclcfhssN1Aeur2Nzj6pknay
 LDB8+0dPYNRUv4aI0M26n2D1mHfmO0MB0qlU30V2wVqXDq7KIfZdK2/nEwmXIM4lVe9T
 hvQIsoLTSna4HhK9not5QfBAWShGOc3XC6qKL8B9hXEyf4hEvqKQ9ezhrNcKCKVftagj
 AlZGkDjvbJK/g0nf23VLGQqP9P0OlbViHPzW/I6w9F1TDKTMime6md50Mt8zraR1R69v
 +B7w==
X-Gm-Message-State: AOAM5302+OoKHzfoYbYYHpvyO9473wZMaw2NCsGd1IbFbeB0RA8ehvWB
 dfCDCsLSVzt44b35U1fQT3viGcEJi4avUg==
X-Google-Smtp-Source: ABdhPJzWRfeSZCjR545/qCKZRJX8v2lnqoI5Tsk/OcC0RET37RDumfezHIcz6hNlWtazn9j68UQe6g==
X-Received: by 2002:a5d:47c5:0:b0:1ef:f2e8:11fc with SMTP id
 o5-20020a5d47c5000000b001eff2e811fcmr8670979wrc.109.1646671640502; 
 Mon, 07 Mar 2022 08:47:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/18] target/arm/translate-neon: Simplify align field check
 for VLD3
Date: Mon,  7 Mar 2022 16:47:01 +0000
Message-Id: <20220307164709.2503250-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

For VLD3 (single 3-element structure to one lane), there is no
alignment specification and the alignment bits in the instruction
must be zero.  This is bit [4] for the size=0 and size=1 cases, and
bits [5:4] for the size=2 case.  We do this check correctly in
VLDST_single(), but we write it a bit oddly: in the 'case 3' code we
check for bit 0 of a->align (bit [4] of the insn), and then we fall
through to the 'case 2' code which checks bit 1 of a->align (bit [5]
of the insn) in the size 2 case.  Replace this with just checking "is
a->align non-zero" for VLD3, which lets us drop the fall-through and
put the cases in this switch in numerical order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220303113741.2156877-3-peter.maydell@linaro.org
---
 target/arm/translate-neon.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 072fdc1e6ee..384604c0095 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -665,16 +665,16 @@ static bool trans_VLDST_single(DisasContext *s, arg_VLDST_single *a)
             return false;
         }
         break;
-    case 3:
-        if ((a->align & 1) != 0) {
-            return false;
-        }
-        /* fall through */
     case 2:
         if (a->size == 2 && (a->align & 2) != 0) {
             return false;
         }
         break;
+    case 3:
+        if (a->align != 0) {
+            return false;
+        }
+        break;
     case 4:
         if (a->size == 2 && a->align == 3) {
             return false;
-- 
2.25.1


