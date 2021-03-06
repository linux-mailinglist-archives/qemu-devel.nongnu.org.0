Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6865A32FB73
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:42:09 +0100 (CET)
Received: from localhost ([::1]:58682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ4C-0007v6-Cl
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYz4-0000DS-05
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:50 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:45089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYz2-0008B3-H2
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:49 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e10so5846174wro.12
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U9jekP1ZlY6y4eDWk3w+fnL7jGwQwnkLpeMzKZ4FPb8=;
 b=cwphV6HO8KHdYDty0MBuOvY/bIrgDUoOodNx+7qLour68N4lxXV5UwdOFCGsXRGC0x
 9/Hx0pMBFuOcrknEqEPHGt5MvwmAbs6VffvMr8md8MCamPEP3uad/+Ebd1FMp0skzWKK
 ZT7OwUPP1lp/HteuKrGOclwTNXyCJZiZsMW1B5C3pEXvCzqAYNpBbF65HNtra4COtOwi
 /fDmE+jaBa5f9DOVBr78JgJL/si5moyKYZnjWIJmOdTfIug0zBFVvMlmcS2J9SyWqnbl
 SYwP4yKTz+CCNdfmPvaHOPepXdwX0snJJ/WQTHlWZHCOnA8Yf6JkHKJ5CKJbyfKGMxFi
 4Zqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U9jekP1ZlY6y4eDWk3w+fnL7jGwQwnkLpeMzKZ4FPb8=;
 b=fzsG8Nkm0WDUzHsvAM5kPFcmFZoz5ZYEYy8KpULt447lfSxMfof0RU2dTlOMQxWAcn
 7xIFZX520l+T8KSUkE6t8TCUnXAOF3EcB7WS9UW/Y9eqXAYgAZWBpEF42Z8b6CTd92OH
 KXyhXdGniBemFAJ1tk8Lzhr7+DBuGUv9OaPgjg0u7m0Whx6XmaVBdUJO680BEMRR+kDC
 C0o+E0xoEx+rXdrqlIu5uzhyUvnCxinNc68N/kwaJiy+G5qVUTdHYe+n2cdifrtisjjG
 YwMgKw1qakQItM11HGsX5dxKWVD5OrZAoCspJGb8Qw3zyWbiPaV8BSo952i2CrVFytmm
 6wyQ==
X-Gm-Message-State: AOAM533b9gWg6BnlBOXcAym1egPAFaH5Mp1DcXitgpW2XJ9AGVTUosRe
 Vskv2fr4fUHeCzECgQc5fO1tDtT1VsM=
X-Google-Smtp-Source: ABdhPJwbQw/YdyUV6ckGXN9YRrHxOP/EZJIkZ9Lyg7sFcqfFBqw/6EvYPxUv9e+xyY0PhMkn5ha4fA==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr14700121wru.366.1615045007159; 
 Sat, 06 Mar 2021 07:36:47 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v9sm9585316wrn.86.2021.03.06.07.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:36:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/14] target/sh4: Remove unused definitions
Date: Sat,  6 Mar 2021 16:36:12 +0100
Message-Id: <20210306153621.2393879-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove these confusing and unused definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210127232151.3523581-6-f4bug@amsat.org>
---
 target/sh4/cpu.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 714e3b56413..01c43440822 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -271,17 +271,6 @@ typedef SuperHCPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
-/* Memory access type */
-enum {
-    /* Privilege */
-    ACCESS_PRIV = 0x01,
-    /* Direction */
-    ACCESS_WRITE = 0x02,
-    /* Type of instruction */
-    ACCESS_CODE = 0x10,
-    ACCESS_INT = 0x20
-};
-
 /* MMU control register */
 #define MMUCR    0x1F000010
 #define MMUCR_AT (1<<0)
-- 
2.26.2


