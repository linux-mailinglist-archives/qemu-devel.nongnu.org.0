Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0119F4E75A4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 16:03:12 +0100 (CET)
Received: from localhost ([::1]:52208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlT5-0002ZE-3j
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 11:03:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXlNc-0004tc-HF
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:57:32 -0400
Received: from [2a00:1450:4864:20::32f] (port=44597
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXlNb-0004DW-3r
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:57:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so4548392wmb.3
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 07:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4MlN/pySNODv55bFqFVfLg38b7ly0tYbAzl8thuVo7U=;
 b=mUbMwdrEqErii+hjQPzmiOjB5JYSQHIpv5KF4PniNEyWteBcKnmn98erfsKBuWpoOw
 5p6qgiRD55W7p3W7w9hLTGud+EuvyhqUDVMV2u34O5bVIgi5Mp8yXazohkfr9Bcxn0hW
 pMajTO8HmV20WZFRmYL/neLgI+IAZVGtSg3p/4IRNndYoW6g+8oR7+S8zfwPbkHoqhGt
 wT+NK9mAnGWnrLfF545XzCO1TPYBJr7dfWt+em+NBP9SyliS1alorLrWFDYu72kjLFGc
 Hg4ldGVe4tcPtcsw3+PWuca2Ish+bhQgFj3mZ4FmruEpVxY7Il9utOXi9g/emiU13NqU
 InmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4MlN/pySNODv55bFqFVfLg38b7ly0tYbAzl8thuVo7U=;
 b=meXTf+xiqEXJmFVTRxlpCG4kris5q2VKddYsbmRmXhX8BEX2pKRrL7pRjpBadTS4eV
 unhFHlFTovhbKyehhxfaAzYOnq1H4Pq4bCHpIgDPv6PWVTcUERKE6OdgP11Zcajxh/9Q
 9eWXbLx/NJq8GtFqFaNzQY+tnVpGSE2JyvtrmQhjzTeKwf9ouenqbPLqW8UxxgIF69Gg
 iC3UzvqyiW0dbfr2qzg0u1YIN4KqmPHsHSma7QeuEooK7Usk20HksBUwdjlag1jAIlGc
 3OVsFb9Tyqi/SzKlSkDww7R0aIPSyRMZ3/VMvuZfErkHvGWb0TTz/5GR6vll4rlp/wN3
 8jnA==
X-Gm-Message-State: AOAM531sqKiZn8YdaoRp6K3kgYT0MZ7QCnXtrHO69s7ybJkkytabQ2AF
 P0WzqQUE9HcwjDaKq6ciqK8noeTF4qpjTA==
X-Google-Smtp-Source: ABdhPJyKuepYDGEkEsVZsvmMeITNDdg764cgjI7t8ZRyYLviR7TzKS+D/rPuaZ/jUUIjB8mO3YrGpg==
X-Received: by 2002:a7b:c2aa:0:b0:389:891f:1fd1 with SMTP id
 c10-20020a7bc2aa000000b00389891f1fd1mr19626594wmk.138.1648220249687; 
 Fri, 25 Mar 2022 07:57:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4f07000000b00203db8f13c6sm5200583wru.75.2022.03.25.07.57.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 07:57:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] hw/intc/arm_gicv3_its: Add missing newlines to
 process_mapc() logging
Date: Fri, 25 Mar 2022 14:57:25 +0000
Message-Id: <20220325145725.3891659-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325145725.3891659-1-peter.maydell@linaro.org>
References: <20220325145725.3891659-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

In commit 84d43d2e82da we rearranged the logging of errors in
process_mapc(), and inadvertently dropped the trailing newlines
from the log messages. Restore them. The same commit also
attempted to switch the ICID printing to hex (which is how we
print ICIDs elsewhere) but only did half the job, adding the
0x prefix but leaving the format string at %d; correct to %x.

Fixes: 84d43d2e82da ("hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b96b874afdf..87466732139 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -524,12 +524,12 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
     trace_gicv3_its_cmd_mapc(icid, cte.rdbase, cte.valid);
 
     if (icid >= s->ct.num_entries) {
-        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d", icid);
+        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%x\n", icid);
         return CMD_CONTINUE;
     }
     if (cte.valid && cte.rdbase >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "ITS MAPC: invalid RDBASE %u ", cte.rdbase);
+                      "ITS MAPC: invalid RDBASE %u\n", cte.rdbase);
         return CMD_CONTINUE;
     }
 
-- 
2.25.1


