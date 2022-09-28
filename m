Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A895ED851
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:58:32 +0200 (CEST)
Received: from localhost ([::1]:36318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSti-0005rU-Gn
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE5-00087a-NC
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:30 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:39059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE3-00089w-OH
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:29 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MS3vJ-1opOD33KoN-00TUns; Wed, 28
 Sep 2022 10:15:22 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 08/38] linux-user/hppa: Dump IIR on register dump
Date: Wed, 28 Sep 2022 10:14:47 +0200
Message-Id: <20220928081517.734954-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:P+eHJAuG0u3qJteTmtcoh3mfe530qxlmOcKH73U3m62AqgkXvtK
 aJCgCjW+EcbzV4v9B3Nd/nXvMIQlOHP8PvSO/RwMBrngLhsx+Rpt622LjTf92ZOo86gicLX
 CAcpr8rIHOmbfNUuR/DazOOPlMIGEsU219QeGUEhuJEnpTaiKX3MU4yTFw+Ld9v2Pf4V5PG
 v4rZSXoMj/yB0YYdPy7fQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/3D1NtuUK10=:HooqMHjW+akNLrvP5bRiBB
 QQzKLq8nRbPe+X7+mtEfc0NJN+GNLr7Axn4BrUNuZZQg9uhRDHs3yPTddbrr/Q5i5sQLOaPWI
 j3wwnqpiI3SkL/DRftGFnwGLJUgdqUt43I2QsohAarBEJmb+oAC2P93+eBGkdUutRnIoex0ZN
 qzHurO14C2EjcB7U1lhV6C74WzQrDHrh2u7JO5ceVy6ceSSqqlmm9Myq4bs63mQ7Ss3AWcsj+
 pcBBNRr0HhXJ+xxWUeREjBm4EEaEXvNS+k5M7UwNvum76kxZXVRJn/h+yNyGAJdkWHK7Zsql/
 ddi5SZgevd/QvQP08Q/UNtnikV7w80rwMMzmP73H3GkhXGYIwrhAl7DruZqrfCW3DKV4GA6Lw
 8eid6QRJnNJTqVzTNAiYr12tmocrUDwW3Xx/am9wkAC5R1ByYz/RIwS7KtDt4ewfntU6VcTBp
 U6dw2EN9d8DLHsoQM/bIMWkapmKKVGGGcVIhw87je9r6pjDn09BHTv1DXvgW3xI9Hd938PHSC
 1ng15bfy385b0eJTx9nCk0u9h3lbK1+w5roy1mL5VSCx/sq1ycvNNvBPGevTL4E9RG0wItNl7
 nm/FiKKRYjxE1ul1imu5P0tahmdSYDXl4No8Umnx7hY9/DIlpZ6QKaIydUcTG6iy0mD9zJX/p
 dNJZ8VFlMaZH+wahktJw6EN11/QdLUhmgbbU1hnBX0f1FdmklDD20qHp3dcxxmRm3Hf/+dYnS
 yMQn8wieMLI/S5cPkFyn+cws4ynLTrHUdaJ6KKyuNkatpcr0N0/o9VpYEA4W8puwu7yRr5zTu
 VbiTmp9
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

Include the IIR register (which holds the opcode of the failing
instruction) when dumping the hppa registers.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220918194555.83535-7-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/hppa/helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/hppa/helper.c b/target/hppa/helper.c
index e2758d8df380..74b8747083f9 100644
--- a/target/hppa/helper.c
+++ b/target/hppa/helper.c
@@ -85,9 +85,11 @@ void hppa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     char psw_c[20];
     int i;
 
-    qemu_fprintf(f, "IA_F " TARGET_FMT_lx " IA_B " TARGET_FMT_lx "\n",
+    qemu_fprintf(f, "IA_F " TARGET_FMT_lx " IA_B " TARGET_FMT_lx
+                 " IIR " TREG_FMT_lx  "\n",
                  hppa_form_gva_psw(psw, env->iasq_f, env->iaoq_f),
-                 hppa_form_gva_psw(psw, env->iasq_b, env->iaoq_b));
+                 hppa_form_gva_psw(psw, env->iasq_b, env->iaoq_b),
+                 env->cr[CR_IIR]);
 
     psw_c[0]  = (psw & PSW_W ? 'W' : '-');
     psw_c[1]  = (psw & PSW_E ? 'E' : '-');
-- 
2.37.3


