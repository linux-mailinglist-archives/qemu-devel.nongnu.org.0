Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5CF648133
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 11:57:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3b2q-0000xl-5d; Fri, 09 Dec 2022 05:55:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p3b2l-0000wo-Kh
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 05:55:52 -0500
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p3b2g-0002Ic-5A
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 05:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670583342; bh=1C3/oOv5s+naGTsjEJ+azzuNMFC1+8qwjwSMF2w4nzw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Oby+seFeMujkbL9fAQdxiVgLYOo6SpIUGiWr/xSCSDL+fW+na4flpa1A8LfAG3aQ2
 hO7+sF7rlubKMUI4CAl+bd18vi4py4TmWvHjgRXGM0qIYjlVOjZ5keZsMmoR4pZRVO
 dCA5fbelbte4D0k4mkO/YvR7XePZscHslRneU2E7VZY+IafP8IgMIXaUJC4oGGJRNK
 OUaIj79N/bmgXt0PQ7caUaib7Q686I1NdyAMC2BNJJE7k84dbwQisvYcmlWoL+l82f
 fKdUx1Ac/LN/M7QiKXIdIN/N+kR47KA/FjekAObjUKx/yhnNzLQEoAJ1vpKbXHo8KA
 aWlTm8iTr79Aw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.149.187]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzBp-1pKzT51JWz-00Hw4z; Fri, 09
 Dec 2022 11:55:42 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH] linux-user: Enhance strace output for various syscalls
Date: Fri,  9 Dec 2022 11:55:31 +0100
Message-Id: <20221209105531.40286-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cvLQNVTFQkbrLvxFnKJIHMoyM/H/erOpiw2onOGoFye/0/7Hqa/
 qp77SZGPfhHot2ccsXYnYAxRJymgnDn3x7vqO/WW8Mcn2IRQZcQ8GdwJSeu6h80RA9h2cWJ
 ei9HxlOpFkBJchkfnKycZW7ihSu9X2gCMm6MWZ97cXUHZhNnjXpxUdUY1op9TX5/Dn/BVuR
 jEiMPtfqffuUPOWKtEe4w==
UI-OutboundReport: notjunk:1;M01:P0:gKE4C+QzAas=;77Jc/eNrKGEtgASaHV9cZdF9HHc
 ak2O65p9R8XnIaPrrCjGUOQap5C82jk1xQY0ZUQqHEEnhzWSbyquHqfq3VJ9kkMsAn11mN6vu
 21JeBquAXF+tG5F5iDhNQD4SUCj4cBA2dNf3wItepUZthF4HP0gILKFm73e4CJz1UwrOxga5v
 lDqpzXMn0EaW3Zq+zIPVtcRWCku3eUhEzSmNhR+N6Jqm0whmNI+mH1FxFn6sH9CemvUMpmxyJ
 eD8/RqGc93H6AoxZ5/d65EmInISppcGXHQyE9u15cgMV8TrqKGy170L+96rmTrTcniJqANamn
 bWiv+1cQXPJ/9ayrDtqAHMVGW+izGCFJ3K5QzoS0JqfXMwSVcJrK7GS4dUdDBHdglWa8hgZU9
 E/DNxcFA5eY8qdYiKBsEgnwgXYwVUUrDNjD7T8BCuLqi35P5v5DqgoShcvKDfm+VT8bfFDu75
 YrR86GtMC6zQ0Soiyy+0N7baRIXACO1cW+oNgtr0kWAA6MFR2yLPHckOdC1E0xJ1QI8tB1YgM
 jSXApI5Du4/jzBWCOo97hT5ctSdnZN+7BbiLx9jahSLqtiM+P+hFC0WIRgLPIwhISvozTD0ZL
 GhaIPZRDDKE2nsy/eCtVB/zuu4kutYFk4xzhmfKuVTrw90iIjSkUIrchChgMBhM78vo7AqRI4
 QfY4eEpzfbjSSgqzaiPWodK9UCxeVacdCWI4byAz9dOleD1Ej8x9at89qob9+5UDoUb9/RGW3
 lZqxB8p61OJI7RgoheNczK4hI3Yya+4dDlPfWbdcb37dMBvNSWm3yVwb1GLVqciTzevz39CyA
 T1B48AJV5FsPKpiAzGz/aobWQh7Ky43DHtnG9mD8O6oxzvRSOAZ673QO1Rav9XW2x0Ia79G5f
 SqwR8TT6QlMzYvkFHuA4hjlaooDF9Ot3KZlfvbkljUsfUSDJYXl5tZESbvjoG+SSAHBE4/m34
 /p2lpQ==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add appropriate strace printf formats for various Linux syscalls.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 43 ++++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 3a898e2532..4091a9e79d 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -337,7 +337,7 @@
 { TARGET_NR_getpagesize, "getpagesize" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_getpeername
-{ TARGET_NR_getpeername, "getpeername" , NULL, NULL, NULL },
+{ TARGET_NR_getpeername, "getpeername" , "%s(%d,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getpgid
 { TARGET_NR_getpgid, "getpgid" , "%s(%u)", NULL, NULL },
@@ -361,19 +361,19 @@
 { TARGET_NR_getrandom, "getrandom", "%s(%p,%u,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresgid
-{ TARGET_NR_getresgid, "getresgid" , NULL, NULL, NULL },
+{ TARGET_NR_getresgid, "getresgid" , "%s(%p,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresgid32
 { TARGET_NR_getresgid32, "getresgid32" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresuid
-{ TARGET_NR_getresuid, "getresuid" , NULL, NULL, NULL },
+{ TARGET_NR_getresuid, "getresuid" , "%s(%p,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getresuid32
 { TARGET_NR_getresuid32, "getresuid32" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_getrlimit
-{ TARGET_NR_getrlimit, "getrlimit" , NULL, NULL, NULL },
+{ TARGET_NR_getrlimit, "getrlimit" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_get_robust_list
 { TARGET_NR_get_robust_list, "get_robust_list" , NULL, NULL, NULL },
@@ -385,10 +385,10 @@
 { TARGET_NR_getsid, "getsid" , "%s(%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getsockname
-{ TARGET_NR_getsockname, "getsockname" , NULL, NULL, NULL },
+{ TARGET_NR_getsockname, "getsockname" , "%s(%d,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getsockopt
-{ TARGET_NR_getsockopt, "getsockopt" , NULL, NULL, NULL },
+{ TARGET_NR_getsockopt, "getsockopt" , "%s(%d,%d,%d,%p,%p)", NULL, NULL }=
,
 #endif
 #ifdef TARGET_NR_get_thread_area
 #if defined(TARGET_I386) && defined(TARGET_ABI32)
@@ -1052,10 +1052,10 @@
 { TARGET_NR_pivot_root, "pivot_root" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_poll
-{ TARGET_NR_poll, "poll" , NULL, NULL, NULL },
+{ TARGET_NR_poll, "poll" , "%s(%p,%d,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_ppoll
-{ TARGET_NR_ppoll, "ppoll" , NULL, NULL, NULL },
+{ TARGET_NR_ppoll, "ppoll" , "%s(%p,%d,%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_prctl
 { TARGET_NR_prctl, "prctl" , NULL, NULL, NULL },
@@ -1124,7 +1124,7 @@
 { TARGET_NR_reboot, "reboot" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_recv
-{ TARGET_NR_recv, "recv" , NULL, NULL, NULL },
+{ TARGET_NR_recv, "recv" , "%s(%d,%p,%d,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_recvfrom
 { TARGET_NR_recvfrom, "recvfrom" , NULL, NULL, NULL },
@@ -1184,7 +1184,7 @@
 { TARGET_NR_rt_sigqueueinfo, "rt_sigqueueinfo" , NULL, print_rt_sigqueuei=
nfo, NULL },
 #endif
 #ifdef TARGET_NR_rt_sigreturn
-{ TARGET_NR_rt_sigreturn, "rt_sigreturn" , NULL, NULL, NULL },
+{ TARGET_NR_rt_sigreturn, "rt_sigreturn" , "%s(%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_rt_sigsuspend
 { TARGET_NR_rt_sigsuspend, "rt_sigsuspend" , NULL, NULL, NULL },
@@ -1196,16 +1196,19 @@
 { TARGET_NR_rt_tgsigqueueinfo, "rt_tgsigqueueinfo" , NULL, print_rt_tgsig=
queueinfo, NULL },
 #endif
 #ifdef TARGET_NR_sched_getaffinity
-{ TARGET_NR_sched_getaffinity, "sched_getaffinity" , NULL, NULL, NULL },
+{ TARGET_NR_sched_getaffinity, "sched_getaffinity" , "%s(%d,%u,%p)", NULL=
, NULL },
 #endif
 #ifdef TARGET_NR_sched_get_affinity
 { TARGET_NR_sched_get_affinity, "sched_get_affinity" , NULL, NULL, NULL }=
,
 #endif
 #ifdef TARGET_NR_sched_getattr
-{ TARGET_NR_sched_getattr, "sched_getattr" , NULL, NULL, NULL },
+{ TARGET_NR_sched_getattr, "sched_getattr" , "%s(%d,%p,%u,%u)", NULL, NUL=
L },
+#endif
+#ifdef TARGET_NR_sched_setattr
+{ TARGET_NR_sched_setattr, "sched_setattr" , "%s(%p,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sched_getparam
-{ TARGET_NR_sched_getparam, "sched_getparam" , NULL, NULL, NULL },
+{ TARGET_NR_sched_getparam, "sched_getparam" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sched_get_priority_max
 { TARGET_NR_sched_get_priority_max, "sched_get_priority_max" , NULL, NULL=
, NULL },
@@ -1220,7 +1223,7 @@
 { TARGET_NR_sched_rr_get_interval, "sched_rr_get_interval" , NULL, NULL, =
NULL },
 #endif
 #ifdef TARGET_NR_sched_setaffinity
-{ TARGET_NR_sched_setaffinity, "sched_setaffinity" , NULL, NULL, NULL },
+{ TARGET_NR_sched_setaffinity, "sched_setaffinity" , "%s(%d,%u,%p)", NULL=
, NULL },
 #endif
 #ifdef TARGET_NR_sched_setatt
 { TARGET_NR_sched_setatt, "sched_setatt" , NULL, NULL, NULL },
@@ -1353,23 +1356,23 @@
 { TARGET_NR_setreuid32, "setreuid32" , "%s(%u,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_setrlimit
-{ TARGET_NR_setrlimit, "setrlimit" , NULL, NULL, NULL },
+{ TARGET_NR_setrlimit, "setrlimit" , "%s(%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_set_robust_list
-{ TARGET_NR_set_robust_list, "set_robust_list" , NULL, NULL, NULL },
+{ TARGET_NR_set_robust_list, "set_robust_list" , "%s(%p,%d)", NULL, NULL =
},
 #endif
 #ifdef TARGET_NR_setsid
 { TARGET_NR_setsid, "setsid" , "%s()", NULL, NULL },
 #endif
 #ifdef TARGET_NR_setsockopt
-{ TARGET_NR_setsockopt, "setsockopt" , NULL, NULL, NULL },
+{ TARGET_NR_setsockopt, "setsockopt" , "%s(%d,%d,%d,%p,%p)", NULL, NULL }=
,
 #endif
 #ifdef TARGET_NR_set_thread_area
 { TARGET_NR_set_thread_area, "set_thread_area", "%s(0x"TARGET_ABI_FMT_lx"=
)",
   NULL, NULL },
 #endif
 #ifdef TARGET_NR_set_tid_address
-{ TARGET_NR_set_tid_address, "set_tid_address" , NULL, NULL, NULL },
+{ TARGET_NR_set_tid_address, "set_tid_address" , "%s(%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_settimeofday
 { TARGET_NR_settimeofday, "settimeofday" , NULL, print_settimeofday, NULL=
 },
@@ -1648,7 +1651,7 @@
 { TARGET_NR_vserver, "vserver" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_wait4
-{ TARGET_NR_wait4, "wait4" , NULL, NULL, NULL },
+{ TARGET_NR_wait4, "wait4" , "%s(%d,%p,%d,%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_waitid
 { TARGET_NR_waitid, "waitid" , "%s(%#x,%d,%p,%#x)", NULL, NULL },
@@ -1672,7 +1675,7 @@
 { TARGET_NR_sync_file_range2, "sync_file_range2", NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_pipe2
-{ TARGET_NR_pipe2, "pipe2", NULL, NULL, NULL },
+{ TARGET_NR_pipe2, "pipe2", "%s(%p,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_pidfd_open
 { TARGET_NR_pidfd_open, "pidfd_open", "%s(%d,%u)", NULL, NULL },
=2D-
2.38.1


