Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FC437F7CE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:23:46 +0200 (CEST)
Received: from localhost ([::1]:35252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhANV-0000Us-KH
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAK8-00061R-D3
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:16 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:39877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhAK6-0001GP-0F
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:20:16 -0400
Received: by mail-qt1-x82a.google.com with SMTP id f8so15384943qth.6
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KdbIg3rlUjFYkOGX6SZXklYcLzrscr/66Cx3ugBj720=;
 b=PJ7Lz7Bd7b5BSpNPvo0QQJRA5+3vWxRdZtApO5sC3SZbjThpRGRgdcpN3wwPSChHtF
 hM7ZcUZETux1U9Ply8PcFjGxO5S6u8m9yew87G08AgvIdzGfQgwNXDVst8Bnkt5GsVvm
 hqknfF9xriH92KC2ZOzQu11DeWSskiELPUrt9qnGABN2+yPkfEANbZQNMMaO/KsfgWNk
 8Bi8JH1hYmp9lnYHVpmm0UQgLa4jqmoPCpMSdL1i1y9aDW/ZMkT7yQxe9uDtNYNfI/cc
 Il1mj0Izcxo5pJHd9QyeEkE/lZMOtvXIYy9gdTlwg4tmYh0flF1jgKapZTaHq30JdWUH
 Et2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KdbIg3rlUjFYkOGX6SZXklYcLzrscr/66Cx3ugBj720=;
 b=YVulL7Xs3Txtmt+0jx3YtO8bFojv31TiH3x7fiKaEAicRJXHda72F7rOvy1eELCBoN
 7xd7MYgWyFMkxl0u56C8k1qQFFrIxHvhI2HDWmYDzmNRUB2ChTaImB3OZRnQ80976LXc
 wocfXmqNTYtL0hrW9r06LqzYPtMij60DyDkqO1TMou0/SGkM+ZbkqZEtO9AE/WlzkpL9
 CRgHuI2/QJVrDcChWbu2aFmgwI9cu+hl6DmkpkMENhl+R4iP/drpWWu1e+CETHh0Mo2x
 0K/0a+fEoiU+3ZCMFOsVTlKjfDAT/8X9jzQVkveq17lK+al6lP+F0ihNCrz87KmWgaog
 rf1g==
X-Gm-Message-State: AOAM533+a+OaZaEjQebJMHqTH3CByJP4wFWNIkVM8lrLQ7R8FZ416qiF
 GuO5VDG+BrJqmX9JOh1A5fCVC+jbWs6I8eBGDhw=
X-Google-Smtp-Source: ABdhPJyQm18rSWB4WUzsATbhx4u7o0Em9yczzc0DY5tNN6GHbHkj5HQeQu7oQ7Di1P02JLqsHpB2Bw==
X-Received: by 2002:ac8:1014:: with SMTP id z20mr37695654qti.65.1620908412208; 
 Thu, 13 May 2021 05:20:12 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id b3sm847262qtg.55.2021.05.13.05.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 05:20:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] exec/gen-icount.h: Add missing "exec/exec-all.h" include
Date: Thu, 13 May 2021 07:20:06 -0500
Message-Id: <20210513122008.207491-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513122008.207491-1-richard.henderson@linaro.org>
References: <20210513122008.207491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
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


