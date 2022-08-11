Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC47058FC18
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:23:15 +0200 (CEST)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7DW-00079k-Ss
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM730-0003mN-DS; Thu, 11 Aug 2022 08:12:22 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1oM72y-0008Pg-8U; Thu, 11 Aug 2022 08:12:21 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BC6rek015313;
 Thu, 11 Aug 2022 12:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=e4GmP7n3Y9QfIv7z7MS14SCmkUEuXvC7frQJaVVUD+A=;
 b=axk1ERyRAFT/02Q/wy06phzhB4RxrTuPHecEDdJXLie+YnwF+AhHpTxPku99A22o5TYt
 8WheHV0HLwoHzsY7s2YPxJXwMtW34hK627YbxAYPHGj89A5zNBc/hMRvJNRkqqGhM9cQ
 31aFR4X2U1vlkv4W/ZDxipkOIr/Dzg51Bp23LKv1d7Q1WiZhMhMCakCuc+ZgOr+7GfuI
 Sa+6q6VNuXOM5ijZhr6mEl97b3HraXMcl3dlNoqO/k7ZnJGc0qNh8nTnVH4Nzk2Mr35w
 FFZdioMLXef3C8r5Z1VEIIUKB6/PwMI2WeqCdNLBcbJ0yMvD/MLnLT3xomeXUU0PlhWd uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw14a8v4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:18 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27BC6ruJ015247;
 Thu, 11 Aug 2022 12:12:17 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hw14a8v36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:17 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27BC6bbF025372;
 Thu, 11 Aug 2022 12:12:14 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3huww2j0g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Aug 2022 12:12:13 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27BCCA8K29753846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:12:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2142AE051;
 Thu, 11 Aug 2022 12:12:10 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B147AAE045;
 Thu, 11 Aug 2022 12:12:09 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 11 Aug 2022 12:12:09 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v5 09/18] dump: Use a buffer for ELF section data and headers
Date: Thu, 11 Aug 2022 12:11:02 +0000
Message-Id: <20220811121111.9878-10-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811121111.9878-1-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CDt5qG25oZk-v_kVmVPJTuO2Eijf9wQW
X-Proofpoint-GUID: 8GfqY1HhINVKKZa9ap71krp7Xe2m4Ie1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110037
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

Currently we're writing the NULL section header if we overflow the
physical header number in the ELF header. But in the future we'll add
custom section headers AND section data.

To facilitate this we need to rearange section handling a bit. As with
the other ELF headers we split the code into a prepare and a write
step.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c           | 83 +++++++++++++++++++++++++++++--------------
 include/sysemu/dump.h |  2 ++
 2 files changed, 58 insertions(+), 27 deletions(-)

diff --git a/dump/dump.c b/dump/dump.c
index a905316fe5..0051c71d08 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -380,30 +380,57 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
     }
 }
 
-static void write_elf_section(DumpState *s, int type, Error **errp)
+static void prepare_elf_section_hdr_zero(DumpState *s)
 {
-    Elf32_Shdr shdr32;
-    Elf64_Shdr shdr64;
-    int shdr_size;
-    void *shdr;
+    if (dump_is_64bit(s)) {
+        Elf64_Shdr *shdr64 = s->elf_section_hdrs;
+
+        shdr64->sh_info = cpu_to_dump32(s, s->phdr_num);
+    } else {
+        Elf32_Shdr *shdr32 = s->elf_section_hdrs;
+
+        shdr32->sh_info = cpu_to_dump32(s, s->phdr_num);
+    }
+}
+
+static void prepare_elf_section_hdrs(DumpState *s)
+{
+    size_t len, sizeof_shdr;
+
+    /*
+     * Section ordering:
+     * - HDR zero
+     */
+    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
+    len = sizeof_shdr * s->shdr_num;
+    s->elf_section_hdrs = g_malloc0(len);
+
+    /*
+     * The first section header is ALWAYS a special initial section
+     * header.
+     *
+     * The header should be 0 with one exception being that if
+     * phdr_num is PN_XNUM then the sh_info field contains the real
+     * number of segment entries.
+     *
+     * As we zero allocate the buffer we will only need to modify
+     * sh_info for the PN_XNUM case.
+     */
+    if (s->phdr_num >= PN_XNUM) {
+        prepare_elf_section_hdr_zero(s);
+    }
+}
+
+static void write_elf_section_headers(DumpState *s, Error **errp)
+{
+    size_t sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
     int ret;
 
-    if (type == 0) {
-        shdr_size = sizeof(Elf32_Shdr);
-        memset(&shdr32, 0, shdr_size);
-        shdr32.sh_info = cpu_to_dump32(s, s->phdr_num);
-        shdr = &shdr32;
-    } else {
-        shdr_size = sizeof(Elf64_Shdr);
-        memset(&shdr64, 0, shdr_size);
-        shdr64.sh_info = cpu_to_dump32(s, s->phdr_num);
-        shdr = &shdr64;
-    }
+    prepare_elf_section_hdrs(s);
 
-    ret = fd_write_vmcore(shdr, shdr_size, s);
+    ret = fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_shdr, s);
     if (ret < 0) {
-        error_setg_errno(errp, -ret,
-                         "dump: failed to write section header table");
+        error_setg_errno(errp, -ret, "dump: failed to write section headers");
     }
 }
 
@@ -579,6 +606,12 @@ static void dump_begin(DumpState *s, Error **errp)
         return;
     }
 
+    /* write section headers to vmcore */
+    write_elf_section_headers(s, errp);
+    if (*errp) {
+        return;
+    }
+
     /* write PT_NOTE to vmcore */
     write_elf_phdr_note(s, errp);
     if (*errp) {
@@ -591,14 +624,6 @@ static void dump_begin(DumpState *s, Error **errp)
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
@@ -674,7 +699,11 @@ static void create_vmcore(DumpState *s, Error **errp)
         return;
     }
 
+    /* Iterate over memory and dump it to file */
     dump_iterate(s, errp);
+    if (*errp) {
+        return;
+    }
 }
 
 static int write_start_flat_header(int fd)
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
index b62513d87d..9995f65dc8 100644
--- a/include/sysemu/dump.h
+++ b/include/sysemu/dump.h
@@ -177,6 +177,8 @@ typedef struct DumpState {
     int64_t filter_area_begin;  /* Start address of partial guest memory area */
     int64_t filter_area_length; /* Length of partial guest memory area */
 
+    void *elf_section_hdrs;     /* Pointer to section header buffer */
+
     uint8_t *note_buf;          /* buffer for notes */
     size_t note_buf_offset;     /* the writing place in note_buf */
     uint32_t nr_cpus;           /* number of guest's cpu */
-- 
2.34.1


