Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C632FB69
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:40:24 +0100 (CET)
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIZ2T-0004Sr-TO
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:40:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYyu-0008My-P4
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:40 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYyt-00087F-8w
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:40 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso1138549wme.0
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qvvv0vZPl7kPXG3BqztYcAmNKJJgttxJAwWBMl32Qgw=;
 b=mmliIsqm20Q55E1F+ZgZjLFne7IPceymNPEPCop9pqBgHNI1tcNyitvSSp31avKBPz
 yD5WIDLOY76l2S8bwKc2cImcZrytwE9HGIbscEgCJGOnZGjDFbR4qERzT3U516X7+i+f
 ITFFBZHeE20Y7/HAn05HNvmTiBo0yktxYHcHxbzKNVWzFZZT0COrFBfueRNvuMoSBVcL
 8pc/Afx/ODVmzk+h/r87Wu0Fv0TCR7yv8XTCQz/+LixhTdF2XSDTi9M+G4VPpo62fate
 62iMniePxqL4Abmh3EDOyd5IR9ovz6jFQz8xPez9fk7679wB4NlIC6+ihPjKVqzH6X9S
 zVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qvvv0vZPl7kPXG3BqztYcAmNKJJgttxJAwWBMl32Qgw=;
 b=I6AmbWZYsW4OTCFVQR75h/7tJlJ57mbv0Q5fWPZ8rvkmdMA6XzMA6kBWYUBCe7l5v+
 G4uD6UCIvpBwL+3GCl20up7U2wLryiXdtYb2U6oobIqvvtukwX9dSVAHAsdGTNZ4WIOn
 h3UZ8AYCuv9sQotINN32YV6zIYaETa5VTLFvX/5fHTjDmUnHqj+fHjmTs4w+hNFj6zch
 MqfjIjTFqTLFOgiil+fCm8PGS1PVJvl+itJpku43qJmFdPZiUEuHHb0o+P1rJPxcO6nS
 gnM1jgXVma7UmPw5ysQcEBVIiYempxKm/FNiacUL8x0GdpctG34qqFZYWGBKJCPvV4id
 1c9w==
X-Gm-Message-State: AOAM530zi/sotq9MB5Q1Pg6hAzCDKkq9LtueuP0QDzXKmz5PRBJ+85jF
 nrD7jYY55S4vvV8LiNn93MN5Kl3h67k=
X-Google-Smtp-Source: ABdhPJyv3WaHQOYxlE7O6FMpGkGHFjSiSn7rrWp5qLv8n9pRiUvZQUZ73UJJBGzScsu3FXFpHqLRPA==
X-Received: by 2002:a1c:61c5:: with SMTP id v188mr13745490wmb.20.1615044997807; 
 Sat, 06 Mar 2021 07:36:37 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v13sm10666362wrt.45.2021.03.06.07.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:36:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/14] target/sh4: Remove unused 'int access_type' argument
Date: Sat,  6 Mar 2021 16:36:10 +0100
Message-Id: <20210306153621.2393879-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210306153621.2393879-1-f4bug@amsat.org>
References: <20210306153621.2393879-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_mmu_address() and get_physical_address() don't use their
'int access_type' argument: remove it along with ACCESS_INT
in superh_cpu_tlb_fill().

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sh4/helper.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 4303ebf018b..b49efe84916 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -331,7 +331,7 @@ static int find_utlb_entry(CPUSH4State * env, target_ulong address, int use_asid
 */
 static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
                            int *prot, target_ulong address,
-                           int rw, int access_type)
+                           int rw)
 {
     int use_asid, n;
     tlb_t *matching = NULL;
@@ -398,7 +398,7 @@ static int get_mmu_address(CPUSH4State * env, target_ulong * physical,
 
 static int get_physical_address(CPUSH4State * env, target_ulong * physical,
                                 int *prot, target_ulong address,
-                                int rw, int access_type)
+                                int rw)
 {
     /* P1, P2 and P4 areas do not use translation */
     if ((address >= 0x80000000 && address < 0xc0000000) || address >= 0xe0000000) {
@@ -432,7 +432,7 @@ static int get_physical_address(CPUSH4State * env, target_ulong * physical,
     }
 
     /* We need to resort to the MMU */
-    return get_mmu_address(env, physical, prot, address, rw, access_type);
+    return get_mmu_address(env, physical, prot, address, rw);
 }
 
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
@@ -441,7 +441,8 @@ hwaddr superh_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     target_ulong physical;
     int prot;
 
-    get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD, 0);
+    get_physical_address(&cpu->env, &physical, &prot, addr, MMU_DATA_LOAD);
+
     return physical;
 }
 
@@ -813,11 +814,9 @@ bool superh_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
            MMU_DTLB_VIOLATION_READ);
 #else
     target_ulong physical;
-    int prot, sh_access_type;
+    int prot;
 
-    sh_access_type = ACCESS_INT;
-    ret = get_physical_address(env, &physical, &prot, address,
-                               access_type, sh_access_type);
+    ret = get_physical_address(env, &physical, &prot, address, access_type);
 
     if (ret == MMU_OK) {
         address &= TARGET_PAGE_MASK;
-- 
2.26.2


