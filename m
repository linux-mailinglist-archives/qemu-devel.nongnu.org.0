Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD61E5141AB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 07:01:19 +0200 (CEST)
Received: from localhost ([::1]:57014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIkp-0002Rn-1D
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 01:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJn-0001Ye-7z
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:33:23 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIJl-0002Wc-9Q
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206800; x=1682742800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zatFxk2u6vStKCrNUJhmFphqQIiQJMnZKZSy4AGwIzE=;
 b=GvTGVTuLoWX/UJgBdY4gvqEKjb2x2OUUv56nZcRRuObvra69Yz9/fwzy
 7egRVURPuN3Z2FBiMQUs4hRjmxmGQIMVALCq195fW+L8gtPj1G8bWPseI
 KGX8CCAWi0RxSBGBV5JNWg78kKQc4BcQEjJ0aqWY/SODnQV4m+1udDB7Y
 jIwXPVwo73YEKisjcTV6xlEDrctAS6SiP12OTPetS5E5tTk7YaQajbaJR
 g9BPFYGqjTVNLY3hqiCY7U+qmmRuu4W6wswe5Ph1jJnfsCYR2P7mW5Fk5
 ULsEe5gpFKNnw6HiALHXVqzxnauka3Ii2kTYEKuLyz6pyTk6Rg4nJYcn0 g==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203996007"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:32:56 +0800
IronPort-SDR: BjZNoXVq6neK08h94THmBcF/wlobzyNYvkT5rC5D+RhL/UF+2X2eTamx6a6iZRSUPb0cjldKDT
 2hDzyg9Q9RQfxrk9peABWRxuDvWCUc4v0Ye6iQ0ED10r5LNQoXElS3tb3Mzq1lqxrtT4NOFrP0
 nj9TyqkkmYp23sjuaEM0+efhW8zcqYqhho8OY7T61+BOLoaZW2IAs+l7yqFNw2kfzLgsG9Tp5R
 GzBnPjT8OFFthU17T5gYwfeGt5aJZJia1xPWu57lZkhVQqPhrA29vZi6qCJlif30Q9QAZIDb0x
 tKaLydxTdRfOHl9FxMMbVPIO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:03:05 -0700
IronPort-SDR: HxPPxWCVvLN15eL/LH6j4RH97rawFGzduSMjvOlIMFqE3aIUgxhJCxi2P7Ho0nRbr85izCFCqQ
 dmKXD9BV2LekQLa4iDtnGAhLniZ8aRj1CpviG4H7mdkkELYz2wwXAxGuZ/qx4RBi21iINa2LWl
 e9a+4bZ3jx1hU4Kn/ArU7BErLTb7Gk3NXuAQl0i2GPpzeYZmlzY9uqmccC+zpotMbJZjB3g8XM
 vufuVWN5AZOCO/QegYSQH2+ep4jKgI8yXqa/ItjnvAn0b+DGVTvuMJTkc+VUHYHMwNQ7vUY77j
 CQU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:32:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKNS6cGGz1SVny
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:32:56 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206776; x=1653798777; bh=zatFxk2u6vStKCrNUJ
 hmFphqQIiQJMnZKZSy4AGwIzE=; b=C4mUmv5YtpBjzkfHkOEUzUZB7LhsXhIgQn
 gEk+2d01mz8wJXRb1vb7PyOF+oNbK+t16b5wnPkRqjqioptl601AmZiuGj55K1s8
 zhK4/SrCW3pwBif2/jc2BFb5anf+6P1EYqI8cH30QJKfhSxP/0WxpuwGPOjFr9t/
 HaCc7L+BiUwda70qruCGHE9oLP73lAZVYPPxqjKCELOcIG7BbNKEUjPz+eix4h3i
 ZxJ20CYMfBMVXNjUBu4JYdc6YSjPpbPgWfPCWkqmjlmXko+S5tNM6Kp3nAVP0xWU
 eWVHxQ34xkk9UjW48ypEkjWy/DaHQd+2UYE8RQvIchyFO7mZ6leA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id o8GTwYQaeVun for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:32:56 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKNP69tJz1Rvlc;
 Thu, 28 Apr 2022 21:32:53 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 25/25] hw/riscv: Enable TPM backends
Date: Fri, 29 Apr 2022 14:31:19 +1000
Message-Id: <20220429043119.1478881-26-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
References: <20220429043119.1478881-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=111bf31fc=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220427234146.1130752-7-alistair.francis@opensource.wdc.com=
>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 docs/system/riscv/virt.rst | 20 ++++++++++++++++++++
 hw/riscv/virt.c            |  4 ++++
 hw/riscv/Kconfig           |  1 +
 3 files changed, 25 insertions(+)

diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
index 1272b6659e..f8ecec95f3 100644
--- a/docs/system/riscv/virt.rst
+++ b/docs/system/riscv/virt.rst
@@ -162,3 +162,23 @@ The minimal QEMU commands to run U-Boot SPL are:
 To test 32-bit U-Boot images, switch to use qemu-riscv32_smode_defconfig=
 and
 riscv32_spl_defconfig builds, and replace ``qemu-system-riscv64`` with
 ``qemu-system-riscv32`` in the command lines above to boot the 32-bit U-=
Boot.
+
+Enabling TPM
+------------
+
+A TPM device can be connected to the virt board by following the steps b=
elow.
+
+First launch the TPM emulator
+
+    swtpm socket --tpm2 -t -d --tpmstate dir=3D/tmp/tpm \
+        --ctrl type=3Dunixio,path=3Dswtpm-sock
+
+Then launch QEMU with:
+
+    ...
+    -chardev socket,id=3Dchrtpm,path=3Dswtpm-sock \
+    -tpmdev emulator,id=3Dtpm0,chardev=3Dchrtpm \
+    -device tpm-tis-device,tpmdev=3Dtpm0
+
+The TPM device can be seen in the memory tree and the generated device
+tree and should be accessible from the guest software.
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 035c6fb581..3326f4db96 100644
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
@@ -1617,6 +1618,9 @@ static void virt_machine_class_init(ObjectClass *oc=
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


