Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310432D0ADA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 07:45:45 +0100 (CET)
Received: from localhost ([::1]:38472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmAHI-0007kh-6D
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 01:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kmAFW-0007GP-NA
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 01:43:54 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:43328 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kmAFT-0002ud-S3
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 01:43:54 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0771C412DD;
 Mon,  7 Dec 2020 06:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1607323426; x=
 1609137827; bh=rvM3Es9nJRemg4YAwOgFeqJO7X8qG8tGvTNaYeTmOsQ=; b=i
 2rHS0WsPMNPgCTAxzoFwgI5TPCm7i2Vb7Rncj5CKAirkh9ao5w2Lnn+l4t3JrT5D
 1X2fOB70JcfCpvN8Bz13MPLZm1hxA0uoZIiU//wWE/M1P9HKi2JrsyNoCQWxB+6D
 UvKVt9H589//6YcDy5t6N5Ac5GL1ZR7dBDFrZutgwU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxMUurIS_Heu; Mon,  7 Dec 2020 09:43:46 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CF8F94125E;
 Mon,  7 Dec 2020 09:43:45 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 7 Dec
 2020 09:43:45 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] tpm: tpm_spapr: Remove unused tracepoint
Date: Mon, 7 Dec 2020 09:43:52 +0300
Message-ID: <20201207064352.16167-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linking of qemu-system-ppc64 fails on macOS with dtrace enabled:

  error: probe tpm_spapr_show_buffer doesn't exist
  error: Could not register probes
  ld: error creating dtrace DOF section for architecture x86_64

The failure is explained in 8c8ed03850208e4 ("net/colo: Match is-enabled
probe to tracepoint"). In short, is-enabled probe can't be used without
a matching trace probe. And for this particular case
tpm_util_show_buffer probe should be enabled to print TPM buffer.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
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
2.29.2


