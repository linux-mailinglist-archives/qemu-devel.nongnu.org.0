Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA414753A
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jun 2019 16:39:24 +0200 (CEST)
Received: from localhost ([::1]:40368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcWJY-00032k-4D
	for lists+qemu-devel@lfdr.de; Sun, 16 Jun 2019 10:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34884)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lucienmp.qemu@gmail.com>) id 1hcW3y-0001Gw-BR
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 10:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lucienmp.qemu@gmail.com>) id 1hcW3w-0006g1-NM
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 10:23:18 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:42028)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lucienmp.qemu@gmail.com>)
 id 1hcW3w-0006cO-Gy
 for qemu-devel@nongnu.org; Sun, 16 Jun 2019 10:23:16 -0400
Received: by mail-pg1-x542.google.com with SMTP id l19so4276501pgh.9
 for <qemu-devel@nongnu.org>; Sun, 16 Jun 2019 07:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=bp4eRAfnnABxVApe8P1bYZlQPAL75u3Wefeou8kR8iw=;
 b=cJJuQQmtd+rbOZkFUCL6av6rEkw9gMhEgqqIT7RlP8wxkmY0Zd7olKZpdsRw80j6ta
 195MCEKCZudhDNHm5rgDWBWzYMoaaMDk5UPOThCF9O7VpZknR5KBzJxmgHpv6+8lXmBe
 BHpa7WF2v69ZBnqolj5c1DsBJtTEX/MdZLDeLJ0CTpflq185n+4gGnd+lngQKyE1AkOs
 YYFqIz+C6OQSqu6/oqWc+bDzH5fDT+foMOdIVyCghGQbXazPt2bkFJ4ruoEFQI1BdwQ2
 gO2YuiTCEVzsXAjJApjgLcvPFpWeBLXGF71naNHxZF8M2NXl8ledm+ekLKE6CWphEP7J
 MaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=bp4eRAfnnABxVApe8P1bYZlQPAL75u3Wefeou8kR8iw=;
 b=iIjXxZcOdksLNIeVspK+o/dw1IvULtjHM/H5pX7YQPXfWfJCmt6yc+HrvQdzR4A6p9
 zP8vDNV2PhLqQbf7m0H9GxO8/gHIzosCiWUoB/WY0cP+JpHVyN8YNoJhqWa6/ZY5Y5dy
 fr6ZxEBuK+PMLvJ61m8cOYRFzyexcXf6jvtjC7Pg00zQDPyBQPOkB0HaS19DTl4aP4UI
 Wurrw4jShkG0URfYAJgMzWQKZ01iFuZpkzEndZw9xdc18Ay3u3dodkbP1ccC13aCR7Op
 miTBELkaHoYKl+LPGTtqRMGf2Ls2o828HlO/8nP+SCAHsV8boV9x/SUO1GAktle9cVun
 qq/Q==
X-Gm-Message-State: APjAAAUnZ1VIiDsIf4mj8ohoOn9jMo0Yau6CEbbM5Y4ym6D7YWi0aBmF
 uWe9W55rFYnLHa5+CxqrNKQslsal
X-Google-Smtp-Source: APXvYqy7hWygykDNyubbgsRD5tfjv4mAduzXgn1X47WCwVfvv0gFzLtUWSfAq3cMLJWeh20H9WbGpA==
X-Received: by 2002:a62:a509:: with SMTP id v9mr107893220pfm.82.1560694990363; 
 Sun, 16 Jun 2019 07:23:10 -0700 (PDT)
Received: from localhost.localdomain (i60-43-49-30.s30.a048.ap.plala.or.jp.
 [60.43.49.30])
 by smtp.gmail.com with ESMTPSA id n26sm11029361pfa.83.2019.06.16.07.23.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 16 Jun 2019 07:23:10 -0700 (PDT)
Date: Sun, 16 Jun 2019 23:23:07 +0900
From: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Message-ID: <20190616142307.GA71211@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-devel] [PATCH 6/6] Added MSP detection support for stack
 pointer swap helpers
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On m68k there are two varities of stack pointers,  USP with SSP or ISP/MSP.

Only the 68020/30/40 support the MSP register the stack swap helpers dont
support this feature.

This patch adds this support, as well as comments to CPUM68KState to
make it clear how stacks are handled

Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
---
 target/m68k/cpu.c    | 1 +
 target/m68k/cpu.h    | 8 +++++++-
 target/m68k/helper.c | 3 ++-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 50260de97d..f1610e2745 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -137,6 +137,7 @@ static void m68010_cpu_initfn(Object *obj)
     m68k_set_feature(env, M68K_FEATURE_M68010);
     m68k_set_feature(env, M68K_FEATURE_RTD);
     m68k_set_feature(env, M68K_FEATURE_BKPT);
+    m68k_set_feature(env, M68K_FEATURE_MSP);
 }
 
 
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 86ba19f779..7a8e4872e2 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -93,7 +93,13 @@ typedef struct CPUM68KState {
     uint32_t pc;
     uint32_t sr;
 
-    /* SSP and USP.  The current_sp is stored in aregs[7], the other here.  */
+    /*
+     * The 68020/30/40 support two supervisor stacks, ISP and MSP.
+     * The 68000/10, Coldfire, and CPU32 only have USP/SSP.
+     *
+     * The current_sp is stored in aregs[7], the other here.
+     * The USP, SSP, and if used the additional ISP for 68020/30/40.
+     */
     int current_sp;
     uint32_t sp[3];
 
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 119fc3af2b..17a4380b5b 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -474,7 +474,8 @@ void m68k_switch_sp(CPUM68KState *env)
     env->sp[env->current_sp] = env->aregs[7];
     if (m68k_feature(env, M68K_FEATURE_M68000)) {
         if (env->sr & SR_S) {
-            if (env->sr & SR_M) {
+            /* SR:Master-Mode bit unimplemented then ISP is not available */
+            if (!m68k_feature(env, M68K_FEATURE_MSP) || env->sr & SR_M) {
                 new_sp = M68K_SSP;
             } else {
                 new_sp = M68K_ISP;
-- 
2.21.0



