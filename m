Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27122D907E
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:26:21 +0100 (CET)
Received: from localhost ([::1]:36546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXwi-0001t7-M1
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXre-0002Ic-MB
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:06 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXrd-0005WU-8N
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:21:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id w206so7881387wma.0
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U1U85wbWiHYedQBnfCehC7vZG2diuqNh/zEf3sAbatk=;
 b=mbQ3Z2kBPsaAeNkAQKlf/Uqc+U93xRoHgnDONlAQ92t4i03Hzh6EQALZI3Y2KEc3U+
 o1H1TjPOani/Sz3yMY3hKY0n4Iz4FeNkEvoziMZBhVWPvaAKITTeu44/mfWZKwfWa0I4
 /T/ovt9++wGDAVVgNaxc87M6DLv7/29iSOO5+y5mmpzQKXzDAstTpYhBBdpnhsqyy+JI
 xRRTW0sZVAuSoU6T7YTvOgQbY3LDniMGS6RyWJroOc9o4kEmKD0NqLGZr4oPM7YSPIMn
 IPXHhDCwvsP6b4T/7/VJQrFU++XjnyBZwrmpSRQizF+pFmOmSQAF3ZXYlKC0BEfn25V7
 qyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U1U85wbWiHYedQBnfCehC7vZG2diuqNh/zEf3sAbatk=;
 b=Xo7bULGmYRQFYjcJYjTV9OmKbuxIcm9MPfZrfpq+zy3od5heM1HtB2MM8Bq7C0zyVw
 lI+HgP3lYmOhduHLtrP+KpmsbOmRXTFBVzcMf7/BhubhIbtpz7Ff6KHVZPWijBdrL5oE
 McxeotOvEEaCNGKv3dtVxHo7X4VnqTz+DjXoGcF9AnGTNhZd8+oxh6uDgYsq7+U3lJqQ
 VQUe7uSzG6iskrJkXH69WaQLpLStaYFPKVbmyYtC+f6P6N1JgB7fJmZR9B7vVrAaToje
 g7yW6T/2OyGjPtTPAHvTVyJ0O3BfQ7qrzSlUzgLJzhnGFMIPeSOIhfxgCKdLZTNTb32/
 aoAg==
X-Gm-Message-State: AOAM533CqplpI1xQSI4uHf5mH65yf2/nqcV288a82HndAM04qK+edu/Q
 h7wdVkEDhqPKQZgAfQZ6b5I0oC+K1X4=
X-Google-Smtp-Source: ABdhPJzNHgtxhEQNX7DznNzRimsoGP5ISuhO0bLMbYb6QifZ7mqmtSXaufbgDyGau189eqa0XDfA4Q==
X-Received: by 2002:a1c:43c5:: with SMTP id
 q188mr24563275wma.163.1607890863692; 
 Sun, 13 Dec 2020 12:21:03 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h5sm30144342wrp.56.2020.12.13.12.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:21:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/26] target/mips: Remove unused headers from op_helper.c
Date: Sun, 13 Dec 2020 21:19:35 +0100
Message-Id: <20201213201946.236123-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Message-Id: <20201206233949.3783184-6-f4bug@amsat.org>
---
 target/mips/op_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 5184a1838be..5aa97902e98 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -19,15 +19,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internal.h"
-#include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "exec/memop.h"
-#include "sysemu/kvm.h"
 
 
 /*****************************************************************************/
-- 
2.26.2


