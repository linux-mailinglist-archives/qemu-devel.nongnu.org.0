Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E03153B8A7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:06:11 +0200 (CEST)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjab-0003GC-LM
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTQ-0000RU-GJ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:44 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:37629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTO-0001D4-BF
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:43 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M7JrG-1nrFpL3B8O-007ja8; Thu, 02
 Jun 2022 13:58:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 01/19] target/m68k: Clear mach in m68k_cpu_disas_set_info
Date: Thu,  2 Jun 2022 13:58:19 +0200
Message-Id: <20220602115837.2013918-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9YYpO0UbLK2qUfZGGPz8V4GgQwOo1/v8LOsqyH8cqeaa1MzHvS/
 WZ1kIbBrmZJnqmdhluSQ5fF9H+RySHao9wAxqx9k0i/WegCUDVlANvVJLwCS3foRmVijiOT
 fgX1LZH30lrk1I7iYx16kzlEvE6f14j9pdcNmkyXmUUEu9gLA8PqGz8M9xbpQZAhrVVPDn3
 ceBi3DmTRxXhyOh5k5Xyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mgufHukKBHQ=:H1SGxwLPYKSj2NwZgTRSYV
 ZCFsoIZdRMfk6DjgmQQ+YjXU0OF5PAfXZgyhStJeYnxR7Q6rbGrLQivgAY4tsVb86r0DZeFIJ
 AhTlxVm/gGPlSyBBBBEpLEUn6yW7dQRghtFbuOR5cDtRO3XLxyjEWcs2XwHQb8722+GulkcX9
 cDFy91yGQ+N9GxsKozOaw6XYmh3twDJbsSaFWEUFbyPBxDZLUloKHgapqv6rQH1FNt754mCl0
 /1rkzu5BnjgtVJgt1vuV8cXUy4gWu3V5cxmZSknAng5klq2ZT4QlFkoj6GUxeFHx/LMomzPzb
 /2VfO03inRr2jmf+9kspv8vnT8Uj1i28j7m4CE44Z/RsFXgnZhpRAcUn23NRL6wwQgy2kava3
 kXPMjFvtPee8T+zNjSW6lPFfbwczX8nzXEWEBC/AmxYu3x4t+tx0GkvWlPAGJnYwYfPweymzO
 rNqRB4vB9jCTNp4ftgz0d6o0IiREv6NHuv739M7YxNzPLoEAodfnOlNjch36PXwXaYtOif4ru
 V6/LT5RrNd5VlxuSRxUY2yHBE5r9bu9uJOoKNYUDOb6jcdeiZfjAN5Y4g1KCMBe6IVzbDOgas
 b7m4xeEfBB/iWWVMwqNsWysDZoMyA5PIfmBiGA9++Cl9T01V13wRya84N8n40tgiFmYQc3Xfz
 N0ofX/esvZG773VFeVWFoPymo5OtjgidYdjSX0ySkwT76hS3Ofhzj9vdsJbCdm9cqqnwY3PvK
 6u0IOMqTHZbg0B8iO87/0/kOZOw5rJex4cf65w==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Zero selects all cpu features in disas/m68k.c,
which is really what we want -- not limited to 68040.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220430170225.326447-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/cpu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index c7aeb7da9c42..567106792377 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -75,12 +75,8 @@ static void m68k_cpu_reset(DeviceState *dev)
 
 static void m68k_cpu_disas_set_info(CPUState *s, disassemble_info *info)
 {
-    M68kCPU *cpu = M68K_CPU(s);
-    CPUM68KState *env = &cpu->env;
     info->print_insn = print_insn_m68k;
-    if (m68k_feature(env, M68K_FEATURE_M68000)) {
-        info->mach = bfd_mach_m68040;
-    }
+    info->mach = 0;
 }
 
 /* CPU models */
-- 
2.36.1


