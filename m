Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7CD475F62
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:33:24 +0100 (CET)
Received: from localhost ([::1]:42980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxY9b-0001TO-PW
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcM-00055k-Bx
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:02 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:56009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcF-0003Tl-Ta
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.195])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 5E92FD226579;
 Wed, 15 Dec 2021 17:58:53 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:58:52 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0016039ab2d-b9f9-46c3-9521-29cd45c48ff8,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 002/102] hw/ppc/mac.h: Remove MAX_CPUS macro
Date: Wed, 15 Dec 2021 17:57:07 +0100
Message-ID: <20211215165847.321042-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215165847.321042-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0297f668-4e84-4775-b66c-328c9df6bf3b
X-Ovh-Tracer-Id: 2219430195029379878
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The mac.h header defines a MAX_CPUS macro. This is confusingly named,
because it suggests it's a generic setting, but in fact it's used
by only the g3beige and mac99 machines. It's also using a single
macro for two values which aren't inherently the same -- if one
of these two machines was updated to support SMP configurations
then it would want a different max_cpus value to the other.

Since the macro is used in only two places, just expand it out
and get rid of it. If hypothetical future work to support SMP
in these boards needs a compile-time-known limit on the number
of CPUs, we can give it a suitable name at that point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20211105184216.120972-1-peter.maydell@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/mac.h          | 3 ---
 hw/ppc/mac_newworld.c | 3 ++-
 hw/ppc/mac_oldworld.c | 3 ++-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index 22c8408078d2..a1fa8f8e41a9 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -36,9 +36,6 @@
 #include "hw/pci-host/uninorth.h"
 #include "qom/object.h"
 
-/* SMP is not enabled, for now */
-#define MAX_CPUS 1
-
 #define NVRAM_SIZE        0x2000
 #define PROM_FILENAME    "openbios-ppc"
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 7bb7ac39975f..4bddb529c2a6 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -581,7 +581,8 @@ static void core99_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Mac99 based PowerMAC";
     mc->init = ppc_core99_init;
     mc->block_default_type = IF_IDE;
-    mc->max_cpus = MAX_CPUS;
+    /* SMP is not supported currently */
+    mc->max_cpus = 1;
     mc->default_boot_order = "cd";
     mc->default_display = "std";
     mc->kvm_type = core99_kvm_type;
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index de2be960e6c4..7016979a7cd0 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -423,7 +423,8 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
     mc->desc = "Heathrow based PowerMAC";
     mc->init = ppc_heathrow_init;
     mc->block_default_type = IF_IDE;
-    mc->max_cpus = MAX_CPUS;
+    /* SMP is not supported currently */
+    mc->max_cpus = 1;
 #ifndef TARGET_PPC64
     mc->is_default = true;
 #endif
-- 
2.31.1


