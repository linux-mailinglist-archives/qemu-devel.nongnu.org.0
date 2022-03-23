Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A06B4E5757
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:20:48 +0100 (CET)
Received: from localhost ([::1]:54872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4f9-0005RH-68
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:20:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4cu-0002du-OK
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:18:28 -0400
Received: from [2607:f8b0:4864:20::102e] (port=42947
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4ct-0004UT-5r
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:18:28 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so2492358pjf.1
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kr2xMtMFIyMaJvHp1QmAibj3cqEfTuMfM82zkP/aCIo=;
 b=GzQ9UQBsumIhsWs2W2K2ffiFYxEFSk/uJQDwHsoJE62lVsznZpDAk+rbusDkg4/pXh
 oYRTWwWf3XXjgqFP4meFBl7xIZslLNSKyF5Y1Nkqv7BIN9qrP/HEZc2GPulKuv+eyy0Q
 CSLUBGrImnHkarTBPYHhqd4Bz5klN6S1366sxNVa10mTmSfYbuDDmi6EMLlX9llM8fg1
 Rm4ZEgKbpo0wmx0loAPNkIBIdsbxwIgizQ0MiPiw3WJfDKD7pBaLfqF/gCCtKxZBp7LS
 gRHq1IcA4FNU/hF6TniJKOWUVqcOHD5j7pUDrlVzfih8abviJtAdwMVwFP6x0OrQ4GyB
 ud3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kr2xMtMFIyMaJvHp1QmAibj3cqEfTuMfM82zkP/aCIo=;
 b=AAhPALeN1wz0RbnhJ8x11YDeYE/yRF26jYLbflVAJwyqtP5K0T6lDf3ivCY6V4ODjm
 IjQuJc75Q+cDVWAkRyYdjvLp0pwmqU30dL2648BBDLxLkTswuiV05wd1rZhK0X4xtQ/f
 xKI+7zpTlWiiA1ORTlKyvz6wvYrnWvPtM6BAmLIrV8iNXcYVSbdnkQTiFrYkuZ/PQIxA
 6TQi90zThXtHGsh9pRdB1veUg9V00p+kSafl5/7X7IBRj1rSzUeuaWyp/EmKHflrWDTL
 xECjwCCPjvkQVdwgUrlP2N2GzSjBax1uqdMFcJ6QeQClgJ4JbbbpXQYn3bvyIUewMqc3
 43Ng==
X-Gm-Message-State: AOAM532uyFSGjKUWcprfUa+PDZnBh8H32n1EFOK92NudpNH8/TJoXCs2
 xNmdL+LfegJ2zgh4VBSvilcxdVOo1XY=
X-Google-Smtp-Source: ABdhPJyp9ousXQMjN1mFJdianu0WkJ5NuwBi+VzVmYIuZ9KnREKdbkqv1O8I5j4eIk26Y9GvJf6XJA==
X-Received: by 2002:a17:902:834a:b0:14f:3337:35de with SMTP id
 z10-20020a170902834a00b0014f333735demr1074863pln.8.1648055905736; 
 Wed, 23 Mar 2022 10:18:25 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm448750pfu.193.2022.03.23.10.18.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:18:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/13] target/i386/kvm: Free xsave_buf when destroying vCPU
Date: Wed, 23 Mar 2022 18:17:40 +0100
Message-Id: <20220323171751.78612-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
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
Tested-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


