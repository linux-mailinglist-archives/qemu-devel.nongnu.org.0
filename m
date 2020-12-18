Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5302DE103
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:30:03 +0100 (CET)
Received: from localhost ([::1]:35370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqD1O-0002y6-BY
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvu-0002z8-3c
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:22 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:32927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvq-00074F-0c
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:21 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MS3rB-1kg8pw3gOB-00TUuF; Fri, 18 Dec 2020 11:24:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/14] linux-user/sparc: Remove unneeded checks of 'err' from
 sparc64_get_context()
Date: Fri, 18 Dec 2020 11:24:05 +0100
Message-Id: <20201218102407.597566-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ZmAq9ybs8O5o28NnMQotEu1ugm4XdPERtwd950RO8gEeC4I8rcD
 YUcRpcQiQFywXZkcukoicbqYh/sHIk7diteQmJWrCs5UbCdqpezSibVoO3UI460FULRuoqC
 6O/fZriYmLZ4x8Wz8D09JT1oLEDTmUkVtRKcaxNYLFHYhYHOkb+O5RkU68WfN78VeUXQdMT
 zMEyMnHoFxsOptUK/pKVQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ztmoiu/l2bA=:KI5SRkyExS5Sv0iD3WzIDW
 R7f+Yi/8EqmncTKNUovIAqI2nvbkpqqfEiswX2Ufew77C6mGS7MgjKJetZvKTlaZ432um/480
 rvtJGU1x1lzW9JAk5xauJi/hrnnY3z+AzZKkH7Nzhw3DEicE9yLQYjFpZG7e3lnB/6eaENnBq
 PCAwyQetCEv54j6KIx/keN4PkUvEFj6g7+coTFSNk9ubzWSmWdk43qQGyNZSWX1OLmPoxsjJ0
 r3aEeNgWh5TAasdkDfWWh5svg+YMfBJuG/gzoz0TuKQHELZwjHILbv6LWCnqVZYFEpxqrfMHh
 ZusrLZ6br+Qp/uBD3nP3GPqOdKNA7iqWvqG7laZ/3BXCD3PwFJKA6XlmU6DGv5T4wR1brbkog
 Sz0l8it6kYEcotG59GJYX/C8s7xM+rc/f6PN4pJP82R2yLfhzweZImQEVndtMcXUzXBYlaMcW
 2csR2wsDbw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Unlike the kernel macros, our __get_user() and __put_user() do not
return a failure code.  Kernel code typically has a style of
  err |= __get_user(...); err |= __get_user(...);
and then checking err at the end.  In sparc64_get_context() our
version of the code dropped the accumulating into err but left the
"if (err) goto do_sigsegv" checks, which will never be taken. Delete
unnecessary if()s.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201106152738.26026-3-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sparc/signal.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 0057b48fad93..58b48afe29c9 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -555,8 +555,6 @@ void sparc64_get_context(CPUSPARCState *env)
         for (i = 0; i < TARGET_NSIG_WORDS; i++, dst++, src++) {
             __put_user(*src, dst);
         }
-        if (err)
-            goto do_sigsegv;
     }
 
     /* XXX: tstate must be saved properly */
@@ -598,8 +596,6 @@ void sparc64_get_context(CPUSPARCState *env)
      * hidden behind an "if (fenab)" where fenab is always 0).
      */
 
-    if (err)
-        goto do_sigsegv;
     unlock_user_struct(ucp, ucp_addr, 1);
     return;
 do_sigsegv:
-- 
2.29.2


