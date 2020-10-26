Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620B1299976
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 23:17:46 +0100 (CET)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXAoD-0005X0-AV
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 18:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kXAan-0005js-Uy
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 18:03:53 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:56951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kXAai-0005Ff-2b
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 18:03:53 -0400
Received: from localhost.localdomain ([82.252.139.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MKbPg-1kpnuH47ga-00KwFF; Mon, 26 Oct 2020 23:03:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] linux-user: remove _sysctl
Date: Mon, 26 Oct 2020 23:03:37 +0100
Message-Id: <20201026220339.195790-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026220339.195790-1-laurent@vivier.eu>
References: <20201026220339.195790-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vPiMZIUBIXumJmFo7IV8fDFusub79Ur+4MlUqePvf+3G+WNm1Vf
 a5MqELLiJRonf/eTf9TLF6GpdyUZd+xZLLmdn/ZsC1xhm8J5dPproZw4w27ail9AhTHYpVq
 MkIQvGSeZo20US7D07OluT5N7esNRUHp/bc2KaiKc7IZbNBKn6a1ioTOWqIYwZgTBCqT/NP
 f8B2wpYS0EVLFUltFF91w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r5lxtjNw3uQ=:oZMTmu0W2YnWlhweZa/tn4
 m0bqDfe2e3BtEN9S+GYKu0qvx4R91dHu4v5JkiM9LVjsz6uPHrt85SEIcC07x5Xa4u50CjtxD
 apdLGQ4Q2jEtTOi3mHOmESIMCmxiBaa5fPlGyDHmXCs5cO3M3DNLItkXJK7A/Op3IbX72MWpy
 4xQZTCr+cednnH48ZhTWd36W6OvOhbL3u60KDCnsfuro3/Utdqo0gBPmRVQ/No6CnEZHBGKSe
 T1ZdwrquI4vJZpNtvQGvOAZBBoZSJrZ66pv+knp7EJfvY0KxXY5HiNTkKbWG6f3YHi2lQ8OOj
 19cTK1obnElIdqU+y2Q+YkcwJ7KhIL+qZ26PosDqjcN0AffDqjI9sZWcogKVOIGVwnrzR3olV
 C0mfEFYwm708tG2I6uhOngFbRjTTINLGTr4KU+uj8kEjLyE1OrQY32zCMmk7oeWdk/vkADvLT
 Kj1ClqV7Qw==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 18:03:45
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It has been removed from linux since

  61a47c1ad3a4 ("sysctl: Remove the sysctl system call")

It's a good news because it was not really supported by qemu.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200930003033.554124-5-laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index cd520ae42e6d..f0df6aecef80 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10529,12 +10529,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #if defined(TARGET_NR_fdatasync) /* Not on alpha (osf_datasync ?) */
     case TARGET_NR_fdatasync:
         return get_errno(fdatasync(arg1));
-#endif
-#ifdef TARGET_NR__sysctl
-    case TARGET_NR__sysctl:
-        /* We don't implement this, but ENOTDIR is always a safe
-           return value. */
-        return -TARGET_ENOTDIR;
 #endif
     case TARGET_NR_sched_getaffinity:
         {
-- 
2.26.2


