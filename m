Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D54E382C25
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:31:14 +0200 (CEST)
Received: from localhost ([::1]:33000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licOu-0003lz-CH
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libr5-00042x-Po
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:15 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqz-0002yd-LV
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:15 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so2591827wmf.5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nXvmJE3pa9KbD0CunFZ/EN5wHDszvex1L42QnnkAm/k=;
 b=Gj70vDFO2vDCHOx01N4yYz28L/3XAqa2+SkSqAnSA9vBbwn9nlk9A934z3/VNQJCAx
 mVzSwoiVYpgKyEn8MJDqR0ADy3p/Wh/YbqhUiSdSx+qkwzLA2t6ly52zBQESgA65nphJ
 KZ2gZnruz0uoKo0XUX7AyLdM/4U4keWtWlz3xLvbYlaKFDXhCy76MgaJQczvNz1QMPT3
 6v7sOpJLrMjSR+aZn+Q+QUBGRqacmfiMDqnOT+4sZj/KE7MCavgALcnzmF8E3Ic5/6ZC
 XJs8a3rpG8Uz2lLOkT/W9mc4YY3PEtQOYCyxhCG+yr4NQhutpccpRUjG9F5cmpihpKfn
 V6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nXvmJE3pa9KbD0CunFZ/EN5wHDszvex1L42QnnkAm/k=;
 b=lwcBPvVPs5y22wU3t38uzIBXt+knYhRFG5KsshSc5239S2t5nqBsJOyKB1Yc/hdASu
 oXQdu2u04kaaEsHBDjpwcmlxygavmrHGu5t/zNNp4WkpbF/CoG+vF9bHpXQO09hnvsZR
 krZFS2n+t7KjoubwQVqF1pyjJ6RPTKD1e96SOXxGvM3Q5fSI17PQX4ibFUSbDnYgRUqm
 sAByefp+PQgV1hhULRvP06k75tJRehMIvUbqc1JpDD9Mbf/9Q9rpoM+w1ZQD/ZuxT3SK
 UprdMz6JJ9x/c4wmdTAY/O8dAyepM7FUrXkPeY6TtGpukfL+8WV4s6VLq7FCHo9hN7Tw
 tTtA==
X-Gm-Message-State: AOAM530m1UuZfM/PQdWMl0vIhG5pUhhBwcL9JnEn9rXVvAyxxVd66Ylv
 28wVhnnhHNpVjCGAtJwgt+UU2FtMx40zhw==
X-Google-Smtp-Source: ABdhPJy15jE8/1p78nuyYNLa5vAQq09RUdf2eB5TZvDym6cjwrA93ZYtDHhz6uyIOlJ38fseVsKNug==
X-Received: by 2002:a1c:4601:: with SMTP id t1mr4452694wma.27.1621252566778;
 Mon, 17 May 2021 04:56:06 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id h14sm14252735wmb.1.2021.05.17.04.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:56:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/15] softmmu/cpu-timers: Remove unused 'exec/exec-all.h'
 header
Date: Mon, 17 May 2021 13:55:18 +0200
Message-Id: <20210517115525.1088693-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpu-timers.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/softmmu/cpu-timers.c b/softmmu/cpu-timers.c
index 34ddfa02f1e..204d946a172 100644
--- a/softmmu/cpu-timers.c
+++ b/softmmu/cpu-timers.c
@@ -28,7 +28,6 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "exec/exec-all.h"
 #include "sysemu/cpus.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
-- 
2.26.3


