Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580F489A2C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:41:37 +0100 (CET)
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6uvY-0000C6-4n
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:41:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRO-0008Ow-Py
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:27 -0500
Received: from [2a00:1450:4864:20::32e] (port=37625
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6uRN-0008Og-3E
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:10:26 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso9239248wmj.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iN7rmJCyt/9XOylIukKsQBez3yTqjDEoUhXX6uhz6nk=;
 b=lff4p114YEVct2vn7c/af0gN+4CpPp4U/Yph4r2HMbiUnSsnx/JatYA8sqJZ6WtIJE
 tNRhINXYCFMBPKDia2c4VvEgfggRASktfqbG5fxYTLlVaLZJOnbqayzny+zZFNunPpv7
 uP5OR3u/YvUh5L3v6TF2DNUMIludloS2aa09nTITdHrn86oi+dNw5+IBC3HbdT9ZwQNW
 cS6rD4iJKvK7cEPauMSR+x4LkOZqbQ0RJe9Wd014TszGPvrmb5ZEigi4KqlUSYEaU8ST
 c1wYtewZm6FU8QYx5Sak5PuBGdfv9JcIOEDLwnp9ntuI+PcirIDHAUmw2eWZjyJ5hPzr
 hNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iN7rmJCyt/9XOylIukKsQBez3yTqjDEoUhXX6uhz6nk=;
 b=T9QWAE2JE7D7KUpBx+EGKvchulbqJVbDlnPRttTQZ7rstagm1v7Cbx0G2KIe1z/CpP
 TK8zD0C4/i3YxPz+8Y8G3Jxk4gTOeaj3pl5uYBsew2iFza+A4X1HFCjP4u4J5RDGr3GW
 dRWhieo9nJLtTLmixjZrleb76j0o4G6NEJGc7YqMRysEOpVuOIITaK87OTVrS7BB40iQ
 Rjzyii/j5lThn89abhsMbqZ6YwHct1QUU36/M+JoPEiscT21CmjUiRZBFtIQ8Fv13q6A
 cvdckZvryXOwtDwv1YFmq9cG+P3M/1bBsnyPLbaOmtYyMDDMFPPhWZcnTJ6OivPBT2/L
 LygA==
X-Gm-Message-State: AOAM533++MBF/Ix0B39DVpCAb3Ug8Uju1r7f9z/h/Tlok1ERXEEEGSmw
 ncdELz7e4UUpXEU84rILlVwpN/G7myWyiw==
X-Google-Smtp-Source: ABdhPJwWVS3okc2AzQo3F2ukXhTa0R+QCTHvcFj/kq4eYgjBstvycGMOzovO8m0vFo9iX2aPb/N3dg==
X-Received: by 2002:a05:600c:6009:: with SMTP id
 az9mr21993042wmb.32.1641820223655; 
 Mon, 10 Jan 2022 05:10:23 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id o15sm6930798wro.70.2022.01.10.05.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 05:10:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 4/7] hvf: Remove deprecated hv_vcpu_flush() calls
Date: Mon, 10 Jan 2022 14:09:58 +0100
Message-Id: <20220110131001.614319-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110131001.614319-1-f4bug@amsat.org>
References: <20220110131001.614319-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building on macOS 12, we get:

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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hvf/vmx.h      | 2 --
 target/i386/hvf/x86_task.c | 1 -
 target/i386/hvf/x86hvf.c   | 2 --
 3 files changed, 5 deletions(-)

diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
index 6df87116f62..094fb9b9dc9 100644
--- a/target/i386/hvf/vmx.h
+++ b/target/i386/hvf/vmx.h
@@ -159,7 +159,6 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
     wvmcs(vcpu, VMCS_GUEST_CR0, cr0 | CR0_NE | CR0_ET);
 
     hv_vcpu_invalidate_tlb(vcpu);
-    hv_vcpu_flush(vcpu);
 }
 
 static inline void macvm_set_cr4(hv_vcpuid_t vcpu, uint64_t cr4)
@@ -171,7 +170,6 @@ static inline void macvm_set_cr4(hv_vcpuid_t vcpu, uint64_t cr4)
     wvmcs(vcpu, VMCS_CR4_MASK, CR4_VMXE);
 
     hv_vcpu_invalidate_tlb(vcpu);
-    hv_vcpu_flush(vcpu);
 }
 
 static inline void macvm_set_rip(CPUState *cpu, uint64_t rip)
diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
index 422156128b7..c8dc3d48fa8 100644
--- a/target/i386/hvf/x86_task.c
+++ b/target/i386/hvf/x86_task.c
@@ -181,5 +181,4 @@ void vmx_handle_task_switch(CPUState *cpu, x68_segment_selector tss_sel, int rea
     store_regs(cpu);
 
     hv_vcpu_invalidate_tlb(cpu->hvf->fd);
-    hv_vcpu_flush(cpu->hvf->fd);
 }
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index 907f09f1b43..bec9fc58146 100644
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
2.33.1


