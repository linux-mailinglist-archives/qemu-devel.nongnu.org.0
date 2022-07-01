Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E35D5634DD
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 16:08:43 +0200 (CEST)
Received: from localhost ([::1]:56100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7HK6-0005Fn-F2
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 10:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o7H4W-0000Ae-0n
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:52:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11594
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1o7H4T-0000vR-OW
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 09:52:35 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261CofJf027820;
 Fri, 1 Jul 2022 13:52:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jL7ANkOv+f9DpttLwyvYWU1Bikt4CJEAicfcP1KQgc0=;
 b=PxmYSiikJwLhdYcMo645l9L8iaGShaEt5qyfDnUxXeQjllGI8de6r1Lxhz1ZuSVzwBAz
 lYhqcf1vz0/FmxegcHiIXgFOynqGvtDzd4JAaV63ZgjfnpYODSLrgObizbwWgmu5V0Wc
 7qI4oHyaHVn0+RlblgGVfS6LCvF0id79mbNxFz3dj5YSQfudxig6LOGleo/DPP60O1fM
 iSucDvncep+92sy427mjJzxViVOEoTQuN8viBMtTLGW9WRgkcdlI0wbZPm06qSqfcOkH
 ZcTciT1rr2L7LaovMVprSTztVCkU0jvpO6Exi84vgW5kT39JN3plNMx6y2Z0dFaq01to /w== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h219r2dc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 13:52:14 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261Do8dW012726;
 Fri, 1 Jul 2022 13:52:12 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 3gwt097ayx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Jul 2022 13:52:12 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 261Dq92r11731316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Jul 2022 13:52:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20D54AE051;
 Fri,  1 Jul 2022 13:52:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD867AE04D;
 Fri,  1 Jul 2022 13:52:08 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.0.230])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  1 Jul 2022 13:52:08 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH] linux-user: Passthrough MADV_DONTNEED for certain file
 mappings
Date: Fri,  1 Jul 2022 15:52:07 +0200
Message-Id: <20220701135207.2710488-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Uv8_hcNq2JcuGXluYpsasHBzp5vbol7Z
X-Proofpoint-GUID: Uv8_hcNq2JcuGXluYpsasHBzp5vbol7Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_07,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207010052
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

This is a follow-up for commit 892a4f6a750a ("linux-user: Add partial
support for MADV_DONTNEED"), which added passthrough for anonymous
mappings. File mappings can be handled in a similar manner.

In order to do that, mark pages, for which mmap() was passed through,
with PAGE_PASSTHROUGH, and then allow madvise() passthrough for these
pages as well.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 include/exec/cpu-all.h |  6 ++++++
 linux-user/mmap.c      | 25 +++++++++++++++++++++----
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index f5bda2c3ca..fbdbc0fdec 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -262,6 +262,12 @@ extern const TargetPageBits target_page;
 #define PAGE_TARGET_1  0x0200
 #define PAGE_TARGET_2  0x0400
 
+/*
+ * For linux-user, indicates that the page is mapped with the same semantics
+ * in both guest and host.
+ */
+#define PAGE_PASSTHROUGH 0x0080
+
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
 
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 4e7a6be6ee..58622a0c15 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -424,7 +424,8 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size, abi_ulong align)
 abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
                      int flags, int fd, abi_ulong offset)
 {
-    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
+    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len,
+              passthrough_start = -1, passthrough_end = -1;
     int page_flags, host_prot;
 
     mmap_lock();
@@ -537,6 +538,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
             host_start += offset - host_offset;
         }
         start = h2g(host_start);
+        passthrough_start = start;
+        passthrough_end = start + len;
     } else {
         if (start & ~TARGET_PAGE_MASK) {
             errno = EINVAL;
@@ -619,6 +622,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
                      host_prot, flags, fd, offset1);
             if (p == MAP_FAILED)
                 goto fail;
+            passthrough_start = real_start;
+            passthrough_end = real_end;
         }
     }
  the_end1:
@@ -626,7 +631,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         page_flags |= PAGE_ANON;
     }
     page_flags |= PAGE_RESET;
-    page_set_flags(start, start + len, page_flags);
+    if (passthrough_start == passthrough_end) {
+        page_set_flags(start, start + len, page_flags);
+    } else {
+        if (start != passthrough_start) {
+            page_set_flags(start, passthrough_start, page_flags);
+        }
+        page_set_flags(passthrough_start, passthrough_end,
+                       page_flags | PAGE_PASSTHROUGH);
+        if (passthrough_end != start + len) {
+            page_set_flags(passthrough_end, start + len, page_flags);
+        }
+    }
  the_end:
     trace_target_mmap_complete(start);
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
@@ -845,7 +861,7 @@ static bool can_passthrough_madv_dontneed(abi_ulong start, abi_ulong end)
     }
 
     for (addr = start; addr < end; addr += TARGET_PAGE_SIZE) {
-        if (!(page_get_flags(addr) & PAGE_ANON)) {
+        if (!(page_get_flags(addr) & (PAGE_ANON | PAGE_PASSTHROUGH))) {
             return false;
         }
     }
@@ -888,7 +904,8 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
      *
      * This breaks MADV_DONTNEED, completely implementing which is quite
      * complicated. However, there is one low-hanging fruit: host-page-aligned
-     * anonymous mappings. In this case passthrough is safe, so do it.
+     * anonymous mappings or mappings that are known to have the same semantics
+     * in the host and the guest. In this case passthrough is safe, so do it.
      */
     mmap_lock();
     if ((advice & MADV_DONTNEED) &&
-- 
2.35.3


