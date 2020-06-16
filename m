Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4431FB160
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 14:58:40 +0200 (CEST)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlBAl-0003zU-CG
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 08:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlB5t-0003nf-LW
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:53:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlB5r-00006S-T4
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:53:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x13so20638092wrv.4
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 05:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=exFtdpeiE/YU2NIFtj2aRDoc3cKhGjW3auP7rUrwYDs=;
 b=Pr0eH5Ko6K0UxbL2ea5LQKMJoe5pTYseSfudKNNX6qSsA9Zq9U0DaYl64Qc/9SxSn0
 4eVQvPva1CLCO/hk6EqjQti4I0p1RgV6tPe7fRbSsKvmtBXkmrcXuf4pL69asuaXCdj3
 4m+OuwVPZVMKlBYDBDvrUcpy3CusRxgKr1zB7n+fzSB04rhMCcmRtboqcSuBJyJxh/+3
 i/YfsAVtz8vG4iC/D6L9Gjh2h0983BKfdQGn29X1YrKcyGSFWiSmzPr/Inmf2ioTpcEi
 O+IzXTgzVKjfyk2A1zwH3InkSNuxj/yVIL0QHQde44nW/LuF3oejJGfei88WMcF//5VY
 YH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=exFtdpeiE/YU2NIFtj2aRDoc3cKhGjW3auP7rUrwYDs=;
 b=PaUlOih15y2+bB63tsZUFiVjCHFDet1SN7JY6oPTSGOsGLdhDVpqea5Z2b3v/7GCx+
 eWQmcbCa7JUUg+oFYNaRHAaQ5aheSaTC/L89jSufIS8yeCmet7V1uMJ0VjzULM6YlP9j
 KPOcfu8D0n54WoA3SiqJpokU/k+ULXh2QG3KOpn5TAoEeWaICKAhJ1fT08KHQZ+u+CHb
 +OPtFvHgqpuo3qKF8427VNh40ICWmvlIXPe1dsYTbj7mhAlf3FP3uFnmgHG9R8gUSsFM
 Ut6BxSzjKsocTIkUjMn04m81bSNVwfNfptTjP2LseArkUBOHUNCP/eTuQSwao5NWLg8i
 dkMA==
X-Gm-Message-State: AOAM533MFLoPqqqfDE0SijuIOpeacclmYJ95IXFtvy3M+r+6FHK4STEZ
 +a5aHPjFAayPwMpdYAZ+/cJf2d2yqvI=
X-Google-Smtp-Source: ABdhPJwV8lFdvt5uK2IyqqCshgZT5zVh114alx4+bBRKhaJ6pIZMNtX8iQkbV1U77BLQR56VnEHKYQ==
X-Received: by 2002:a5d:4701:: with SMTP id y1mr2914014wrq.310.1592312014401; 
 Tue, 16 Jun 2020 05:53:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r14sm789732wrx.42.2020.06.16.05.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 05:53:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F04281FF93;
 Tue, 16 Jun 2020 13:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/21] cputlb: destroy CPUTLB with tlb_destroy
Date: Tue, 16 Jun 2020 13:53:10 +0100
Message-Id: <20200616125324.19045-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616125324.19045-1-alex.bennee@linaro.org>
References: <20200616125324.19045-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org,
 "Emilio G. Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

I was after adding qemu_spin_destroy calls, but while at
it I noticed that we are leaking some memory.

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200609200738.445-5-robert.foley@linaro.org>
Message-Id: <20200612190237.30436-8-alex.bennee@linaro.org>

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 8792bea07ab..3cf88272df9 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -124,6 +124,11 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
  * @cpu: CPU whose TLB should be initialized
  */
 void tlb_init(CPUState *cpu);
+/**
+ * tlb_destroy - destroy a CPU's TLB
+ * @cpu: CPU whose TLB should be destroyed
+ */
+void tlb_destroy(CPUState *cpu);
 /**
  * tlb_flush_page:
  * @cpu: CPU whose TLB should be flushed
@@ -284,6 +289,9 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
 static inline void tlb_init(CPUState *cpu)
 {
 }
+static inline void tlb_destroy(CPUState *cpu)
+{
+}
 static inline void tlb_flush_page(CPUState *cpu, target_ulong addr)
 {
 }
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index eb2cf9de5e6..1e815357c70 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -270,6 +270,21 @@ void tlb_init(CPUState *cpu)
     }
 }
 
+void tlb_destroy(CPUState *cpu)
+{
+    CPUArchState *env = cpu->env_ptr;
+    int i;
+
+    qemu_spin_destroy(&env_tlb(env)->c.lock);
+    for (i = 0; i < NB_MMU_MODES; i++) {
+        CPUTLBDesc *desc = &env_tlb(env)->d[i];
+        CPUTLBDescFast *fast = &env_tlb(env)->f[i];
+
+        g_free(fast->table);
+        g_free(desc->iotlb);
+    }
+}
+
 /* flush_all_helper: run fn across all cpus
  *
  * If the wait flag is set then the src cpu's helper will be queued as
diff --git a/exec.c b/exec.c
index 9c8f558590d..d6712fba7eb 100644
--- a/exec.c
+++ b/exec.c
@@ -892,6 +892,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
+    tlb_destroy(cpu);
     cpu_list_remove(cpu);
 
     if (cc->vmsd != NULL) {
-- 
2.20.1


