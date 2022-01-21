Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900D24959F0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:31:11 +0100 (CET)
Received: from localhost ([::1]:58608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnS2-0003MN-IU
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:31:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmy5-0006ta-D6
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:19 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxz-0004AK-K3
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744807; x=1674280807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fsIWfG/YhDiWb+NY861jhKV1cgP13eIxnm24Vc1+lTo=;
 b=P1hp4LTd+BZ/XL+nAAiTUz0pWSf8tI/Ieum6tj7/VOUqxJ1LIEkfZFLo
 0oBzRfOPhGaV9kQtYidQ3uxFDCQSlNNED22DeKVrWH2DoAMIT9G6+SJ7t
 6EceN9cr+IHoC6u6QFiKSYnNtjRuiYOYsNKNRIBkrHuOTg/Kss/e6xNVk
 ghGE8pnnvULQajVYEf6kU+A4hHk6WbTlNUS93lLf+1GLnVihcuivo5J1w
 JreYOzYMczt5G1vep8UQk72xlk1iaotNu0hWUk6S0vMLknjPgU8Wo9Bzd
 47D2EcEkecVw521dxuzQF4fwzK6kEkUfowM1rbbvFagFTqex87wV8Yfs+ Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082884"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:05 +0800
IronPort-SDR: phzUCQA0d+0SpTqR4PQ2Jm0oeV1fURIKIp7BvY1rgR2E45V6sqtmyONPmc6XIYQRMx+M0B4g9U
 lttu0BvFrYRtflneBazFIQ/WhL1ALIHtvQdVmdJhxfjnS8sOSrx99uQTsKErX2K6nLopHDcZKC
 0a9YgjZhw+fOdqftJF35s8nv1pzhr0gCknOUKXHHaK8bPfiWP9xunkqD7p0jvg8zIUSjg3CxAA
 PQpUQolEnHzQAiQHLrRgEVewYN04H44s3zAzHWBg32+V/Kjcs1dIUx34VJPju6kV5wOVS8kPL3
 ilFxSR/hmsFo3FMx0TNZ0u5R
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:33:32 -0800
IronPort-SDR: CNwFq99qf+LG3pq41dfJYYq/52q4stJMKIoSRlVYK67dgF6rb8STpmUls6M1XM7APx5C+rgZMJ
 jNJCIp9X4JUMDFpdqjNYTMTUm3WCcZwII5iQYwHhbK9bTF1Nj+1k26nPqd6ArkR5Kt2/3oZOj3
 c8b5N2QcywZ1wIxnkM7abrVGZrNYyt6rdJ7nm0Vrc7ZsrRzKEaga7iZ06swua94NV6m6EKZqny
 y66ure2Ny5OSalT7KbNoNyJLHB4WppDlbd/BWkPUAmr4NMIEjBvj74KPOxqIXkGPp2CSuewONc
 0Ks=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:05 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7yD6yPwz1SVp1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:04 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744804; x=1645336805; bh=fsIWfG/YhDiWb+NY86
 1jhKV1cgP13eIxnm24Vc1+lTo=; b=KkhvUnL2mZswS29ZXd/CQQEOAPyYmQsVy7
 Q4HaoE2ZRd321R3slHzU7zVoam/+AGXwRRckGhO6OYnlDJO22dlKtYCiq0ydwjhK
 sMNjekETwlB+SscQleFYl2jgzBRy+wgogyi8aLPf+nJZ+uQfK8M7+IzCWqmGV572
 M+1ZIvF35Llgz83+vUMgEjC3PcO9DToV8DxryOqrM3XGvxBB1Nmo4RCjUGglDiWO
 CRSYdOCHTGmFvpDXmzK7upcWMaAgrLuIvbWVY9GVZ4MyRKx2rMtkxRmP1oS9jsox
 EIYK0eEpoRKBPbpiTZWbck66nbB9xZ6rb/uhrh1Mnfk7hEZGFiJw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 32Ek_ojmHSFc for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:04 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7y76CjRz1RvlN;
 Thu, 20 Jan 2022 21:59:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 18/61] softmmu/device_tree: Remove redundant pointer assignment
Date: Fri, 21 Jan 2022 15:57:47 +1000
Message-Id: <20220121055830.3164408-19-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

The pointer assignment "const char *p =3D path;" in function
qemu_fdt_add_path is unnecessary. Let's remove it and just
use the "path" passed in. No functional change.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-id: 20220111032758.27804-1-wangyanan55@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 softmmu/device_tree.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index 0a433c98e2..6ca3fad285 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -558,7 +558,6 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
 int qemu_fdt_add_path(void *fdt, const char *path)
 {
     const char *name;
-    const char *p =3D path;
     int namelen, retval;
     int parent =3D 0;
=20
@@ -567,9 +566,9 @@ int qemu_fdt_add_path(void *fdt, const char *path)
     }
=20
     do {
-        name =3D p + 1;
-        p =3D strchr(name, '/');
-        namelen =3D p !=3D NULL ? p - name : strlen(name);
+        name =3D path + 1;
+        path =3D strchr(name, '/');
+        namelen =3D path !=3D NULL ? path - name : strlen(name);
=20
         retval =3D fdt_subnode_offset_namelen(fdt, parent, name, namelen=
);
         if (retval < 0 && retval !=3D -FDT_ERR_NOTFOUND) {
@@ -586,7 +585,7 @@ int qemu_fdt_add_path(void *fdt, const char *path)
         }
=20
         parent =3D retval;
-    } while (p);
+    } while (path);
=20
     return retval;
 }
--=20
2.31.1


