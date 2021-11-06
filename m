Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079B2447038
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 20:46:41 +0100 (CET)
Received: from localhost ([::1]:42142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjReB-0000Bz-MS
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 15:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mjRZp-0006ZS-5T
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 15:42:10 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:59443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mjRZm-0000qm-6k
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 15:42:08 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MFbFW-1mxChL2XiY-00HAhi; Sat, 06
 Nov 2021 20:42:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw: m68: virt: Add compat machines for 6.2
Date: Sat,  6 Nov 2021 20:41:58 +0100
Message-Id: <20211106194158.4068596-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211106194158.4068596-1-laurent@vivier.eu>
References: <20211106194158.4068596-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:M/Fg2ua9rHrJIEKxs/rEXpHftvYfn2mQ/9eAHh+1mT4Ju8vDiOO
 NdAJAdZpCHR3OxxHngf9Ws08eDcnkXxLzDvg/i5VYnGN1nANa8X1MLYp0X/3WsDnWsDVys0
 1VymGD7usmHCccVFPy00/qUpKo18nvXmuOUtvkKa2HY5tpPXW52h0VXQTgzM37i8Cdd6xlf
 U8K+9U5ArqvXGFo48zn8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XJtTMkf/zUU=:gZOh8WT6DBgAn85XKZhm2P
 r8eTJzYSf8tS8rydu+5nqnInwVFuaiosRzdA6Nh1u4YqWA6bE2KLWtVbRmv8ZuYlbPReCyTbp
 zFySrHESMYPV7tRHraDE/CoPfNz9ohRf4TagpTVmp5FhqvZSJs1HUjaEoHuxz8hbDeBiylccS
 ma/JMmV0kdDdwEdCB3C4nurULz4lcX80CYAYgCX3kGRUiqjeAmCWQabrZcWmI/M+G8QzcdIW7
 +7eYI1LaHuQF9WvSIEWVe1JbIWbDbpvuC6QYFrm04waSHFWX89bNsRKthhlYjmBR9n0UhWgW5
 lvqLpDhLEfkwFM4gh1SIMj/moP3owhFfTHp8+QwmSr9vaaAAxT/4DhShVkVU69x0bF8DFDi3a
 KUv762GlD/wsM2onXvCdMo27l4pG7dBksSkJukZ6EQxXPPrimxlpotsCrmdsb270AF7DOSFNx
 4DaILiD3SMMsL3sj/Sgz40F3yZK2hQmHLJ90Cne4xzGEG3CjbUfgbnl8iEOk24U1QES3aj7YL
 UkQKy2+B9V+RP+JvPg2xf0kA8OOWWXshDvUKpUVl6p7fM4tTsJaUTdpoQlcVeU6jB7M6Hwi6D
 w0CBK3B4zKnSUY+5V1RlxHTg/HFkT7jleccPzHGy6UOXGfYFPa9PGnUtTD+la6QhBs2NX/iHM
 gE19liBC4LqI+8QvpUVnaecnVJTJZCNbqAYd4+3Ew8sfENhBlkYZeBL0DjKa4y1kbjcc=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the missing machine type for m68k/virt

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/virt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 0d9e3f83c169..978c26e025a7 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -304,10 +304,17 @@ type_init(virt_machine_register_types)
     } \
     type_init(machvirt_machine_##major##_##minor##_init);
 
+static void virt_machine_6_2_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE(6, 2, true)
+
 static void virt_machine_6_1_options(MachineClass *mc)
 {
+    virt_machine_6_2_options(mc);
+    compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
 }
-DEFINE_VIRT_MACHINE(6, 1, true)
+DEFINE_VIRT_MACHINE(6, 1, false)
 
 static void virt_machine_6_0_options(MachineClass *mc)
 {
-- 
2.31.1


