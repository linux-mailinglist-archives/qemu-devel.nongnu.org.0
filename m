Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B36367A15
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 08:44:55 +0200 (CEST)
Received: from localhost ([::1]:39728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZT54-0000El-Vs
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 02:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZT28-0005qM-Fi
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:41:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZT1z-0008PF-FF
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 02:41:48 -0400
Received: by mail-wr1-x433.google.com with SMTP id p6so36902837wrn.9
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 23:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDhZv6hOAh1AXh93jaOloafMBY2uwHZW7S6gBqsTHSE=;
 b=Zz+KIAGcCmHTMnNr1qzYeyBhfFuvy9XVtyjRMGewwswoKS67Nc4WGi8MUp5ZHMvOfN
 H5MkmqRwDkNU4cU20ZDT0N5vqjs12jHZDutsNwiCmaQdMxz8DBwXrVw/G2ht1sLODGor
 dZMUsLH0tVNIFclfYzoPi6U66YE5R8oKqp4NzjbiSRWqFFqpC64OppBclrkxDbNrNOp/
 NUOShetUckYPwYqYjwZtfji9vrCUlCQClWqjhNQPVS/Dq8bKhV0LzK2mZPjslisUq5f4
 UWeWxpo4MZeERWhM+aUqtPd0s3VbZ4UWSNsCnBCv+MFVpseKuCS2iJaGMurXWYquxsIL
 zJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qDhZv6hOAh1AXh93jaOloafMBY2uwHZW7S6gBqsTHSE=;
 b=ZhzqoJ7e4IggDlmcsdaw0VPURFALW5PwBInBxNKxBqOidZ8U03U76867ZaBhd6Bovn
 zDaRMckXAOlnDAkrVovAMsrw/yxaJ8YYradj9/NX55T34QRKat/4qovxluuLOTIw4GJG
 e/ArrXOQuZzNSz6DHC7YrylU6CNI53aOm00oUB03+wRS00bEAqEq+HaDchSVHjF/hmo4
 J6Ev42TVu0/LiuV6dAx3frpEQIC563FdShkcu5t3nRUgtI9SPjmvhHwqJ+oziqxQ14id
 +Toz3DN4S3z3lc8D2l9SzyW7qzT7aeImPTHv77O7d9GJI2Q0FFx0YGovsvknHlB41Y8D
 2Eyw==
X-Gm-Message-State: AOAM530wYIcJQ6/ZCVOa8tWbpFzoWGGp/z7WPrV4HTUFTWJU9K9iqw8O
 c6H1FrhsEzfhwCE77u6BZP1/bCIwIPqXSQ==
X-Google-Smtp-Source: ABdhPJy23p9yzSO41zynG+tWKwBWb7Re1HJ8cs9b0vGymk56OqwDdkK7wt/xMpv1ym+HOerQB2K0sw==
X-Received: by 2002:adf:fbcc:: with SMTP id d12mr2030918wrs.151.1619073700352; 
 Wed, 21 Apr 2021 23:41:40 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o12sm4761454wmq.21.2021.04.21.23.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 23:41:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] exec/gen-icount.h: Add missing "exec/exec-all.h" include
Date: Thu, 22 Apr 2021 08:41:28 +0200
Message-Id: <20210422064128.2318616-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422064128.2318616-1-f4bug@amsat.org>
References: <20210422064128.2318616-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When including "exec/gen-icount.h" we get:

  include/exec/gen-icount.h: In function ‘gen_tb_start’:
  include/exec/gen-icount.h:40:9: error: implicit declaration of function ‘tb_cflags’ [-Werror=implicit-function-declaration]
     40 |     if (tb_cflags(tb) & CF_USE_ICOUNT) {
        |         ^~~~~~~~~
  include/exec/gen-icount.h:40:9: error: nested extern declaration of ‘tb_cflags’ [-Werror=nested-externs]
  include/exec/gen-icount.h:40:25: error: ‘CF_USE_ICOUNT’ undeclared (first use in this function); did you mean ‘CPU_COUNT’?
     40 |     if (tb_cflags(tb) & CF_USE_ICOUNT) {
        |                         ^~~~~~~~~~~~~
        |                         CPU_COUNT

Since tb_cflags() is declared in "exec/exec-all.h", include this
header in "exec/gen-icount.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/gen-icount.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 298e01eef49..467529d84c5 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -1,6 +1,7 @@
 #ifndef GEN_ICOUNT_H
 #define GEN_ICOUNT_H
 
+#include "exec/exec-all.h"
 #include "qemu/timer.h"
 
 /* Helpers for instruction counting code generation.  */
-- 
2.26.3


