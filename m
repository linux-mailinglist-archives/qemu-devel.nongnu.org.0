Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860C92D909A
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:36:27 +0100 (CET)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koY6U-0001PH-Kw
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:36:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXsT-0003j3-0h
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:57 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXsR-0005kq-7r
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:56 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 91so14379133wrj.7
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZtIz6icb9vG8sSEUm2p8Ck/LCv5K/GRxl6Ah3VWmmJs=;
 b=tzFWhUoChRKrYS25J+TqKbNe96+AgWzdYxtHl5ARz/GIED5fF95WrWR9oNZhmgVepK
 69DEKpPLqkWHrighpo5wbEDimB9+v3nKviX1rCmjqEW0WZJ4Hk5RUyRZPD4ZAdHTSGRE
 OJnyXS1H6XTL4vTgEn4BfWmGu9xNdhNDecJNAzG5JMR69rByBZVswORo+IBLq1RyYyNG
 4+zxsR0TUROEobAq8LyhvUlmk+mMgZDJzo5Mcsaiem95XfijzBr9ww4RJglPnJbyjIwU
 GgjEjQ7dazfh9Bjb2LJ3T8+HvJCeqEMWw+C8t5arZ0uVQMFkWgtd+NTFwP+Rq51cp8Rq
 JN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZtIz6icb9vG8sSEUm2p8Ck/LCv5K/GRxl6Ah3VWmmJs=;
 b=Eyrm+aJKwOMwkV9eQ2XZTLmWkjsjA6mawYkXCul6CNlGv3QQ+KwjgiHzEcBQxprjMe
 1GKqofEnKetr5Cktpf8i4O6j4ajFsQuMv/Z0U1bgsND1SAuBlJINrv84POa49sqJu3Lr
 zZfT9fC4c4+RcNdd1WenYr66Cr83G93vEZMrACuhRXNe3LiNUxquVXt7ERNwiUbSx4kW
 Z+MfHSGpRDXJ+lx0Xkzmyrzf/5Ag+8lSyf7ymCUztLgcvT/1N1gYS4Ls/t5rEyfjsr0j
 Z3h7ZL5YpxkuCOTYmCN6IlURS2eR1aUDsZgZQ3OIP5UgUbzD9iegEa2ikzrY8S29hVVf
 wY1A==
X-Gm-Message-State: AOAM532Ub+FnAJZeAaV9HioKaLIr03UGCZ8xJLda0qJFXLhWS4plcZCN
 lEv66wUkBkACs6BReOaKs0Os0lZRGMo=
X-Google-Smtp-Source: ABdhPJyDTHKNg3NgFUG7Kyp5sodkdQheiE4rdVXY7dx+4Y/b1e5AQbj1cd4FxUJbKXqxtuEHuH+OHA==
X-Received: by 2002:a5d:6503:: with SMTP id x3mr25221744wru.151.1607890913580; 
 Sun, 13 Dec 2020 12:21:53 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a14sm19603645wrn.3.2020.12.13.12.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/26] target/mips: Remove unused headers from fpu_helper.c
Date: Sun, 13 Dec 2020 21:19:45 +0100
Message-Id: <20201213201946.236123-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-4-f4bug@amsat.org>
---
 target/mips/fpu_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index 020b768e87b..956e3417d0f 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -21,15 +21,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internal.h"
-#include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "exec/memop.h"
-#include "sysemu/kvm.h"
 #include "fpu/softfloat.h"
 
 
-- 
2.26.2


