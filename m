Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438485736E9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 15:09:55 +0200 (CEST)
Received: from localhost ([::1]:48276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBc7m-0005C7-4U
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 09:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc4y-00081r-Ar; Wed, 13 Jul 2022 09:07:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oBc4w-00069H-Cc; Wed, 13 Jul 2022 09:07:00 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DD601k026529;
 Wed, 13 Jul 2022 13:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ww29aUkDfHDJFyJC49oNXm7+qxd3QE2/pdxU0MTJm5c=;
 b=Kno9JfMpIOHeYfkhBibldNYGPNtQ8TL2+u65OBJ18hceAo324YxmnV+B0u7Uy9XAC0nC
 tx+1ZXjtIz8qZwjq8DhjAXTjJyi7a/QLiyQNNydH5YTaek1cZ1kLVUCz4vE7vosFMaPh
 PvDr8alWkM6opff8irk2F2ea20mHBslPimNNdt9Ut6+RmyTVceSHSyehvUFvoJ+C9oB0
 faMl+4ZYCW9aKhxnh/CaoDl/pho0PPrunVPdObn9gQfp+P/H6IwDZtANXqvZS3kHa5F2
 FFR+sEVbebpivC+1WEjynSgBx5tdqQetalTIAux//U9DwNMl/F9QfDhER3zvbFej0Ku2 /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9xmw80eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:55 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DD6XbU027543;
 Wed, 13 Jul 2022 13:06:55 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9xmw80dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:55 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DCoPVe025309;
 Wed, 13 Jul 2022 13:06:53 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma01fra.de.ibm.com with ESMTP id 3h71a8vyrt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:06:52 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26DD6nFc20840918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Jul 2022 13:06:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB92AAE057;
 Wed, 13 Jul 2022 13:06:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C685AE045;
 Wed, 13 Jul 2022 13:06:48 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jul 2022 13:06:48 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 richard.henderson@linaro.org
Subject: [PATCH v2 03/11] dump: Split write of section headers and data and
 add a prepare step
Date: Wed, 13 Jul 2022 13:03:14 +0000
Message-Id: <20220713130322.25517-4-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713130322.25517-1-frankja@linux.ibm.com>
References: <20220713130322.25517-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OPLa4-P0Os4Yzp3e3z5DhZ31dFtKYR8o
X-Proofpoint-GUID: 2pdijV4YI5HIHsS9I9XcDfx-NIXhHcRK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_01,2022-07-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130050
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By splitting the writing of the section headers and (future) section
data we prepare for the addition of a string table section and
architecture sections.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 116 ++++++++++++++++++++++++++++++++----------
 include/sysemu/dump.h |   4 ++
 2 files changed, 94 insertions(+), 26 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index 16d7474258..467d934bc1 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -342,30 +342,73 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
     }
 }
 
-static void write_elf_section(DumpState *s, int type, Error **errp)
+static size_t write_elf_section_hdr_zero(DumpState *s, void *buff)
 {
-    Elf32_Shdr shdr32;
-    Elf64_Shdr shdr64;
-    int shdr_size;
-    void *shdr;
-    int ret;
+    if (dump_is_64bit(s)) {
+        Elf64_Shdr *shdr64 = buff;
 
-    if (type == 0) {
-        shdr_size = sizeof(Elf32_Shdr);
-        memset(&shdr32, 0, shdr_size);
-        shdr32.sh_info = cpu_to_dump32(s, s->phdr_num);
-        shdr = &shdr32;
+        memset(buff, 0, sizeof(Elf64_Shdr));
+        shdr64->sh_info = cpu_to_dump32(s, s->phdr_num);
     } else {
-        shdr_size = sizeof(Elf64_Shdr);
-        memset(&shdr64, 0, shdr_size);
-        shdr64.sh_info = cpu_to_dump32(s, s->phdr_num);
-        shdr = &shdr64;
+        Elf32_Shdr *shdr32 = buff;
+
+        memset(buff, 0, sizeof(Elf32_Shdr));
+        shdr32->sh_info = cpu_to_dump32(s, s->phdr_num);
     }
 
-    ret = fd_write_vmcore(shdr, shdr_size, s);
+    return dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
+}
+
+static void prepare_elf_section_hdrs(DumpState *s)
+{
+    uint8_t *buff_hdr;
+    size_t len, sizeof_shdr;
+
+    /*
+     * Section ordering:
+     * - HDR zero (if needed)
+     */
+    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
+    len = sizeof_shdr * s->shdr_num;
+    s->elf_section_hdrs = g_malloc0(len);
+    buff_hdr = s->elf_section_hdrs;
+
+    /* Write special section first */
+    if (s->phdr_num == PN_XNUM) {
+            write_elf_section_hdr_zero(s, buff_hdr);
+    }
+}
+
+static void prepare_elf_sections(DumpState *s, Error **errp)
+{
+    if (!s->shdr_num) {
+        return;
+    }
+
+    prepare_elf_section_hdrs(s);
+}
+
+static void write_elf_section_headers(DumpState *s, Error **errp)
+{
+    size_t sizeof_shdr;
+    int ret;
+
+    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
+
+    ret = fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_shdr, s);
     if (ret < 0) {
-        error_setg_errno(errp, -ret,
-                         "dump: failed to write section header table");
+        error_setg_errno(errp, -ret, "dump: failed to write section data");
+    }
+}
+
+static void write_elf_sections(DumpState *s, Error **errp)
+{
+    int ret;
+
+    /* Write section zero */
+    ret = fd_write_vmcore(s->elf_section_data, s->elf_section_data_size, s);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "dump: failed to write section data");
     }
 }
 
@@ -557,12 +600,22 @@ static void dump_begin(DumpState *s, Error **errp)
     /* Write elf header to buffer */
     prepare_elf_header(s);
 
+    prepare_elf_sections(s, errp);
+    if (*errp) {
+        return;
+    }
+
     /* Start to write stuff into files*/
     write_elf_header(s, errp);
     if (*errp) {
         return;
     }
 
+    write_elf_section_headers(s, errp);
+    if (*errp) {
+        return;
+    }
+
     /* write PT_NOTE to vmcore */
     write_elf_phdr_note(s, errp);
     if (*errp) {
@@ -575,14 +628,6 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
-    /* write section to vmcore */
-    if (s->shdr_num) {
-        write_elf_section(s, 1, errp);
-        if (*errp) {
-            return;
-        }
-    }
-
     /* write notes to vmcore */
     write_elf_notes(s, errp);
 }
@@ -610,6 +655,19 @@ static void dump_iterate(DumpState *s, Error **errp)
     }
 }
 
+static void dump_end(DumpState *s, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (!s->elf_section_data_size) {
+        return;
+    }
+    s->elf_section_data = g_malloc0(s->elf_section_data_size);
+
+    /* write sections to vmcore */
+    write_elf_sections(s, errp);
+}
+
 static void create_vmcore(DumpState *s, Error **errp)
 {
     ERRP_GUARD();
@@ -620,6 +678,12 @@ static void create_vmcore(DumpState *s, Error **errp)
     }
 
     dump_iterate(s, errp);
+    if (*errp) {
+        return;
+    }
+
+    /* Write section data after memory has been dumped */
+    dump_end(s, errp);
 }
 
 static int write_start_flat_header(int fd)
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index 736f681d01..bd49532232 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -172,6 +172,10 @@ typedef struct DumpState {
     int64_t length;            /* Length of the dump we want to dump */
 
     void *elf_header;
+    void *elf_section_hdrs;
+    uint64_t elf_section_data_size;
+    void *elf_section_data;
+
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
     uint32_t nr_cpus;           /* number of guest's cpu */
-- 
2.34.1


