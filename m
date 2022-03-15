Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3344D9BD4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:08:57 +0100 (CET)
Received: from localhost ([::1]:50100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6v2-0003nu-6y
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:08:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6hJ-0004VY-9C
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:45 -0400
Received: from [2607:f8b0:4864:20::62e] (port=35676
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6hH-0007k1-Kb
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:54:44 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n15so16169026plh.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RcstpUhbUgnI9fuTcLWWtxfVGC/x5MLDlmMnW6NP8eM=;
 b=lMg61RT0+u+kv279f53F8sXH8CF9qu+M4Ccga24blC0WwCAwLyJz94E/KrayJG/HAV
 L4WnZ1aRC8U2bhRmGp62fhknL1z2EhZRdAumEIRKBTgYsTMtPrAP3FSpTVW93oC3AiVX
 ZS8H8gCT9bqu0pghVZC0isj5roNXj2paGqPT2ZjZJuu8c1C/irP8X4dQxladSp79ax+v
 D5oN9kOCjDOJmMwbjXbI0cyoMXOOowcfecx4ztieGVIvAMmVIK4YGYjcUTkQRqfQPFJq
 ZB1lsnweFgRzKAK+p/+Zrkl1f9mbMTcaE1bR3/M1dCEBVoNqWbnCGleM4+NPb8EuuaPJ
 I/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RcstpUhbUgnI9fuTcLWWtxfVGC/x5MLDlmMnW6NP8eM=;
 b=igBbzk25rHlQ6RhCIrhmAfhWyHlUmR00UxKHEJ8Ky/GnLCchilP6lI5aYAhid6ovWD
 lrvUNaxlkn2PXe/62xFEVEGOINTVPka6HAAlMGYZ+13X8ZQ4d9a7JEp3E97DmAvHSnuT
 hbPXY4MUTkH22fKxIX7dxyu90RnsRQrJiCPl6/Asv8WtkVBNw7wD0x2U7y/mRqFoIhKG
 JoswAy5GFNxLz+X+aDvnn6M0nLxlAKo4EHAZvzc0jkHawEuK+yBasUijFRjpL9fA8Vrl
 /UYzI07/neYlbO5or8vSONS/5L6c/njaG3EJycfmGR7rznScjdfVOrCVNgststkYVPxv
 jbsA==
X-Gm-Message-State: AOAM532/KjLcX2QkgMFie8j2NQBz9ikBgfuJxLK6TKEp1zVi61k1Ehy4
 mATy5snXu5j8m2zANEKXgPqoXglvmAc=
X-Google-Smtp-Source: ABdhPJyC/8TC8tmOPfzMln0S5kvzdku7rAR9pUu/rXwoHUYF7Z6joc7icdEoaUvZ8A4QCYVA23cICw==
X-Received: by 2002:a17:90a:5794:b0:1b9:8932:d475 with SMTP id
 g20-20020a17090a579400b001b98932d475mr4445932pji.24.1647348880257; 
 Tue, 15 Mar 2022 05:54:40 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a17090a380200b001bf46846c09sm3175989pjb.36.2022.03.15.05.54.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:54:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/21] hvf: Remove deprecated hv_vcpu_flush() calls
Date: Tue, 15 Mar 2022 13:53:34 +0100
Message-Id: <20220315125350.82452-6-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62e.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
index 907f09f1b4..bec9fc5814 100644
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


