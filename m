Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8D3382C14
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:28:19 +0200 (CEST)
Received: from localhost ([::1]:56540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licM6-0000VT-HL
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libql-0003vB-Bd
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:55 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:42915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqj-0002tc-Tb
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:55 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so3428307wmf.1
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CR4jn+u6FS9l33qzafdhc7xASGZQil1oCqTnHK2u1S4=;
 b=UjmmldowfgUW/2dYGE1wvcQiPb/QSfAV48oPnfKKR1uwmr8qKlj7zePF8Fxju7YAwS
 eYw55JW9018XMdR/wmoQTb+BgTrq7vL0XVzcO5/ULhE1sbVrDNV/s0CLN2MHZ8pg6pGj
 YLq2xLnaHCsN0LNu9XWlFLWvUoXJw2GwKE0amhQV8B1RxHMTvNA+6ffnWrFSpfcteJhK
 P76UW6v9Oji9Eyjhqo4h0iFrkQDdmJ/T/ocruvl69QPBP7prat9aspH3cPLYYQbQAC0l
 eSWuhv7eMTQz1QN2uRghqXHDOIgQPNVZoEv4XlrN4JFk4fhdR9/zURwvcJtCP6uf/SCx
 J7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CR4jn+u6FS9l33qzafdhc7xASGZQil1oCqTnHK2u1S4=;
 b=bgX7LY7BxkpQmFJxwXVUMqbaulGqgqTUMjMCBv0gSkUGhSxQW/zXJOD5o49hAhhB+n
 5PwuIFVAdp2bVG4AHyIq8TlyLo/Cmt6tYJTPMBq1mYPYbcVMgoa+qdIJ9vlgt3vjrmvy
 4NShnBprmUwmVoLt2EbmY2zGvz1uiffS5iGG0VotUWLjaibh3prED1yWrBMowPeyEOLc
 xrmZ45acYBfs+vCRKXFHp9HREIVveJtnIuYdJdP2R9vpXDD4ABd0pNeSRwl+gs4kNZVT
 z9RViQ74B8miTMMLcv2RbVFEIfyjtYhkBulLbl/X7iRJrMR0IJkgCXSXSfCYYbQiS5Fu
 kYGA==
X-Gm-Message-State: AOAM531ih3tFmJfzhnxJhFX1BKC6eSpokGWbT6+b9evJo+0JSQGa+3+v
 WDel+0/9mQvp7wA0/ajH2QSW175BLqDIyw==
X-Google-Smtp-Source: ABdhPJySU3h0X8Q9/eRNb6f/a6UYDSpipRwF3Y4dEuLrGVC9AjKeGSV+47K3WT2T3JLLD7U2/JEqcQ==
X-Received: by 2002:a05:600c:4ca7:: with SMTP id
 g39mr7915482wmp.1.1621252552469; 
 Mon, 17 May 2021 04:55:52 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t17sm10099919wrp.89.2021.05.17.04.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:55:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/15] accel/kvm: Simplify user-mode #ifdef'ry
Date: Mon, 17 May 2021 13:55:15 +0200
Message-Id: <20210517115525.1088693-6-f4bug@amsat.org>
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

Now than we only build this stub with system emulation,
remove the user-mode #ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/stubs/kvm-stub.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 6bda6c8c925..6ae1ff62607 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -12,10 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/kvm.h"
-
-#ifndef CONFIG_USER_ONLY
 #include "hw/pci/msi.h"
-#endif
 
 KVMState *kvm_state;
 bool kvm_kernel_irqchip;
@@ -81,7 +78,6 @@ int kvm_on_sigbus(int code, void *addr)
     return 1;
 }
 
-#ifndef CONFIG_USER_ONLY
 int kvm_irqchip_add_msi_route(KVMState *s, int vector, PCIDevice *dev)
 {
     return -ENOSYS;
@@ -153,5 +149,3 @@ bool kvm_cpu_check_are_resettable(void)
 {
     g_assert_not_reached();
 }
-
-#endif
-- 
2.26.3


