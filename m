Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E3265FA22
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:26:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdDq-0002uz-Al; Thu, 05 Jan 2023 22:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDF-0002dN-5J
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:16 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDC-0008VI-IB
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974966; x=1704510966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WeHy9ds5VHauRN8/y2zq21Dl7c1lbc71l/7+X7pYlpU=;
 b=OMg7Gy0TW+8kmBk+oDHk+YVfWLesnFC+t7oLOS+ZHKn/cq/ORTNT8AI1
 XHpgYTnNOqeDy94I79z0P9yO2yGOC5qnZxm5ynnYXZjQY8r2NtaOSy9GX
 37HBe4UTJz9WRaP9PAFbDJKVuTBU1sd+S+fxeZkXpABaXf0O4cWupw/Nu
 9Yfq/Xhvw+l1QKHJGHFT6rACurFi0eTo0rmoXAnBF3X+sER5+gEnXkyG7
 EEdjnDI3WTlcHtQfVusF3ovEPsThtmviWkhOlBI6RFhrAMqjpTDmF7j9n
 eY8SfhYNGt6LvoxKlAZR6E57JDSjCqWUWeoU3rMLc+fXI9fDudtCrJ7xW g==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254832"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:15:05 +0800
IronPort-SDR: cxDHmjxS19dKXv4Fw/zOrLNIVnGV4PAmgwt/hO/HpiXBBO/qxMwodkpRMQyeVIVbwXcKTz5YhW
 JOqQ4T9xxrAgMqDkxHAZhnfMTyD/G5YL2jTaw6YcxhXDC90wecHmCNXpdx2vE8oC/0uILh2EkV
 wbJ3iGbZFlVoys4gOc+cPYKfkqJPDFWU/YPjWdgyDZ1MVMHVlCi/lsWtPG15wrkb0qYXy1L/W3
 Sojgbbh72HEgyaAfm7DHFUGl8ylu/GKbmll8iz5mTbuKHD3jhMT7dcthdtW0eG5EQkUuARTt9f
 3lk=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:16 -0800
IronPort-SDR: v/hexP0Uf0ndnPks64zruBKc/TmrivSGKhs/NvK21c8uhvPrfHTzSFNKU1jU0EJYdmJOKxKHvf
 hW/YU9KwuJhvpVmOqKNDtvbsbMSPN8MVfVQPcg9TKEyZF9wWupryy6jBV1ogOCE2mXPEf8wrKt
 taqhyrMD88hlJwi1LVt0dTGQT5FAXqXUH2yDEoETvzurEhmLjj6qaLobyWSq0l7URDqSYsmhST
 RMQU/JrOZq5FWIXDpANpf6rntWdggWDZML8dBTY4KCrWcFoThjRFn+lV/orZQDzv+v/wlM3ArW
 IHQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:06 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kK0Bcfz1RwqL
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:15:05 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974904; x=1675566905; bh=WeHy9ds5VHauRN8/y2
 zq21Dl7c1lbc71l/7+X7pYlpU=; b=qmvtS21oGbxu4rb/TlbgfAuj4Td5he0MxK
 epHlbGRiJK8YwInbBwPLmAzaTXMwItxQA+xgG2H4ofYQc96xMRVx2GIr8lxdJcHY
 d7ADHBgKDvE3dBbO6Tj//4SWq+nkOuwg1ndbHYkd0Rmf1HyuqySr9aAStRuyjb4A
 LQrTGq28qr4MEfLb/V1ZxXPvjlLNReMML8TKN0H5PkeY7jUOZfzADt290TOB+513
 acZ8SNdXjOBv0KCYPX+vunN+L9Mxyg0NTIfdpNijdsKaufT7oxT23EO49CiigxE+
 PVap1qxGVd/lDtM+kW6EKbixwARwO7ulrTMAF3fuPSQzjkKZeppw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RSdkUfcs9ymJ for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:15:04 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7kH2yB0z1RvLy;
 Thu,  5 Jan 2023 19:15:02 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 34/43] hw/intc: sifive_plic: Improve robustness of the PLIC
 config parser
Date: Fri,  6 Jan 2023 13:13:48 +1000
Message-Id: <20230106031357.777790-35-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

At present the PLIC config parser can only handle legal config string
like "MS,MS". However if a config string like ",MS,MS,,MS,MS,," is
given the parser won't get the correct configuration.

This commit improves the config parser to make it more robust.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-7-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 936dcf74bc..c9af94a888 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -290,7 +290,7 @@ static void sifive_plic_reset(DeviceState *dev)
  */
 static void parse_hart_config(SiFivePLICState *plic)
 {
-    int addrid, hartid, modes;
+    int addrid, hartid, modes, m;
     const char *p;
     char c;
=20
@@ -299,11 +299,13 @@ static void parse_hart_config(SiFivePLICState *plic=
)
     p =3D plic->hart_config;
     while ((c =3D *p++)) {
         if (c =3D=3D ',') {
-            addrid +=3D ctpop8(modes);
-            modes =3D 0;
-            hartid++;
+            if (modes) {
+                addrid +=3D ctpop8(modes);
+                hartid++;
+                modes =3D 0;
+            }
         } else {
-            int m =3D 1 << char_to_mode(c);
+            m =3D 1 << char_to_mode(c);
             if (modes =3D=3D (modes | m)) {
                 error_report("plic: duplicate mode '%c' in config: %s",
                              c, plic->hart_config);
@@ -314,8 +316,9 @@ static void parse_hart_config(SiFivePLICState *plic)
     }
     if (modes) {
         addrid +=3D ctpop8(modes);
+        hartid++;
+        modes =3D 0;
     }
-    hartid++;
=20
     plic->num_addrs =3D addrid;
     plic->num_harts =3D hartid;
@@ -326,11 +329,16 @@ static void parse_hart_config(SiFivePLICState *plic=
)
     p =3D plic->hart_config;
     while ((c =3D *p++)) {
         if (c =3D=3D ',') {
-            hartid++;
+            if (modes) {
+                hartid++;
+                modes =3D 0;
+            }
         } else {
+            m =3D char_to_mode(c);
             plic->addr_config[addrid].addrid =3D addrid;
             plic->addr_config[addrid].hartid =3D hartid;
-            plic->addr_config[addrid].mode =3D char_to_mode(c);
+            plic->addr_config[addrid].mode =3D m;
+            modes |=3D (1 << m);
             addrid++;
         }
     }
--=20
2.39.0


