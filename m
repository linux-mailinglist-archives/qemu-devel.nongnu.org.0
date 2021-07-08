Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B193BF82C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 12:13:26 +0200 (CEST)
Received: from localhost ([::1]:60676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1R25-0006ND-Oi
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 06:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx4-0004rP-GX
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:14 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:48975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Qx0-0001Hv-3I
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 06:08:14 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MxV8b-1lHJaD2rCj-00xpy6; Thu, 08
 Jul 2021 12:08:00 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] linux-user/hppa: Handle TARGET_EWOULDBLOCK as TARGET_EAGAIN
Date: Thu,  8 Jul 2021 12:07:53 +0200
Message-Id: <20210708100756.212085-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708100756.212085-1-laurent@vivier.eu>
References: <20210708100756.212085-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Sys9lww59p805ibkdsDGtnOQh0QhsOX5GlqT6sYbQnXWlkSSHeX
 5mcDJMAuM33cIba/QL2zduzEi+Q+KFj/TsaA6HkZKrInnnOx0Wt0mq6lGlD57FfnC1S8+8S
 vxjCHgdpTGQiALV7l43005/+UJ7QVkBPsbjtsg5eB4jrVyvQueiNqON6Vhq3b1CrVJ0uMOX
 8mVKgaSWU1UKFXjjzVTtA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TRU1b7MKUfU=:UeLfFkRXbLM1ANrVzZnzkK
 k6wumItwcdQy9WLQB9+mmZtlEwFU91mckGaWZEJB4Ojrf0gvg7JOcfQMe5UtBEeAS3/CioAhD
 33gSHwPyoGcdhuwdyPGdz9FiEHFuZRHyCLI/pGiFNRFPxVEGR3B3mQAyxlOqenGb7iM0XNLXE
 C6HZAVosI9MMmD13Romsa4eswfBIM64DvSegvgaZMVLSYaooHI02b2e3uzzC4c6CUwjz/rJBF
 Y7BnZFEk0hdcx8CIrZi80VzbEmkaVgeGxcBIVxFON36SkJ6xK8lNWF2TQb8B1+dxf0yjWHALv
 2xck37WHH5NIp9mM96m21qwrfMHNE/wOIKdfeKOa28zWdFquTpcvCO/TYznI8+jWYqbKLqQ+z
 TtwKXb941J6INlbHvbuhoAB+4FMxtuJ9tedpCDMNqg92E7xUOD44grDtuK0NutumfBHD3U1W0
 qsfDPb6y2Q2/nLBQwIBVGJG+vtD2j1+sc8ukGKgzMoM8oaXdgJPPsfjilJIkfMwST+HjKeWz7
 viWPBkX0YoyaIR1dsUyMzEnso7faC9mypAwLZfduIvY9oJlCXGTeVywSuwm25sD5YpnmxRP6e
 fGx3AqKzw5Jlg5JTXFZM6tpW7kJNHh0snOEy7AfHl/ugGUkkM5hiqzjGTJ8pClzCfbUwVuztk
 EHm6pbg3ol1q799jrsu7TAkwFeUoADNpdapXxi+T1OvK6nwGaGzQ1amkTex7Rba0sAC13Eni4
 2z7eLeJFPbS8pwmaUGoljejNq7pQ9N385iSZKO5a37xWF8OCts7mpoZkaaQiy10FR7ZlqKvqY
 qAYqBS/B4PAF7M73tUTSRhexcRVH5kKsCPmBsn9cUtDu+tqSooXoCCKZrVmDKuDD8Ay6/7p
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
Message-Id: <20210704183755.655002-3-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/hppa/target_syscall.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/hppa/target_syscall.h b/linux-user/hppa/target_syscall.h
index f34e05edb57b..97a095656d89 100644
--- a/linux-user/hppa/target_syscall.h
+++ b/linux-user/hppa/target_syscall.h
@@ -27,6 +27,8 @@ struct target_pt_regs {
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4
 
+#undef  TARGET_EWOULDBLOCK
+#define TARGET_EWOULDBLOCK     TARGET_EAGAIN /* Operation would block */
 #undef  TARGET_ENOMSG
 #define TARGET_ENOMSG          35
 #undef  TARGET_EIDRM
-- 
2.31.1


