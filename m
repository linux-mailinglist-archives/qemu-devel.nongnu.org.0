Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48043BF839
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:15:10 +0200 (CEST)
Received: from localhost ([::1]:36652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1R3l-0000qR-Lf
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx6-0004tV-MO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:16 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:50917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx0-0001I5-V8
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:16 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1Mzydy-1lDBup0snW-00x0MH; Thu, 08
 Jul 2021 12:08:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] linux-user/mips: Handle TARGET_EWOULDBLOCK as TARGET_EAGAIN
Date: Thu,  8 Jul 2021 12:07:54 +0200
Message-Id: <20210708100756.212085-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708100756.212085-1-laurent@vivier.eu>
References: <20210708100756.212085-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Dy9KhDTighUmyfrHHR2qe4nB2FE9M6mOaFnjqmN5cXSRFVJEfeq
 nBsl75Ps35lR7U8IdMClkD+mXDiMRmseBR9xwY5t5/biAo9D3x+xyFio1xb4+9xut5KHrB/
 gVyS8a1fyQejQpSrazcOt5vEuxhwe3/GD9bC7SNIl6iEDVs7RrDeyDbI1aGVRMbHRalbaX2
 S1JlGjzJ/AboEAQn3keMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AMtYKk9KY1A=:2p13dm/5bkm3SWKjKO0GQH
 D5ClH9Q5ID0uPgRqXRS45pSJq01KibQt/fCNVWAtw1LL0Z8m5AJf0gNb7TP+dd6zw0DXPhZXJ
 crzcMiE0k5tsyet4vvGy6s/7cquWpwL9nXQFgwEIaF8Lsp+LSg7jryacNq91sX6tX6zq9QRJR
 4IXoalFEnZTQ5h0zE320hqeJl1BHb5Q6VNV9O0454XfVEef7KBcPnwB9YtQviJU2vpsPCxZ3a
 jmvV17fD1rCvLSYcZdLGzImJs9kPDkG83FFBlArgqx032UfyE3gCLkjoq/loU+ovwY2YspGUM
 9sIgUDtSU3r/oPs6RG1dRAyGU8aheCzHTlPazEzJw3X90csfXzepCj/PRr5bi/ODX/zlVA+Oc
 KuULG+btq9xBFMjl1MsebaIFM2kKS7NjiasuOThk7Rgv9dzLh7rBgfDsvcQ349rbeWgeE6VXD
 Rhoz/3e4lI6wPMf3LXAIla01mecXqPZk8nV8opKqJ6VO9G1dCSLBcudsdA6TdBlFETDlUJhxL
 Goa2ygHaVfwL8ycUhbagOG7B8g1NzaNHC1t8CowzaPR8w13Yb/EkG+I3Gl8smEWu67PeCPcDw
 vCGomQ/Cgny1RkM/4LTjS7c1bUYWHTsD+9sjOhfKZWxuWgok0hWC/A9xyQCXZBazrgoBAKfel
 09QPB6Qn67rYe69syVVdhUJw2znqA8c0YAGzGImt3jcn7emd6/Xv/sZ130fqSXJM9aCS1IFQf
 0w5X1cqrt2N2GRi4AnT5jnlyUwR1Kd0v2WO68TFyLpkz3bF6aculeODwz4+FQBg9H/YNC7wNi
 gvVi5tI7JTaLg+vOBQqjzIpPz08OyeYlEdxtI57YrK69EwXwf5AkgZ1ZJw+BWxkyPY1zvwI
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Linux kernel defines EWOULDBLOCK as EAGAIN (since before v2.6.12-rc2).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210704183755.655002-4-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips/target_syscall.h   | 2 ++
 linux-user/mips64/target_syscall.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/linux-user/mips/target_syscall.h b/linux-user/mips/target_syscall.h
index dd6fd7af8eac..3e558fdb4b40 100644
--- a/linux-user/mips/target_syscall.h
+++ b/linux-user/mips/target_syscall.h
@@ -21,6 +21,8 @@ struct target_pt_regs {
 };
 
 /* Target errno definitions taken from asm-mips/errno.h */
+#undef TARGET_EWOULDBLOCK
+#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
 #undef TARGET_ENOMSG
 #define TARGET_ENOMSG          35      /* Identifier removed */
 #undef TARGET_EIDRM
diff --git a/linux-user/mips64/target_syscall.h b/linux-user/mips64/target_syscall.h
index 8594955eec26..c54374c5a295 100644
--- a/linux-user/mips64/target_syscall.h
+++ b/linux-user/mips64/target_syscall.h
@@ -18,6 +18,8 @@ struct target_pt_regs {
 };
 
 /* Target errno definitions taken from asm-mips/errno.h */
+#undef TARGET_EWOULDBLOCK
+#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
 #undef TARGET_ENOMSG
 #define TARGET_ENOMSG          35      /* Identifier removed */
 #undef TARGET_EIDRM
-- 
2.31.1


