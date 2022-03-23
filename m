Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A844E5760
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:23:27 +0100 (CET)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4hi-00044U-FQ
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:23:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4dU-0004fX-D3
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:19:04 -0400
Received: from [2607:f8b0:4864:20::62d] (port=41606
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nX4dS-0004cz-Pw
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:19:04 -0400
Received: by mail-pl1-x62d.google.com with SMTP id j13so2147053plj.8
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0hihgfEmLJPNBEh4WW6rYf49XmgK0ovI41W1a0emuNk=;
 b=MrdYb7945anCfYH1VRiFA5pAW7S4hoZOOF1Pdv+2ZTrCvIPQ0tdNE6NgZGHvIaYl6F
 plkh3wIlaqYoXktAcEAtQmOqlHJdMmidt+Oa/wnRaHYaNMUJZ9CkCSrlqjquwFaZdWSC
 HPnXLzJcabcEufzwkRoVTxfpe1EHQA8+scJQyC9OkHIYWUa2UKWUlEhDYRHbD8EXQtLR
 hGXTs3LTe0tNECvEc0QQ3gavKzuFIBW5V+W6pGyNgy0F8X1RKcixk5n93FXcTecHiIep
 G1WrbmTHafbZqiFIsAW0M4VWI5qRob0xYjL9jnDgfVfth7/f271rS43Pm6WxxiTOI/Ta
 havA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0hihgfEmLJPNBEh4WW6rYf49XmgK0ovI41W1a0emuNk=;
 b=kxrMc1fWLMaBHc2LFEOxfNi6alQrjKNDPikSaHNa4/vxnpX/Tt6TU/Bn94Wf0II/oS
 EIhZZz0GCFlSyh0qlxe8Gnv/j1qKKw12CJ7v+B2JUST5Ruz+wYE7TiofbKYrv30v7mE7
 wZaLK4eYm9O8YDxJjRhORc4UosjCP7FwtA+PK4s9sHrtl7FZGSgoTPUNkr5iXzUtGiWV
 /6TqwW+gfloo/bMwysT+eCFsvzhyv1MvotcHYKLKIUlyNzWNkWmBJzlZ8ZG2pRn5lg95
 ugjgm+Z6NAqaIPH+n3srb1e08CqpNEhWWedIa45jHBAFtAbMYZTOkPJnrwufbVymMFrr
 HHeQ==
X-Gm-Message-State: AOAM5316MxNhY7Z7HBI3sCLWHCBxNnRfAaxArGA11t1ZBS1EuJpf4E/4
 G5vzJZ6ccGSbWx/ZjsxizopP7zngsag=
X-Google-Smtp-Source: ABdhPJwdV5/nAguIIYnMM8I+otidppMXPEnBBQGuuNIH21Igt/CypcRNRBAVG30eApAdY410n71pzg==
X-Received: by 2002:a17:90a:8581:b0:1b2:7541:af6c with SMTP id
 m1-20020a17090a858100b001b27541af6cmr842235pjn.48.1648055941418; 
 Wed, 23 Mar 2022 10:19:01 -0700 (PDT)
Received: from localhost.localdomain (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 u15-20020a056a00098f00b004faa58d44eesm455060pfg.145.2022.03.23.10.18.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Mar 2022 10:19:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/13] accel/tcg: Init TCG cflags in vCPU thread handler
Date: Wed, 23 Mar 2022 18:17:43 +0100
Message-Id: <20220323171751.78612-6-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
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

Move TCG cflags initialization to thread handler.
Remove the duplicated assert checks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/tcg-accel-ops-mttcg.c | 5 ++---
 accel/tcg/tcg-accel-ops-rr.c    | 7 +++----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
index ea2b741deb..80609964a6 100644
--- a/accel/tcg/tcg-accel-ops-mttcg.c
+++ b/accel/tcg/tcg-accel-ops-mttcg.c
@@ -71,6 +71,8 @@ static void *mttcg_cpu_thread_fn(void *arg)
     assert(tcg_enabled());
     g_assert(!icount_enabled());
 
+    tcg_cpu_init_cflags(cpu, current_machine->smp.max_cpus > 1);
+
     rcu_register_thread();
     force_rcu.notifier.notify = mttcg_force_rcu;
     force_rcu.cpu = cpu;
@@ -140,9 +142,6 @@ void mttcg_start_vcpu_thread(CPUState *cpu)
 {
     char thread_name[VCPU_THREAD_NAME_SIZE];
 
-    g_assert(tcg_enabled());
-    tcg_cpu_init_cflags(cpu, current_machine->smp.max_cpus > 1);
-
     cpu->thread = g_new0(QemuThread, 1);
     cpu->halt_cond = g_malloc0(sizeof(QemuCond));
     qemu_cond_init(cpu->halt_cond);
diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
index b287110766..de8af32af7 100644
--- a/accel/tcg/tcg-accel-ops-rr.c
+++ b/accel/tcg/tcg-accel-ops-rr.c
@@ -153,7 +153,9 @@ static void *rr_cpu_thread_fn(void *arg)
     Notifier force_rcu;
     CPUState *cpu = arg;
 
-    assert(tcg_enabled());
+    g_assert(tcg_enabled());
+    tcg_cpu_init_cflags(cpu, false);
+
     rcu_register_thread();
     force_rcu.notify = rr_force_rcu;
     rcu_add_force_rcu_notifier(&force_rcu);
@@ -276,9 +278,6 @@ void rr_start_vcpu_thread(CPUState *cpu)
     static QemuCond *single_tcg_halt_cond;
     static QemuThread *single_tcg_cpu_thread;
 
-    g_assert(tcg_enabled());
-    tcg_cpu_init_cflags(cpu, false);
-
     if (!single_tcg_cpu_thread) {
         cpu->thread = g_new0(QemuThread, 1);
         cpu->halt_cond = g_new0(QemuCond, 1);
-- 
2.35.1


