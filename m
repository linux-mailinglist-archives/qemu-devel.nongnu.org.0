Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DD84F08D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 23:46:16 +0200 (CEST)
Received: from localhost ([::1]:38060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heRMN-0006Wa-Du
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 17:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47618)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <liran.alon@oracle.com>) id 1heREB-0002sm-Km
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 17:37:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <liran.alon@oracle.com>) id 1heRE6-0001on-1c
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 17:37:44 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:45920)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <liran.alon@oracle.com>)
 id 1heRE4-0001m7-3Q
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 17:37:41 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5LLYddq168769;
 Fri, 21 Jun 2019 21:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2018-07-02;
 bh=Wh431tg7vPDPfhFil9wchrYih7rygjCi4hi/dLVlj3E=;
 b=ngPjJ45kaHmomrmcJG1lABgHqayYSSXCa8ANMb74mkijwFrDmO9DhskhQ8MMo/Z39jk4
 e3/+0VBpksQwkQVGEFZhhqg4bcB/iJAaVLW6ppxOCN0jjAxvkdUWt0Q/ytapegCUUn1F
 kzoiiPBF5zAk9phtqPmcekvTe7zsNypyEAp0qPPRxsjsj2/bd13SzHXbDRSRnvyMyHVI
 5zaQE4ZJlJwa5pmxZhuJHVP76V2VRFmnWEJ2Xh3i0aXACvmgOqZjPCtsmwP2zV4qXkMh
 0Z5BeP4jFqO0CSVdCXPq6dhP1LImPYAO5kBgzRxMsEc2KEAUn4m0Qnewpao6KPGkm4s/ lA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2t7809rfg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 21:37:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5LLbKGd127102;
 Fri, 21 Jun 2019 21:37:37 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2t7rdxy06g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jun 2019 21:37:36 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5LLbZe0002365;
 Fri, 21 Jun 2019 21:37:35 GMT
Received: from Lirans-MBP.Home (/109.64.216.174)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 21 Jun 2019 14:37:35 -0700
From: Liran Alon <liran.alon@oracle.com>
To: qemu-devel@nongnu.org
Date: Sat, 22 Jun 2019 00:37:12 +0300
Message-Id: <20190621213712.16222-3-liran.alon@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190621213712.16222-1-liran.alon@oracle.com>
References: <20190621213712.16222-1-liran.alon@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9295
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906210164
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9295
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906210164
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 156.151.31.85
Subject: [Qemu-devel] [PATCH 2/2] target/i386: kvm: Init nested-state in
 case of vCPU exposed with SVM
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
Cc: maran.wilson@oracle.com, dgilbert@redhat.com,
 Liran Alon <liran.alon@oracle.com>, pbonzini@redhat.com,
 Karl Heubaum <karl.heubaum@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though current most upstream kernel does not support save/restore
of nested-state in case of AMD SVM, prepare QEMU code to init
relevant nested-state struct fields.

Reviewed-by: Mark Kanda <mark.kanda@oracle.com>
Reviewed-by: Karl Heubaum <karl.heubaum@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
---
 target/i386/kvm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index c2bae6a3023a..be192e54a80b 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1714,13 +1714,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
         env->nested_state->size = max_nested_state_len;
 
-        if (IS_INTEL_CPU(env)) {
+        if (cpu_has_vmx(env)) {
             struct kvm_vmx_nested_state_hdr *vmx_hdr =
                 &env->nested_state->hdr.vmx;
-
             env->nested_state->format = KVM_STATE_NESTED_FORMAT_VMX;
             vmx_hdr->vmxon_pa = -1ull;
             vmx_hdr->vmcs12_pa = -1ull;
+        } else if (cpu_has_svm(env)) {
+            env->nested_state->format = KVM_STATE_NESTED_FORMAT_SVM;
         }
     }
 
-- 
2.20.1


