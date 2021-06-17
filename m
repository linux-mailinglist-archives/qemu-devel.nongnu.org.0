Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962A3ABF5D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 01:27:47 +0200 (CEST)
Received: from localhost ([::1]:39182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu1QI-0003SY-DY
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 19:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lu1OR-0000gz-Po; Thu, 17 Jun 2021 19:25:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lu1ON-0007Y9-Sr; Thu, 17 Jun 2021 19:25:51 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HN5EWZ057553; Thu, 17 Jun 2021 19:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+0LKsvzreriNF6VSQApyapBoiAeaZhO2a3iAHxi2Qew=;
 b=Al/XU+uosLD6Z2T0eCCqE9SArUaSG2v14zKB8otOq4YxapBO1Ez7l44PFmMRlc3C//Z+
 mJckzPivSSxSZFz/nKqR2PFL/KyoIiFNRJAUTZCUYg1+5Ho2YLtBJKCvw+EaZj1ctvq+
 NzaFnNBnvbaiVamdrDT7VuRd0n6u0wJiGxJPWOC4ggtQiMpoKnZIms1N6DwDJDvAqWnO
 nvRoIAGujs1tpz87zBYpnz77qNaiE7wyo5O7LNKzq5LOF4mkwt/U7i0GAW2ZlyzMjamW
 SITg95OqywZnesSHRCmrpnRQ2bhZlRSYYz5ODlZ/4KGRmiJ8oCeHfXF61tHt23ljauvh Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398fn98jyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 19:25:44 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HN5dTX059520;
 Thu, 17 Jun 2021 19:25:43 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398fn98jy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 19:25:43 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HNEmhj004306;
 Thu, 17 Jun 2021 23:25:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 394m6htyvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 23:25:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HNPcPZ28443024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 23:25:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7558352051;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 6191E5204F;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 25A4BE033C; Fri, 18 Jun 2021 01:25:38 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH v4 1/4] s390x/css: Introduce an ESW struct
Date: Fri, 18 Jun 2021 01:25:34 +0200
Message-Id: <20210617232537.1337506-2-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617232537.1337506-1-farman@linux.ibm.com>
References: <20210617232537.1337506-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LCP60CSJ-gNQNtGZX0zvxDDDhVmFkMwx
X-Proofpoint-GUID: ZQer7c2rrDd2wQECEjp3UXuDYhZr6AAs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170140
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Interrupt Response Block is comprised of several other
structures concatenated together, but only the 12-byte
Subchannel-Status Word (SCSW) is defined as a proper struct.
Everything else is a simple array of 32-bit words.

Let's define a proper struct for the 20-byte Extended-Status
Word (ESW) so that we can make good decisions about the sense
data that would go into the ECW area for virtual vs
passthrough devices.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 hw/s390x/css.c            | 19 +++++++++++++------
 include/hw/s390x/ioinst.h | 12 +++++++++++-
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index bed46f5ec3..59d935570e 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1335,6 +1335,14 @@ static void copy_schib_to_guest(SCHIB *dest, const SCHIB *src)
     }
 }
 
+static void copy_esw_to_guest(ESW *dest, const ESW *src)
+{
+    dest->word0 = cpu_to_be32(src->word0);
+    dest->erw = cpu_to_be32(src->erw);
+    dest->f_addr = cpu_to_be64(src->f_addr);
+    dest->s_addr = cpu_to_be32(src->s_addr);
+}
+
 IOInstEnding css_do_stsch(SubchDev *sch, SCHIB *schib)
 {
     int ret;
@@ -1604,9 +1612,8 @@ static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW *pmcw,
 
     copy_scsw_to_guest(&dest->scsw, &src->scsw);
 
-    for (i = 0; i < ARRAY_SIZE(dest->esw); i++) {
-        dest->esw[i] = cpu_to_be32(src->esw[i]);
-    }
+    copy_esw_to_guest(&dest->esw, &src->esw);
+
     for (i = 0; i < ARRAY_SIZE(dest->ecw); i++) {
         dest->ecw[i] = cpu_to_be32(src->ecw[i]);
     }
@@ -1655,9 +1662,9 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
                         SCSW_CSTAT_CHN_CTRL_CHK |
                         SCSW_CSTAT_INTF_CTRL_CHK)) {
             irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF;
-            irb.esw[0] = 0x04804000;
+            irb.esw.word0 = 0x04804000;
         } else {
-            irb.esw[0] = 0x00800000;
+            irb.esw.word0 = 0x00800000;
         }
         /* If a unit check is pending, copy sense data. */
         if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
@@ -1670,7 +1677,7 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
             for (i = 0; i < ARRAY_SIZE(irb.ecw); i++) {
                 irb.ecw[i] = be32_to_cpu(irb.ecw[i]);
             }
-            irb.esw[1] = 0x01000000 | (sizeof(sch->sense_data) << 8);
+            irb.esw.erw = ESW_ERW_SENSE | (sizeof(sch->sense_data) << 8);
         }
     }
     /* Store the irb to the guest. */
diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
index c6737a30d4..e7ab401781 100644
--- a/include/hw/s390x/ioinst.h
+++ b/include/hw/s390x/ioinst.h
@@ -123,10 +123,20 @@ typedef struct SCHIB {
     uint8_t mda[4];
 } QEMU_PACKED SCHIB;
 
+/* format-0 extended-status word */
+typedef struct ESW {
+   uint32_t word0;
+   uint32_t erw;
+   uint64_t f_addr;     /* Zeros for other ESW formats */
+   uint32_t s_addr;     /* Zeros for other ESW formats */
+} QEMU_PACKED ESW;
+
+#define ESW_ERW_SENSE 0x01000000
+
 /* interruption response block */
 typedef struct IRB {
     SCSW scsw;
-    uint32_t esw[5];
+    ESW esw;
     uint32_t ecw[8];
     uint32_t emw[8];
 } IRB;
-- 
2.25.1


