Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4D6441553
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:32:39 +0100 (CET)
Received: from localhost ([::1]:46032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSkA-0004CP-Gu
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSff-0005xh-DP; Mon, 01 Nov 2021 04:27:59 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:43275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mhSfd-00086R-FJ; Mon, 01 Nov 2021 04:27:59 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MPrXf-1mKj1Y3Ibj-00MqRP; Mon, 01
 Nov 2021 09:27:51 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/6] MAINTAINERS: Split HPPA TCG vs HPPA machines/hardware
Date: Mon,  1 Nov 2021 09:27:44 +0100
Message-Id: <20211101082747.2524909-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101082747.2524909-1-laurent@vivier.eu>
References: <20211101082747.2524909-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cYdtptuzDFuG45gYvai7tL8cFu6w+SZLwAKfkBqP88cBixraQHS
 yNvX66bDoOW/ttzJMC5xP03E5xnBd7XMMUYLjv/Zc7T4muFG/jbBCoTKPgL0soisyQs6aS4
 L12yNMAYkI0l2ela9i/Z19EbkeNtdF7jygipa79RVR2cCweuYIb8kBAnjJCIcvJbxy7vpjB
 XWa3yKw0ar+FHh6ZgY4nQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s755VrgJ/u4=:XGEFTsDCNx1G6K63+3Lf5V
 rKRPuxNu0R9JyEx688NauGu44epj78ee/WJdS99D7rS1r/0uekgtXgwksMLPRs6WtYvPI8Jwc
 C18ePvaQ+1/gCF307btDxuBtTaKYoTeDPFmfkZn+w7oVfZ99n3cAOSTNg164ofwFmhgtEepiY
 M+vC1UNKLszmvwq+pLNOt4+dOlG7dvjNYfBwybsx0PtYraDon1vHfo7C/QrnBCnIc9tYyQ+jk
 aP08tQZK0qUO2nJlwMcY23qnEWZ4Zyg2SbanL9zM2n/jCXunqPlJeBUoNJkAO88tnwP8BnmQ0
 OFzFlUQfwAkLQxL6EyXFH7Nhr0350d1aoTUk5gX24BVpxBlXSCIYt8qRVYcKHsdC0LhWo6vOA
 YI7tX0kgPJasqz54qQtnq/YoTvObvkFh/h0mGBpo7KKy3bYYZvpzz7wWC2DcXUMwPqxnw31OT
 hRsX9YL/iezjm7V9Vw7yTLt7osWA+fZf1ya7WIBXYh0EiFRS4Tmo1eKIwu+tcpGwD6mjIMbHt
 yTanEAAYT9m1dBDZKZmfqn1pdYg4f0ji7Egr7rpvHzigaRXz9HKKrAvVUXTg1Fu6bK32Yhjfc
 1UjKr7NutRmjGoI2Hm3F3Uf59UcKswgc2crnPC9BwKerVpfBxwtRs+7N1YS6UfULpCrfia1H7
 ICXmy1yYk+1Bgv9V/pYPQJPmILxtgTJEt0IJhM8neqHOs1TB+dLrZCeAhKwzftrHCEUE=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Hardware emulated models don't belong to the TCG MAINTAINERS
section. Move them to the 'HP-PARISC Machines' section.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Helge Deller <deller@gmx.de>
Message-Id: <20211004083835.3802961-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 894dc4310526..6f2b20078032 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -205,10 +205,7 @@ HPPA (PA-RISC) TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
 S: Maintained
 F: target/hppa/
-F: hw/hppa/
 F: disas/hppa.c
-F: hw/net/*i82596*
-F: include/hw/net/lasi_82596.h
 
 M68K TCG CPUs
 M: Laurent Vivier <laurent@vivier.eu>
@@ -1099,6 +1096,8 @@ R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
 F: configs/devices/hppa-softmmu/default.mak
 F: hw/hppa/
+F: hw/net/*i82596*
+F: include/hw/net/lasi_82596.h
 F: pc-bios/hppa-firmware.img
 
 M68K Machines
-- 
2.31.1


