Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 684512AD54F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:34:29 +0100 (CET)
Received: from localhost ([::1]:36776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRuu-0003fv-EF
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgR-0001xM-2B
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:31 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:43596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgN-0006oK-Od
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:30 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s8so5152425wrw.10
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1xSX3FHtZwaNdWEesDDxbv6UzUKE+EZ51VclS+NR9fA=;
 b=GvE8I6H16jUVUsd6u/Vj7KRuHsLiHs5IROvPaduyQ4ZDDrng47SK3j5fkU5Jq3pm83
 e6+omTmPVjM5azmI7uOEt/2d8PPYeYRW70xRlC+Voouz2ri2HsmM1EBgMeD3YhpALMxd
 SbVYu6e+EZV5J5aCMaDsT9ZgZPPeR1kHBzFBACwLz0a27sdjpVwJmkOCSCH8ztncxjUA
 Kc7xt8Btf9svpY4IKQKbphB+eNhCH35OGvVAb/zg09cxDJ5CHqBbM3QtRg1n/itXSbPE
 4ANqR/g7T/qPYWV+7EoiUN38zFYXxCrQo0K2ANmDM4SlnlmZ9h0g/x6oKqTT6LTeIpGb
 DEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1xSX3FHtZwaNdWEesDDxbv6UzUKE+EZ51VclS+NR9fA=;
 b=iyjXaj4RaZ+DER02zYib+LEGbnE8b5BKXwb5+glrJ64GsW3l4qlPj9dV2SCfG40Hl6
 sKGPqNoCn8h/RxAKqvhvMEKQoH+lfbSzH0Uv/HxfAZTQd6zYMfs8N7lQzsqqA4BN5XH2
 MPesaLy19Cz/OdKVl0FWDwiFPl1+VW/G5CqqTa9XbvYQy06z7zWULB+6X8EIBq/ik+Rq
 qoGAg9Y2b/mWLdbe8aSLn9Doen2UlAlsjcSb5aAr64IGa5U4qiXLwYdnB/p7CZfE+Au6
 VVNoAfCJPNLliCcP//P7oZdWfGVwnMaeRwBIfEqA094TEqBDl8ZLKFiMB8QgnlUteF8T
 5E7g==
X-Gm-Message-State: AOAM531R0keUYuDGRjUJEll6QOHFMiIwXlnog7SdKjEeVaLPnIZ85Daq
 Wi+1YyzxbKjdYxmpnhRIaY8m2iXqBIyfFQ==
X-Google-Smtp-Source: ABdhPJzdJpslpKxb5umj1TfrR46eZ9qzx/Uyp5NDfjYyFKderLs9dGvS6ugu95lCbIbETTU2Xiaynw==
X-Received: by 2002:adf:e992:: with SMTP id h18mr13900831wrm.356.1605007166310; 
 Tue, 10 Nov 2020 03:19:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/16] target/arm: add space before the open parenthesis '('
Date: Tue, 10 Nov 2020 11:19:06 +0000
Message-Id: <20201110111917.29539-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xinhao Zhang <zhangxinhao1@huawei.com>

Fix code style. Space required before the open parenthesis '('.

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
Message-id: 20201103114529.638233-3-zhangxinhao1@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 29ea1eb7811..f7d4ee393b7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9171,7 +9171,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             - Hardware watchpoints.
            Hardware breakpoints have already been handled and skip this code.
          */
-        switch(dc->base.is_jmp) {
+        switch (dc->base.is_jmp) {
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
             gen_goto_tb(dc, 1, dc->base.pc_next);
-- 
2.20.1


