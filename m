Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28664CEB9F
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:07:07 +0100 (CET)
Received: from localhost ([::1]:45846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqbK-0000lo-OX
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:07:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUq-0000Jd-DO
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:24 -0500
Received: from [2a00:1450:4864:20::42e] (port=35636
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqUn-0003nf-6Q
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:22 -0500
Received: by mail-wr1-x42e.google.com with SMTP id b5so19354457wrr.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VlT6vVXviz1GP/XMR8RGt4JnmABZzl+ZaOzErHnQUk4=;
 b=Rf7BrTn6bWbSAMlWWXoaSxkUZamHP/vSKMEZ8Np6cPZgFM0KoRZjeT+FLHcEMW5dPZ
 3fLt77gibk7trpU1sYy+v6f9eEDZWZ8d5m7T7a5Fnp4NbTOflJXPu8im6FYmCqoswa8v
 1KfbKkI2dSbDWk8htkT9MtGyGGL3OJFqkIl7SYpJaaEic6LLarThX34NShh1yRF8BiIi
 HkVQEisqta66EhZgVDPm7y+rI6VCd3AHSl/Hhnxf5H3TTYkoJeX+1EC2bFuIRAe9xDTX
 R/eEQ1wutCczoMVPbLZmpC1tAHIJu4LVJDF8H1lSbYApRCkdAqTWdmacDzZ0KWwKeqGO
 DG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VlT6vVXviz1GP/XMR8RGt4JnmABZzl+ZaOzErHnQUk4=;
 b=ehx9juECNm34YrguhpvQdNYzyPG6MpprHqbDoTXNAVQkZSHN2D6uAS36kxt5keETWh
 TIdifvzjG06feNSgKNgEhKAmCT5UolIyE7ZaByMleo30CPwJBWXKz+sD3DgYlTdW0l0V
 dhpQD6M2meVre8L/BZuQy7mB/DbomAa3r5gPdTYKzIddOeG8KW0Zxbszb0/ofHNKo7PS
 yf2STmubaNs3XpHVEwyLcf7yvShIyJ2kFM6t2bz9PSwd/8gTqbaPKshMThC/gzDaic5V
 8y2u13DgqiDRKJktkNpHmbT5SFEB/nGDkmD85h4vgj3AqMnHpfZd3uu++ydRZpc6SFa/
 gRsw==
X-Gm-Message-State: AOAM530uZznuo5ANTKYl558wSCLsrAeAmCzVRi+0GBArKTMzGBz+Jx88
 nLffOFKPAvq718fggqUVuAlF1LxUfmY=
X-Google-Smtp-Source: ABdhPJxp2AocL0x6ztuWJb86OeQgyUeqFCli1vk0IdePZ6rdH9ZHoxMOa7RN92LSjnz7Y7m/7zlXag==
X-Received: by 2002:a5d:5849:0:b0:1f0:5552:bc05 with SMTP id
 i9-20020a5d5849000000b001f05552bc05mr5307711wrf.386.1646571619637; 
 Sun, 06 Mar 2022 05:00:19 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm12104478wmb.3.2022.03.06.05.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:00:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/33] exec: Declare vaddr as a generic target-agnostic type
Date: Sun,  6 Mar 2022 13:59:30 +0100
Message-Id: <20220306130000.8104-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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

Move vaddr type declaration to the generic "exec/cpu-common.h" header.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-4-f4bug@amsat.org>
---
 include/exec/cpu-common.h | 12 ++++++++++++
 include/hw/core/cpu.h     | 13 +------------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index de5f444b193..cd1d7328a1d 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -7,6 +7,18 @@
 #include "exec/hwaddr.h"
 #endif
 
+/**
+ * vaddr:
+ * Type wide enough to contain any #target_ulong virtual address.
+ */
+typedef uint64_t vaddr;
+#define VADDR_PRId PRId64
+#define VADDR_PRIu PRIu64
+#define VADDR_PRIo PRIo64
+#define VADDR_PRIx PRIx64
+#define VADDR_PRIX PRIX64
+#define VADDR_MAX UINT64_MAX
+
 /* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
  * when intptr_t is 32-bit and we are aligning a long long.
  */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 76ab3b851c8..3f2b681281c 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -22,6 +22,7 @@
 
 #include "hw/qdev-core.h"
 #include "disas/dis-asm.h"
+#include "exec/cpu-common.h"
 #include "exec/hwaddr.h"
 #include "exec/memattrs.h"
 #include "qapi/qapi-types-run-state.h"
@@ -35,18 +36,6 @@
 typedef int (*WriteCoreDumpFunction)(const void *buf, size_t size,
                                      void *opaque);
 
-/**
- * vaddr:
- * Type wide enough to contain any #target_ulong virtual address.
- */
-typedef uint64_t vaddr;
-#define VADDR_PRId PRId64
-#define VADDR_PRIu PRIu64
-#define VADDR_PRIo PRIo64
-#define VADDR_PRIx PRIx64
-#define VADDR_PRIX PRIX64
-#define VADDR_MAX UINT64_MAX
-
 /**
  * SECTION:cpu
  * @section_id: QEMU-cpu
-- 
2.35.1


