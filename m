Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF8617AF18
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 20:42:15 +0100 (CET)
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9wNq-0004XQ-FB
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 14:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanb@linux.vnet.ibm.com>) id 1j9wKj-0007Ov-Vc
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 14:39:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.vnet.ibm.com>) id 1j9wKi-0005FC-97
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 14:39:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13618
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1j9wKi-0005Du-3s
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 14:39:00 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 025JL3sT098165; Thu, 5 Mar 2020 14:38:58 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhr4kncyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2020 14:38:58 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 025JPUrd109231;
 Thu, 5 Mar 2020 14:38:58 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yhr4kncyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2020 14:38:58 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 025JaIiN013487;
 Thu, 5 Mar 2020 19:38:57 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 2yffk8182q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Mar 2020 19:38:57 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 025JcucC54198696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 19:38:56 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91DCE124053;
 Thu,  5 Mar 2020 19:38:56 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78D94124058;
 Thu,  5 Mar 2020 19:38:56 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  5 Mar 2020 19:38:56 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/10] tpm: Use TPMState as a common struct
Date: Thu,  5 Mar 2020 14:38:47 -0500
Message-Id: <20200305193855.278878-3-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200305193855.278878-1-stefanb@linux.vnet.ibm.com>
References: <20200305193855.278878-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_06:2020-03-05,
 2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=1 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003050114
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, peter.maydell@linaro.org,
 Stefan Berger <stefanb@linux.ibm.com>, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

As we plan to introduce a SysBus TPM TIS device, let's
make the TPMState a common struct usable by both the
ISADevice and the SysBusDevice. TPMStateISA embeds the
struct and inherits from the ISADevice.

The prototype of functions bound to be used by both
the ISA and SysBus devices is changed to take TPMState
handle.

A bunch of structs also are renamed to be specialized
for the ISA device. Besides those transformations, no
functional change is expected.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Tested-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-id: 20200305165149.618-3-eric.auger@redhat.com
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 hw/tpm/tpm_tis.c | 146 +++++++++++++++++++++++++++++------------------
 1 file changed, 91 insertions(+), 55 deletions(-)

diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index c609737272..fc6d7ca579 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -65,7 +65,6 @@ typedef struct TPMLocality {
 } TPMLocality;
 
 typedef struct TPMState {
-    ISADevice busdev;
     MemoryRegion mmio;
 
     unsigned char buffer[TPM_TIS_BUFFER_MAX];
@@ -91,7 +90,15 @@ typedef struct TPMState {
     TPMPPI ppi;
 } TPMState;
 
-#define TPM(obj) OBJECT_CHECK(TPMState, (obj), TYPE_TPM_TIS_ISA)
+typedef struct TPMStateISA {
+    /*< private >*/
+    ISADevice parent_obj;
+
+    /*< public >*/
+    TPMState state; /* not a QOM object */
+} TPMStateISA;
+
+#define TPM_TIS_ISA(obj) OBJECT_CHECK(TPMStateISA, (obj), TYPE_TPM_TIS_ISA)
 
 #define DEBUG_TIS 0
 
@@ -281,9 +288,8 @@ static void tpm_tis_prep_abort(TPMState *s, uint8_t locty, uint8_t newlocty)
 /*
  * Callback from the TPM to indicate that the response was received.
  */
-static void tpm_tis_request_completed(TPMIf *ti, int ret)
+static void tpm_tis_request_completed(TPMState *s, int ret)
 {
-    TPMState *s = TPM(ti);
     uint8_t locty = s->cmd.locty;
     uint8_t l;
 
@@ -338,7 +344,7 @@ static uint32_t tpm_tis_data_read(TPMState *s, uint8_t locty)
 }
 
 #ifdef DEBUG_TIS
-static void tpm_tis_dump_state(void *opaque, hwaddr addr)
+static void tpm_tis_dump_state(TPMState *s, hwaddr addr)
 {
     static const unsigned regs[] = {
         TPM_TIS_REG_ACCESS,
@@ -353,7 +359,6 @@ static void tpm_tis_dump_state(void *opaque, hwaddr addr)
     int idx;
     uint8_t locty = tpm_tis_locality_from_addr(addr);
     hwaddr base = addr & ~0xfff;
-    TPMState *s = opaque;
 
     printf("tpm_tis: active locality      : %d\n"
            "tpm_tis: state of locality %d : %d\n"
@@ -363,7 +368,7 @@ static void tpm_tis_dump_state(void *opaque, hwaddr addr)
 
     for (idx = 0; regs[idx] != 0xfff; idx++) {
         printf("tpm_tis: 0x%04x : 0x%08x\n", regs[idx],
-               (int)tpm_tis_mmio_read(opaque, base + regs[idx], 4));
+               (int)tpm_tis_mmio_read(s, base + regs[idx], 4));
     }
 
     printf("tpm_tis: r/w offset    : %d\n"
@@ -488,7 +493,7 @@ static uint64_t tpm_tis_mmio_read(void *opaque, hwaddr addr,
         break;
 #ifdef DEBUG_TIS
     case TPM_TIS_REG_DEBUG:
-        tpm_tis_dump_state(opaque, addr);
+        tpm_tis_dump_state(s, addr);
         break;
 #endif
     }
@@ -835,10 +840,8 @@ static const MemoryRegionOps tpm_tis_memory_ops = {
 /*
  * Get the TPMVersion of the backend device being used
  */
-static enum TPMVersion tpm_tis_get_tpm_version(TPMIf *ti)
+static enum TPMVersion tpm_tis_get_tpm_version(TPMState *s)
 {
-    TPMState *s = TPM(ti);
-
     if (tpm_backend_had_startup_error(s->be_driver)) {
         return TPM_VERSION_UNSPEC;
     }
@@ -850,9 +853,8 @@ static enum TPMVersion tpm_tis_get_tpm_version(TPMIf *ti)
  * This function is called when the machine starts, resets or due to
  * S3 resume.
  */
-static void tpm_tis_reset(DeviceState *dev)
+static void tpm_tis_reset(TPMState *s)
 {
-    TPMState *s = TPM(dev);
     int c;
 
     s->be_tpm_version = tpm_backend_get_tpm_version(s->be_driver);
@@ -896,15 +898,14 @@ static void tpm_tis_reset(DeviceState *dev)
 
 /* persistent state handling */
 
-static int tpm_tis_pre_save(void *opaque)
+static int tpm_tis_pre_save(TPMState *s)
 {
-    TPMState *s = opaque;
     uint8_t locty = s->active_locty;
 
     trace_tpm_tis_pre_save(locty, s->rw_offset);
 
     if (DEBUG_TIS) {
-        tpm_tis_dump_state(opaque, 0);
+        tpm_tis_dump_state(s, 0);
     }
 
     /*
@@ -929,34 +930,78 @@ static const VMStateDescription vmstate_locty = {
     }
 };
 
-static const VMStateDescription vmstate_tpm_tis = {
+/* ISA */
+
+static int tpm_tis_pre_save_isa(void *opaque)
+{
+    TPMStateISA *isadev = opaque;
+
+    return tpm_tis_pre_save(&isadev->state);
+}
+
+static const VMStateDescription vmstate_tpm_tis_isa = {
     .name = "tpm-tis",
     .version_id = 0,
-    .pre_save  = tpm_tis_pre_save,
+    .pre_save  = tpm_tis_pre_save_isa,
     .fields = (VMStateField[]) {
-        VMSTATE_BUFFER(buffer, TPMState),
-        VMSTATE_UINT16(rw_offset, TPMState),
-        VMSTATE_UINT8(active_locty, TPMState),
-        VMSTATE_UINT8(aborting_locty, TPMState),
-        VMSTATE_UINT8(next_locty, TPMState),
+        VMSTATE_BUFFER(state.buffer, TPMStateISA),
+        VMSTATE_UINT16(state.rw_offset, TPMStateISA),
+        VMSTATE_UINT8(state.active_locty, TPMStateISA),
+        VMSTATE_UINT8(state.aborting_locty, TPMStateISA),
+        VMSTATE_UINT8(state.next_locty, TPMStateISA),
 
-        VMSTATE_STRUCT_ARRAY(loc, TPMState, TPM_TIS_NUM_LOCALITIES, 0,
+        VMSTATE_STRUCT_ARRAY(state.loc, TPMStateISA, TPM_TIS_NUM_LOCALITIES, 0,
                              vmstate_locty, TPMLocality),
 
         VMSTATE_END_OF_LIST()
     }
 };
 
-static Property tpm_tis_properties[] = {
-    DEFINE_PROP_UINT32("irq", TPMState, irq_num, TPM_TIS_IRQ),
-    DEFINE_PROP_TPMBE("tpmdev", TPMState, be_driver),
-    DEFINE_PROP_BOOL("ppi", TPMState, ppi_enabled, true),
+static void tpm_tis_isa_request_completed(TPMIf *ti, int ret)
+{
+    TPMStateISA *isadev = TPM_TIS_ISA(ti);
+    TPMState *s = &isadev->state;
+
+    tpm_tis_request_completed(s, ret);
+}
+
+static enum TPMVersion tpm_tis_isa_get_tpm_version(TPMIf *ti)
+{
+    TPMStateISA *isadev = TPM_TIS_ISA(ti);
+    TPMState *s = &isadev->state;
+
+    return tpm_tis_get_tpm_version(s);
+}
+
+static void tpm_tis_isa_reset(DeviceState *dev)
+{
+    TPMStateISA *isadev = TPM_TIS_ISA(dev);
+    TPMState *s = &isadev->state;
+
+    return tpm_tis_reset(s);
+}
+
+static Property tpm_tis_isa_properties[] = {
+    DEFINE_PROP_UINT32("irq", TPMStateISA, state.irq_num, TPM_TIS_IRQ),
+    DEFINE_PROP_TPMBE("tpmdev", TPMStateISA, state.be_driver),
+    DEFINE_PROP_BOOL("ppi", TPMStateISA, state.ppi_enabled, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void tpm_tis_realizefn(DeviceState *dev, Error **errp)
+static void tpm_tis_isa_initfn(Object *obj)
 {
-    TPMState *s = TPM(dev);
+    TPMStateISA *isadev = TPM_TIS_ISA(obj);
+    TPMState *s = &isadev->state;
+
+    memory_region_init_io(&s->mmio, obj, &tpm_tis_memory_ops,
+                          s, "tpm-tis-mmio",
+                          TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT);
+}
+
+static void tpm_tis_isa_realizefn(DeviceState *dev, Error **errp)
+{
+    TPMStateISA *isadev = TPM_TIS_ISA(dev);
+    TPMState *s = &isadev->state;
 
     if (!tpm_find()) {
         error_setg(errp, "at most one TPM device is permitted");
@@ -973,55 +1018,46 @@ static void tpm_tis_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    isa_init_irq(&s->busdev, &s->irq, s->irq_num);
+    isa_init_irq(ISA_DEVICE(dev), &s->irq, s->irq_num);
 
     memory_region_add_subregion(isa_address_space(ISA_DEVICE(dev)),
                                 TPM_TIS_ADDR_BASE, &s->mmio);
 
     if (s->ppi_enabled) {
         tpm_ppi_init(&s->ppi, isa_address_space(ISA_DEVICE(dev)),
-                     TPM_PPI_ADDR_BASE, OBJECT(s));
+                     TPM_PPI_ADDR_BASE, OBJECT(dev));
     }
 }
 
-static void tpm_tis_initfn(Object *obj)
-{
-    TPMState *s = TPM(obj);
-
-    memory_region_init_io(&s->mmio, OBJECT(s), &tpm_tis_memory_ops,
-                          s, "tpm-tis-mmio",
-                          TPM_TIS_NUM_LOCALITIES << TPM_TIS_LOCALITY_SHIFT);
-}
-
-static void tpm_tis_class_init(ObjectClass *klass, void *data)
+static void tpm_tis_isa_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     TPMIfClass *tc = TPM_IF_CLASS(klass);
 
-    dc->realize = tpm_tis_realizefn;
-    device_class_set_props(dc, tpm_tis_properties);
-    dc->reset = tpm_tis_reset;
-    dc->vmsd  = &vmstate_tpm_tis;
+    device_class_set_props(dc, tpm_tis_isa_properties);
+    dc->vmsd  = &vmstate_tpm_tis_isa;
     tc->model = TPM_MODEL_TPM_TIS;
-    tc->get_version = tpm_tis_get_tpm_version;
-    tc->request_completed = tpm_tis_request_completed;
+    dc->realize = tpm_tis_isa_realizefn;
+    dc->reset = tpm_tis_isa_reset;
+    tc->request_completed = tpm_tis_isa_request_completed;
+    tc->get_version = tpm_tis_isa_get_tpm_version;
 }
 
-static const TypeInfo tpm_tis_info = {
+static const TypeInfo tpm_tis_isa_info = {
     .name = TYPE_TPM_TIS_ISA,
     .parent = TYPE_ISA_DEVICE,
-    .instance_size = sizeof(TPMState),
-    .instance_init = tpm_tis_initfn,
-    .class_init  = tpm_tis_class_init,
+    .instance_size = sizeof(TPMStateISA),
+    .instance_init = tpm_tis_isa_initfn,
+    .class_init  = tpm_tis_isa_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_TPM_IF },
         { }
     }
 };
 
-static void tpm_tis_register(void)
+static void tpm_tis_isa_register(void)
 {
-    type_register_static(&tpm_tis_info);
+    type_register_static(&tpm_tis_isa_info);
 }
 
-type_init(tpm_tis_register)
+type_init(tpm_tis_isa_register)
-- 
2.24.1


