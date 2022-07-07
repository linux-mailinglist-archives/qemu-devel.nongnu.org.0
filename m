Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15C956A24E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:50:12 +0200 (CEST)
Received: from localhost ([::1]:36434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9QxP-0006B1-OQ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbo-0007tb-BN
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Qbj-0006ww-5Y
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:27:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v14so26104767wra.5
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 05:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=54C2KT31QW3Oe8QM5umZHnyj6rkELBZ/NxsErfLMW/Q=;
 b=qxfcEttVJTxiamd8ISBmU4maDrJSBedccAI+hyAoncfQYZuoAy9usGvzIz88QIexqe
 KeorZ206EYjlpd8z+RJxmNODT8uEoQrYmdCr3/msnsz8Z1UBo8Bzkxd4eHIWgq5cpjJq
 AD7q9xGFd+pYo7PIaVfVTwKyYvCOEfH5swuh2tZZ/UJu3h3jt8HiAnCB++ngnVI8/SnG
 LY2dmoyrkuR00hgoSNTxoTp8Pamd+xZ4eblEB/Va3PvbxFv+SDUxFVsamMp58PvIU8g1
 cdqc5GTDhxQALkTY05FnwJf9IJlbHniJF2Wge2KOu0ucdYdm3XzmoZu3tV0PvUDsEDFK
 EDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54C2KT31QW3Oe8QM5umZHnyj6rkELBZ/NxsErfLMW/Q=;
 b=znRWlHqO3aO81iBD57mQvf13zStjDHql7QGCm/EMYvPJip9ERcetHkz9hQPFmXLUei
 3C9mgPfwoSCdCeJmLwv5lua8ZCKwPqFdUzHRErn7v0d4HBCRhmoe77vt+eZorkgkIUMM
 3ggZRoQ6dginF+/gXrIZXNF6AcVFgiD0nGkQJMbtX4Y8ee31XUkpKcYJ/srWCorJ5c9U
 fyobFwkigiiodVoLWayc9U8S6oAYRXAmxywopjtrJSw7IONSSH3J8aSqZv0pFr8xinbx
 2e1QJfqBnR8eU+McEkM+goW5qGNpUkLmEG//6BgYYuMWCABKao+zhU9/tziG51L2k8PF
 G3Nw==
X-Gm-Message-State: AJIora+ERz/GB2uE+/JtYelA+qoSTlCEr/5e3iAxd1PNNuuafGzaL1XQ
 PmXBkWsTaYrZnFP1fQi0eTK96x6wt7QKnA==
X-Google-Smtp-Source: AGRyM1sdszgnm+uUd+aPgev4MOTg4bNBqxV6tPUqnCL3gccwqphalrajug/BPXoCfY6kzfQRSSX36Q==
X-Received: by 2002:adf:979b:0:b0:21d:868a:7f3b with SMTP id
 s27-20020adf979b000000b0021d868a7f3bmr2811056wrb.451.1657196865687; 
 Thu, 07 Jul 2022 05:27:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003a0375c4f73sm29177618wmq.44.2022.07.07.05.27.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 05:27:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] target/arm: Fix qemu-system-arm handling of LPAE block
 descriptors for highmem
Date: Thu,  7 Jul 2022 13:27:34 +0100
Message-Id: <20220707122734.288929-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707122734.288929-1-peter.maydell@linaro.org>
References: <20220707122734.288929-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

In commit 39a1fd25287f5d we fixed a bug in the handling of LPAE block
descriptors where we weren't correctly zeroing out some RES0 bits.
However this fix has a bug because the calculation of the mask is
done at the wrong width: in
  descaddr &= ~(page_size - 1);
page_size is a target_ulong, so in the 'qemu-system-arm' binary it is
only 32 bits, and the effect is that we always zero out the top 32
bits of the calculated address.  Fix the calculation by forcing the
mask to be calculated with the same type as descaddr.

This only affects 32-bit CPUs which support LPAE (e.g. cortex-a15)
when used on board models which put RAM or devices above the 4GB
mark and when the 'qemu-system-arm' executable is being used.
It was also masked in 7.0 by the main bug reported in
https://gitlab.com/qemu-project/qemu/-/issues/1078 where the
virt board incorrectly does not enable 'highmem' for 32-bit CPUs.

The workaround is to use 'qemu-system-aarch64' with the same
command line.

Reported-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220627134620.3190252-1-peter.maydell@linaro.org
Fixes: 39a1fd25287f5de ("target/arm: Fix handling of LPAE block descriptors")
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index da478104f05..e71fc1f4293 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1257,7 +1257,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
          * clear the lower bits here before ORing in the low vaddr bits.
          */
         page_size = (1ULL << ((stride * (4 - level)) + 3));
-        descaddr &= ~(page_size - 1);
+        descaddr &= ~(hwaddr)(page_size - 1);
         descaddr |= (address & (page_size - 1));
         /* Extract attributes from the descriptor */
         attrs = extract64(descriptor, 2, 10)
-- 
2.25.1


