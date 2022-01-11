Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CD248B7B7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:58:44 +0100 (CET)
Received: from localhost ([::1]:59420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7NI3-0000Xt-OH
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:58:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCQ-0007iF-3h
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:54 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:37169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n7NCN-0008Da-Cv
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 14:52:53 -0500
Received: from quad ([82.142.23.158]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MJn8J-1mnEz216LZ-00KAfU; Tue, 11
 Jan 2022 20:52:49 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/30] linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND
Date: Tue, 11 Jan 2022 20:52:19 +0100
Message-Id: <20220111195247.1737641-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111195247.1737641-1-laurent@vivier.eu>
References: <20220111195247.1737641-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8cfmD5ULKC42iIBATjpKxBbDMB+Mqjkld+mbuot+69r9/EDRuUo
 kzPzl2Y+LSi2juQMq+QRpINJFEJ2jVznAYrsYqrC36+lQfcUHHKJwXTnxH2yoIcM3yXiEYC
 Dkmn++reN3e31nyAkg+SKVTlvJXuImiOKaEyY88Xa7dQXxaug/LErHTCH9p9X0JL5t9mZhk
 LKoSC9Aoz0/oIpO7jJs6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+t3FlDKkqMg=:IIjYGKLfnsM4ETLCQg4ONe
 mWPrgFad51zWjUmSv7jmNkuuogWkuBubItPQXeCsg5WyC7RMRnf0aLUPhkqnrRvh7DgoAvVz7
 3bNHYx9X+4hlL2GV7DPujq0MY+/JagaYCIc4Ws+7PTHiGDBBn3DmCfV+31yyIJDXrbu2f2v++
 4RewKNP1FHx+WlF8GbRpGhylLfVMpobEiCGpq7U4M+uf2giAPdPoklIBHeLHi1B5AzrHfYoeg
 zId/j9Iv3auNKmTisK6PywcOkEQ4R9y851BQ23sEokvAROGhsPahkHtfjDYRi/hrgkb4De2Tr
 U4/m8jRIO+36p1bd3ZtxNP6UX3ORXVT62CKkQDn/MBQIkCnHTtzX+PB5LiA+IKKi1QQWaS89O
 54K9S4xkcAC3jd5M4JpTN3UlSvhE9nXgSWIotBm2bhcIKgXFK/zyUzukHtzXfA5UK04mGjYL7
 zBvK9WFN3gdmQuSloiZRlzqXWsajIIMwZoOIgURYAQ4qHbJh8TZLaYH3rN6yKWMbbJyRRS2KF
 ByiWBUwkURIFpIhROI/GYsxJzXXGDV1sZ2yh/bHpr8N9AozdmQSPeNOF/+oebp8JB1Q8wwrpP
 EtOZ9kIhuNiOdA2iHK8vh2u0pjUYVkVPPPJKQ68wukj8MZqMBfKp/sMRIcjgiJF64AdObk+eY
 6/MznirW0Eep9l2AfEkuPJJIAqNzz6rYx/okkl+w3dvn0/J970jze2Ay+WKDAUlJqDUQ=
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This si_code was changed in 4cc13e4f6d441, for linux 4.17.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220107213243.212806-3-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/alpha/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index 96466b23f969..caeea97b9d96 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -151,7 +151,7 @@ void cpu_loop(CPUAlphaState *env)
                     info.si_code = TARGET_FPE_FLTRES;
                     break;
                 case TARGET_GEN_ROPRAND:
-                    info.si_code = 0;
+                    info.si_code = TARGET_FPE_FLTUNK;
                     break;
                 default:
                     info.si_signo = TARGET_SIGTRAP;
-- 
2.33.1


