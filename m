Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1114F71DC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 04:07:57 +0200 (CEST)
Received: from localhost ([::1]:40892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncHYy-00009n-4S
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 22:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHWW-0005M4-Fi
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:05:27 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:43521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=089d0ce6d=alistair.francis@opensource.wdc.com>)
 id 1ncHWT-0007QG-Ke
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 22:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649297121; x=1680833121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l0CXaP+tbwyurpGlT0CWLXD+mibNyZO0xUI/IwjNBKM=;
 b=Re97wjrpEcqVu6mHIBulexzCcobgZaX+SExEJc2vIT4ALfXvGMHKhfyw
 0aFGHBMBi1PDNuxomV1hlYwOQKwRDR2vOQcnVNVM2WpX+eC4JBvLDn9YD
 RHyitmKp1iJRNEgYT/9nnGIegwaCTFP5IJIiib0b9AuxvSL6D1rY9Wurn
 WDPcjp51oHJQ9H09YUrBZwkmXlwdAWMLvEB46GEN65ZhTsKgWLKs+cdT8
 R3I6orl1LjUYJz9rrvIuvC3R/LN7ew9Uxlh5yXhx4rXPEqwWT0Rq4nR18
 Is/qmiwcuIP73aLRxCz9HZc31Z04t2DBt5G3+E132hRBN3XVK39+C9SDm A==;
X-IronPort-AV: E=Sophos;i="5.90,241,1643644800"; d="scan'208";a="309261477"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2022 10:05:17 +0800
IronPort-SDR: SlFo8+bRjirC36Ovjszu5m/R6w3AhqrxJ2CSALZedjqqE3gDxzTQL7cY7GrDS4qJ8V1SscFNNr
 eIskcjAvXo0T8tXsaJI7Bw3U7DIUNIYiFC5PC1MWr/keFy8s983TbLE2Wt7xlxk7qOvrwLcc8D
 kEzhPngm8+ZUvF3n9aN17uaN5e7w3epyvWYfcG9g1pcLkhjyQLfYJrG5g8cIz0ai852TJZp4w8
 SvhzVcqbgH/CrtDmnPw+YEF3tJnomjVZob2uFngrBanSmVhfa5mEqJGgVqTUFPIaF+e96ek0Sg
 04os1SbPUCNlgnco1cV0dMjS
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 18:36:48 -0700
IronPort-SDR: iEZIiLt1qS5oIXfSp0sxue+mnDGMDEuYd0KKTmZ1QO1L64Yj5Ge1xuWf0IMLRzLNMtoHDQDK4q
 xgNfyeqQ6kGlhsJvhZqcCxOZMImW0OAeiqR+nLZKfX7Qp3j4A8DoVx1oaqsQSMuWL3l86MBl+b
 w/v8lQE+Kp9XnHFWR42lpHEVZX9k4YN/A706R49B5PIYX+BYq4TCQnhwrSHKf7/MBEPxdvp3uu
 dbcFUDVVwnyGRHPR9WqSi/JpSJcqa73xPIytaJC2sxPXS+NW3kNdBunmzCfiPdOWww/pLQakLB
 9/M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2022 19:05:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYl8F1WGNz1SVp3
 for <qemu-devel@nongnu.org>; Wed,  6 Apr 2022 19:05:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1649297116; x=1651889117; bh=l0CXaP+tbwyurpGlT0
 CWLXD+mibNyZO0xUI/IwjNBKM=; b=tBV02YX/ACTTIJpGJl/ln73gdNY1E5RPIz
 T0ygfOpE/6oFs/dbu/4fIQFjInGRzTuoElsemrrEBVetaQ7R44/1bKzZ/3LBNTM2
 Ge3Kf2q6G4kp6C3rp0nk/UKzHHcgEpjGL8hPe9jrKVzsGFEcEILDy3WwtOLgQ+mR
 7GteRCCQ0TTPK3jf4anDwiym2SnBhCjfMOqVVr3AiFhjgTOvzK4pzeC8jDJiIlQ5
 JqSQdmB3+dBYbwdBIDg/JzQt4Mnd/UVW66PXntn1M6ZRCfL1HF5ES5gppyLuEFdv
 n2BBNmY718FIJ9SJhlEWi1oFgNvLr4xScpeM+DWui4xj70ac9fjg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jR9XaHjBUyr3 for <qemu-devel@nongnu.org>;
 Wed,  6 Apr 2022 19:05:16 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYl873v9cz1SVp4;
 Wed,  6 Apr 2022 19:05:11 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, bmeng.cn@gmail.com,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 6/6] hw/riscv: Enable TPM backends
Date: Thu,  7 Apr 2022 12:04:32 +1000
Message-Id: <20220407020432.4062829-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
References: <20220407020432.4062829-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=089d0ce6d=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
---
 hw/riscv/virt.c  | 4 ++++
 hw/riscv/Kconfig | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bec83d26fd..e435b1f118 100644
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


