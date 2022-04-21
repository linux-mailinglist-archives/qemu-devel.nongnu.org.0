Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EF350992D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:35:23 +0200 (CEST)
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhRLW-0003cA-Kz
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSD-0005j3-58
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:15 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQSA-0007zd-Ts
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523090; x=1682059090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cCSvh9NLyfh13yHT8AoxiS9EOLBc9JbgMzZo/YDkN0A=;
 b=iFZVOQ3T1PduVZ+ZV0+x1sGRGJUJYHicsz+5P4Y5swv9NhHxTc7StuEx
 koeO5Mh2JOqSulraXwce/NRJnSg+yx5Z7H0ntRtlI7zQ5IeHOmuQLIIdt
 ESEjue6vQCi672oMEF6Kc/sPQAWUIyfeQqMO8fO/Y4aIwHFbXarleX7nR
 57MiKXAJi0dCbh42hQPdQcBAN6/lY35JMlP18LAYS2H/prawruCfrrz2D
 sBECXPetHtRmSIe2/C+m7LwFH5bWNRHV4vT+sVU+f1khpEv3cJnNSofQd
 ST9tZBa5O3aXigguA/Sek1v8oZG2rLG70XCAYoK2gVn7x2PodS+b+Z3Tz A==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302640010"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:50 +0800
IronPort-SDR: 3+aDraApS6j8GsMrZJ3fSJNCqIFQbIocQeQODcXxL1JTV0rB2/vHON+dykQJujk38JvJ89y+QC
 vJs+bFLFhy14JOBervZbD6zHEMn+nTfFhsy/eMYNqOvk7XGEfuSME9pY6/xFM2e5GV/8RyWUyv
 3q6vWIKDcjOVFyAx4e1tP65kx+7cWebEQRQK7Rb0B3NNoN1pKubZPWJHCelMs5AaPJrJQMQhP6
 icO3o6i1WRREkPH4luTzEQfhsbCXNd5vxhrzzN+eNf/7ELCMTiK3QUaG5oxA/bVt6dkcxZlsrA
 A9JWn11xUxcZTWHb3gxoSLhB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:53 -0700
IronPort-SDR: wlryxQZ/prJZixdfyqPOTRcXKlblI7e0rMBlG1KkPmPjp9uDxtWW7PSjy4CTXXtkjbPEYljYEk
 8DHmMQ1uIlfV8MMwgcFToqZ7aQOmHcbBuWKZVZsyh5Y+OmpSWyroo9oJADpAqGNKrHorjW0Gsd
 gCXQxxA47YflzwSZwFtmf7PsUGTy7jxSKaCFpMCfyQMSGjOB12QWnxzGDObE7pdUpVJ9i79pin
 PUaxnbIB/AlTmW3JN0qzOeFsbtTa0Zn2my8pYqXuJ3AwjQ8w+hOFcPmdlGTjXs3AOB0lJFUJix
 e2o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:51 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSXG4hZWz1SHwl
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523070; x=1653115071; bh=cCSvh9NLyfh13yHT8A
 oxiS9EOLBc9JbgMzZo/YDkN0A=; b=OTEJhLZHFreIO0cBBYN/JzBG74en0oPuJV
 SLQSdGE7mUwJr1oajadpmrBcy9MsN9MLt/pBpy39hjXs+yRqi1MAE1cf71KXhfvI
 EEywVKz5C8xR/52LxzdkAp1MCM8S7+2JAeubGUT1e5F3vRlDu2uqBlSE7RgqLQxw
 UB4OJUSC1KCxiszFL4IFeMvA0iiTZXaz+iSP0TUTmkLbVetIqWZKPKl8AhbIxGth
 0K9uF5QUWGEz15LIldGLKU93ijdiz2Cz1VftQhVvWmL7HZjVa4fLdB+EX8xCtsVI
 aiGFysd5fXa3C08/X4GVnJmQsAJDbXtdwNZDPudo8FZdqZ3eMxYQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id eKGp3ZLfrxDz for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:50 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSXD0gr1z1SVnx;
 Wed, 20 Apr 2022 23:37:47 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PULL 21/31] hw/intc: Add .impl.[min|max]_access_size declaration in
 RISC-V ACLINT
Date: Thu, 21 Apr 2022 16:36:20 +1000
Message-Id: <20220421063630.1033608-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

If device's MemoryRegion doesn't have .impl.[min|max]_access_size
declaration, the default access_size_min would be 1 byte and
access_size_max would be 4 bytes (see: softmmu/memory.c).
This will cause a 64-bit memory access to ACLINT to be splitted into
two 32-bit memory accesses.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Message-Id: <20220420080901.14655-2-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/riscv_aclint.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index e43b050e92..37e9ace801 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -208,6 +208,10 @@ static const MemoryRegionOps riscv_aclint_mtimer_ops=
 =3D {
     .valid =3D {
         .min_access_size =3D 4,
         .max_access_size =3D 8
+    },
+    .impl =3D {
+        .min_access_size =3D 4,
+        .max_access_size =3D 8,
     }
 };
=20
--=20
2.35.1


