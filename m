Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B816B31EB2A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 15:56:04 +0100 (CET)
Received: from localhost ([::1]:47258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCkip-00024m-S0
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 09:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeR-0006qH-Vg
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCkeP-0005aq-OE
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 09:51:31 -0500
Received: by mail-wm1-x329.google.com with SMTP id n10so4224414wmq.0
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 06:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vrr/db47Qzv03uQ5HOCzDgMN9bgsfLjuAFvS1PFLBqU=;
 b=HwGfHuZKK+JqnORjAiDUI7FprIQVhz+MET9ho9AE9PFTIjATULL9HJgp+jgTy3Q+Cz
 9L/WOocKYPcuYv7s25iEpvDBaXQo1waTnIRHWV0XUywqgxZZcAEU9M/40H9qkp1kypEV
 z13OibB8+HKx3zQsgTV5dA6BkazBjdpvQfxPfhroFuzYey7EI+AUCR/3IGmDfgQ77ZrI
 1yFhWQ/JcePLLt/EuWvMiDiAcCxQuC1vBu4MBQFGnIVk8av1mqau4rsBMplci4tMIJGb
 kwtQdp+Q3LYRa+qXBBnNE++VM7ygclHijOuFGDaunCfrEx7q04K/nlIiAXQON0z9KyU6
 7yoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vrr/db47Qzv03uQ5HOCzDgMN9bgsfLjuAFvS1PFLBqU=;
 b=RtbGO6mERm+O5bZWwLCYn/lYGM2QIi12cfeQbq+7KH/6GHwrcxTy/LXinw1doJOOWv
 CO01vzWG9cI47G/JqtabxH34LajKl20m14aKmGbuDcLqVlWHUFmf/dnZh6Tlxlx3c38F
 jNonsudt6w0PeaLWaMmqqVuG7nfovZNlRZ9ETVSzzohkp9TWtKqhxRDXSvBnWNOwFgYW
 btN7RjFbtoQtzJz28q80QNHC+rqlECLw93Vrg89o4Mv6nrWQjtgcl4ItybyheEIagsKF
 gB7xm9Qd0KrnnhDS1+/Tzh7yqLrVwLTgDlMSp2bSLWjicz+hNO3mDgQf2Y0VkZyOLtf/
 uUMw==
X-Gm-Message-State: AOAM532NeIQnZAWNTsqRXmLF3AP7zH6Bq8Ygfaipzy8ZhCUz0IaCABD0
 xf44C/INUfcVev4/Kq96rS7Ry8qUZRc=
X-Google-Smtp-Source: ABdhPJxWrufPQ3GlgGe9I1zxJzIb1uFEvuyZewJjcRhxQ0M31M4qyq6fooWdBsSpgMYVD2MBwv85Gw==
X-Received: by 2002:a1c:1f4d:: with SMTP id f74mr4161072wmf.12.1613659888135; 
 Thu, 18 Feb 2021 06:51:28 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i3sm8559259wrr.19.2021.02.18.06.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 06:51:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] target/sh4: Remove unused 'int access_type' argument
Date: Thu, 18 Feb 2021 15:51:09 +0100
Message-Id: <20210218145111.1591763-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210218145111.1591763-1-f4bug@amsat.org>
References: <20210218145111.1591763-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Joe Komlodi <komlodi@xilinx.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

get_mmu_address() and get_physical_address() don't use their
'int access_type' argument: remove it along with ACCESS_INT
in superh_cpu_tlb_fill().

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
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


