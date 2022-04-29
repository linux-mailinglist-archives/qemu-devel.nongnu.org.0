Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7515A514170
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 06:33:39 +0200 (CEST)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkIK2-0000D2-Jk
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 00:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkIIA-0005uP-6a
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:42 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:13466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=111bf31fc=alistair.francis@opensource.wdc.com>)
 id 1nkII8-0002SD-5b
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 00:31:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651206698; x=1682742698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nzjX2IZkFlk9xDz6PdjrBvMrGbie4XRl/qA1VQl0tmQ=;
 b=GobjW29Fvc6T6AYBM2XwjxbzJDOiEXD0H3CHfq6GiUjEPUY2cGIEGrru
 +1BbUDBkitNsBDMhI8PQVl4eVdC+HEKxq1qeyAhl6qOQEe1CJq7H1nIzt
 hfp1tGxsK8Bvd7P+vEfThLXSrFLUYI4eZVRljJBOLjCjbXg4RQimo8oOY
 bbbHW2yCoD4Ko1WgOrodJnuA99KKjNU3H4EDA++Z2SgmSOsdBJjtKNnsA
 DscFS7w0NWnFVp92Z837c7CajwCwxUWvj94QYoZC8WizkBIwgMYQB51fs
 FTZMnCBxdMrj/eNF+8PADrR4QMtnWV08DXOPPrd/Z9dfFXVecNgXEl+37 g==;
X-IronPort-AV: E=Sophos;i="5.91,297,1647273600"; d="scan'208";a="203995889"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Apr 2022 12:31:36 +0800
IronPort-SDR: Jmpr9s7GdzNMdR0i8+3mApPq+5YpU9ZVKqZQJwR/mCd3T+Svk73EwT5I4lAjhtY36hNciqt0M/
 jAaJ90e38yZ3J7A/H6kWMZ+v1QGq1DLPAXCaVwAdHk2RzIQl7xR7pDAYGIZk6B2qeFJi+p/2lZ
 GS4JDMjc1nhWxIKkQxLCOCU6QFiK26+2TQgbgwWVynFygLJLIV32a4UPxfTN1f5DeJPq0Jqzot
 07d3MSyDWXnuBSbG/dl0H0Q+0CksOHlrASml0vYwldWlQQe0PMUHsCWek0aE0Pvakuwvaw6Qgk
 /eH958aVMwJ99haODQ9H+uDo
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:01:45 -0700
IronPort-SDR: Ttnc0jn+Yc4EeOVJzmNrwHRyoCa5+CmebG0BrTcXB9yUM2yyZcfQzvURl8gA7EKCdIC3TX7TeJ
 YvsziHe2FR1hzTH/uGBne2iLiqeYtR5Oi9For2sjwgKGEYLqPp+iUP3mh9fLBUdpE49TnKQpg0
 dgZyPs74HVUPMLYtn6A6aTVFvuN3NOqrSCnXglfE7AZXcg9jGe0fs4IBz1yFUknvBMS+3Xwvqv
 gY/zQ2i5mzbHsnX+GgsPW6EI0fOk64im0RdxPbBGALFbZr5qiLoXLiG4KuDFKAgAIBh1+Mnvv+
 WIY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2022 21:31:38 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KqKLx3gvKz1SHwl
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 21:31:37 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651206697; x=1653798698; bh=nzjX2IZkFlk9xDz6Pd
 jrBvMrGbie4XRl/qA1VQl0tmQ=; b=TJlg5OawEmHnqIBVIWRLAZcux2wpYLcDIM
 edPJLADq3Ncr5ormRutuCpDOCfT0OVzT6I8VKhL8xJuCujjO/7cX82biCOXHtcph
 jFdSWDkSpm3FoXVSBvhWvZDzGNCFER3uyc8HMLMqF1cY4LG5TYRRfljSdQBZeXIA
 3n+yaotQWKq1gyi5/J3dpppMvPFPwqw600DfbuRFZ7ybJesehluZYiFKDCzH92sb
 GSw0m+PnXW/VBv1ogUxwchh4TymlcL0sVmsGU+o2XHcenZqE9mHvxuobmh27L7XG
 pBK7UmW75VeCrC5jcRUSmHhmEkYt10A8oIBKMkNJre1ZnF8h/MNw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5lauWlSfkqs5 for <qemu-devel@nongnu.org>;
 Thu, 28 Apr 2022 21:31:37 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KqKLv0NZ1z1Rvlx;
 Thu, 28 Apr 2022 21:31:34 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/25] hw/riscv: spike: Add '/chosen/stdout-path' in device
 tree unconditionally
Date: Fri, 29 Apr 2022 14:30:55 +1000
Message-Id: <20220429043119.1478881-2-alistair.francis@opensource.wdc.com>
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

From: Bin Meng <bin.meng@windriver.com>

At present the adding '/chosen/stdout-path' property in device tree
is determined by whether a kernel command line is provided, which is
wrong. It should be added unconditionally.

Fixes: 8d8897accb1c ("hw/riscv: spike: Allow using binary firmware as bio=
s")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220421055629.1177285-1-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/spike.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index d059a67f9b..1562b000bb 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -174,10 +174,11 @@ static void create_fdt(SpikeState *s, const MemMapE=
ntry *memmap,
=20
     riscv_socket_fdt_write_distance_matrix(mc, fdt);
=20
+    qemu_fdt_add_subnode(fdt, "/chosen");
+    qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
+
     if (cmdline) {
-        qemu_fdt_add_subnode(fdt, "/chosen");
         qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
-        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
     }
 }
=20
--=20
2.35.1


