Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BC250812D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 08:27:34 +0200 (CEST)
Received: from localhost ([::1]:53538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh3oH-0000kZ-BK
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 02:27:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3HO-0008OZ-9v
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:53:30 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1021dae20=alistair.francis@opensource.wdc.com>)
 id 1nh3HM-0004UQ-AN
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 01:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650434008; x=1681970008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=54LNDcv7kZB26uhwQDpQcWJg6cxn2r4zaQ0u9RhnAYA=;
 b=gKXuwgio0l3tMGsKYqU3my80jDQc5eHJgqjJ/NT5LptS68mU9fOFm18B
 irGkljBtzD5XYe9nrBT1GLFXTMIYAYnJiR3M2dRBVNCcKRP+DM0gq+apg
 xb/uPXc+ym/xqKTI3Xxw2Ta53N0i0rrv6pUsgh/TZKcnfe+Pl9VkOU6rm
 /UgsQe4VnsefuGB5jspgHwDUkxzgaYnMgB/mp9T7gBKNWSgsG/F/W7beP
 czRwzK0CDk9hImZX+m6ejhcLsLpFAcd15u52wlI4ikWorp4xrAtMz8Xs8
 YDij1sxQIynwc1n6scivEeorPal/U+hyAhfRjrWFhcnEBf7qXY9RE3bVJ g==;
X-IronPort-AV: E=Sophos;i="5.90,274,1643644800"; d="scan'208";a="199228727"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Apr 2022 13:53:28 +0800
IronPort-SDR: enG8ZeUcGlRbjnqKpElHOseJHHfY87P4C56uD4c3svvz8/dynZqd5gtbPFszCYM6Qy9wBER1IK
 PncIAJ3t3jckMRNEvJCUhLXu4MPw+/XrWtjxL7Ek9JrfYgG79yFPx284Qq0Hcuc1+5q2dKC4a4
 zoKs7pobJY3VuSrXBkKW6GOZPi6pbS2G7BCr8vxC4pOx4gvx5tUV0MjLn/OHKIwOtKE+BVpl/w
 8CbsYJXXubWEoft8Q1jEciKc6uzS5skQfK/OgKMYt0mBgbkhzJ/p4KPYimx3Copzeff3yaHLfi
 w6FteeXNAZ/5/Gp/3LbPvXmC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:24:31 -0700
IronPort-SDR: fm2Oq/s4pMajUSwvRJwvwkg9uOW4ZMSv7sNIjGdQyXyISnnzHjV0z+MesBvTKhNF8DLF25Oz9w
 EgkJekE4eRZWBXz3HUr1o0AJjbRcpRYZPPwGEKIENM8aVXi0dENt/0IAsFC0VkhRaNOD6+V4hY
 5vbDVO3poJMxgbuWivkEdhyeg+I2G8iX+1aLH1NaW5ZGrG+OzCTcXmzmr3g4JOin7kYQ545fXe
 +Hz9ktBN2XH2Yp7i6RlJf5vKFDFlZ8dwGdFjoKkA4UHBPr84KWAoqhD9tueJpjM1JD6SLZtl+p
 kBE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2022 22:53:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjqbW2FzMz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 22:53:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650434006; x=1653026007; bh=54LNDcv7kZB26uhwQD
 pQcWJg6cxn2r4zaQ0u9RhnAYA=; b=BJ+huSzGbvFPyjR13/QkG6bmQiyzlY1olg
 P9fOn+QxTFuOVMowjaX9Oe56wqqoCN6JFsjfNgNLYqix2QA+blNULHukkgWK2MOj
 JPkV+Zh8otLWRPHgYenTOZpw49VoOwLn5HdyPJg7nA7rGP6YXBbYTU4C74UPVIWG
 T0WY7WT7RV/kmzRPqiUqIw/ycY1oJ99aqS0O7yOYYX9GG4oHEpu4j3pVafTc2vZl
 Mq+Lr4IrmwiPGy3M6i8wJcYM8V33qVFIxNT9Bt7rRVcjHy8dWAkseFEOGy9exCSx
 TzVc6NWEUR7zrfAnNTOY3HSK7+aAULqyO1iyLAnjHBRI3JrDhpVA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 8sx0BcT9Db0K for <qemu-devel@nongnu.org>;
 Tue, 19 Apr 2022 22:53:26 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjqbQ3JCnz1SVnx;
 Tue, 19 Apr 2022 22:53:22 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, bmeng.cn@gmail.com,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PATCH v4 6/6] hw/riscv: Enable TPM backends
Date: Wed, 20 Apr 2022 15:52:48 +1000
Message-Id: <20220420055248.960491-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
References: <20220420055248.960491-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=1021dae20=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

Imply the TPM sysbus devices. This allows users to add TPM devices to
the RISC-V virt board.

This was tested by first creating an emulated TPM device:

    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
        --ctrl type=3Dunixio,path=3Dswtpm-sock

Then launching QEMU with:

    -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \
    -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
    -device tpm-tis-device,tpmdev=3Dtpm0

The TPM device can be seen in the memory tree and the generated device
tree.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/942
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/riscv/virt.c  | 4 ++++
 hw/riscv/Kconfig | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6eed1f4d70..b62fd66a49 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -43,6 +43,7 @@
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tpm.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
@@ -1612,6 +1613,9 @@ static void virt_machine_class_init(ObjectClass *oc=
, void *data)
     hc->plug =3D virt_machine_device_plug_cb;
=20
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
+#ifdef CONFIG_TPM
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
+#endif
=20
     object_class_property_add_bool(oc, "aclint", virt_get_aclint,
                                    virt_set_aclint);
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index da790f5936..79ff61c464 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -34,6 +34,7 @@ config RISCV_VIRT
     imply PCI_DEVICES
     imply VIRTIO_VGA
     imply TEST_DEVICES
+    imply TPM_TIS_SYSBUS
     select RISCV_NUMA
     select GOLDFISH_RTC
     select MSI_NONBROKEN
--=20
2.35.1


