Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F6A5EE6AA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:36:31 +0200 (CEST)
Received: from localhost ([::1]:49690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddnC-0002Qy-E6
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odden-000844-Jw
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:49 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:56621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddek-0006Ob-T9
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:49 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MA7Om-1oXXls2mZ0-00BYLS; Wed, 28
 Sep 2022 22:27:42 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 08/37] linux-user/hppa: Dump IIR on register dump
Date: Wed, 28 Sep 2022 22:27:08 +0200
Message-Id: <20220928202737.793171-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:itUyI87B0gxUie31z7pYd2Ek5piM5mJghePvOMLo3/zy9mgZUtn
 C3gLT28aUxe5WVCQCB9bFZo4KVnLXRXg6L5agdkLfJJS1MaMFSMyo2SZeNOMEwwURWvv6F2
 oJbCESq2elEq5yws7Ji5XWSBcTQKTOrwUCZKladUgAOFKM+1AWTmoWMsPq86FzE1TNZAQvT
 Ir8Blb9scfDmvY21iexWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:408QV7yPtow=:vnCjXM42olOPu1fzxbdpDE
 U+2V35eG9Qgtu1FqlZX16LgAGZ9dTSnjvjmxdOsIWpWkak7sKZ5CWzVgt3z9Asd9mZNtJcwJi
 G4zYdW640R0zEQrRmFvCy94PbOA1tyOHJtfY9BZq23HazOySE1BY6z112f2GkrJSLyRcyN/6s
 3AIH26KxjzH7y7QIAEugm2jEizHqBADrZ78zQDZbWc5XMdAyArFDxh/d1olRdcWkH0Y+bqecZ
 X55C9TKcXRjYzWJblClzNoLhN3PSh+2bUwhGhBB2u5LDnWHQHn7MvZMyeSsuoJz6XmtiQ3LUG
 qhmy2uNUAMXxQcsGmKbPU8o6l9G6CaYp14RWK6yYZ31A+yfQOd/vnqUJhK9NaXlHX8Hrzp1ns
 yURFz3+J+CKoxOudCIK3yELxODI9DS+AjS6BP4wWeYBN+xuingWwe+TTlOiiWebo1+lbOZI5A
 k+0oBqZPav1SS5oANo+oZgzf+qrx0h+bQYY1FR7XmBn1XUXJRDDsfqTX7iGSacN+rin/FxF1f
 YU1n2Y4GmmzQGkKTTq1EWhLKHf8FDLbEhJ0rnmSU+zCzpCWTB6+A9T7UH4W2XG3wQa/ihjvo8
 19dPo2zbKuzDMmEjg67Hbjs5D1lobSJ1xHQc9bHrPH2cLL7QmNfKx0PP30+wgvC36NDIlWVWJ
 7sEkCd3m3hjJKw9N7TcOdNOVymohoT7IsNlv3V0Yr5zTegVr+Y7HIk+tyLoeu2B0bJEMhrxKK
 /MVrMetFA5+rcCtcFX0/qQidtJj2EVdNHGzmSOPRcUqWz/0NjRTkakgTdYUgQB52PbNrSHI8i
 uOLA7w6
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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


