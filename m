Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5B322D343
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jul 2020 02:25:00 +0200 (CEST)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jz7zn-0003N0-Gk
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 20:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1jz7xc-0000sy-1L
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 20:22:44 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1jz7xY-0007rh-AE
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 20:22:43 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06P02GeW036810; Fri, 24 Jul 2020 20:22:36 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32faepvfya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 20:22:36 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06P0377h038899;
 Fri, 24 Jul 2020 20:22:36 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32faepvfy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 20:22:36 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06P0Je6C001774;
 Sat, 25 Jul 2020 00:22:35 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 32brq9r8pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 25 Jul 2020 00:22:35 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06P0MYLe37224760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 25 Jul 2020 00:22:34 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF8C6B2068;
 Sat, 25 Jul 2020 00:22:34 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1F38B2066;
 Sat, 25 Jul 2020 00:22:34 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 25 Jul 2020 00:22:34 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PULL v1 3/3] tpm_emulator: Report an error if chardev is missing
Date: Fri, 24 Jul 2020 20:22:28 -0400
Message-Id: <20200725002228.2629410-4-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200725002228.2629410-1-stefanb@linux.vnet.ibm.com>
References: <20200725002228.2629410-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_10:2020-07-24,
 2020-07-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=1
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007240162
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=stefanb@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 20:22:38
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch fixes the odd error reporting when trying to send a file
descriptor to the TPM emulator if one has not passed a valid chardev.

$ x86_64-softmmu/qemu-system-x86_64 -tpmdev emulator,id=tpm0
qemu-system-x86_64: -tpmdev emulator,id=tpm0: tpm-emulator: Failed to send CMD_SET_DATAFD: Success
qemu-system-x86_64: -tpmdev emulator,id=tpm0: tpm-emulator: Could not cleanly shutdown the TPM: Success

This is the new error report:

$ x86_64-softmmu/qemu-system-x86_64 -tpmdev emulator,id=tpm0
qemu-system-x86_64: -tpmdev emulator,id=tpm0: tpm-emulator: parameter 'chardev' is missing

This change does not hide the display of supported TPM types if a non-existent type is passed:

$ x86_64-softmmu/qemu-system-x86_64 -tpmdev nonexistent,id=tpm0
qemu-system-x86_64: -tpmdev nonexistent,id=tpm0: Parameter 'type' expects a TPM backend type
Supported TPM types (choose only one):
 passthrough   Passthrough TPM backend driver
    emulator   TPM emulator backend driver

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 backends/tpm/tpm_emulator.c | 38 ++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 9605339f93..a9b0f55e67 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -549,27 +549,30 @@ err_exit:
 static int tpm_emulator_handle_device_opts(TPMEmulator *tpm_emu, QemuOpts *opts)
 {
     const char *value;
+    Error *err = NULL;
+    Chardev *dev;
 
     value = qemu_opt_get(opts, "chardev");
-    if (value) {
-        Error *err = NULL;
-        Chardev *dev = qemu_chr_find(value);
-
-        if (!dev) {
-            error_report("tpm-emulator: tpm chardev '%s' not found.", value);
-            goto err;
-        }
+    if (!value) {
+        error_report("tpm-emulator: parameter 'chardev' is missing");
+        goto err;
+    }
 
-        if (!qemu_chr_fe_init(&tpm_emu->ctrl_chr, dev, &err)) {
-            error_prepend(&err, "tpm-emulator: No valid chardev found at '%s':",
-                          value);
-            error_report_err(err);
-            goto err;
-        }
+    dev = qemu_chr_find(value);
+    if (!dev) {
+        error_report("tpm-emulator: tpm chardev '%s' not found", value);
+        goto err;
+    }
 
-        tpm_emu->options->chardev = g_strdup(value);
+    if (!qemu_chr_fe_init(&tpm_emu->ctrl_chr, dev, &err)) {
+        error_prepend(&err, "tpm-emulator: No valid chardev found at '%s':",
+                      value);
+        error_report_err(err);
+        goto err;
     }
 
+    tpm_emu->options->chardev = g_strdup(value);
+
     if (tpm_emulator_prepare_data_fd(tpm_emu) < 0) {
         goto err;
     }
@@ -925,6 +928,11 @@ static void tpm_emulator_shutdown(TPMEmulator *tpm_emu)
 {
     ptm_res res;
 
+    if (!tpm_emu->options->chardev) {
+        /* was never properly initialized */
+        return;
+    }
+
     if (tpm_emulator_ctrlcmd(tpm_emu, CMD_SHUTDOWN, &res, 0, sizeof(res)) < 0) {
         error_report("tpm-emulator: Could not cleanly shutdown the TPM: %s",
                      strerror(errno));
-- 
2.24.1


