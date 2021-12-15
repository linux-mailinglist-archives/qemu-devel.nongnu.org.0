Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A2B475E6A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:18:54 +0100 (CET)
Received: from localhost ([::1]:55184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXvZ-00059O-8Y
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:18:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcV-0005f4-Fe
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:11 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:37347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcM-0003WO-Kr
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:11 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 52B6520C0A;
 Wed, 15 Dec 2021 16:59:01 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:59:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001a15630c2-9b87-4992-8f90-71b8556c915b,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 013/102] ppc/pnv.c: add a friendly warning when accel=kvm is
 used
Date: Wed, 15 Dec 2021 17:57:18 +0100
Message-ID: <20211215165847.321042-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215165847.321042-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 68f42c56-554c-4828-b6d5-2daaa7fd84bf
X-Ovh-Tracer-Id: 2221681992262716265
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

If one tries to use -machine powernv9,accel=kvm in a Power9 host, a
cryptic error will be shown:

qemu-system-ppc64: Register sync failed... If you're using kvm-hv.ko, only "-cpu host" is possible
qemu-system-ppc64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument

Appending '-cpu host' will throw another error:

qemu-system-ppc64: invalid chip model 'host' for powernv9 machine

The root cause is that in IBM PowerPC we have different specs for the bare-metal
and the guests. The bare-metal follows OPAL, the guests follow PAPR. The kernel
KVM modules presented in the ppc kernels implements PAPR. This means that we
can't use KVM accel when using the powernv machine, which is the emulation of
the bare-metal host.

All that said, let's give a more informative error in this case.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20211130133153.444601-2-danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ppc/pnv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 71e45515f136..e5b87e873095 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -742,6 +742,11 @@ static void pnv_init(MachineState *machine)
     DriveInfo *pnor = drive_get(IF_MTD, 0, 0);
     DeviceState *dev;
 
+    if (kvm_enabled()) {
+        error_report("The powernv machine does not work with KVM acceleration");
+        exit(EXIT_FAILURE);
+    }
+
     /* allocate RAM */
     if (machine->ram_size < mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
-- 
2.31.1


