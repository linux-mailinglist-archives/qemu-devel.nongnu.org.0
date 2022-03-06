Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5140F4CEBAF
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:19:09 +0100 (CET)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqmy-000211-ET
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:19:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWA-0001Zf-Ev
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:50 -0500
Received: from [2a00:1450:4864:20::32c] (port=47066
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqW8-000471-QO
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:46 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so7740271wmp.5
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UCCpLypHWIhYieiqCsg2pu+elbpRnMdy2MI1G/pJVOQ=;
 b=PAdUF3pM03X/Rt45vtr4Um6S067uyh00xPrSror92k1o9p26XNBwwXiQsWqdW6GcTs
 DcySd8EUyO2NyMZfEEVp1NP1vJOCaIWot3+53WGWkKX5TPmA6Q402fuxFM1dotarskJq
 JufsQLS4sIkqrgSnjRpcAs8jcbRBwsxIN0U1Y2gxupTp9B1r2r0JpRD6VRmwvYAMhvDj
 k3H2HDxfwYoMZjldkQlYpFJdy1LEC+VEgPS5J7BnOndO716J4MbR/qkkQ2ECZfp3jbll
 Rzm/2omSUY4A4qDI2j11+LqyFezQQP3BuCNoqkpZ4+9/0CR40H7foPgt0zwnHTRWC69J
 4wGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UCCpLypHWIhYieiqCsg2pu+elbpRnMdy2MI1G/pJVOQ=;
 b=8OnveZVwyklCs2JiiDJZomiyflTWWq2HVzFt9ITmWYSpT2ClaJflwZagCnPnp9XUJ3
 Z2M15V4et1PCxC/Aq57UU1xJ1aoRULUcFzVpkufZdqAnyFkXcpxytoRzjyifHOJaR6dN
 nucKJNrFiVsovgKXhdP5+wdYu1HaCz7Muy5zkb/Pmkyq4MNZic5h8upkcJ1BtSVLcGxj
 c69cCVV1BlTrFfm7nt1nhREdMEBA/P/h2iCF+Rr59MP7f6RYbSRUe33GpyEaN1OZHf9o
 oLBh7CktDaWg+mC58heBTqsOCn9nzkA7kd7N8F+U/VvdJeGPahvR/40ic7tDCLca0LRe
 jWKA==
X-Gm-Message-State: AOAM532Cxnhk1Mv7NGiMhgrOnOi9AE5cGrcK8j+zJnB/NsCW2Y+exClB
 b/YdiXdAML6YyiPsjzbcvcy7+X1O24Y=
X-Google-Smtp-Source: ABdhPJxlc4qi7bEISveplcS4kpwZJ9ckIQbvCS3TJCBydJkUaHmlXRTJ4qvLbUlwN8y/BNOYVW1wbA==
X-Received: by 2002:a05:600c:602a:b0:389:9e05:6f01 with SMTP id
 az42-20020a05600c602a00b003899e056f01mr3198388wmb.1.1646571703399; 
 Sun, 06 Mar 2022 05:01:43 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 u10-20020adfa18a000000b001f04c24afe7sm8892212wru.41.2022.03.06.05.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/33] softmmu: Add qemu_init_arch_modules()
Date: Sun,  6 Mar 2022 13:59:46 +0100
Message-Id: <20220306130000.8104-20-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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

module_allow_arch() is the single target-specific call in the
whole vl.c file. Move the module initialization out to arch_init.c,
that way we'll be able to build vl.o once for all targets (the
next commit).

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-21-f4bug@amsat.org>
---
 include/sysemu/arch_init.h | 2 ++
 softmmu/arch_init.c        | 9 +++++++++
 softmmu/vl.c               | 5 +----
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index 70c579560ad..79c2591425f 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -28,4 +28,6 @@ enum {
 
 extern const uint32_t arch_type;
 
+void qemu_init_arch_modules(void);
+
 #endif
diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
index 8919405c7b2..79716f959ba 100644
--- a/softmmu/arch_init.c
+++ b/softmmu/arch_init.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/module.h"
 #include "sysemu/arch_init.h"
 
 #ifdef TARGET_SPARC
@@ -39,3 +40,11 @@ int graphic_depth = 32;
 #endif
 
 const uint32_t arch_type = QEMU_ARCH;
+
+void qemu_init_arch_modules(void)
+{
+#ifdef CONFIG_MODULES
+    module_init_info(qemu_modinfo);
+    module_allow_arch(TARGET_NAME);
+#endif
+}
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1fe028800fd..0b81f615354 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2815,10 +2815,7 @@ void qemu_init(int argc, char **argv, char **envp)
     error_init(argv[0]);
     qemu_init_exec_dir(argv[0]);
 
-#ifdef CONFIG_MODULES
-    module_init_info(qemu_modinfo);
-    module_allow_arch(TARGET_NAME);
-#endif
+    qemu_init_arch_modules();
 
     qemu_init_subsystems();
 
-- 
2.35.1


