Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239ED30319B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 03:11:35 +0100 (CET)
Received: from localhost ([::1]:50544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4DpN-0008Gw-TF
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 21:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1l4DmO-0006ur-S7
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 21:08:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21036
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1l4DmJ-0003Iq-OV
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 21:08:28 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10Q22aOs179079; Mon, 25 Jan 2021 21:08:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/IxLUMGW1/BUtu4Eqkjly7kjOpKiflCsA5W8O7SJmxo=;
 b=Ti8o7UTVbJtO1P+quS5IaP4Ifdm1m89OOQ3baXvXDFQzrMQ5zZ0q1CvokD+KVk3wcYeZ
 SEdxw3sVyavn3Oi4sc0ZjW19h2NnVEIEOGJLtviU4c61OJOPFSpBmfg59vCeOsNc3X5w
 puor5Xw7j8VOAmys5JCQrIO8KY3aJB0ERhr/szO9dG0Oc+l4mSRWv8zOs4P5uc4epQrW
 quFcFnX6AX+f4UNs/+A/9RkBKalnIwFQbAsCAGuJ0D6og3CaPPA56nfG8d6Q6HM1/UX5
 rPr8mFhmtaNcdbVPhUNuujuq6kiPdcljfWdZs6eEJ5wTUsEuFtUF3vUO3N34OEiOvUbj Ng== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36a58y5yhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 21:08:21 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10Q23Ff7022427;
 Tue, 26 Jan 2021 02:08:20 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 36a8uh0cff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Jan 2021 02:08:20 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10Q28IW020316606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Jan 2021 02:08:18 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 982F128058;
 Tue, 26 Jan 2021 02:08:18 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 803902805C;
 Tue, 26 Jan 2021 02:08:18 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 26 Jan 2021 02:08:18 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 1/1] tpm: tpm_spapr: Remove unused tracepoint
Date: Mon, 25 Jan 2021 21:08:16 -0500
Message-Id: <20210126020816.352782-2-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126020816.352782-1-stefanb@linux.vnet.ibm.com>
References: <20210126020816.352782-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_10:2021-01-25,
 2021-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxscore=0 phishscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260003
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Bolshakov <r.bolshakov@yadro.com>

Linking of qemu-system-ppc64 fails on macOS with dtrace enabled:

  error: probe tpm_spapr_show_buffer doesn't exist
  error: Could not register probes
  ld: error creating dtrace DOF section for architecture x86_64

The failure is explained in 8c8ed03850208e4 ("net/colo: Match is-enabled
probe to tracepoint"). In short, is-enabled probe can't be used without
a matching trace probe. And for this particular case
tpm_util_show_buffer probe should be enabled to print TPM buffer.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 hw/tpm/tpm_spapr.c  | 8 ++------
 hw/tpm/trace-events | 1 -
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/tpm/tpm_spapr.c b/hw/tpm/tpm_spapr.c
index e3775adc57..dea7b1333b 100644
--- a/hw/tpm/tpm_spapr.c
+++ b/hw/tpm/tpm_spapr.c
@@ -93,9 +93,7 @@ struct SpaprTpmState {
  */
 static void tpm_spapr_tpm_send(SpaprTpmState *s)
 {
-    if (trace_event_get_state_backends(TRACE_TPM_SPAPR_SHOW_BUFFER)) {
-        tpm_util_show_buffer(s->buffer, s->be_buffer_size, "To TPM");
-    }
+    tpm_util_show_buffer(s->buffer, s->be_buffer_size, "To TPM");
 
     s->state = SPAPR_VTPM_STATE_EXECUTION;
     s->cmd = (TPMBackendCmd) {
@@ -255,9 +253,7 @@ static void tpm_spapr_request_completed(TPMIf *ti, int ret)
     rc = spapr_vio_dma_write(&s->vdev, be32_to_cpu(crq->data),
                              s->buffer, len);
 
-    if (trace_event_get_state_backends(TRACE_TPM_SPAPR_SHOW_BUFFER)) {
-        tpm_util_show_buffer(s->buffer, len, "From TPM");
-    }
+    tpm_util_show_buffer(s->buffer, len, "From TPM");
 
     crq->valid = SPAPR_VTPM_MSG_RESULT;
     if (rc == H_SUCCESS) {
diff --git a/hw/tpm/trace-events b/hw/tpm/trace-events
index 266de17d38..6005ecb5da 100644
--- a/hw/tpm/trace-events
+++ b/hw/tpm/trace-events
@@ -25,7 +25,6 @@ tpm_tis_pre_save(uint8_t locty, uint32_t rw_offset) "locty: %d, rw_offset = %u"
 tpm_ppi_memset(uint8_t *ptr, size_t size) "memset: %p %zu"
 
 # tpm_spapr.c
-tpm_spapr_show_buffer(const char *direction, size_t len, const char *buf) "direction: %s len: %zu\n%s"
 tpm_spapr_do_crq(uint8_t raw1, uint8_t raw2) "1st 2 bytes in CRQ: 0x%02x 0x%02x"
 tpm_spapr_do_crq_crq_result(void) "SPAPR_VTPM_INIT_CRQ_RESULT"
 tpm_spapr_do_crq_crq_complete_result(void) "SPAPR_VTPM_INIT_CRQ_COMP_RESULT"
-- 
2.26.2


