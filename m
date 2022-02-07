Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3537B4AB6E4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:56:16 +0100 (CET)
Received: from localhost ([::1]:44030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzoj-0004fN-NJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:56:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrw-0005r8-7F
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:40 -0500
Received: from [2a00:1450:4864:20::433] (port=40852
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrn-00027Z-Ua
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id s18so23110215wrv.7
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpFa/IKKJWfbzZvTx8XgPB/hvj/ELIT1rILBVFupVCQ=;
 b=IAnMj00eftzbxPS6u12zY/8lJxq7+eEu/RWJ89P81ls8XR7iPML4GcqV9bWL1k+JfH
 A9uWRGKyNQDXI+xlqedFAPLzkibqLb0Mu4xD1R8eiSTFdMxdUsi0wSo8JC0p38UYU6kY
 VgD1OIsG7hkHCz94GFPwRDBF/IMDdQj+hU9wqDH+GMyhadUsgwX4Z688guDIm7lkMrEr
 qukdF5rOe17l+VINQFuNA7KimR+jz70dRSqQGG99wWvcuTRpXKU4O4hg5Lc8pMxclcyZ
 ek6ue+MwP/k3Vjx3IWwTb/qEtnx2abLdzmpSrd/wczVe6I3VzeTaC9srzoeHzicWWuJW
 Xnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bpFa/IKKJWfbzZvTx8XgPB/hvj/ELIT1rILBVFupVCQ=;
 b=GfQELIHhbzSZ+wpkKvWJBaYcs3HJiYhXn4DbUen/jA8S7f2fn1A3H7rbt42jISR9JP
 83fuszUR6iJzxOYtabR3/d7pWmknibtVtM07zvAkRZeHW9Tw5MFVyPmoxbobU9mM8x3B
 w7RuvKccyDkyfu+2rJbjpFnKYyGU4sM9NGBnWzvB7yu+mJonNzWGfPbnw2RBIBvXJ5BQ
 6zM2x2ZL/uUOQH4aLL3qvHc3HCNUnsSkKaYtl6r6YfvgOMbfPyGhtMuW9RCs79QRGJsT
 lLPHU9RtGmEBLI/KDahvwl10ZvCecOv4QdcgzoxjVbqU6jRWVO1j4msXmfMWoL+jUNrH
 fheQ==
X-Gm-Message-State: AOAM5329cuzwfxd0Vg9rsw+GO+/kgocIUm9IM/614Ttm5Fjk46wsz3GN
 kCulnMnYPxEJD9NyK8TyH7FDfOWF9/g=
X-Google-Smtp-Source: ABdhPJyQPVSmQDOt9pUfmRImp80daCqHjZWefUfYfnXeTrdJOTbwpyBdRH7b2AXPexUELCf5GAW5ng==
X-Received: by 2002:a5d:6041:: with SMTP id j1mr4348555wrt.47.1644220509066;
 Sun, 06 Feb 2022 23:55:09 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 5sm10036032wrb.113.2022.02.06.23.55.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:08 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 09/21] softmmu/cpus: Code movement
Date: Mon,  7 Feb 2022 08:54:14 +0100
Message-Id: <20220207075426.81934-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

We want cpu_thread_is_idle() to use cpus_accel, so declare this
variable earlier.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpus.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 7f15106dd9..538e1714af 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -66,6 +66,11 @@
 
 static QemuMutex qemu_global_mutex;
 
+/*
+ * The chosen accelerator is supposed to register this.
+ */
+static const AccelOpsClass *cpus_accel;
+
 bool cpu_is_stopped(CPUState *cpu)
 {
     return cpu->stopped || !runstate_is_running();
@@ -126,11 +131,6 @@ void hw_error(const char *fmt, ...)
     abort();
 }
 
-/*
- * The chosen accelerator is supposed to register this.
- */
-static const AccelOpsClass *cpus_accel;
-
 void cpu_synchronize_all_states(void)
 {
     CPUState *cpu;
-- 
2.34.1


