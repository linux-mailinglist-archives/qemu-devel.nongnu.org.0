Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0731B9DC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:55:49 +0100 (CET)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdPn-0005nb-Bl
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdGC-0004Bv-68
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:59 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:46845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdG7-0000jJ-2E
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:51 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MzQXu-1m6ui20AJE-00vQgC; Mon, 15 Feb 2021 13:45:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 13/13] linux-user/mips: Support the n32 ABI for the R5900
Date: Mon, 15 Feb 2021 13:45:19 +0100
Message-Id: <20210215124519.720265-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OWVUR9QOaknYTL1YGHgI5udPBlz8uHTPzJcluLpV5yclvebKg2f
 y3D4SaJdoxSbuRtpImxr8DcDSXgAp3rT2iPeefeZeNlxDfE1JqCdBCc46q5cZjBpuxD93bW
 de6sGBQJoqX2J7bGw+MsSIaHP4gGxMmpoA5tN7GjQE0alUkF+FGJicjafgPSUQqcQEfGQcw
 nn1dh3OaQc+euoRRnXUfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ckf8rSexkjk=:Svn75acuRA2iSzKk2GSClc
 1kaEbZkZJT2py5h5p9GGAYXGYfX7GmXMJYxXN/CzyVUqrL9ws4vZ/r08qR9vJVvqlEVhQfmaE
 Bf6gfTFt5POqDP5rQ85ymlQnB6zwBw9EIX1QeJDmj8C8netKFO7Qo9nlqyyi7eX4rlNPqvG61
 scvPWBSa3Z4tZh1tpJ5thdzeoXm+Ch9ZpbOGnpfyJ1A9sKrvZKYJdDBWH4OdsNDknsoSoF4Ip
 /9MNUmLVqWgodYGBdfi1jF1KgOAklFUhplQHpQSHyw6gB0NVxACxsyO3FrJ0Ek3trbzvfuSNN
 didX9N8li0tkIdHNvovlWq43zxxXWeritVn/O1F30vK/ppUY1765qxRA/xSUrbVuP3paiFOFl
 6vJ+05PiHAPepIZ5vXZQb+U7VIM0VGMXVs4TIYpX3NqIS522m1OrmqIm5D5zdnuGFTDCuebv1
 YAthveqjjw==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fredrik Noring <noring@nocrew.org>

Recognise the R5900, which reports itself as MIPS III, as a 64-bit CPU
supporting the n32 ABI.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <5bea109f0c140da6a821aa7f9705d4b3717e86dc.1541701393.git.noring@nocrew.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mips64/target_elf.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/mips64/target_elf.h b/linux-user/mips64/target_elf.h
index ec55d8542ae1..5f2f2df29f7f 100644
--- a/linux-user/mips64/target_elf.h
+++ b/linux-user/mips64/target_elf.h
@@ -12,6 +12,9 @@ static inline const char *cpu_get_model(uint32_t eflags)
     if ((eflags & EF_MIPS_ARCH) == EF_MIPS_ARCH_64R6) {
         return "I6400";
     }
+    if ((eflags & EF_MIPS_MACH) == EF_MIPS_MACH_5900) {
+        return "R5900";
+    }
     return "5KEf";
 }
 #endif
-- 
2.29.2


