Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E692A75F9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 23:11:09 +0200 (CEST)
Received: from localhost ([::1]:51540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5G4x-0001tT-4m
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 17:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jag.raman@oracle.com>) id 1i5FaX-0008Ff-Fe
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:39:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jag.raman@oracle.com>) id 1i5FaW-0000vn-Az
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:39:41 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:56556)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jag.raman@oracle.com>)
 id 1i5FaW-0008Lu-39
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 16:39:40 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x83KXfUl053263;
 Tue, 3 Sep 2019 20:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2019-08-05;
 bh=T3mfHAj9+HL3xKXNgTXtFXhOJtn0MsOFyDfMHjSkdBA=;
 b=XRgP0ROpck6UAXjqTERRODdemzSq1oweuftKHOjSfzJO/2YZ2BfbzG7ZX9ow2iIVV3XZ
 +UEXyAHnSgkWpW+JOmg5EB8hzYMPSV+IRvfqXxbM5Gh6YHWz6eNmBxrv4on1jBvOobAE
 J2XBIuL0nXx6odmKduyKw01lJqRbI6jxfzfbV+vDnzDPcv7FXNxE2ZFGRNm6u8pIrmcN
 yZRDowpFRCgzP/WJmBM72TxnLlZmLVHI0vKYz2qvb4hngwoo8bpslqiTpx4/YT9SNXKh
 9tVsZV1gGI50rb7I9HB4qMqx1fkrOzITNtJlaaylY7eSRrsvDi+Z5ZXuItizVLv9i58j Lg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 2usy6n01ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Sep 2019 20:38:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x83KcH1Z094699;
 Tue, 3 Sep 2019 20:38:29 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2usu51u17c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 Sep 2019 20:38:29 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x83KcST7017254;
 Tue, 3 Sep 2019 20:38:28 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 03 Sep 2019 13:38:27 -0700
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Date: Tue,  3 Sep 2019 16:37:29 -0400
Message-Id: <3dfc129055ff32b7b55bdcd7142baec1547bcd25.1567534653.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1567534653.git.jag.raman@oracle.com>
References: <cover.1567534653.git.jag.raman@oracle.com>
In-Reply-To: <cover.1567534653.git.jag.raman@oracle.com>
References: <cover.1567534653.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909030207
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9369
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909030206
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 141.146.126.78
Subject: [Qemu-devel] [RFC v3 PATCH 03/45] multi-process: add a command line
 option for debug file
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, john.g.johnson@oracle.com,
 kraxel@redhat.com, jag.raman@oracle.com, quintela@redhat.com, mst@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 liran.alon@oracle.com, stefanha@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Can be used with -d rdebug command options when starting qemu.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 include/qemu/log.h | 1 +
 util/log.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index b097a6c..ca6f490 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -45,6 +45,7 @@ static inline bool qemu_log_separate(void)
 /* LOG_TRACE (1 << 15) is defined in log-for-trace.h */
 #define CPU_LOG_TB_OP_IND  (1 << 16)
 #define CPU_LOG_TB_FPU     (1 << 17)
+#define LOG_REMOTE_DEBUG   (1 << 18)
 
 /* Lock output for a series of related logs.  Since this is not needed
  * for a single qemu_log / qemu_log_mask / qemu_log_mask_and_addr, we
diff --git a/util/log.c b/util/log.c
index 1d1b33f..78e3e82 100644
--- a/util/log.c
+++ b/util/log.c
@@ -273,6 +273,8 @@ const QEMULogItem qemu_log_items[] = {
     { CPU_LOG_TB_NOCHAIN, "nochain",
       "do not chain compiled TBs so that \"exec\" and \"cpu\" show\n"
       "complete traces" },
+    { LOG_REMOTE_DEBUG, "rdebug",
+      "log remote debug" },
     { 0, NULL, NULL },
 };
 
-- 
1.8.3.1


