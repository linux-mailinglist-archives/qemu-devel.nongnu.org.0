Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A4F4AB7E8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:43:03 +0100 (CET)
Received: from localhost ([::1]:39684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0Y2-00009w-Kt
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:43:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNY-000645-KG
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:08 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:53171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNV-00079B-4C
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:07 -0500
Received: from quad ([82.142.19.58]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N0o3X-1oDLK00jPJ-00wkou; Mon, 07
 Feb 2022 09:28:01 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] linux-user: Remove unnecessary 'aligned' attribute from
 TaskState
Date: Mon,  7 Feb 2022 09:27:52 +0100
Message-Id: <20220207082759.180431-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082759.180431-1-laurent@vivier.eu>
References: <20220207082759.180431-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JY/PovTIkwSsApTcj3xi4dQnCYGxxgq7387nWZV6ESeBWC9/snp
 wavuVoYcuHORoNoERvZFSxb0ILEUaTNY5y7kVEwXAttZ+ODGV4iTsFsvqTQGE9pX3TYFbJZ
 JcrUupZm7c7o8nFQwni4C44wN0wEkTix2BG5ORcJxRkaTghw9ePW32Mh8gbJ/Xr4A35UYn3
 hWaU1KQEmvdkPLq9f3Oag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KqoL3oVntYc=:A30PJevTPN1bXAYGzXQpxZ
 ItSFdWaDCIv2MHk8INXvdO4u5YwInuSe16r8kgUPKCTFr7excPq9MJMdtYCNmnnn60EI62stU
 EF4Bs0dxgry+g0abYPBu6EbmEgRDPcIfGaoDEmH2Gb8aFq28kWazFNh8k+KBjdxe3XkIEjH7+
 BDxXUYGsZEmnbYnT75pLrJc5RrC1P7j+nlWvDOleEP/h9R7lHLlCdENN3bvCFBz3fdhJw9RXo
 lS0fAZiZsfX4ROtSSKvAMdkAtZCoIE2WDrCdw2TrdbTGCKQyt/b6nDRRoxtlgVyvhh4GyHoxH
 wmV0B12hfXTYwrmzdQKLQzZ/hCVkYjU95m/gjDaRMw4I/z5NLXvJSDZFEboE3EXC6IccRJ+jd
 YstNKdlBSwgU8BFUPfb427wMvQhBO/oJ5abpAM93plVCtkQIuYmfCQlXSd253K1mpsZ6Rvfwx
 pvUlgcmFdmr00ZGPKWo6kIN8v0njHxdiOlTtT/5LWbnAthgeBXgE1chfptQabMCl64u09fibp
 TMMjJCKfb7+nzL1HcNlgfjH3IecLoW8/mz+GTt24RP1AurCRY4vJQyV5PWSo7W5BPAQRNwFjB
 YxabPOCRW9Hpc6PHpql/G0eUsGWrm8mlFGbbJVp3mqGBsG1UwCvQ1Ct3KQH/6ULswu5O0HPvF
 wg7WrxMcXgzZpPpb1LGa6GiuMEaQUtL0N4vY4l26MkS7slVKmXG/mOWY350iy3TEpcb8=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The linux-user struct TaskState has an 'aligned(16)' attribute.  When
the struct was first added in commit 851e67a1b46f in 2003, there was
a justification in a comment (still present in the source today):

/* NOTE: we force a big alignment so that the stack stored after is
   aligned too */

because the final field in the struct was "uint8_t stack[0];"
But that field was removed in commit 48e15fc2d in 2010 which
switched us to allocating the stack and the TaskState separately.
Because we allocate the structure with g_new0() rather than as
a local variable, the attribute made no difference to the alignment
of the structure anyway.

Remove the unnecessary attribute, and the corresponding comment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220114153732.3767229-2-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/qemu.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 7910ce59cc8c..9d2b3119d1fe 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -94,10 +94,6 @@ struct emulated_sigtable {
     target_siginfo_t info;
 };
 
-/*
- * NOTE: we force a big alignment so that the stack stored after is
- * aligned too
- */
 typedef struct TaskState {
     pid_t ts_tid;     /* tid (or pid) of this task */
 #ifdef TARGET_ARM
@@ -158,7 +154,7 @@ typedef struct TaskState {
 
     /* This thread's sigaltstack, if it has one */
     struct target_sigaltstack sigaltstack_used;
-} __attribute__((aligned(16))) TaskState;
+} TaskState;
 
 abi_long do_brk(abi_ulong new_brk);
 
-- 
2.34.1


