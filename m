Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C91D165DF9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 13:59:14 +0100 (CET)
Received: from localhost ([::1]:40944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4lQ9-0007bi-IM
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 07:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53990)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j4lOf-0005tl-2V
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:57:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j4lOa-0006R7-Jl
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:57:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30064)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j4lOa-0006QU-Bs
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:57:36 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KCsJg1066136
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 07:57:35 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubg87vs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 07:57:35 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 20 Feb 2020 12:57:33 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 12:57:31 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KCvV3d54526170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 12:57:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01FD2AE04D;
 Thu, 20 Feb 2020 12:57:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA9AFAE045;
 Thu, 20 Feb 2020 12:57:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.185.143])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 12:57:29 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/16] s390x: protvirt: Add diag308 subcodes 8 - 10
Date: Thu, 20 Feb 2020 07:56:24 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220125638.7241-1-frankja@linux.ibm.com>
References: <20200220125638.7241-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022012-0016-0000-0000-000002E89799
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022012-0017-0000-0000-0000334BB3E8
Message-Id: <20200220125638.7241-3-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_03:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=3 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200097
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
Cc: qemu-s390x@nongnu.org, mihajlov@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For diag308 subcodes 8 - 10 we have a new ipib of type 5. The ipib
holds the address and length of the secure execution header, as well
as a list of guest components.

Each component is a block of memory, for example kernel or initrd,
which needs to be decrypted by the Ultravisor in order to run a
protected VM. The secure execution header instructs the Ultravisor on
how to handle the protected VM and its components.

Subcodes 8 and 9 are similiar to 5 and 6 and subcode 10 will finally
start the protected guest.

Subcodes 8-10 are not valid in protected mode, we have to do a subcode
3 and then the 8 and 10 combination for a protected reboot.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 hw/s390x/ipl.c      | 48 ++++++++++++++++++++++++++++++++++++++++++---
 hw/s390x/ipl.h      | 31 +++++++++++++++++++++++++++++
 target/s390x/diag.c | 27 ++++++++++++++++++++++---
 3 files changed, 100 insertions(+), 6 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 7773499d7f..e92d989813 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -538,15 +538,56 @@ static bool is_virtio_scsi_device(IplParameterBlock *iplb)
     return is_virtio_ccw_device_of_type(iplb, VIRTIO_ID_SCSI);
 }
 
+int s390_ipl_pv_check_components(IplParameterBlock *iplb)
+{
+    int i;
+    IPLBlockPV *ipib_pv = &iplb->pv;
+
+    if (ipib_pv->num_comp == 0) {
+        return -EINVAL;
+    }
+
+    for (i = 0; i < ipib_pv->num_comp; i++) {
+
+        /* Addr must be 4k aligned */
+        if (ipib_pv->components[i].addr & ~TARGET_PAGE_MASK) {
+            return -EINVAL;
+        }
+
+        /* Tweak prefix is monotonously increasing with each component */
+        if (i < ipib_pv->num_comp - 1 &&
+            ipib_pv->components[i].tweak_pref >
+            ipib_pv->components[i + 1].tweak_pref) {
+            return -EINVAL;
+        }
+    }
+    return 1;
+}
+
 void s390_ipl_update_diag308(IplParameterBlock *iplb)
 {
     S390IPLState *ipl = get_ipl_device();
 
-    ipl->iplb = *iplb;
-    ipl->iplb_valid = true;
+    if (iplb->pbt == S390_IPL_TYPE_PV) {
+        ipl->iplb_pv = *iplb;
+        ipl->iplb_valid_pv = true;
+    } else {
+        ipl->iplb = *iplb;
+        ipl->iplb_valid = true;
+    }
     ipl->netboot = is_virtio_net_device(iplb);
 }
 
+IplParameterBlock *s390_ipl_get_iplb_secure(void)
+{
+    S390IPLState *ipl = get_ipl_device();
+
+    if (!ipl->iplb_valid_pv) {
+        return NULL;
+    }
+    return &ipl->iplb_pv;
+}
+
 IplParameterBlock *s390_ipl_get_iplb(void)
 {
     S390IPLState *ipl = get_ipl_device();
@@ -561,7 +602,8 @@ void s390_ipl_reset_request(CPUState *cs, enum s390_reset reset_type)
 {
     S390IPLState *ipl = get_ipl_device();
 
-    if (reset_type == S390_RESET_EXTERNAL || reset_type == S390_RESET_REIPL) {
+    if (reset_type == S390_RESET_EXTERNAL || reset_type == S390_RESET_REIPL ||
+        reset_type == S390_RESET_PV) {
         /* use CPU 0 for full resets */
         ipl->reset_cpu_index = 0;
     } else {
diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
index d4813105db..3c4bb66eda 100644
--- a/hw/s390x/ipl.h
+++ b/hw/s390x/ipl.h
@@ -15,6 +15,23 @@
 #include "cpu.h"
 #include "hw/qdev-core.h"
 
+struct IPLBlockPVComp {
+    uint64_t tweak_pref;
+    uint64_t addr;
+    uint64_t size;
+} QEMU_PACKED;
+typedef struct IPLBlockPVComp IPLBlockPVComp;
+
+struct IPLBlockPV {
+    uint8_t  reserved[87];
+    uint8_t  version;
+    uint32_t num_comp;
+    uint64_t pv_header_addr;
+    uint64_t pv_header_len;
+    struct IPLBlockPVComp components[];
+} QEMU_PACKED;
+typedef struct IPLBlockPV IPLBlockPV;
+
 struct IplBlockCcw {
     uint8_t  reserved0[85];
     uint8_t  ssid;
@@ -71,6 +88,7 @@ union IplParameterBlock {
         union {
             IplBlockCcw ccw;
             IplBlockFcp fcp;
+            IPLBlockPV pv;
             IplBlockQemuScsi scsi;
         };
     } QEMU_PACKED;
@@ -84,9 +102,11 @@ union IplParameterBlock {
 typedef union IplParameterBlock IplParameterBlock;
 
 int s390_ipl_set_loadparm(uint8_t *loadparm);
+int s390_ipl_pv_check_components(IplParameterBlock *iplb);
 void s390_ipl_update_diag308(IplParameterBlock *iplb);
 void s390_ipl_prepare_cpu(S390CPU *cpu);
 IplParameterBlock *s390_ipl_get_iplb(void);
+IplParameterBlock *s390_ipl_get_iplb_secure(void);
 
 enum s390_reset {
     /* default is a reset not triggered by a CPU e.g. issued by QMP */
@@ -94,6 +114,7 @@ enum s390_reset {
     S390_RESET_REIPL,
     S390_RESET_MODIFIED_CLEAR,
     S390_RESET_LOAD_NORMAL,
+    S390_RESET_PV,
 };
 void s390_ipl_reset_request(CPUState *cs, enum s390_reset reset_type);
 void s390_ipl_get_reset_request(CPUState **cs, enum s390_reset *reset_type);
@@ -133,6 +154,7 @@ struct S390IPLState {
     /*< private >*/
     DeviceState parent_obj;
     IplParameterBlock iplb;
+    IplParameterBlock iplb_pv;
     QemuIplParameters qipl;
     uint64_t start_addr;
     uint64_t compat_start_addr;
@@ -140,6 +162,7 @@ struct S390IPLState {
     uint64_t compat_bios_start_addr;
     bool enforce_bios;
     bool iplb_valid;
+    bool iplb_valid_pv;
     bool netboot;
     /* reset related properties don't have to be migrated or reset */
     enum s390_reset reset_type;
@@ -161,9 +184,11 @@ QEMU_BUILD_BUG_MSG(offsetof(S390IPLState, iplb) & 3, "alignment of iplb wrong");
 
 #define S390_IPL_TYPE_FCP 0x00
 #define S390_IPL_TYPE_CCW 0x02
+#define S390_IPL_TYPE_PV 0x05
 #define S390_IPL_TYPE_QEMU_SCSI 0xff
 
 #define S390_IPLB_HEADER_LEN 8
+#define S390_IPLB_MIN_PV_LEN 148
 #define S390_IPLB_MIN_CCW_LEN 200
 #define S390_IPLB_MIN_FCP_LEN 384
 #define S390_IPLB_MIN_QEMU_SCSI_LEN 200
@@ -185,4 +210,10 @@ static inline bool iplb_valid_fcp(IplParameterBlock *iplb)
            iplb->pbt == S390_IPL_TYPE_FCP;
 }
 
+static inline bool iplb_valid_pv(IplParameterBlock *iplb)
+{
+    return be32_to_cpu(iplb->len) >= S390_IPLB_MIN_PV_LEN &&
+           iplb->pbt == S390_IPL_TYPE_PV;
+}
+
 #endif
diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index b5aec06d6b..5e77d85652 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -52,6 +52,8 @@ int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
 #define DIAG_308_RC_OK              0x0001
 #define DIAG_308_RC_NO_CONF         0x0102
 #define DIAG_308_RC_INVALID         0x0402
+#define DIAG_308_RC_NO_PV_CONF      0x0a02
+#define DIAG_308_RC_INVAL_FOR_PV    0x0b02
 
 #define DIAG308_RESET_MOD_CLR       0
 #define DIAG308_RESET_LOAD_NORM     1
@@ -59,6 +61,9 @@ int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
 #define DIAG308_LOAD_NORMAL_DUMP    4
 #define DIAG308_SET                 5
 #define DIAG308_STORE               6
+#define DIAG308_PV_SET              8
+#define DIAG308_PV_STORE            9
+#define DIAG308_PV_START            10
 
 static int diag308_parm_check(CPUS390XState *env, uint64_t r1, uint64_t addr,
                               uintptr_t ra, bool write)
@@ -105,6 +110,7 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
         s390_ipl_reset_request(cs, S390_RESET_REIPL);
         break;
     case DIAG308_SET:
+    case DIAG308_PV_SET:
         if (diag308_parm_check(env, r1, addr, ra, false)) {
             return;
         }
@@ -117,7 +123,8 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
 
         cpu_physical_memory_read(addr, iplb, be32_to_cpu(iplb->len));
 
-        if (!iplb_valid_ccw(iplb) && !iplb_valid_fcp(iplb)) {
+        if (!iplb_valid_ccw(iplb) && !iplb_valid_fcp(iplb) &&
+            !(iplb_valid_pv(iplb) && s390_ipl_pv_check_components(iplb) >= 0)) {
             env->regs[r1 + 1] = DIAG_308_RC_INVALID;
             goto out;
         }
@@ -128,17 +135,31 @@ out:
         g_free(iplb);
         return;
     case DIAG308_STORE:
+    case DIAG308_PV_STORE:
         if (diag308_parm_check(env, r1, addr, ra, true)) {
             return;
         }
-        iplb = s390_ipl_get_iplb();
+        if (subcode == DIAG308_PV_STORE) {
+            iplb = s390_ipl_get_iplb_secure();
+        } else {
+            iplb = s390_ipl_get_iplb();
+        }
         if (iplb) {
             cpu_physical_memory_write(addr, iplb, be32_to_cpu(iplb->len));
             env->regs[r1 + 1] = DIAG_308_RC_OK;
         } else {
             env->regs[r1 + 1] = DIAG_308_RC_NO_CONF;
         }
-        return;
+        break;
+    case DIAG308_PV_START:
+        iplb = s390_ipl_get_iplb_secure();
+        if (!iplb || !iplb_valid_pv(iplb)) {
+            env->regs[r1 + 1] = DIAG_308_RC_NO_PV_CONF;
+            return;
+        }
+
+        s390_ipl_reset_request(cs, S390_RESET_PV);
+        break;
     default:
         s390_program_interrupt(env, PGM_SPECIFICATION, ra);
         break;
-- 
2.20.1


