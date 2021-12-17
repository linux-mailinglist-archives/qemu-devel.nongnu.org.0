Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7792F479550
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:15:04 +0100 (CET)
Received: from localhost ([::1]:60144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myJd9-0005X1-Jj
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:15:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYh-0005po-SZ; Fri, 17 Dec 2021 15:10:27 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:59525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYg-0001IJ-CF; Fri, 17 Dec 2021 15:10:27 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1McXs5-1mLwSu386H-00cufE; Fri, 17
 Dec 2021 21:10:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] target/i386/kvm: Replace use of __u32 type
Date: Fri, 17 Dec 2021 21:10:12 +0100
Message-Id: <20211217201019.1652798-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217201019.1652798-1-laurent@vivier.eu>
References: <20211217201019.1652798-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fyWsljQuV2ckBBMTcxXIz+WOj/dSSWgGibWMtCyplCIyCga1TSe
 ZgHMLnB+W4739oebK3R7hlPKweuB58jzdNHL9grO4bCqQMr9p9Nfcz3TmOOyuK6pN1YTY1L
 sDXVsyIMissdM0oZant+gJ3GKAFOONnZHA59Ho09UY9r4yqZtOye/2t+DPD0onS606kj7Yb
 /UzB2zHGyY12ZYNYI4CpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hEQm1re27Go=:AgqnFOhiEqEGMED4hGi4sr
 9xTtFyXMDCzqx3DzRiWG4Aspp9KajXXzY76S81oRaJt50BHR15lUhArk8SncwT1pqeR1hc7pO
 GeLxIyJ7aV5n49CyEgi32kwMlWxptFPudzz9kaQj7kemz5uSicitZHtdgmq2j/VdtZORmAHkk
 ZDQdF3Uj4ceYms6xikYHCU2XbTsnUPfys6nxFX4sbWD0SZ72g08RDUkahiEYu19euxQTVMrzw
 kPCWkM7mX4gbJaFEnl7s3U3w3G1f7gUP9kMl+hdZAHsE46XNTbxF9PWLbKPUBwAqMRYucmPUk
 i9rAOdown8g3otD4hSEXDNVIudtfWrLgsWLIVO+OenKrEsd4gTevhw/9pG3vA/cefgheBCbe1
 StvMK/cKYZ+OyrVN27sEYQLKeWyDpdJ+2SG67RtT5kaKucSmAr7qctO8dqD/9216BkPWIW27F
 xR2/FAaUa2ed6/R2kdFd8Md78vCgd6W/JbIjsWBgUzr3x9cRmYyZaiigz2sqdIxfI1UXM4K6A
 VWOct/CHrdaV3KjpINCFkx98fo31pWHGgmcCJF7+x0M9nBuFhl7700SKxtlXhAQnFZ6mA6FUS
 GS8L4QLaSxywRD7//VqBnxEfeDPw1aTkuINuSw5T/HE9UlVRZALtSM0HabAGuH5y/DPwK5jgD
 0GIRD+UOcvcuXpQlvU2oIip/oUZPjYISf1JBG4zH1n4nUEkq7ZA7h2N9q8xSHtC50qBc=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

QEMU coding style mandates to not use Linux kernel internal
types for scalars types. Replace __u32 by uint32_t.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211116193955.2793171-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/i386/kvm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 5a698bde19ac..13f8e30c2a54 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1406,7 +1406,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->edx = cpu->hyperv_limits[2];
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
-        __u32 function;
+        uint32_t function;
 
         /* Create zeroed 0x40000006..0x40000009 leaves */
         for (function = HV_CPUID_IMPLEMENT_LIMITS + 1;
-- 
2.33.1


