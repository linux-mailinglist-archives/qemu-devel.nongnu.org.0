Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB351BD6A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:45:48 +0200 (CEST)
Received: from localhost ([::1]:33330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYzT-0002Mg-Po
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWt-0005Jg-Gw
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:11 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWr-0003OT-Vt
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id t6so5237009wra.4
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lUUUty35mHrdlwzzNpzWoTHLJi4hbdRcoTC6a1ASl1U=;
 b=CmktfocO/gJapdbi5n3Yx0H9W7/XwioywVs5X2HjhwZ0rFQvKMcX1hJiDAN+AtOyFP
 nTd+XBlDR3loVwIr6Jma7/xJOZdA3VR0SjRDyoXlOoIndFBFCJjGIRgYOkn37ooXRI2d
 hI0DmK86GwM9kD9vptoY2DB93ZaKLOqXg6Q9FwC1VmXSViN9+f7pZxD3Y+3DUzXewx6I
 TynS3ZRcsj6HXhtQ5mDQ1xjaqY7fFYecsPxZWYBzfbanipL/hWHc/ghBb66awX12c2IP
 WJuNMHoT2NvTxK7yupz8cebemGA0Ny3TdKOG4Jc9KSa19KvzfpUzRfN6mdO+h5QFBKw4
 4vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUUUty35mHrdlwzzNpzWoTHLJi4hbdRcoTC6a1ASl1U=;
 b=q4IPW+hRS6fFViOPQ3Or4X/BT3VFXzfvEHI4EYmnNIlVvcWWAXow7uaq79DCQeeQEW
 XfSdvQAarhMXRhYjyjpWDms1A2mpZDmseCzxIUcNWw5m1rbU9u3Do6LLs71OpbSpYWav
 ZWJk4EjQ/Ba5o+sOdvQ2STWgefwx3uSno3SNuU4ASGwXRYAYZoC4yNh8Fne4Z57BywOF
 jJMOP81HvKa6tEc6W0vj/1NbgsqYmUc7HUkOXA0R8DAXwp/DlW1DSju4qUMZGo94C4yx
 XsqnfXNGQhyAoCzuYBXr6XXCDyG3cG6W6GAPTa5uc7BqtJHAicfgfPa83Vxc5Wx27diA
 iyDQ==
X-Gm-Message-State: AOAM533PsJpWn2THZlt4oq/PDZ2QscL5ZItDBBvLDiq9BzXtRgKViSH7
 V2UZ9gavaiKAQjlXnWF7VNk1IQyvRgIYmQ==
X-Google-Smtp-Source: ABdhPJzZ0rDT8Sxs5gLWOXWv62txKXHYLKxlsAl5dDPmqHNDdrXyytnPY+KsWUT4P9uaAlpRdo2gkA==
X-Received: by 2002:a05:6000:1841:b0:20c:788b:9306 with SMTP id
 c1-20020a056000184100b0020c788b9306mr8265320wri.369.1651741927952; 
 Thu, 05 May 2022 02:12:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.12.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:12:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] target/arm: Remove HOST_BIG_ENDIAN ifdef in
 add_cpreg_to_hashtable
Date: Thu,  5 May 2022 10:11:44 +0100
Message-Id: <20220505091147.2657652-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Since e03b56863d2bc, our host endian indicator is unconditionally
set, which means that we can use a normal C condition.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-20-richard.henderson@linaro.org
[PMM: quote correct git hash in commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 81612952f3a..14ea5caad94 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8602,12 +8602,9 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
             r2->type |= ARM_CP_ALIAS;
         }
 
-        if (r->state == ARM_CP_STATE_BOTH) {
-#if HOST_BIG_ENDIAN
-            if (r2->fieldoffset) {
-                r2->fieldoffset += sizeof(uint32_t);
-            }
-#endif
+        if (HOST_BIG_ENDIAN &&
+            r->state == ARM_CP_STATE_BOTH && r2->fieldoffset) {
+            r2->fieldoffset += sizeof(uint32_t);
         }
     }
 
-- 
2.25.1


