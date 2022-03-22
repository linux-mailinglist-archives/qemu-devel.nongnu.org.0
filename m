Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A31464E3E8B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:33:27 +0100 (CET)
Received: from localhost ([::1]:45830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdhW-0001WS-1F
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:33:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWdGR-0002Yg-KG
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:05:27 -0400
Received: from [2a00:1450:4864:20::336] (port=51772
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWdGQ-0007zm-0j
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:05:27 -0400
Received: by mail-wm1-x336.google.com with SMTP id q20so10649539wmq.1
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 05:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LsogzIW20PFbxNVUsODKUNH/SwjRh3rmWCB3ikdFeq8=;
 b=LNuU/fRaR5WkXZ8+KarznGMNy6S5Sn0lf0qOij6gVQfMzGs6HWGARVSb4Fa3rpv/Ef
 wUDqxkDuoTiY7YhLRFbll+aGhgyzIZfja8j4tpidxMyHwxI4I+SH4Kh0p+J/UjxE6zbo
 sKzd5ay5ymu0E7JLzDcYT5JX6rOZYJWrSK87IsDqB6Bpx4+nl8EGc9IaJBh6O+xR+y49
 FcErGEus8P91TWOkmU5VG4RL2ZkNujDHhlcwSrfEreqte70svS9qlOaVXC6EKdMVrzcK
 S+8MwTpSnK9iTlyjNYK5xrEW2PNAxxoReIYvh1QT/0f1ngGsxaCV6An9R+1uq15pEO7T
 Zmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LsogzIW20PFbxNVUsODKUNH/SwjRh3rmWCB3ikdFeq8=;
 b=qRVMiQHjIXcSqVei/wS6iY9c8b0Olz4awrJLGh2hZ1zzK3Ppy5VDroevHpxHlVlV51
 gGlybxnVtFDvZeSBUYDLFHfRAoyFgxkrRa7SB1I6iw10mqPv5c2mmkmB0qpYNgD1MP5N
 vngv1a6C4d/yA4OMyZHDTckVWF1RP0HVhkOuDiGOk3QPYsUXFYX22qpkWRkuH3rzjyZs
 AUeyfBDvrN9kaDMd39tpVxSiFgPjOlRUbSkVJeL5eSfb0xpNdiHIW0kOJ86XWHmsEoLy
 HbAxpOY+6SsU2Cm81F2Qh0uoWfp7HV4oMIpXiuB8w+J3wN/r4KXaGKyVCmbdO9/It+bz
 nPrQ==
X-Gm-Message-State: AOAM5336Vpvvvfc/rYn46BBdWQXVEzZ6oAmPeVb+5Gp5jSafLVyZFou5
 +UWDJ2x7flJBGafpX+xrMxsvy0fdj4g=
X-Google-Smtp-Source: ABdhPJwpGb8MYLFgQMP5JIu70aj+GrxjBxenjonIHryZ3l2jiFc0vhUI6qyrJHXnBszicHTyorRoUg==
X-Received: by 2002:a7b:c14d:0:b0:38c:801a:a8b3 with SMTP id
 z13-20020a7bc14d000000b0038c801aa8b3mr3352236wmi.40.1647950724424; 
 Tue, 22 Mar 2022 05:05:24 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 r13-20020adfbb0d000000b00203e0efdd3bsm15376668wrg.107.2022.03.22.05.05.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Mar 2022 05:05:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-7.0 v4] target/i386/kvm: Free xsave_buf when
 destroying vCPU
Date: Tue, 22 Mar 2022 13:05:22 +0100
Message-Id: <20220322120522.26200-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix vCPU hot-unplug related leak reported by Valgrind:

  ==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 8,440 of 8,549
  ==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
  ==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
  ==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
  ==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
  ==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
  ==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
  ==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
  ==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
  ==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
  ==132362==    by 0x7EB2159: start_thread (in /usr/lib64/libpthread-2.28.so)
  ==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)

Reported-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based on a series from Mark:
https://lore.kernel.org/qemu-devel/20220321141409.3112932-1-mark.kanda@oracle.com/

RFC because currently no time to test
---
 target/i386/kvm/kvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ef2c68a6f4..e93440e774 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2072,6 +2072,8 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
 
+    g_free(env->xsave_buf);
+
     if (cpu->kvm_msr_buf) {
         g_free(cpu->kvm_msr_buf);
         cpu->kvm_msr_buf = NULL;
-- 
2.35.1


