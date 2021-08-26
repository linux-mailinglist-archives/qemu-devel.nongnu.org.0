Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDE73F8CEF
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:25:49 +0200 (CEST)
Received: from localhost ([::1]:50808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ8O-0000Sw-QF
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImo-0005Vk-Kq
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:30 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImn-0008RN-5W
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:30 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso5954664wmj.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cd8xI6PJSFZZ22zgXrYlDJesxftGci2nDGziFuXwknM=;
 b=nOARUw393EgupQDpXMBNkihIUqtLIULbKdYQYw1hm20w2rBPU1hO2DF9XEheR7aTXc
 pwaBYr3O76VCz9+s8L4uP8kzfJ8WJW3vjYzq7RmgrxotOkcZmjRUkWc5kP74nJ+fIO8j
 kj583qO/EVLlWnr0thyerXK0MFYbrq9u3l4eTJ9n3mz+yvnZGrk6Hpgy/8KIFlPfyu2Z
 k4x2usdP5YW7iEqjmgQBbui6Cq/VzxHxyMKjDpwtB3PLOfFe4adPAN+gdnlG+d99Rnwy
 RfW2H4J5zRmTkrQ1y6ZiMIRTrAzXay7CCp8m3zZmhXhYVzBA7a9SWOqVdVgP66+NFdtR
 psoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cd8xI6PJSFZZ22zgXrYlDJesxftGci2nDGziFuXwknM=;
 b=aJzpdfqxwcts/TPZ/lpy8KFL/M/x2ZpjmWR5kxe3mvoj5u6gnz9KzRjmKHDNVM3KlV
 jaOikj/c7wMnbQTrwCvi9tKW8BYwej7LCjUOu3mZiuBTH1dkmmWpYnPp2l3uaeKJdS1Z
 yGvRTSdbcWD4RZnT4mf7dVjg/LOFiADTXMpj5sONiDftIkodT3yuezAeh1Q78YB6QTyn
 DmXLCudsCUUIeJrsslCpgdt8qk7RIiySQxyu/7uoPXg4IORNN1buvzk6C0s72By00YaM
 yNZ66pkWqIMml7cAuTOmIZRvyfG61PrY6pbDlw8F7aee+g5mRmsQPP9Qe2SkX8PPnCmQ
 pYgQ==
X-Gm-Message-State: AOAM531V4RDrxFf72sg8hrUQrBDABXzITGrHJ2L2YcFtvj59oDErJfT1
 XlUKL7A8pB1PqUbSwGa5v+T+x92VnZqQwQ==
X-Google-Smtp-Source: ABdhPJx/Y3r9zHKnoHL25PO3k42ajypMJx3IRHdnmeONvIEIdFJ3TbdXlpGl3kcu8UHBV9HG+/ntag==
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr2672228wmk.107.1629997407770; 
 Thu, 26 Aug 2021 10:03:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/37] softmmu/arch_init.c: Trim down include list
Date: Thu, 26 Aug 2021 18:02:47 +0100
Message-Id: <20210826170307.27733-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

arch_init.c does very little but has a long list of #include lines.
Remove all the unnecessary ones.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210730105947.28215-4-peter.maydell@linaro.org
---
 softmmu/arch_init.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 9011af74e4a..91cbf883e28 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -23,13 +23,6 @@
  */
 #include "qemu/osdep.h"
 #include "sysemu/arch_init.h"
-#include "hw/pci/pci.h"
-#include "hw/audio/soundhw.h"
-#include "qapi/error.h"
-#include "qemu/config-file.h"
-#include "qemu/error-report.h"
-#include "hw/acpi/acpi.h"
-#include "qemu/help_option.h"
 
 #ifdef TARGET_SPARC
 int graphic_width = 1024;
-- 
2.20.1


