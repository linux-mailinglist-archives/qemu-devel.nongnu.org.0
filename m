Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A374CEBA0
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:07:08 +0100 (CET)
Received: from localhost ([::1]:45976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqbM-0000qq-0R
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:07:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVE-0000Wu-P9
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:48 -0500
Received: from [2a00:1450:4864:20::331] (port=41802
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVC-0003uV-J9
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:47 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so6899784wmf.0
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RKpGStM8DkShYLY2Ns4C0i7XvPWHVVZwHbKnqu8GWvo=;
 b=l7zymXQDg5rB7o0XoVMtVGz+Nte8mXr+37dV+XhbhCI/8an6/FyY82EMXwWAineFYp
 N1hwAIPWBCNe9tNxHL0pYBF8hJXrX12tfbExiaMHtp7JWFp/yv3hMWy/ia9O1lLKEWCg
 cgYyFFsmMeuZytpimIiZZPKqs/zADHFZtPN4SVESek3uLbXlc0TeexIrkGqGoDAHgCLk
 t1SSh5spLRM7eRVhHDxqI/pCA+a2ymqLZGtGBRAR0KxIH1OnpBUhsS+4+i7IdPcAxeT0
 btS6ePvbPPIMqkw0E0pQK+aWV8VwcutjNSKzFHvzqdhBwHsXIYHJa6LSy7V8D95hsQYd
 fP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKpGStM8DkShYLY2Ns4C0i7XvPWHVVZwHbKnqu8GWvo=;
 b=LhijVTjlB1IGjNJOzveD3WyNfsrJnbUq4w0SdDTb7ylAYGdcp2IJ8+jY/qWlsPwk/G
 9ebwZUYvUSYhE5xw1pysPh1RJZ4x6V85aoKyF6sHDq7ATAlIXsVEwJtFnL9VTNnLnJOm
 BwVfegvnh6QYSDxjkWpAV0l+jyaWz4BhVSeUmwVPZCzUuXAzA+NwuZxvR4lQVM83pX/V
 MBIhlZVPsufqSmCcE5Q7afKBj/keBf3cd+WdBbk41q2bG+AadMmi79J38hcgYEK1VfWC
 5HNtpQF5SvF9p+3MS+27X6sYpz2Us4oomxDliTFXDQZ2Q2ot5mGgg5WCgVNqgWsL/Ufl
 Mweg==
X-Gm-Message-State: AOAM531KrpU9Za9AWegGNZp+HZyjaOZmsFFffrz4a6PP1co16pgVR/by
 8ZiDrw1NicvUc6W8DOAn7Tf5VVCRslY=
X-Google-Smtp-Source: ABdhPJx8jYoFo/s7JeOaFpKiF1r2SceqUNwF6LLPJ7VFjZb9V4xCn+PaYWzE3w3ODCc2jAkhnGXv1g==
X-Received: by 2002:a7b:c250:0:b0:389:7fe5:d34c with SMTP id
 b16-20020a7bc250000000b003897fe5d34cmr9216698wmj.83.1646571645056; 
 Sun, 06 Mar 2022 05:00:45 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 q14-20020a1cf30e000000b0038986a18ec8sm6217590wmq.46.2022.03.06.05.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:00:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/33] accel/hax: Introduce CONFIG_HAX_IS_POSSIBLE
Date: Sun,  6 Mar 2022 13:59:35 +0100
Message-Id: <20220306130000.8104-9-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

Mirror "sysemu/kvm.h" #ifdef'ry to define CONFIG_HAX_IS_POSSIBLE,
expose hax_allowed to hax_enabled() macro.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-9-f4bug@amsat.org>
---
 include/sysemu/hax.h      | 18 ++++++++++++------
 accel/stubs/hax-stub.c    |  2 ++
 target/i386/hax/hax-all.c |  7 +------
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/sysemu/hax.h b/include/sysemu/hax.h
index 247f0661d12..bf8f99a8246 100644
--- a/include/sysemu/hax.h
+++ b/include/sysemu/hax.h
@@ -25,17 +25,23 @@
 int hax_sync_vcpus(void);
 
 #ifdef NEED_CPU_H
+# ifdef CONFIG_HAX
+#  define CONFIG_HAX_IS_POSSIBLE
+# endif
+#else /* !NEED_CPU_H */
+# define CONFIG_HAX_IS_POSSIBLE
+#endif
 
-#ifdef CONFIG_HAX
+#ifdef CONFIG_HAX_IS_POSSIBLE
 
-int hax_enabled(void);
+extern bool hax_allowed;
 
-#else /* CONFIG_HAX */
+#define hax_enabled()               (hax_allowed)
 
-#define hax_enabled() (0)
+#else /* !CONFIG_HAX_IS_POSSIBLE */
 
-#endif /* CONFIG_HAX */
+#define hax_enabled()               (0)
 
-#endif /* NEED_CPU_H */
+#endif /* CONFIG_HAX_IS_POSSIBLE */
 
 #endif /* QEMU_HAX_H */
diff --git a/accel/stubs/hax-stub.c b/accel/stubs/hax-stub.c
index 49077f88e3c..2fe31aaa9ab 100644
--- a/accel/stubs/hax-stub.c
+++ b/accel/stubs/hax-stub.c
@@ -16,6 +16,8 @@
 #include "qemu/osdep.h"
 #include "sysemu/hax.h"
 
+bool hax_allowed;
+
 int hax_sync_vcpus(void)
 {
     return 0;
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index bf65ed6fa92..ccdcb6afabc 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -49,18 +49,13 @@ const uint32_t hax_cur_version = 0x4; /* API v4: unmapping and MMIO moves */
 /* Minimum HAX kernel version */
 const uint32_t hax_min_version = 0x4; /* API v4: supports unmapping */
 
-static bool hax_allowed;
+bool hax_allowed;
 
 struct hax_state hax_global;
 
 static void hax_vcpu_sync_state(CPUArchState *env, int modified);
 static int hax_arch_get_registers(CPUArchState *env);
 
-int hax_enabled(void)
-{
-    return hax_allowed;
-}
-
 int valid_hax_tunnel_size(uint16_t size)
 {
     return size >= sizeof(struct hax_tunnel);
-- 
2.35.1


