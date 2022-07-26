Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A246581656
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:24:28 +0200 (CEST)
Received: from localhost ([::1]:42784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMQ7-0003II-57
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMB-0006Nf-2v
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:23 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMM6-00062e-DR
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:20 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso8356982wmq.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MAULpYRElXb/JnZHgFpotDF/VeeWBZVTrWblujY9hI4=;
 b=GoGfcSZoxmH6tRjVbHuGdyzDkyLC7pfEo7cjdC0k86XdSXoRDOCvp4PLJ8BKRvHoZw
 v8rmY76TuW5hFNHkooLXzJIljNDDohx8bNM0v90PdZzLNVxDskRcNBm6f+hpJkU2zS2P
 EXCVTxneGqQazaoceWJGfmTNsTKps3YNSWq0CSXxFVW1uvPscOyuJlr/l4D4CekALQwe
 smys15L8Kum9/9qLFeYxgsDJZfKKy+pWzyQyjLYxuuox16Q6010JBWIi8GTCMN0T0M5p
 XtkrUHNyVyxeKXpOYpvi2GWS+gXJ4OexH68Fbbw9MrnjozYmTUQ4ogWDe3ZeFjTdDqgW
 gu2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MAULpYRElXb/JnZHgFpotDF/VeeWBZVTrWblujY9hI4=;
 b=YdfEZ1fUtK1IWo5uK7gBouXrdWt0qthiVlVfkFcWBZptm9EliRRxgCGIsp7Xl/EQQS
 GJMaX+MPYw4HuNabQaX021XsEIiBSIUiWDKh3uokDJ/yieG2sIDujK25TaZ3tQhereJj
 MZSnpBV+T9ZBi9UoeFlWJf/Oa/KVabQOWxDNSJGXDuBq0Lpksvdidz2nY0vpx4Mm7lr5
 k0+XwPF1CSYEBYEyjh54IFJO94JeYVDk4wrE4HoAqiZSFuO1VYsZ9KzIXW9C/usPycko
 ZHEsbfTrhKYiJNnbZgcn2bw6AJINC0UWKee5dodxGCPjv0jmKEue/LikzoBBWV2YC02E
 2Odw==
X-Gm-Message-State: AJIora/exv5SLLkbjzMjmWNPFUZZlF+4ggGiAhKYMW0mqejWt1UazNKn
 DpB4B2b/zDTwCgrjJZ8Dmf5RtcRn8jPV4Q==
X-Google-Smtp-Source: AGRyM1vrRET8dUYRSJ0uNHCTgr/ecwbgK9b+6ShaSp5pmEkErD2dE7XKeSHhLdKt8L9ARaQWHGM6Ig==
X-Received: by 2002:a05:600c:a03:b0:39e:4f0c:938c with SMTP id
 z3-20020a05600c0a0300b0039e4f0c938cmr12290904wmp.145.1658848816399; 
 Tue, 26 Jul 2022 08:20:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm21932739wmn.47.2022.07.26.08.20.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:20:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] scripts/coverity-scan/COMPONENTS.md: Add loongarch
 component
Date: Tue, 26 Jul 2022 16:20:04 +0100
Message-Id: <20220726152012.1631158-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726152012.1631158-1-peter.maydell@linaro.org>
References: <20220726152012.1631158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add the component regex for the new loongarch target.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20220718142310.16013-2-peter.maydell@linaro.org
---
 scripts/coverity-scan/COMPONENTS.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index de2eb962416..a61d011d9a4 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -143,3 +143,6 @@ testlibs
 
 tests
   ~ (/qemu)?(/tests/.*)
+
+loongarch
+  ~ (/qemu)?((/include)?/hw/(loongarch/.*|.*/loongarch.*)|/target/loongarch/.*)
-- 
2.25.1


