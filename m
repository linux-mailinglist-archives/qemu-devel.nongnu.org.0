Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43EF1D2FFD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 14:39:33 +0200 (CEST)
Received: from localhost ([::1]:37054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZD9A-0004x6-Qp
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 08:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jZD7O-0003Dm-Mq; Thu, 14 May 2020 08:37:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1jZD7N-0006UU-CA; Thu, 14 May 2020 08:37:42 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04ECW3GX065832; Thu, 14 May 2020 08:37:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310syx24t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 08:37:39 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04ECWo50072201;
 Thu, 14 May 2020 08:37:38 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310syx24sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 08:37:38 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04ECZN5R007631;
 Thu, 14 May 2020 12:37:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3100ubbn7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 May 2020 12:37:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04ECaM5b58720522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 May 2020 12:36:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFA2BA4054;
 Thu, 14 May 2020 12:37:33 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DAD3A4060;
 Thu, 14 May 2020 12:37:33 +0000 (GMT)
Received: from linux01.pok.stglabs.ibm.com (unknown [9.114.17.81])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 May 2020 12:37:33 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/9] pc-bios: s390x: cio.c cleanup and compile fix
Date: Thu, 14 May 2020 08:37:21 -0400
Message-Id: <20200514123729.156283-2-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200514123729.156283-1-frankja@linux.ibm.com>
References: <20200514123729.156283-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-14_02:2020-05-14,
 2020-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=1
 spamscore=0 bulkscore=0 impostorscore=0 cotscore=-2147483648 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=602 malwarescore=0
 clxscore=1015 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005140109
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 07:20:14
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's initialize the structs at the beginning to ease reading and also
zeroing all other fields. This also makes the compiler stop
compalining about sense_id_ccw.flags being ored into when it's not
initialized.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
---
 pc-bios/s390-ccw/cio.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/pc-bios/s390-ccw/cio.c b/pc-bios/s390-ccw/cio.c
index 339ec5fbe7..63301ebb58 100644
--- a/pc-bios/s390-ccw/cio.c
+++ b/pc-bios/s390-ccw/cio.c
@@ -49,13 +49,13 @@ void enable_subchannel(SubChannelId schid)
 
 uint16_t cu_type(SubChannelId schid)
 {
-    Ccw1 sense_id_ccw;
     SenseId sense_data;
-
-    sense_id_ccw.cmd_code = CCW_CMD_SENSE_ID;
-    sense_id_ccw.cda = ptr2u32(&sense_data);
-    sense_id_ccw.count = sizeof(sense_data);
-    sense_id_ccw.flags |= CCW_FLAG_SLI;
+    Ccw1 sense_id_ccw = {
+        .cmd_code = CCW_CMD_SENSE_ID,
+        .count = sizeof(sense_data),
+        .flags = CCW_FLAG_SLI,
+        .cda = ptr2u32(&sense_data),
+    };
 
     if (do_cio(schid, CU_TYPE_UNKNOWN, ptr2u32(&sense_id_ccw), CCW_FMT1)) {
         panic("Failed to run SenseID CCw\n");
@@ -67,13 +67,13 @@ uint16_t cu_type(SubChannelId schid)
 int basic_sense(SubChannelId schid, uint16_t cutype, void *sense_data,
                  uint16_t data_size)
 {
-    Ccw1 senseCcw;
+    Ccw1 senseCcw = {
+        .cmd_code = CCW_CMD_BASIC_SENSE,
+        .count = data_size,
+        .cda = ptr2u32(sense_data),
+    };
     Irb irb;
 
-    senseCcw.cmd_code = CCW_CMD_BASIC_SENSE;
-    senseCcw.cda = ptr2u32(sense_data);
-    senseCcw.count = data_size;
-
     return __do_cio(schid, ptr2u32(&senseCcw), CCW_FMT1, &irb);
 }
 
@@ -314,7 +314,13 @@ static void print_irb_err(Irb *irb)
  */
 static int __do_cio(SubChannelId schid, uint32_t ccw_addr, int fmt, Irb *irb)
 {
-    CmdOrb orb = {};
+    CmdOrb orb = {
+        .fmt = fmt,
+        .pfch = 1,	/* QEMU's cio implementation requires prefetch */
+        .c64 = 1,	/* QEMU's cio implementation requires 64-bit idaws */
+        .lpm = 0xFF,	/* All paths allowed */
+        .cpa = ccw_addr,
+    };
     int rc;
 
     IPL_assert(fmt == 0 || fmt == 1, "Invalid ccw format");
@@ -324,12 +330,6 @@ static int __do_cio(SubChannelId schid, uint32_t ccw_addr, int fmt, Irb *irb)
         IPL_assert(ccw_addr <= 0xFFFFFF - 8, "Invalid ccw address");
     }
 
-    orb.fmt = fmt;
-    orb.pfch = 1;  /* QEMU's cio implementation requires prefetch */
-    orb.c64 = 1;   /* QEMU's cio implementation requires 64-bit idaws */
-    orb.lpm = 0xFF; /* All paths allowed */
-    orb.cpa = ccw_addr;
-
     rc = ssch(schid, &orb);
     if (rc == 1 || rc == 2) {
         /* Subchannel status pending or busy. Eat status and ask for retry. */
-- 
2.25.1


