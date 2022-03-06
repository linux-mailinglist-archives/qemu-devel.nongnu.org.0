Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A14CEBA9
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:14:56 +0100 (CET)
Received: from localhost ([::1]:34892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqit-0004GL-Ct
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:14:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWU-00024Y-4W
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:06 -0500
Received: from [2a00:1450:4864:20::436] (port=34412
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWS-0004EX-NY
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:05 -0500
Received: by mail-wr1-x436.google.com with SMTP id j26so8965188wrb.1
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YP/OwaNKn69ZY9LQU+sOJzCXfUeM/0snWCKQSSt7nAM=;
 b=Rs/PXqe32iT84ZdKdtPt0lgHXshw1iFTXCtvvpEdtGqy1g3cwuX4bOCujnO0Cbi39c
 q84RnzYDGJ2UGg9X9Z5+uZkYXA+ZSYU6mu0LDHbVplKI0o8oXe7RbEr5ph+T3PZkA1n0
 8IsOxgcvGIfIY+kcaCvfsEBiUB9TUqnYudvKv4ngEdMdDn0fLcxi1NvZdOQV80kFjV5c
 dW6QiDIuXkvPe+9cBaQ464JMCBDXpeHqaZ3XtYWilURQlSvLSQNtuslfCqD5FMghSJjl
 cHt+cgw5G5Hd6xZfAcQwDaPxDKX8Klgdw8SSjVGTkvzDKyxYANskREdqDGHnfymNNSrQ
 JvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YP/OwaNKn69ZY9LQU+sOJzCXfUeM/0snWCKQSSt7nAM=;
 b=gxQbQMMdJuRGC6qFzwAah5OYi3rpBzok/0hvA8viZlriVS9D/VmHFaNQpyDTisOiGt
 1LZvnM/VIfw5gmkDXt+VspamiDqnIodyitRWLoKlHjxz6YQbWW0C7yPyXP27iJloeVnn
 ax2IJHoSgfRvPxG5uKnkagpu8v97MgFTPjXk2paJlXbfIMo4W0huQ7tGubPakPsXNi1E
 v1lGYvXbYzIwt93pHC83iPcn84SRyooz785lC6xBbtqr8PcGkr4E8MmS7LpjUbTmBI1J
 tCUewQOfgJWVN9FzYGdjKRWdqa7VYjdAijSsOX76gEG7nh8sPzcWQXPwcgbNchFhPGD+
 7lcg==
X-Gm-Message-State: AOAM530mSKpH1mZPkFlNbhITBuesXsM/G59wAKJG8Or3gJlrsJvGhlow
 8u5MiBjFzNK7idcZaexd4LSCfxhU4AQ=
X-Google-Smtp-Source: ABdhPJxgYC1CglCtd++lNxw9JnAHKZgDwoF7AUPhyyDCwlkmtYnOvcQXoynJG1Swh3yW/lhhcjsh9Q==
X-Received: by 2002:a5d:584f:0:b0:1e8:5697:e979 with SMTP id
 i15-20020a5d584f000000b001e85697e979mr5254013wrf.167.1646571723312; 
 Sun, 06 Mar 2022 05:02:03 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c228700b00389865c646dsm11247156wmf.14.2022.03.06.05.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:02:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/33] cpu: Add missing 'exec/exec-all.h' and 'qemu/accel.h'
 headers
Date: Sun,  6 Mar 2022 13:59:50 +0100
Message-Id: <20220306130000.8104-24-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

cpu.c requires "exec/exec-all.h" to call tlb_flush() and
"qemu/accel.h" to call accel_cpu_realizefn().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214183144.27402-6-f4bug@amsat.org>
---
 cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/cpu.c b/cpu.c
index d5d4cbf8cb7..d5648861490 100644
--- a/cpu.c
+++ b/cpu.c
@@ -35,10 +35,12 @@
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
 #include "sysemu/replay.h"
+#include "exec/exec-all.h"
 #include "exec/translate-all.h"
 #include "exec/log.h"
 #include "hw/core/accel-cpu.h"
 #include "trace/trace-root.h"
+#include "qemu/accel.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
-- 
2.35.1


