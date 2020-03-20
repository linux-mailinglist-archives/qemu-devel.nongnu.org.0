Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B6718DAE5
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 23:08:09 +0100 (CET)
Received: from localhost ([::1]:59690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFPoG-0006pN-Pn
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 18:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=34142b0fd=alistair.francis@wdc.com>)
 id 1jFPn6-0005uG-Mu
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 18:06:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=34142b0fd=alistair.francis@wdc.com>)
 id 1jFPn5-0005Bl-L5
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 18:06:56 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:56412)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=34142b0fd=alistair.francis@wdc.com>)
 id 1jFPn5-0005AG-Bn
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 18:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1584742033; x=1616278033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G78v3GAJXzyaOCKFOiYbSCcg8DjRRNX4Nt71P0W/f2k=;
 b=BcadV8Hcw5XeX+cZwTNOf51lvwwvYjmQe7VaAoa+M81CzlbjvxAp20kA
 XN0gz52tEr5Uflv/wS1ucI16SdmvNMmpgKI9ZaCB5lRniT+PzP8uCjsQP
 cl/f5xjjfAWvI2YEjt+I/HSLpxB6GqsvWxsPY0B+lJa3eN2/UBKoLXx1K
 K9fqTM1q7k4Ek46EzzH/7H8onyxQ/KMPncmrzSNvXXIYf3aKgtBflZmEH
 g0rrjm4/9YeSVOgKDoZrJ1ofeAu3lHf+69WZz0jK0SWGrAYBGIVk2USar
 MG0SYIU9AajRxHgg/xBUwK9xfZnxUe8B6NYxvWEcVXgeDPdVGafd26j8m A==;
IronPort-SDR: kTz2f+AE6Orr8mnrn2xgYiCLFZbLx5NNVhlj5QipPQiOrxKbM13ly+gAqZtbNEwRIfHwxrPAOn
 1FFXSr6kp94bO4Wy64uEuVYWRDn9iKFV+uN69RCp4y8EFpHa53D82zbBM/TyAMkdtDc/nh63mZ
 w7R6jyoGBGpd+h4Ua6i8Is3x2EGil4hZ+NtK9dOpDXKQ/j+1sXjd+ziCmG08s/xht9PhH1SN55
 jMnfH6Npr9LBHDkCNxsMWaHbZY3RF3UYKF2eAl2ki5kKDkTzCyX+N7JD9x9ujmuPr+sB9tvBXL
 h7Y=
X-IronPort-AV: E=Sophos;i="5.72,286,1580745600"; d="scan'208";a="235266277"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Mar 2020 06:07:06 +0800
IronPort-SDR: BocIAeNZpXN42k59Hvk0/TlakdxTW2YfKFVHghM8wPO8jxuGmZdow4xLnL1asIVPHfxHdxtN7n
 +kQ1IEIplFTxRfcZZ9Fn4ROCl9hX2A7Xq/RuxHLFNcBFLnOx7M9sxm29uTXV5bi+2CosXH+LNE
 lGTvzW18zcVw9sea6LHrBJdV4K/KGHKxpv/8oA4HelVGCsYyh0Cx9RzkasDKEhXlfMWhGj7wJZ
 IFtfTg/xEMMnUxPLJs2xmqWHGBPoxa95T+lgGmAdDbaY0NAKZExqGbitxUiGKNhUyLBqN6MuyJ
 vtOPoqnOWS7plkaxVJayhxCT
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 14:58:12 -0700
IronPort-SDR: F0UHgtZDM5dg/7saViRRFdXRxsHKjmwunZ0+7B7P0drUcM6+S9dcYvAbhWfO7hQu7i8rn+MuVr
 /IFQhCQgHJPOYUiMA1gWcJ2Z1sqQlEuiub8s1th85iuwz9vQpVeNsk/P8fpg75TUrdaV/q0Q/Z
 jEctzeqLgJAcoBEClRo9CaNIenakRYfj9UOvEXXFuUgJaEdYCHyPGllr8k3Ng7scPwkm8py58L
 P+XZrW79uMHXsKDY/aJD5ltMRt1KM01tHgTBbSRtCIRjAFuLamssZV/u+Ip4SSHm+vTG713c91
 8sM=
WDCIronportException: Internal
Received: from 2kbcp12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.54.155])
 by uls-op-cesaip01.wdc.com with ESMTP; 20 Mar 2020 15:06:50 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] device_tree: Add info message when dumping dtb to file
Date: Fri, 20 Mar 2020 14:59:16 -0700
Message-Id: <20200320215916.3054194-2-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320215916.3054194-1-alistair.francis@wdc.com>
References: <20200320215916.3054194-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 68.232.143.124
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
Cc: peter.maydell@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <alistair.francis@wdc.com>,
 Leonardo Bras <leonardo@linux.ibm.com>, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Bras <leonardo@linux.ibm.com>

When dumping dtb to a file, qemu exits silently before starting the VM.

Add info message so user can easily track why the proccess exits.
Add error message if dtb dump failed.

Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
Message-Id: <20200319040326.391090-1-leonardo@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 device_tree.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/device_tree.c b/device_tree.c
index f8b46b3c73..bba6cc2164 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -530,7 +530,12 @@ void qemu_fdt_dumpdtb(void *fdt, int size)
 
     if (dumpdtb) {
         /* Dump the dtb to a file and quit */
-        exit(g_file_set_contents(dumpdtb, fdt, size, NULL) ? 0 : 1);
+        if (g_file_set_contents(dumpdtb, fdt, size, NULL)) {
+            info_report("dtb dumped to %s. Exiting.", dumpdtb);
+            exit(0);
+        }
+        error_report("%s: Failed dumping dtb to %s", __func__, dumpdtb);
+        exit(1);
     }
 }
 
-- 
2.25.1


