Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836344549DB
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 16:25:48 +0100 (CET)
Received: from localhost ([::1]:60524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMol-00028K-KP
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 10:25:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mnMmp-0000oN-8Y; Wed, 17 Nov 2021 10:23:47 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mnMmn-0005op-Eu; Wed, 17 Nov 2021 10:23:47 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHF8AWc016109; 
 Wed, 17 Nov 2021 15:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=0B8QeaUUC2eEXK1e82gsfHn9vTWFn4pVW+uFTadzCwI=;
 b=tNnLFXcCvHLpAkRr2jUNEGX2XkgkUGODj1UG3aEIY/D6lcUFyuDlO64JhBemsK2Kz0HF
 ttPIYf2u8tRaqVrjZLyuaWC483F9nqQ8cqJI49I2sQeQAKpR8/YtfQ7xu3vKvRvngI0g
 T6GHtHqEnDLNQ/+xuXVeXyVsf0aQwEG9teKm/M05A95x0ZfYcKtDwatMEsdXweT9tnxl
 zsbpURSjSWGH74zlVHnK10cfx+8xX7JK9wm0jTU6qqsOgaoY6NAT9QrAls4zFCaYAd/F
 rEJyO3q/bCYlwXuFCr4BW2I0nGJwR8mPJlqkjgE0b00xH4XHRzoYG/ny12ecgs6eEN/O SA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd0nnn9u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 15:23:39 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AHF95Zn024553;
 Wed, 17 Nov 2021 15:23:38 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd0nnn9tm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 15:23:38 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHEqqtD028739;
 Wed, 17 Nov 2021 15:23:37 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 3ca50bnx3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 15:23:37 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AHFNack27984216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 15:23:36 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43F19124052;
 Wed, 17 Nov 2021 15:23:36 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76D4C124054;
 Wed, 17 Nov 2021 15:23:35 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.160.104.209])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 15:23:35 +0000 (GMT)
From: Collin Walling <walling@linux.ibm.com>
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, thuth@redhat.com,
 qemu-stable@nongnu.org
Subject: [PATCH v4] s390: kvm: adjust diag318 resets to retain data
Date: Wed, 17 Nov 2021 10:23:03 -0500
Message-Id: <20211117152303.627969-1-walling@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tfLq0oNlhnPRBVHG5PpGFZVzGY_zxEj4
X-Proofpoint-ORIG-GUID: syrFCvHMLV9ZbeG8ogfBqK2tP6N3k6SX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_05,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 clxscore=1011
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111170074
Received-SPF: pass client-ip=148.163.156.1; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: borntraeger@de.ibm.com, cohuck@redhat.com, frankja@linux.ibm.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The CPNC portion of the diag318 data is erroneously reset during an
initial CPU reset caused by SIGP. Let's go ahead and relocate the
diag318_info field within the CPUS390XState struct such that it is
only zeroed during a clear reset. This way, the CPNC will be retained
for each VCPU in the configuration after the diag318 instruction
has been invoked.

The s390_machine_reset code already takes care of zeroing the diag318
data on VM resets, which also cover resets caused by diag308.

Signed-off-by: Collin Walling <walling@linux.ibm.com>
Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@linux.ibm.com> 
---

Changelog:

    v4
    - fixed up commit message and added r-b's

    v3
    - reverted changes from previous versions
    - simply relocate diag318_info in CPU State struct
    - add comment in set_diag318 to explain resets

    v2
    - handler uses run_on_cpu again
    - reworded commit message slightly
    - added fixes and reported-by tags 

    v3
    - nixed code reduction changes
    - added a comment to diag318 handler to briefly describe
        when relevent data is zeroed

---
 target/s390x/cpu.h     | 4 ++--
 target/s390x/kvm/kvm.c | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 3153d053e9..88aace36ff 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -63,6 +63,8 @@ struct CPUS390XState {
     uint64_t etoken;       /* etoken */
     uint64_t etoken_extension; /* etoken extension */
 
+    uint64_t diag318_info;
+
     /* Fields up to this point are not cleared by initial CPU reset */
     struct {} start_initial_reset_fields;
 
@@ -118,8 +120,6 @@ struct CPUS390XState {
     uint16_t external_call_addr;
     DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
 
-    uint64_t diag318_info;
-
 #if !defined(CONFIG_USER_ONLY)
     uint64_t tlb_fill_tec;   /* translation exception code during tlb_fill */
     int tlb_fill_exc;        /* exception number seen during tlb_fill */
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5b1fdb55c4..6acf14d5ec 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -1585,6 +1585,10 @@ void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
         env->diag318_info = diag318_info;
         cs->kvm_run->s.regs.diag318 = diag318_info;
         cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
+        /*
+         * diag 318 info is zeroed during a clear reset and
+         * diag 308 IPL subcodes.
+         */
     }
 }
 
-- 
2.31.1


