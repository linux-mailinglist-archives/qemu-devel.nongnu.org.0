Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AC01889AE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 17:02:32 +0100 (CET)
Received: from localhost ([::1]:35468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEEfm-0006dA-9R
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 12:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jEEVK-0004mS-FS
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:51:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jEEVI-0007Bd-PG
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:51:42 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:53959)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jEEVH-000798-MP
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:51:40 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MvbO4-1jXHUC43vC-00sdf8; Tue, 17 Mar 2020 16:51:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/37] target/i386: Renumber EXCP_SYSCALL
Date: Tue, 17 Mar 2020 16:50:40 +0100
Message-Id: <20200317155116.1227513-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200317155116.1227513-1-laurent@vivier.eu>
References: <20200317155116.1227513-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IHSb0XGKBUV2bLYKONNW1gLsiPLvCT+GaqeE2S4y0flDKBJ9S1N
 JehETmgvNW/82ei8ENXFeeDXz0vF7YVDVyJsGxQpPXT/64pBB8LAoU2Tbd/0TJyRKYXS1Hq
 4FR82COdrMLM31ecvJsM+kjabx51N8avI6gVxKvEfmcx9iaDYhjNZIgSjbrI2GkxYeJTzYI
 8fzuz4MNtcteEtRdtqrBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J2WJ+ttZNPs=:qqu8/qDkGEsqfqEkU4JHw2
 /MqUUCrQvz+pJWV8Nqgb1LlzVnuOYHoKzYrPnQnMYwF3wLN0gDOd3sORn8dYqDIcNFTGBeh0Y
 8g1Mo/VAMIPOKnRJfDutWMuN7zTCEin5w0v0rVBIKp0o5VXzmQbxqs4jdLd33TsjfkmvqcjJq
 ddto7Swf40LkeoQqwiFbaaT6wp4Hmhpg27CTREsCGgQLTwcmZf9r4H8iL0nRR6+BfA6+zzuki
 Cc1C25r4gIlR7nAiAfMvz2qF4OCfvMwVwO3J+0nx+htwtuv1jaaaBnH6zhzMbuFLQYPFCWn4m
 WhUNC99Ius7hBFachQQatnEutQMMI6vS4py9auLYP/YHVguzHE2l1MgCxtviWQJyvcOss0Eby
 Yibl4INxmI7ezGiJJIfvukwaFYaZkbeLeaer39QqyJkwLV0VqovNr5XGlMjbj1nMxUik1FnAP
 rX2YN54Dj1TtojMgkxYHZv8Fnet+GyXZeIT6XAVPkk5CCgxrp/JmsofFBDlBRJtL7wSMLh5Vs
 bRkut5C9jXKvuxFGEFj+9VJ3suEY3V0RrxqDkCrF3umK00GmDodYxUul9PROLv9iQHHVTNhrJ
 tleTdvGXiGsYPusPbJIiaKHpDIadpwyHa090hQMUaCHrnSEIPZhoFmut6MpkZ+NO4XR1NQ3es
 CQj8iwVJntMU+ga4+js+1fJ1cGp3JJrDct5ohv40SIvwoO+JQovBRA5vRGD/RT2JzCLLjAxZy
 GJCZXPnVJOMi7/+V6iH/2xE0DYDQEWX91FgyBiUk8rZvYpxAgP41Pd/445Eei2Fa0YRykJP9V
 7MOY4tDy5ahvQ2WF5bkjvJdfPxsKXHhboiP03mbpkYhDhiVftceE7SkAI0caz84eD+/dewp
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

We are not short of numbers for EXCP_*.  There is no need to confuse things
by having EXCP_VMEXIT and EXCP_SYSCALL overlap, even though the former is
only used for system mode and the latter is only used for user mode.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200213032223.14643-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/i386/cpu.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 576f309bbfc8..08b4422f36bd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -999,9 +999,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define EXCP11_ALGN	17
 #define EXCP12_MCHK	18
 
-#define EXCP_SYSCALL    0x100 /* only happens in user only emulation
-                                 for syscall instruction */
-#define EXCP_VMEXIT     0x100
+#define EXCP_VMEXIT     0x100 /* only for system emulation */
+#define EXCP_SYSCALL    0x101 /* only for user emulation */
 
 /* i386-specific interrupt pending bits.  */
 #define CPU_INTERRUPT_POLL      CPU_INTERRUPT_TGT_EXT_1
-- 
2.24.1


