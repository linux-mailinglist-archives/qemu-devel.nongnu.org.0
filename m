Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC431F06B9
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jun 2020 15:23:52 +0200 (CEST)
Received: from localhost ([::1]:59940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhYnf-0002el-IQ
	for lists+qemu-devel@lfdr.de; Sat, 06 Jun 2020 09:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jhYgf-0007QP-5o
 for qemu-devel@nongnu.org; Sat, 06 Jun 2020 09:16:37 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:37593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jhYgc-0007gS-KK
 for qemu-devel@nongnu.org; Sat, 06 Jun 2020 09:16:36 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MhUQ7-1j2yk30wJH-00eglx; Sat, 06 Jun 2020 15:16:20 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 14/19] exec: Assert CPU migration is not used on user-only
 build
Date: Sat,  6 Jun 2020 15:16:02 +0200
Message-Id: <20200606131607.1250819-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200606131607.1250819-1-laurent@vivier.eu>
References: <20200606131607.1250819-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ythf28RThGfajgyBsmL9OEYIzfEuxYwUJAyfOXddT66L+gXoDSh
 1RXfQwkcPAPxBWMlATfxaxdl/GvQxt30LrofBx2Y9Fgppji3NO113PtChpzApw2ffb2UkX7
 4SFfcBs6Q12+zYgAFtCA3uXtQ3nPYQxLbs+60hRHBOXzR6OKSPT6+1CRJaO15XBw6t8QY+E
 YY8CD6MtL52sWEIdj+dbA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LLtp8ss7yJc=:Xgd3lpW4K47LnwK0tm4Dn8
 HFmA/8qegi5heyIZIMCa3xXFX4qyBj/s/6+8E8+p/cqcHKuZTgF3q2rkbnt7BGnVtEvvrw9PM
 rK/3YKPg+I83FGxN9u2of1qXA/YYbCbdts5PeyCBEE9G6EXhh0GsJs39NeSobaA10Ri+J2ocX
 u20n+QHPBGbhkZbdxyBOeNerbOQnHDRZK62wL0R41nT1RqXe13xQM2/kJmGG8wLvLwh0tjZs8
 xLGVz9ve+fkacc4XY+OvCEPVg1rDm55dqbT12FagaKmRDE1TQmQ2Fs9Q9fEM1mc+/PO1ATlGU
 LyWudisMNg7P4jni+zjVpuSzh7/LVOIwTfMS84bmt2t55fa9fTt9kc53YeycE9MF+ZmIkarzF
 //vVkxNOGCwg/LvHWgxxFgdcEHw/HsOjh2LAkWSRXhN4VQUB6MCF3YNeE9zb8UIOK2WH6iVof
 PDQdxv01x3nBTPbDrNIrYTXq2hyui/VXOtwU45IhDitsknv76wjNynPGhnIlVQdi1pFVohOvL
 meFJFrTUUNUyT6JzcVHoMREuUvbm7FNaYGmCu6bBK1zu1tz7IrtuTm3JZ+tWveKdHkf6VefsP
 VBRMQ5bdVhr7aJL5G5HYM7FoxFMU3jBxYKRwa7qxSgSsXqorwZ3+z42yYBfWdkU5sJCGksD5W
 8Wg56+VwUjh2HOMrOpVOgtZLwC+BhqgbylkdTa7zYG5q1UuXhFtIIpHtFalUyJgQDvdt1jplZ
 NP0nmR1T6NEEom/uBjKbR4mq6uCHuc4eJItl8Li0GR8l8C3SBEpWtBsseun1aTEEgsKkefqGf
 Z3k6/8l2uiiLRY45Ue8LPO95C1OMsI8PR55M5K8DEL/UcICRjpkp2DnFErkpZPcurCZ4Q35
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/06 09:16:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Alistair Francis <alistair.francis@wdc.com>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200522172510.25784-9-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 exec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 5162f0d12f99..6dfd314469de 100644
--- a/exec.c
+++ b/exec.c
@@ -946,7 +946,9 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 
     qemu_plugin_vcpu_init_hook(cpu);
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    assert(cc->vmsd == NULL);
+#else /* !CONFIG_USER_ONLY */
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu->cpu_index, &vmstate_cpu_common, cpu);
     }
-- 
2.26.2


