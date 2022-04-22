Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605DE50ACF4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 02:50:30 +0200 (CEST)
Received: from localhost ([::1]:48716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhVF-0001zh-FU
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 20:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJq-0007wt-RE
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:42 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhJh-0005Vz-Uq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587913; x=1682123913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cCSvh9NLyfh13yHT8AoxiS9EOLBc9JbgMzZo/YDkN0A=;
 b=HwF4ZBXWBKZLf1qshf2q34gUbnNoRgeCjX6uGMQlqzelbXOkVlSaIhmy
 A5qZaE9UsUsqV0eo0fOOUAEVbfjUc1QvyLrFngHMkJLzYivP2Eqqax6o5
 iKbmYdb3in4wj2ocmoDNyIj1oTWpBNUY7dpCKB+0AX1GTis9jZjVt1C4Q
 +4kiYpLYoHvfd2A1D85jTX84UTuOxbVfy1aSeP1Xe0MAre2IS2aPjd851
 MlLMDIIURKhjmrWxkatOJqLKdb76tSRJTiM5nkBQK4B6rnq21qYVP9204
 DMHaDAv3yrmI4tVBCzwlBd1QKANYfCuP04YmyU11KXhWwDFFXoM4nhhc2 A==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483424"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:20 +0800
IronPort-SDR: Th2hLZdHEB4hCxKaOg0W6t8r2L8qqIVEDh7IM+Qg0jcwcDRxRDTMPRNpCZNFRey1vdlG/HIQp5
 JmcUI5usrdip/FvEF32uTZvuroLlsge0qAJyGg6zpqOCbuUImUc6kVS39HOWfJ1Mru7kvU+9mZ
 TB+WW+hJbdcptyU+j2Rz1XWfmkYncvfHdF71ECnv8Cu5EMwn7UWdV4xfBrUgPVDgJzUsI5KAQM
 7MoxJN7dsRPfR5GplMvaSS2rROTir1IuKXZF8DLm5AWe+pT7zo9advoNZ3yR4XLy0bId3I7OR6
 cg5k495IDYd7SW9FjlDRrPyf
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:37 -0700
IronPort-SDR: LNnnwmj2rfeOWUj7LpdxYPNnxwAiAl9oS/LmPCM0NukuJoQwIfdZ09Jnou6+jninQB/Wwj4X06
 kdFed3WvyN2vpSFOHu9+ioeCnB1veHKvD0JWarShdHLo8TDJXxF9c5TdGRsyxa8tKJ0Alco/ce
 kxjTV7jFxSAa2oXMFov2FEv5zc4/w+cobA+3qcqjusr9Bc+Za5Eq6R8PCndyrDYkV0cBr19wVB
 ko6PEE/tHB9k0WRWYHJ255a886XiK5xdvcQtvguXtYBpipXQER8HOMPBf8U6PvdVKoxbSUWpwr
 5HY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwW04dNcz1Rwrw
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587900; x=1653179901; bh=cCSvh9NLyfh13yHT8A
 oxiS9EOLBc9JbgMzZo/YDkN0A=; b=rgfjA1zZNafGcohNdChjhKCJ5iMrdg3k57
 y5AkxyDxcWTWs+ZEBhZ5lwkE0AcWSgjO3255yLvej5VMmny0z3ARwkNnHJYkGDpm
 qQ2R4w/K+DqA7CE6XIOR7eI1FZgYW/BRw5OoBFhO78IaCufHQ9nvSKz2ut1hWlXw
 HU9oWPaiEsCP5a8xBC80EU1shh4Aeyh3rnwGMKmCJ2Sq4ThUJV/pc5PwHwogpbqB
 o7K80bl43y4pp2+Uc3ywSVzfXTB+UBIyVXwtIggKEXYsg8NkxiWIL//x7yvVfbbw
 vfUCAx2zpO7IVpDBPQrcVSdNOxmHwYRJ95i3G8KeQeKg4nH3pXhw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 6iRTLeKDvn9w for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:20 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwVx1Zf9z1SVp2;
 Thu, 21 Apr 2022 17:38:16 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Jim Shu <jim.shu@sifive.com>
Subject: [PULL v2 21/31] hw/intc: Add .impl.[min|max]_access_size declaration
 in RISC-V ACLINT
Date: Fri, 22 Apr 2022 10:36:46 +1000
Message-Id: <20220422003656.1648121-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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


