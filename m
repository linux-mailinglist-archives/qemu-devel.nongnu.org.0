Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F465BF110
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 01:28:58 +0200 (CEST)
Received: from localhost ([::1]:43980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oamfg-000200-HR
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 19:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8K-0001M8-0A; Tue, 20 Sep 2022 15:42:16 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:46614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8I-0001pB-Fg; Tue, 20 Sep 2022 15:42:15 -0400
Received: by mail-oi1-x233.google.com with SMTP id o184so5058488oif.13;
 Tue, 20 Sep 2022 12:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=oT+Z/k8aj1QLqWnJJ6y1QViSX/DHV3nGrwLb9ZRcTRk=;
 b=l9E8VzXa7fzt+0mSZV8hlw7q244oDxBXFmXjwmOOzyafAyfFZ/TjG0tiatc+tFgeGJ
 zwdwvkOeLgGrk/C98SPCYfsnXxrQkwQ72sOsh8Oi4o67cIojhDhkK4mgl95k4Y+njP4K
 PRngGmq6zEoUwht99vA1QOUb3v8bmyEMcGQMbHbisG92kglnuo8CcfXUTLCG6l6GKLrY
 zX3LEgXnIP/k2hjedWeBZOAb9z1Msc3lhN4gkYiFbqm1KZYUsF0KEvJppEpEO8kPSAkq
 iBqkNwou6tZ1SGksIZVPRV6IiQVYGUoMR7QK4Kjb9X2+BL86Sy4Lr5FtNmAH84TUlNGY
 mJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=oT+Z/k8aj1QLqWnJJ6y1QViSX/DHV3nGrwLb9ZRcTRk=;
 b=UMTDHWP+0ygGQ7BDeDUYXy48B9kiOtnq8b+im3FvQaD+GTyYgI19uMiaIFcIoG/Jls
 uXBW0v5shobiWCGn4dAUlDdaPwDpYTLoKH5rgy5Dw5pWLjU+HSUOwjAYclrw4EZ4x96c
 8zX+rZMhbdvGchhV/Jautkh3HPVY6TGU5a+vbHM38kVMUPCghphe5Nte74cHPd+grgJG
 ZDMjpRYef8KR5ss0u0+CdR6rrx5VvAQwwNngQsXUarEDZ5ggbB4EZTVxxJtgbYJNkFRs
 DTxzkqD8eZP2DiML/WLUQDHDFGrR9d2y0VNFvlqlMkdxwBM5YL9A57tNPfRxdF+DUhLI
 I/9g==
X-Gm-Message-State: ACrzQf207eJDJj1NIgp72+FPVeGOXGd5zLc1Cb0hQ9XY+GmkkBCSvDE1
 1FB0Ed9Q39ZtkAHlOizNmMGuoI77zBc=
X-Google-Smtp-Source: AMsMyM4wmBUVzZc/a1coC9Vd5i4wk947S7EKPmLLSspjOwbrfnQnunAipxpR5OoO9aDf8Cmj5YwPjA==
X-Received: by 2002:aca:5988:0:b0:345:443d:5c32 with SMTP id
 n130-20020aca5988000000b00345443d5c32mr2389353oib.96.1663702931935; 
 Tue, 20 Sep 2022 12:42:11 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:11 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 01/17] target/ppc: Add HASHKEYR and HASHPKEYR SPRs
Date: Tue, 20 Sep 2022 16:41:46 -0300
Message-Id: <20220920194202.82615-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Add the Special Purpose Registers HASHKEYR and HASHPKEYR, which were
introduced by the Power ISA 3.1B. They are used by the new instructions
hashchk(p) and hashst(p).

The ISA states that the Operating System should generate the value for
these registers when creating a process, so it's its responsability to
do so. We initialize it with 0 for qemu-softmmu, and set a random 64
bits value for linux-user.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Lucas Mateus Castro <lucas.araujo@eldorado.org.br>
Message-Id: <20220715205439.161110-2-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h      |  2 ++
 target/ppc/cpu_init.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index a4c893cfad..4551d81b5f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1676,6 +1676,8 @@ void ppc_compat_add_property(Object *obj, const char *name,
 #define SPR_BOOKE_GIVOR14     (0x1BD)
 #define SPR_TIR               (0x1BE)
 #define SPR_PTCR              (0x1D0)
+#define SPR_HASHKEYR          (0x1D4)
+#define SPR_HASHPKEYR         (0x1D5)
 #define SPR_BOOKE_SPEFSCR     (0x200)
 #define SPR_Exxx_BBEAR        (0x201)
 #define SPR_Exxx_BBTAR        (0x202)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 899c4a586e..6e080ebda0 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5700,6 +5700,33 @@ static void register_power9_mmu_sprs(CPUPPCState *env)
 #endif
 }
 
+static void register_power10_hash_sprs(CPUPPCState *env)
+{
+    /*
+     * it's the OS responsability to generate a random value for the registers
+     * in each process' context. So, initialize it with 0 here.
+     */
+    uint64_t hashkeyr_initial_value = 0, hashpkeyr_initial_value = 0;
+#if defined(CONFIG_USER_ONLY)
+    /* in linux-user, setup the hash register with a random value */
+    GRand *rand = g_rand_new();
+    hashkeyr_initial_value =
+        ((uint64_t)g_rand_int(rand) << 32) | (uint64_t)g_rand_int(rand);
+    hashpkeyr_initial_value =
+        ((uint64_t)g_rand_int(rand) << 32) | (uint64_t)g_rand_int(rand);
+    g_rand_free(rand);
+#endif
+    spr_register(env, SPR_HASHKEYR, "HASHKEYR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            &spr_read_generic, &spr_write_generic,
+            hashkeyr_initial_value);
+    spr_register_hv(env, SPR_HASHPKEYR, "HASHPKEYR",
+            SPR_NOACCESS, SPR_NOACCESS,
+            SPR_NOACCESS, SPR_NOACCESS,
+            &spr_read_generic, &spr_write_generic,
+            hashpkeyr_initial_value);
+}
+
 /*
  * Initialize PMU counter overflow timers for Power8 and
  * newer Power chips when using TCG.
@@ -6518,6 +6545,7 @@ static void init_proc_POWER10(CPUPPCState *env)
     register_power8_book4_sprs(env);
     register_power8_rpr_sprs(env);
     register_power9_mmu_sprs(env);
+    register_power10_hash_sprs(env);
 
     /* FIXME: Filter fields properly based on privilege level */
     spr_register_kvm_hv(env, SPR_PSSCR, "PSSCR", NULL, NULL, NULL, NULL,
-- 
2.37.3


