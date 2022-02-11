Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1434B2AA0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:42:14 +0100 (CET)
Received: from localhost ([::1]:49498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYzt-0000Yf-Cy
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:42:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYu3-0000SI-Oc
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:16 -0500
Received: from [2607:f8b0:4864:20::429] (port=39617
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYtz-0002JH-Aw
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:36:10 -0500
Received: by mail-pf1-x429.google.com with SMTP id r19so17203767pfh.6
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d7T27EMFPVzp3B0TQwoZYMCEX+PxVB/NfGOmyTZ7TJw=;
 b=Gah2APfQ4kdoT75MIsAyYjw8P9SCl0rbwwJdBes1ARo1wJ1L0aRHvYzZDQ0Bch0lTC
 ygH2d6W98gR6pV5sSU/fEAhHd0KRaQ/ozf26ThBtOHUxo3HPhuEVMDBNWGSfoUG5WQjh
 0Yx9A++wTrOUt2FV2+zXcV9/B4rznmjt9y21zomIt9rQOGpedHZueDrVL9PG7ruIjZIk
 NTq3l6jwRkT9UaZSfntdSoruWe4oklapnMa+iiCMIMGYWSSj9s8DXpMNYxkFWweSkkS7
 II2RLu8rE2HN4IvK93kdllkd2we6CwVc14aTpKbW2smke2j7sjiNi2NE8igWt1FknPrm
 pAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d7T27EMFPVzp3B0TQwoZYMCEX+PxVB/NfGOmyTZ7TJw=;
 b=CE5YWDFL5LtGhS2JHD5mIFXS2fbMQy7a6UHUo67GWm18Ekp3pU3AbASzuLlL2zmxcT
 G8pmvmlpg+Ahe0dGsW9LBkOCuPshtrs/cuA4Vi2EHqrmQeOPcsqSjQoigmjEpJOnOQVt
 7V9lKlnqb3qNXjx9FPr/DphJcHLpTD91csmnJ0KqPuJNmZYKZ5HjVsdBvTk0KLPQRbbB
 ivlpUlSET1bbpxYUxBolCTDUGzn9dctivmSy+vEm5gmDKENoPpixr+6td9S9AfX34mXy
 L/kHCsKVXZFZUHRcq7ayzAGyOsmJEvONf0LoURf/RHtja7WDHiNyQ2eoYG+OVS20m661
 CsYA==
X-Gm-Message-State: AOAM531kj/RKiOmXnnW4cobDzHQfa4nkimZJahCwpRnvFi5pFH4pdBgY
 wuvwLeLybIiNw5ikeTNqqrmZM12X084=
X-Google-Smtp-Source: ABdhPJwVV8XiVQlxGHoi8q/BqVMCKhr0Spzc30ocuZ3CyAAQKSqtrVHChsb176zn0nQrNfi/QitWeQ==
X-Received: by 2002:a63:1ca:: with SMTP id 193mr2050069pgb.20.1644597358017;
 Fri, 11 Feb 2022 08:35:58 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id me18sm2983705pjb.39.2022.02.11.08.35.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 11 Feb 2022 08:35:57 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 08/13] hvf: Remove deprecated hv_vcpu_flush() calls
Date: Fri, 11 Feb 2022 17:34:29 +0100
Message-Id: <20220211163434.58423-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211163434.58423-1-f4bug@amsat.org>
References: <20220211163434.58423-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
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

When building on macOS 11 [*], we get:

  In file included from ../target/i386/hvf/hvf.c:59:
  ../target/i386/hvf/vmx.h:174:5: error: 'hv_vcpu_flush' is deprecated: first deprecated in macOS 11.0 - This API has no effect and always returns HV_UNSUPPORTED [-Werror,-Wdeprecated-declarations]
      hv_vcpu_flush(vcpu);
      ^
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Hypervisor.framework/Headers/hv.h:364:20: note: 'hv_vcpu_flush' has been explicitly marked deprecated here
  extern hv_return_t hv_vcpu_flush(hv_vcpuid_t vcpu)
                     ^

Since this call "has no effect", simply remove it ¯\_(ツ)_/¯

Not very useful deprecation doc:
https://developer.apple.com/documentation/hypervisor/1441386-hv_vcpu_flush

[*] Also 10.15 (Catalina):
    https://lore.kernel.org/qemu-devel/Yd3DmSqZ1SiJwd7P@roolebo.dev/

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/vmx.h      | 2 --
 target/i386/hvf/x86_task.c | 1 -
 target/i386/hvf/x86hvf.c   | 2 --
 3 files changed, 5 deletions(-)

diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
index 29b7deed3c..573ddc33c0 100644
--- a/target/i386/hvf/vmx.h
+++ b/target/i386/hvf/vmx.h
@@ -160,7 +160,6 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
     wvmcs(vcpu, VMCS_GUEST_CR0, cr0 | CR0_NE_MASK | CR0_ET_MASK);
 
     hv_vcpu_invalidate_tlb(vcpu);
-    hv_vcpu_flush(vcpu);
 }
 
 static inline void macvm_set_cr4(hv_vcpuid_t vcpu, uint64_t cr4)
@@ -172,7 +171,6 @@ static inline void macvm_set_cr4(hv_vcpuid_t vcpu, uint64_t cr4)
     wvmcs(vcpu, VMCS_CR4_MASK, CR4_VMXE_MASK);
 
     hv_vcpu_invalidate_tlb(vcpu);
-    hv_vcpu_flush(vcpu);
 }
 
 static inline void macvm_set_rip(CPUState *cpu, uint64_t rip)
diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
index e1301599e9..d24daf6a41 100644
--- a/target/i386/hvf/x86_task.c
+++ b/target/i386/hvf/x86_task.c
@@ -182,5 +182,4 @@ void vmx_handle_task_switch(CPUState *cpu, x68_segment_selector tss_sel, int rea
     store_regs(cpu);
 
     hv_vcpu_invalidate_tlb(cpu->hvf->fd);
-    hv_vcpu_flush(cpu->hvf->fd);
 }
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index cff59f3144..a338c207b7 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -125,8 +125,6 @@ static void hvf_put_segments(CPUState *cpu_state)
 
     hvf_set_segment(cpu_state, &seg, &env->ldt, false);
     vmx_write_segment_descriptor(cpu_state, &seg, R_LDTR);
-    
-    hv_vcpu_flush(cpu_state->hvf->fd);
 }
     
 void hvf_put_msrs(CPUState *cpu_state)
-- 
2.34.1


