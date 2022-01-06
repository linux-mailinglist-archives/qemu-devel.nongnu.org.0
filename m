Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1810A486332
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:52:43 +0100 (CET)
Received: from localhost ([::1]:44456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QNu-0007zN-5h
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:52:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDY-0007lh-PI
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:00 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:43203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDQ-0004jn-Pt
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:42:00 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MfHIZ-1mTdQV0KgV-00goy9; Thu, 06
 Jan 2022 11:41:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 02/27] linux-user/hexagon: Use generic target_stat64 structure
Date: Thu,  6 Jan 2022 11:41:12 +0100
Message-Id: <20220106104137.732883-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:P3yrWGTTx8rZnUXP2Z1XBlZNARuCE+UfgT+nMT7CQ92zhAn/ZbH
 Sfb81stPeKZwHvTRyc+rsmSpW0vlJ+e08LbXopw5RPLWzQMM/sKYgTvM7myvTNsTsHajLTz
 OOmxVmqPV33D0/cHqe2YXKIo1TTuKIhJay+kvjiADHmw0kaMHdc3btotYcvbMD4S0bi5VIC
 5wwODfY/UJeJhJ4f11CEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gKN/v6+/gwA=:oqTBn+xf57wX/oMcQcOpUG
 6VyL+a2J0p1sDEaQuuuK5vilF9JjUrCsiyfE1BZpSliuzOHGWZLpdZ+iVW4DXjoFoCVKVe40H
 oSvpP3LJlU7vNXANsXZaQaD9GfSSx/o/iCBXPF5Gtc3AA8aLQFp25arQuPFmxQs4uFcU6/vvq
 G4OJ08paOG/jQ59u1cmjiiyq4HYBlEseOB07vbsB111igMosSqE27GhRbMcQynu06Nr3VeZPk
 x/4+yvb6wrLjp9T8YK9pu9Y7EkroS3TbQUULfc8atMa5/sZbBgVSZeJ/2cfl9F8DUHchQEIns
 k2WWNTHWB5WN90qVz3843u17/Rs/xTBReFUgQkulketTpPsJihj4Pl5O9mOwzq3f2tGqxVUYU
 pAnCo0599TwDs1pSW4T/SZp9movFUzuy0Rzy0XQ3hHA42Yb2JMnn9HIhAFvU4sVFflK6lD+Fi
 FkMluOKq2mEiHW83aftBAfZzxf4xMsHtH2o+OWNhGzwlgTIJVDfEkSsRWgNPmCkL5dkmRtSC7
 APQbF+TCI1Foac9BeYpYXXdbyoqSjsBKTjRDmi/U33st2hyJE0pCqgirvoLyDmgoJwX3Fx1ax
 MKo+N80HbioHM9AMz/KzfDt1neYTdbJv2kdzOKx8Q6VJL3bX6B+TMP5ZU5TAH96qIH94YhO/w
 /NHvGoGkckGoYLMMTBvByF65hJfC/jyJ7xIQMtGbN0FiGCLjEgEeFSrUs2iLWgT62WxI=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Linux Hexagon port doesn't define a specific 'struct stat'
but uses the generic one (see Linux commit 6103ec56c65c [*]
"asm-generic: add generic ABI headers" which predates the
introduction of the Hexagon port).

Remove the target specific target_stat (which in fact is the
target_stat64 structure but uses incorrect target_long and
ABI unsafe long long types) and use the generic target_stat64
instead.

[*] https://github.com/torvalds/linux/commit/6103ec56c65c3#diff-5f59b07b38273b7d6a74193bc81a8cd18928c688276eae20cb10c569de3253ee

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Tested-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <20211116210919.2823206-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall_defs.h | 28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 0b139759377b..585e933140ac 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2133,7 +2133,8 @@ struct target_stat64  {
     abi_ulong __unused5;
 };
 
-#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) || defined(TARGET_RISCV)
+#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) \
+        || defined(TARGET_RISCV) || defined(TARGET_HEXAGON)
 
 /* These are the asm-generic versions of the stat and stat64 structures */
 
@@ -2244,31 +2245,6 @@ struct target_stat64 {
     uint64_t   st_ino;
 };
 
-#elif defined(TARGET_HEXAGON)
-
-struct target_stat {
-    unsigned long long st_dev;
-    unsigned long long st_ino;
-    unsigned int st_mode;
-    unsigned int st_nlink;
-    unsigned int st_uid;
-    unsigned int st_gid;
-    unsigned long long st_rdev;
-    target_ulong __pad1;
-    long long st_size;
-    target_long st_blksize;
-    int __pad2;
-    long long st_blocks;
-
-    target_long target_st_atime;
-    target_long target_st_atime_nsec;
-    target_long target_st_mtime;
-    target_long target_st_mtime_nsec;
-    target_long target_st_ctime;
-    target_long target_st_ctime_nsec;
-    int __unused[2];
-};
-
 #else
 #error unsupported CPU
 #endif
-- 
2.33.1


