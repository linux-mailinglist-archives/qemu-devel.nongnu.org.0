Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A352364F9D3
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 16:26:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Z4J-0003YY-IJ; Sat, 17 Dec 2022 10:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z4A-0003XU-8d
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:36 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Z48-0005Pg-5i
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 10:25:33 -0500
Received: by mail-ed1-x52a.google.com with SMTP id c17so7357126edj.13
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 07:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kga5RZQ0pXj6oEgyCnjUh8d8RvnKnrRGTcdOKmgX+hQ=;
 b=XkmpCIpKYHTvM2Dm6YUZyA46vCplj7PS+ruKN1s+dRusjSPoffF9n7Hg2/t065zYMj
 6TpdgCGxUAa3bc+z9vSGfjM/m+so3Pug/ZlLZ1fTYBz1N/xdEASxfX1eRPfFtCiQTymi
 q3kFJ4t6mD4IyUn/i+VGZb+UDAXyCOZVBQir2j42oC5L3G+Xtm1WEeneer3nL3Ds9t+d
 tZt+fhS30Xse+nOYxweUvl2GjhfBveoJWhl1aHI0678aPHET78/6DHZFzTduUDdzgtxt
 hXUCPqSojReFPzHTKa/5/FX1JYDuRHQPaz1zhvEZ6uSWOFW82bEhKdz9RGl2m3Cxqf+Y
 f5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kga5RZQ0pXj6oEgyCnjUh8d8RvnKnrRGTcdOKmgX+hQ=;
 b=dlJqTN8/baIzYaHWIq0UuXsZx5Xz0IP+ONGjU/J77qodzeuXEhYw/5coacoRiKrqAe
 1Q+k2xkG6NGCcRYUnInyVaQbNAujsipQu0vuunCYLZSgjM3767rMqHSOZo91vYbcVLOT
 Zkqn3GD0lOffvUiCXWa8ZrLAiZ0xdE+6cO1vum/jbPfuBJejhQFJVHdYPb7rOHgcowR1
 4ELy+bwgTVHzBmxszBaVXB9QEjRCx8NTbaHB74axuygtkm82MArp1hzWkrcU6kUf4pq/
 cJx1BN8nBbjglnjBjKUzg1ykcc3Keu8Z/Vns+ArsQ6ugKV46BVMwp16My/pPmQ80PUXt
 xljg==
X-Gm-Message-State: AFqh2kq85Lp6fUpS6M9+OSLI78uyWlQa80cB4WHUcqXdlTdT3cWQUVQQ
 +1pfV4B9JlsLqIS/UVS7jeEG8LNsYw+NWkrnqao=
X-Google-Smtp-Source: AMrXdXuEwZPHi2VLlV7RBznYTvTuwC2IV1SFTqGSABiH1L7cmSBsCw2KuuJzw6SCb5Pw4kuF8eC4bw==
X-Received: by 2002:aa7:d6da:0:b0:474:c69:9ada with SMTP id
 x26-20020aa7d6da000000b004740c699adamr14327571edr.24.1671290726727; 
 Sat, 17 Dec 2022 07:25:26 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 lx5-20020a170906af0500b007af75e6b6fesm2138192ejb.147.2022.12.17.07.25.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 07:25:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 5/5] target/s390x/tcg/excp_helper: Restrict system headers
 to sysemu
Date: Sat, 17 Dec 2022 16:24:54 +0100
Message-Id: <20221217152454.96388-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217152454.96388-1-philmd@linaro.org>
References: <20221217152454.96388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/tcg/excp_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index fe02d82201..bc767f0443 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -21,15 +21,15 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
-#include "s390x-internal.h"
 #include "exec/helper-proto.h"
-#include "qemu/timer.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "hw/s390x/ioinst.h"
-#include "exec/address-spaces.h"
+#include "s390x-internal.h"
 #include "tcg_s390x.h"
 #ifndef CONFIG_USER_ONLY
+#include "qemu/timer.h"
+#include "exec/address-spaces.h"
+#include "hw/s390x/ioinst.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/boards.h"
 #endif
-- 
2.38.1


