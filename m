Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3385420C6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 04:42:30 +0200 (CEST)
Received: from localhost ([::1]:50906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyleP-0004VN-MS
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 22:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nylaR-0007jT-F3
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 22:38:23 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nylaO-0004hH-QH
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 22:38:23 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so22596068pjo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 19:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=t0KNVpckDa0g958hmZLpQ+1xaKpj4svZ2fffpgTDKPU=;
 b=dwav2UVKc+yoj6Wh9rkl/GzyZuEewO6gMs5Ep9T2efbkXbmWbpi0JHAsd9Q3gX09Ii
 1VcbxIQZ0mw0NEyAeIK1jMrgO+mEyJUv82uDYsvY0oqSSFQMXuaF8L0LUtafqBGuof6R
 A2slmRk3CKv/So0sCtRs7oY0HF1mZHcnYQ1VzmAM5eqWX+aMSwHH5YrP9yn3Z48i3CUJ
 7EGrAse9VS3fg2KQB3MD1ODw8JEXSVCE/r/KbKzfBV6+4yUW/g1Oy6FYYdRT22oFR1B2
 BPhoFBmGVgAb41s4iFGY+WMElnKJwTMUezB1UI1ZH1ldRmVOIjHC5vpIkUgwEZY1azLh
 eOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t0KNVpckDa0g958hmZLpQ+1xaKpj4svZ2fffpgTDKPU=;
 b=Krm6I/poW/cHNRQoiDizDB18Acn51M04UWlur8IcOjmSAF5I2SwH2Vl9z6iJdQvUPB
 IL+ZsxTB2Gm84eMnA8kI81pOicBcjUjJhAJAKxQ0eq97zpqflTqpzXYZ7JaX20rY+dxY
 /aBRTl+0iAwJwKZXCWhJWF3ok154LSQc79mnbLjfBCcQmkP4RGcnr3QB5WpJwLbMAh0Z
 RGC0mkUXClvikBfwoazJ+60rCYVBE3BEWKddbRNBJj6jK8mO0stFGi/WpKvQTbGiWEtb
 PjI/FI8iquElWDk9uu6lr6DY2WMjTTApaZvX8gMyggtPlUpKnf7N3jm16juDME9k3er1
 LQJw==
X-Gm-Message-State: AOAM533pzOd+5KkEBxfOdTRrqMHV3PfU+5Th1VMcQ1ygDdGGMSSeRb24
 ADGEjmO/282YjcQharcM/DBBqRpAjJIA0w==
X-Google-Smtp-Source: ABdhPJwDqeUILiFF9yfXqcd+dw7MH06cMwJc1kY6CzBcbXPUcrWtSspRiav//9+H+22ml6jhKONuSA==
X-Received: by 2002:a17:903:124b:b0:15e:84d0:ded6 with SMTP id
 u11-20020a170903124b00b0015e84d0ded6mr31970238plh.141.1654655899469; 
 Tue, 07 Jun 2022 19:38:19 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:c626:2f70:ac99:7c97])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a63d813000000b003f66a518e48sm13607398pgh.86.2022.06.07.19.38.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 19:38:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] target/nios2: Move nios2-semi.c to nios2_softmmu_ss
Date: Tue,  7 Jun 2022 19:38:15 -0700
Message-Id: <20220608023816.759426-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220608023816.759426-1-richard.henderson@linaro.org>
References: <20220608023816.759426-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Semihosting is not enabled for nios2-linux-user.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/nios2-semi.c | 5 -----
 target/nios2/meson.build  | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index bdf8849689..55061bb2dc 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -22,14 +22,9 @@
  */
 
 #include "qemu/osdep.h"
-
 #include "cpu.h"
 #include "exec/gdbstub.h"
-#if defined(CONFIG_USER_ONLY)
-#include "qemu.h"
-#else
 #include "semihosting/softmmu-uaccess.h"
-#endif
 #include "qemu/log.h"
 
 #define HOSTED_EXIT  0
diff --git a/target/nios2/meson.build b/target/nios2/meson.build
index 2bd60ba306..c6e2243cc3 100644
--- a/target/nios2/meson.build
+++ b/target/nios2/meson.build
@@ -1,7 +1,6 @@
 nios2_ss = ss.source_set()
 nios2_ss.add(files(
   'cpu.c',
-  'nios2-semi.c',
   'op_helper.c',
   'translate.c',
 ))
@@ -10,7 +9,8 @@ nios2_softmmu_ss = ss.source_set()
 nios2_softmmu_ss.add(files(
   'helper.c',
   'monitor.c',
-  'mmu.c'
+  'mmu.c',
+  'nios2-semi.c',
 ))
 
 target_arch += {'nios2': nios2_ss}
-- 
2.34.1


