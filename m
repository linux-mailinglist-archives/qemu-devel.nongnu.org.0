Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6CC109C5B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 11:33:33 +0100 (CET)
Received: from localhost ([::1]:52418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZY9z-0001QF-Pu
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 05:33:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59402)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuval.shaia@oracle.com>) id 1iZY5W-0006WB-Qe
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:28:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuval.shaia@oracle.com>) id 1iZY5V-0004cd-9x
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:28:54 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:58876)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yuval.shaia@oracle.com>)
 id 1iZY5V-0004YE-0b
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 05:28:53 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQAOW60028235;
 Tue, 26 Nov 2019 10:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2019-08-05; bh=PXOsTrpH7/9uDHp9JJqbJ25Q2HdcOuZEX4qGLEP5Oig=;
 b=f20k+M1rIUDmMfU4Q11pJO9j/rpyzUfUHArDxz4Zk/QxeKh0V6I5LdA3rKZ49PGlC50b
 DasFVqIGMRIMCzFoybthoQPnjzm4rETNRsPUspKRoic4ghgf94CbBoEp5RdMs8hmcizg
 j+pFoS5IMVy22ml/DdDEyPeVzZ+MkboRfxhYMzpy6va0vwj4D6S6PTQCbpdbgDhwu6+0
 Zq0AXw2P2ZFYB+fuuysaLdr/mi4oWM312kCzVbdiSreJ/IE9F4UU6i/SUkPIbLKcHizf
 we3jZlEp7bCN1HfZDQQzjRITOjUeWFZ7+58aMFlpFVhYNCzkMsmL4QA/O9+Nv0OfrdOr Fw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2wevqq5xb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 10:28:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQANP4w180186;
 Tue, 26 Nov 2019 10:26:45 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2wgvh9rqs5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 10:26:44 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAQAQgJ2027932;
 Tue, 26 Nov 2019 10:26:43 GMT
Received: from host4.lan (/37.142.197.130)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 26 Nov 2019 02:26:42 -0800
From: Yuval Shaia <yuval.shaia@oracle.com>
To: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com
Subject: [PATCH] MAINTAINERS: Update Yuval Shaia's email address
Date: Tue, 26 Nov 2019 12:26:37 +0200
Message-Id: <20191126102637.2038-1-yuval.shaia@oracle.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=958
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260095
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 141.146.126.78
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
Cc: Yuval Shaia <yuval.shaia@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use gmail account for maintainer tasks.

Signed-off-by: Yuval Shaia <yuval.shaia@oracle.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e5e3e52d6..4297b54fcb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2640,7 +2640,7 @@ F: tests/test-replication.c
 F: docs/block-replication.txt
 
 PVRDMA
-M: Yuval Shaia <yuval.shaia@oracle.com>
+M: Yuval Shaia <yuval.shaia.ml@gmail.com>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
 S: Maintained
 F: hw/rdma/*
-- 
2.20.1


