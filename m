Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6E54B65F2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:22:31 +0100 (CET)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJt6T-0002Dp-W9
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:22:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsoj-0002A3-V4
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:10 -0500
Received: from [2607:f8b0:4864:20::1030] (port=44793
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJsof-0002BN-Sw
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:04:09 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 d9-20020a17090a498900b001b8bb1d00e7so1453546pjh.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PEI7kUnsnIGZxPsTEp+GtQhNNx0K7T3AfPnUbQ/3n4M=;
 b=J53/0fRih8pCSKvg/ap8j/dTLJDDQ6XeQs6i1YRLV1W3/J3MULGeyk+X3xALtG1U1S
 VAqfjvntz0ChbTYaaz3fPO3zxhEH5+52rvxrKdvFknJBTJW6Exj0Ubg2iUvsacNwEszW
 BMlBtxxrtHfRdcOrCnx2xV7qXJz/isg1bU5YtElh1aE5hJls/ccCOyOmGqOJBS8XThGX
 F8L/myKqK95suYVn+/jZo8J6jEo0IHIWBv8pMjaQyDf/tRZATmBhp7L713MLbm4tgJ7b
 4NNrlsGYftrmpSJKmgynT+bDIBZa8MOpCuZHkOeNaN8MgcK2+NTU7V8YNXuzSnpKHw/T
 0gKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PEI7kUnsnIGZxPsTEp+GtQhNNx0K7T3AfPnUbQ/3n4M=;
 b=kvp0+S7kjCIhuceMz9zCeWawRrF7GrFctmLqV3y2G/S4n7sXPm5CJLWWVlne9f1hla
 GbhcFXFtRCETiYnG4A0xYZnC5E8pLW2nL1MoI47BsaxiZb9nXG6/qrdlDltbYlmBWN9h
 SZ4o3QkUqeuBg8NpTbjQKX+GLhKRflfeiFprQvD/rfjQ64sno7pz24pk1204L7d1G3Vp
 WtRQDqLMo8eFG2Ub4zkC85zaiE80qUahJZwNTDOXMXo/xvQkyJGIg6qBkRuWdH4fss4i
 X67J/fDsGevLDWvK1c494qQxkFYEFeMNn2FAf4clQSscgX5TJUFGQt9q4gy5C3otq08f
 yy2w==
X-Gm-Message-State: AOAM5309VfTaPz2lyYJ6z0v7504knhf2oO6wdalzAdWMxsgsDh0JW3aR
 5fe/gctly2kLfUc3bToZrUlD2mktEco=
X-Google-Smtp-Source: ABdhPJyCIZ5M2THtGCy20RgLFIo8uyoeoICx7PtkdVs0RlgP3PRqNJIpkPEiCpU/2V05V7htPU3SVA==
X-Received: by 2002:a17:902:724a:: with SMTP id
 c10mr2873080pll.88.1644912244500; 
 Tue, 15 Feb 2022 00:04:04 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id ck20sm14671213pjb.27.2022.02.15.00.04.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:04:04 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 06/15] hvf: Remove deprecated hv_vcpu_flush() calls
Date: Tue, 15 Feb 2022 09:02:58 +0100
Message-Id: <20220215080307.69550-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


