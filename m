Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0B376F5C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 18:49:57 +0200 (CEST)
Received: from localhost ([::1]:41804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hr3Po-000280-De
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 12:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59428)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanb@linux.vnet.ibm.com>) id 1hr3PR-0001I8-Jc
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 12:49:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanb@linux.vnet.ibm.com>) id 1hr3PP-0004Vk-T6
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 12:49:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42202
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanb@linux.vnet.ibm.com>)
 id 1hr3PP-0004Qh-Ni; Fri, 26 Jul 2019 12:49:31 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6QGlUHL114234; Fri, 26 Jul 2019 12:49:30 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u03aqpxft-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jul 2019 12:49:29 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x6QGnTH6118778;
 Fri, 26 Jul 2019 12:49:29 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u03aqpxf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jul 2019 12:49:29 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6QGij6O014061;
 Fri, 26 Jul 2019 16:49:28 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 2tymfenu77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jul 2019 16:49:28 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6QGnRBY52953396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jul 2019 16:49:27 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF1AFBE051;
 Fri, 26 Jul 2019 16:49:26 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6278BBE04F;
 Fri, 26 Jul 2019 16:49:26 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jul 2019 16:49:26 +0000 (GMT)
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-stable@nongnu.org, mdroth@linux.vnet.ibm.com
Date: Fri, 26 Jul 2019 12:49:21 -0400
Message-Id: <20190726164921.1655115-3-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726164921.1655115-1-stefanb@linux.vnet.ibm.com>
References: <20190726164921.1655115-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-26_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907260205
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-001b2d01.pphosted.com id x6QGlUHL114234
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH for-3.1.1 2/2] tpm_emulator: Translate TPM
 error codes to strings
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement a function to translate TPM error codes to strings so that
at least the most common error codes can be translated to human
readable strings.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
(git cherry-pick 7e095e84ba0b7c0a1ac45bc6824dace2fd352e56)
---
 hw/tpm/tpm_emulator.c | 60 +++++++++++++++++++++++++++++++++++--------
 hw/tpm/tpm_int.h      | 13 ++++++++++
 2 files changed, 63 insertions(+), 10 deletions(-)

diff --git a/hw/tpm/tpm_emulator.c b/hw/tpm/tpm_emulator.c
index 70f4b10284..58894dc320 100644
--- a/hw/tpm/tpm_emulator.c
+++ b/hw/tpm/tpm_emulator.c
@@ -81,6 +81,40 @@ typedef struct TPMEmulator {
     TPMBlobBuffers state_blobs;
 } TPMEmulator;
=20
+struct tpm_error {
+    uint32_t tpm_result;
+    const char *string;
+};
+
+static const struct tpm_error tpm_errors[] =3D {
+    /* TPM 1.2 error codes */
+    { TPM_BAD_PARAMETER   , "a parameter is bad" },
+    { TPM_FAIL            , "operation failed" },
+    { TPM_KEYNOTFOUND     , "key could not be found" },
+    { TPM_BAD_PARAM_SIZE  , "bad parameter size"},
+    { TPM_ENCRYPT_ERROR   , "encryption error" },
+    { TPM_DECRYPT_ERROR   , "decryption error" },
+    { TPM_BAD_KEY_PROPERTY, "bad key property" },
+    { TPM_BAD_MODE        , "bad (encryption) mode" },
+    { TPM_BAD_VERSION     , "bad version identifier" },
+    { TPM_BAD_LOCALITY    , "bad locality" },
+    /* TPM 2 error codes */
+    { TPM_RC_FAILURE     , "operation failed" },
+    { TPM_RC_LOCALITY    , "bad locality"     },
+    { TPM_RC_INSUFFICIENT, "insufficient amount of data" },
+};
+
+static const char *tpm_emulator_strerror(uint32_t tpm_result)
+{
+    size_t i;
+
+    for (i =3D 0; i < ARRAY_SIZE(tpm_errors); i++) {
+        if (tpm_errors[i].tpm_result =3D=3D tpm_result) {
+            return tpm_errors[i].string;
+        }
+    }
+    return "";
+}
=20
 static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, voi=
d *msg,
                                 size_t msg_len_in, size_t msg_len_out)
@@ -263,7 +297,8 @@ static int tpm_emulator_stop_tpm(TPMBackend *tb)
=20
     res =3D be32_to_cpu(res);
     if (res) {
-        error_report("tpm-emulator: TPM result for CMD_STOP: 0x%x", res)=
;
+        error_report("tpm-emulator: TPM result for CMD_STOP: 0x%x %s", r=
es,
+                     tpm_emulator_strerror(res));
         return -1;
     }
=20
@@ -292,8 +327,9 @@ static int tpm_emulator_set_buffer_size(TPMBackend *t=
b,
=20
     psbs.u.resp.tpm_result =3D be32_to_cpu(psbs.u.resp.tpm_result);
     if (psbs.u.resp.tpm_result !=3D 0) {
-        error_report("tpm-emulator: TPM result for set buffer size : 0x%=
x",
-                     psbs.u.resp.tpm_result);
+        error_report("tpm-emulator: TPM result for set buffer size : 0x%=
x %s",
+                     psbs.u.resp.tpm_result,
+                     tpm_emulator_strerror(psbs.u.resp.tpm_result));
         return -1;
     }
=20
@@ -338,7 +374,8 @@ static int tpm_emulator_startup_tpm_resume(TPMBackend=
 *tb, size_t buffersize,
=20
     res =3D be32_to_cpu(init.u.resp.tpm_result);
     if (res) {
-        error_report("tpm-emulator: TPM result for CMD_INIT: 0x%x", res)=
;
+        error_report("tpm-emulator: TPM result for CMD_INIT: 0x%x %s", r=
es,
+                     tpm_emulator_strerror(res));
         goto err_exit;
     }
     return 0;
@@ -398,8 +435,9 @@ static int tpm_emulator_reset_tpm_established_flag(TP=
MBackend *tb,
=20
     res =3D be32_to_cpu(reset_est.u.resp.tpm_result);
     if (res) {
-        error_report("tpm-emulator: TPM result for rest establixhed flag=
: 0x%x",
-                     res);
+        error_report(
+            "tpm-emulator: TPM result for rest established flag: 0x%x %s=
",
+            res, tpm_emulator_strerror(res));
         return -1;
     }
=20
@@ -637,7 +675,8 @@ static int tpm_emulator_get_state_blob(TPMEmulator *t=
pm_emu,
     res =3D be32_to_cpu(pgs.u.resp.tpm_result);
     if (res !=3D 0 && (res & 0x800) =3D=3D 0) {
         error_report("tpm-emulator: Getting the stateblob (type %d) fail=
ed "
-                     "with a TPM error 0x%x", type, res);
+                     "with a TPM error 0x%x %s", type, res,
+                     tpm_emulator_strerror(res));
         return -1;
     }
=20
@@ -757,7 +796,8 @@ static int tpm_emulator_set_state_blob(TPMEmulator *t=
pm_emu,
     tpm_result =3D be32_to_cpu(pss.u.resp.tpm_result);
     if (tpm_result !=3D 0) {
         error_report("tpm-emulator: Setting the stateblob (type %d) fail=
ed "
-                     "with a TPM error 0x%x", type, tpm_result);
+                     "with a TPM error 0x%x %s", type, tpm_result,
+                     tpm_emulator_strerror(tpm_result));
         return -1;
     }
=20
@@ -887,8 +927,8 @@ static void tpm_emulator_shutdown(TPMEmulator *tpm_em=
u)
         error_report("tpm-emulator: Could not cleanly shutdown the TPM: =
%s",
                      strerror(errno));
     } else if (res !=3D 0) {
-        error_report("tpm-emulator: TPM result for sutdown: 0x%x",
-                     be32_to_cpu(res));
+        error_report("tpm-emulator: TPM result for shutdown: 0x%x %s",
+                     be32_to_cpu(res), tpm_emulator_strerror(be32_to_cpu=
(res)));
     }
 }
=20
diff --git a/hw/tpm/tpm_int.h b/hw/tpm/tpm_int.h
index a4c77fbd7e..3fb28a9d6c 100644
--- a/hw/tpm/tpm_int.h
+++ b/hw/tpm/tpm_int.h
@@ -39,7 +39,16 @@ struct tpm_resp_hdr {
 #define TPM_TAG_RSP_AUTH1_COMMAND 0xc5
 #define TPM_TAG_RSP_AUTH2_COMMAND 0xc6
=20
+#define TPM_BAD_PARAMETER         3
 #define TPM_FAIL                  9
+#define TPM_KEYNOTFOUND           13
+#define TPM_BAD_PARAM_SIZE        25
+#define TPM_ENCRYPT_ERROR         32
+#define TPM_DECRYPT_ERROR         33
+#define TPM_BAD_KEY_PROPERTY      40
+#define TPM_BAD_MODE              44
+#define TPM_BAD_VERSION           46
+#define TPM_BAD_LOCALITY          61
=20
 #define TPM_ORD_ContinueSelfTest  0x53
 #define TPM_ORD_GetTicks          0xf1
@@ -59,4 +68,8 @@ struct tpm_resp_hdr {
=20
 #define TPM2_PT_MAX_COMMAND_SIZE  0x11e
=20
+#define TPM_RC_INSUFFICIENT       0x9a
+#define TPM_RC_FAILURE            0x101
+#define TPM_RC_LOCALITY           0x907
+
 #endif /* TPM_TPM_INT_H */
--=20
2.20.1


