Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D7E4E578A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:32:49 +0100 (CET)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4qm-0003Wn-Oz
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:32:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4ed-00078G-AG
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:20:15 -0400
Received: from [2607:f8b0:4864:20::1031] (port=54111
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4eb-000595-RZ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:20:14 -0400
Received: by mail-pj1-x1031.google.com with SMTP id bx5so2371181pjb.3
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MsX1ZkecFTiI7JDWgHH13CsFxdulVP/faYY6Ho3L9NU=;
 b=WiW4MrCr//Z88g+PXSFrPmTGMoceaVHESi73affp7lvaELZrmIQzuoUOKQHWdxEGR1
 NO8SV9ARJQk3egmkmUIPnlIThomv8Lit2KqxTc39Z2U2FpA9dGoRpDFaiV7jNk13qUza
 7zTfMC78Yc9mIXAGObaiUFBGpvB4UERocSaZSl7rhPntj8Gi1+FoC3nfqPiNjeGgZmPh
 TRMYKUG2CwwJHNw1Jqgv/qe0wIDn26xQq8oJkIoqzDAj6WG0NmljbJFdXSn/JSJOqJKV
 ad67bhyOCOEqsfPGFGJ1vRiL63Vd3PXt65wKeeSdZ40GLF1FXc9OTqtSP/xBz7j9+tjc
 hyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MsX1ZkecFTiI7JDWgHH13CsFxdulVP/faYY6Ho3L9NU=;
 b=EFYepmxq4mZwIfegN6HqTRjHc08lW7PUk51XYcjB0CTDH1nNwqUU2AmUoLdMS0fkM+
 ts8qM5mNYaNFBfve3WK6vh7apVwU7D2qIIFT5fEitjlewNMiKJjwVeK/hI4MWiN2DCCW
 KqPjdiWk73qIxdnoynjjFISYU3Ng7VMSrtsHLnWeth8IsGil9Zufs/q8YMmi3gw5ydEZ
 t6nfvjFjIhZZI/AfY+QKbaftgMMyWYT3vvdHJ63k0pkCHnDdW3Ip8sOGC/ll9EJJxFdE
 DDA8ZWApf0rLkZc0Yr6mvJb96c3gsiPO8+jQg5vW748WUD6waA3HAz7g1x25T9gdo2e/
 mlzg==
X-Gm-Message-State: AOAM532CE2328nl5rngJVMVhkNkj9ToWuUkGsB3szlh+/8RJUOVZ8dE7
 K4MhR4h/EFUZH6bmWU7nSLRzCvDFenM=
X-Google-Smtp-Source: ABdhPJyjcb2sZqeH87rq3zUZWSVN13XuvvacgYKtkqz+CZvHLPq51GDtssoIVmULExUOmBBtc3gkrA==
X-Received: by 2002:a17:90a:5291:b0:1bb:ef4d:947d with SMTP id
 w17-20020a17090a529100b001bbef4d947dmr12885297pjh.243.1648056012464; 
 Wed, 23 Mar 2022 10:20:12 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 d24-20020a637358000000b003823aefde04sm336971pgn.86.2022.03.23.10.20.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:20:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/13] accel/tcg: Add rr_destroy_vcpu_thread_precheck()
Date: Wed, 23 Mar 2022 18:17:49 +0100
Message-Id: <20220323171751.78612-12-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
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
Cc: Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 David Hildenbrand <david@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wenchao Wang <wenchao.wang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

TCG/RR is special and creates a single vCPU. It only have
to release its resources once. Implement the .precheck()
for that purpose.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops-rr.c | 9 +++++++++
 accel/tcg/tcg-accel-ops.c    | 1 +
 2 files changed, 10 insertions(+)

diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index 006b787289..6fe8e20356 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -295,3 +295,12 @@ void rr_create_vcpu_thread_postcheck(CPUState *cpu)
         cpu->created = true;
     }
 }
+
+bool rr_destroy_vcpu_thread_precheck(CPUState *cpu)
+{
+    if (single_tcg_cpu_thread) {
+        single_tcg_cpu_thread = NULL;
+        return true;
+    }
+    return false;
+}
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 127dd6fee5..0b0dbcc47a 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -102,6 +102,7 @@ static void tcg_accel_ops_init(AccelOpsClass *ops)
         ops->vcpu_thread_fn = rr_vcpu_thread_fn;
         ops->create_vcpu_thread_precheck = rr_create_vcpu_thread_precheck;
         ops->create_vcpu_thread_postcheck = rr_create_vcpu_thread_postcheck;
+        ops->destroy_vcpu_thread_precheck = rr_destroy_vcpu_thread_precheck;
         ops->kick_vcpu_thread = rr_kick_vcpu_thread;
 
         if (icount_enabled()) {
-- 
2.35.1


