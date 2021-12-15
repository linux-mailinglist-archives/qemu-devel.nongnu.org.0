Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B428F4757BE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:28:44 +0100 (CET)
Received: from localhost ([::1]:53668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSSh-00033k-R6
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRif-0007Ax-6f
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:09 -0500
Received: from [2a00:1450:4864:20::32e] (port=54816
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRiZ-0008Sy-Vs
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:08 -0500
Received: by mail-wm1-x32e.google.com with SMTP id i12so16260185wmq.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=V9ad1ft9XN2bt0JubTin4DNNl6fvaB1gNU6QqLOH+X4=;
 b=xtIBO+JqqB/Z+/MpxwX7miezjv3ktsJ7GPP+DCzCjRgzSFMF8gil0s4v4vzHep9KQ2
 t8QpL/ZZsW9ChVEQS5ekuKczprC1JwzoTfQLut30GR3eGiKuPPRxHTytGmZobonu2j+i
 8z62TjTxix1IGKONWM3OQXuLLi/klIzxakfuTBDYDnnH6uwQBO5ZLLt3DhUQdWXLJP7A
 qEmH0AttBUhM/KRGFkDO8z6y4WuR4iM8uEY9Z1RmFIpKmd0yMRTfLH+ZTpoy9fOpqqu2
 I6r+mLtj4bJHRUTjI4YIMYYx9axE8NYLKoKoP7+rB0d3xsd7S5DmkdIrkecoUeZq7L7f
 X2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V9ad1ft9XN2bt0JubTin4DNNl6fvaB1gNU6QqLOH+X4=;
 b=d+FzgcaiszybSrJKXMql4R17b50Lx1Sm1i6y4lTTdovj5AEYUjyDMO3XuPcobX6Qw1
 IzC5sVKxtfSF5ZLpPDT8IXaL/WYqCl78E188F05/0VDWPONjnlAyckf0UUq3EtA227zV
 YpNx0uaw2kuurZCd7G290A1+PDnBYph4zldB57EJZt28osBAM9vtrr48zH6FNDz8lnu9
 +s0ZoeYtShgBR77Z+zRIAKxYA6fv/vjzgldZp0lbZ2pEwsAAv5GjAgXJx5L84EZGWDEt
 g7GH55Tykgmf4a9EDll2dVH9xATbewQd6ugLsUrcFGSCEnyyt6YNvKrFyiHaWl93z9Qu
 pOTg==
X-Gm-Message-State: AOAM531VFcXtMYybMisGU3BTPq1zyP50rFq2lJXmOvV4RDvGV6qfdngW
 qHYAB9DX4vQnfpPKIgKpDcjV/fcvBAaXmQ==
X-Google-Smtp-Source: ABdhPJwzXWmrifxJH8zKhhbwnpNmzFSEIa37vzBL443z2eq4LrYX80FgTDPFzVFhrQ7xoo1oXDQR7Q==
X-Received: by 2002:a7b:c054:: with SMTP id u20mr914736wmc.133.1639564862775; 
 Wed, 15 Dec 2021 02:41:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/33] target/hexagon/cpu.h: don't include qemu-common.h
Date: Wed, 15 Dec 2021 10:40:37 +0000
Message-Id: <20211215104049.2030475-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The qemu-common.h header is not supposed to be included from any
other header files, only from .c files (as documented in a comment at
the start of it).

Move the include to linux-user/hexagon/cpu_loop.c, which needs it for
the declaration of cpu_exec_step_atomic().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Message-id: 20211129200510.1233037-3-peter.maydell@linaro.org
---
 target/hexagon/cpu.h          | 1 -
 linux-user/hexagon/cpu_loop.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index de121d950f2..58a0d3870bb 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -23,7 +23,6 @@ typedef struct CPUHexagonState CPUHexagonState;
 
 #include "fpu/softfloat-types.h"
 
-#include "qemu-common.h"
 #include "exec/cpu-defs.h"
 #include "hex_regs.h"
 #include "mmvec/mmvec.h"
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
index 6b24cbaba93..e47f8348d56 100644
--- a/linux-user/hexagon/cpu_loop.c
+++ b/linux-user/hexagon/cpu_loop.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu-common.h"
 #include "qemu.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
-- 
2.25.1


