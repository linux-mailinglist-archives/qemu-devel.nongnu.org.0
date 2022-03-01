Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337434C8DF4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 15:38:09 +0100 (CET)
Received: from localhost ([::1]:54742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP3dg-0002Zw-4N
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 09:38:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3Og-0002m2-H8
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1nP3Oe-0007OG-D5
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 09:22:37 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221DNM7V002260
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NNV1BcRZJ59KCx6eBmTQXkCCy618KTBFlmdEAe9WNAA=;
 b=XQl0iOk6/r2hNoXMSmFCzTNxaqCtWjUXpu2EespkbnI6DqcTOVN7N2yLb4hLm1atq3O+
 WLEiLld9lJjHpZobjOm9t4iRMGnF8BmXYHo+3Io3MSi08mJ9kALqGdeVzso/55DASA+q
 M/psz3BewsVDyDxOPuVCXheInQi9H0pNZIXtrdg9TCIrcQ7io2pbudo/+7boGKaEyJ4Z
 3YzME2RwBYmjybLO7MdLUxSJmJfYkb4zvmz+xqR/TNS+zXnHanW4iLkFTCT0twuFz6fD
 5lSZrGt3x/mgaTnHd+icr8OGiY164NSSJRKYdXqpEQb2wBy/tRHIZayUIUnENAQ8hoAa 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehgc6q8ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:22:33 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 221DSf96025092
 for <qemu-devel@nongnu.org>; Tue, 1 Mar 2022 14:22:33 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehgc6q8kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:33 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221EKbUv006592;
 Tue, 1 Mar 2022 14:22:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3efbfjkxqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 14:22:30 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221EMSGR46989618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 14:22:28 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8829711C04C;
 Tue,  1 Mar 2022 14:22:28 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B644D11C04A;
 Tue,  1 Mar 2022 14:22:27 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Mar 2022 14:22:27 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] dump: Cleanup dump_begin write functions
Date: Tue,  1 Mar 2022 14:22:12 +0000
Message-Id: <20220301142213.28568-7-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301142213.28568-1-frankja@linux.ibm.com>
References: <20220301142213.28568-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ak7lG_XXmnQ9022NZFqzZZLomuzD34CX
X-Proofpoint-ORIG-GUID: y107RcEJTCEWZCM5bs7l6eJmzmB79s2C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=819
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no need to have a gigantic if in there let's move the elf
32/64 bit logic into the section, segment or note code.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 52 ++++++++++++++++------------------------------------
 1 file changed, 16 insertions(+), 36 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 88c2dbb466..78654b9c27 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -554,52 +554,32 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    if (dump_is_64bit(s)) {
-        /* write all PT_LOAD to vmcore */
-        write_elf_loads(s, &local_err);
+    /* write all PT_LOAD to vmcore */
+    write_elf_loads(s, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    /* write section to vmcore */
+    if (s->shdr_num) {
+        write_elf_section(s, 1, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
         }
+    }
 
-        /* write section to vmcore */
-        if (s->shdr_num) {
-            write_elf_section(s, 1, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
-                return;
-            }
-        }
-
+    if (dump_is_64bit(s)) {
         /* write notes to vmcore */
         write_elf64_notes(fd_write_vmcore, s, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
     } else {
-        /* write all PT_LOAD to vmcore */
-        write_elf_loads(s, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
-
-        /* write section to vmcore */
-        if (s->shdr_num) {
-            write_elf_section(s, 0, &local_err);
-            if (local_err) {
-                error_propagate(errp, local_err);
-                return;
-            }
-        }
-
         /* write notes to vmcore */
         write_elf32_notes(fd_write_vmcore, s, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            return;
-        }
+    }
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
     }
 }
 
-- 
2.32.0


