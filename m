Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E2381F39
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 16:18:36 +0200 (CEST)
Received: from localhost ([::1]:58922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liHbG-00039u-VS
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 10:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHUj-00060J-T3
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:11:50 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:44575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liHUY-0008O4-Hf
 for qemu-devel@nongnu.org; Sun, 16 May 2021 10:11:49 -0400
Received: by mail-qv1-xf31.google.com with SMTP id u1so1906729qvg.11
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KdbIg3rlUjFYkOGX6SZXklYcLzrscr/66Cx3ugBj720=;
 b=WRyrctpeo+wrQDRQaoTFP2RKYOiXZnlV+ak0MH7HcWmvQsUVjVj/mjVfUgbU4Av3MW
 UYC/j8hDp04NPM3mcNN/pyP+AbRtZta5tn5jZS4oXw5eXIc9+8WDQWxVyJxOHO5+p+uP
 zsJvH8T9YJeYwsmoI+CRGabwRVYJRU8zGC2JyY11YLadSgqxPdpiGeneWjVcGvcsYq7J
 qIcmzgnhDIQfJK382apsB9t2CLPgmfP+TJnrf5nkg+XkO7s8MKoxHW642WaoCwWIsrJn
 HYTKMoGy9GIQAvQm7xUABO/MWjMAdj+ja2ESVbeJd4Wz9So8POpBXIZFLdO1nlzFGgDw
 u7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KdbIg3rlUjFYkOGX6SZXklYcLzrscr/66Cx3ugBj720=;
 b=BVKVsVZ7dmAWTfaBCfVMidVsAzkBlQggYpSW+biNu3wc3kh9U7KXjnRLZRQnFlof/o
 L2s/JjHH7spoGcAPligR9jjsGFmhE4/yDlWondcbdanxeRk4KOTHziEsYudR52ux87va
 wYnwS5BODWgti1qMgvQbFn0R0QQXe+RVAna1OO6WP5o5pWdrQFgx2WGrkCWnYxF7xxFx
 uemvMJz1QOXl1TVmyrzvRCoZRJmroMDuoyN5e8pVj73WkbOn9shaOdSsZXDi4UXs/Hf7
 X+WQqYWjpN1+Ah4EtJnMfcPXeHrDXA07QqKmvcCIL2CLd8fYyZ+pbcpsJaO4dwxR8OKn
 0bgg==
X-Gm-Message-State: AOAM532GJDJxECVtOrOTGRlfoEEtj9PSeXN874qxNMEqiviDh8L/eox0
 OFpD5f3VevXlsd0JQvjOSUA4oWLVKgtqb3C2FRM=
X-Google-Smtp-Source: ABdhPJwx1eaqCnIPEDz+tJnv1tJHAegXJdud42siQ1kTmiaOwy26fOFU2wilThpu9lYRxmmp4rEt+g==
X-Received: by 2002:a05:6214:d01:: with SMTP id
 1mr55600298qvh.57.1621174296375; 
 Sun, 16 May 2021 07:11:36 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id j28sm8350102qkl.35.2021.05.16.07.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 07:11:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 2/4] exec/gen-icount.h: Add missing "exec/exec-all.h" include
Date: Sun, 16 May 2021 09:11:31 -0500
Message-Id: <20210516141133.739701-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516141133.739701-1-richard.henderson@linaro.org>
References: <20210516141133.739701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
Message-Id: <20210422064128.2318616-3-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 298e01eef4..467529d84c 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -1,6 +1,7 @@
 #ifndef GEN_ICOUNT_H
 #define GEN_ICOUNT_H
 
+#include "exec/exec-all.h"
 #include "qemu/timer.h"
 
 /* Helpers for instruction counting code generation.  */
-- 
2.25.1


