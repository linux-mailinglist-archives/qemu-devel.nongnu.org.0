Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1280517E142
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 14:33:50 +0100 (CET)
Received: from localhost ([::1]:43274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBIXV-0000gI-6B
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 09:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pasic@linux.ibm.com>) id 1jBIWT-0000E1-26
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 09:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pasic@linux.ibm.com>) id 1jBIWS-0003lb-1G
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 09:32:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12239)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pasic@linux.ibm.com>) id 1jBIWR-0003l0-QS
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 09:32:43 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 029DOONe051076
 for <qemu-devel@nongnu.org>; Mon, 9 Mar 2020 09:32:42 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym6tmsku9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Mar 2020 09:32:42 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <pasic@linux.ibm.com>;
 Mon, 9 Mar 2020 13:32:40 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 9 Mar 2020 13:32:36 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 029DWY3P53936364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2020 13:32:35 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D541752059;
 Mon,  9 Mar 2020 13:32:34 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7804852054;
 Mon,  9 Mar 2020 13:32:34 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] s390/ipl: sync back loadparm
Date: Mon,  9 Mar 2020 14:32:23 +0100
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
x-cbid: 20030913-0016-0000-0000-000002EE9EA4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030913-0017-0000-0000-00003351FE64
Message-Id: <20200309133223.100491-1-pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_04:2020-03-09,
 2020-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003090092
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marc Hartmayer <mhartmay@linux.ibm.com>, Michael Mueller <mimu@linux.ibm.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We expose loadparm as a r/w machine property, but if loadparm is set by
the guest via DIAG 308, we don't update the property. Having a
disconnect between the guest view and the QEMU property is not nice in
itself, but things get even worse for SCSI, where under certain
circumstances (see 789b5a401b "s390: Ensure IPL from SCSI works as
expected" for details) we call s390_gen_initial_iplb() on resets
effectively overwriting the guest/user supplied loadparm with the stale
value.

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Fixes: 7104bae9de ("hw/s390x: provide loadparm property for the machine")
Reported-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Viktor Mihajlovski <mihajlov@linux.ibm.com>
Tested-by: Marc Hartmayer <mhartmay@linux.ibm.com>
---
v1 --> v2:
* tweaked the Fixes tag (Connie)
* s/mo/machine/ (David)
* We decided to not abort if the setter fails. It is not clear where
  do the validation logic come from in the first place. For now lets put
  out a warning if things go wrong.
  The warning we get looks something like:
  qemu-system-s390x: warning: LOADPARM: invalid character '?' (ASCII 0x3f)
* I keept the r-b's and the tested-by as the changes are minor. Please
  shout at me if you object.
---
 hw/s390x/ipl.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 9c1ecd423c..8bd50de44c 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -538,6 +538,30 @@ static bool is_virtio_scsi_device(IplParameterBlock *iplb)
     return is_virtio_ccw_device_of_type(iplb, VIRTIO_ID_SCSI);
 }
 
+static void update_machine_ipl_properties(IplParameterBlock *iplb)
+{
+    Object *machine = qdev_get_machine();
+    Error *err = NULL;
+
+    /* Sync loadparm */
+    if (iplb->flags & DIAG308_FLAGS_LP_VALID) {
+        char ascii_loadparm[8];
+        int i;
+        uint8_t *ebcdic_loadparm = iplb->loadparm;
+
+        for (i = 0; i < 8 && ebcdic_loadparm[i]; i++) {
+            ascii_loadparm[i] = ebcdic2ascii[(uint8_t) ebcdic_loadparm[i]];
+        }
+        ascii_loadparm[i] = 0;
+        object_property_set_str(machine, ascii_loadparm, "loadparm", &err);
+    } else {
+        object_property_set_str(machine, "", "loadparm", &err);
+    }
+    if (err) {
+        warn_report_err(err);
+    }
+}
+
 void s390_ipl_update_diag308(IplParameterBlock *iplb)
 {
     S390IPLState *ipl = get_ipl_device();
@@ -545,6 +569,7 @@ void s390_ipl_update_diag308(IplParameterBlock *iplb)
     ipl->iplb = *iplb;
     ipl->iplb_valid = true;
     ipl->netboot = is_virtio_net_device(iplb);
+    update_machine_ipl_properties(iplb);
 }
 
 IplParameterBlock *s390_ipl_get_iplb(void)

base-commit: 67f17e23baca5dd545fe98b01169cc351a70fe35
-- 
2.17.1


