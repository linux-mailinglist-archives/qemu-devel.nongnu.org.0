Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E08067F009
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 22:00:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLVoD-0006Xq-8z; Fri, 27 Jan 2023 15:58:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pLVoB-0006Xf-M0
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:58:51 -0500
Received: from mout.gmx.net ([212.227.17.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1pLVoA-000209-19
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 15:58:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1674853128; bh=QiFPN3bFqmhqeVJFHP25ibgHutJvjyOScIAYMAcynWU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=CuomJtiSor0GSSWjXVC+ddG1te6ZL7exrnrEPAxgVrbwDmcMsxTfAV4nOhGu8rRNk
 cAirybD19VmYTgEkNLii0BO/4mIP1G1xQSYVmCOHaKJZda7lQkCToNz37VOC09hxfU
 Oc5NGockbNN0uaazZ+0X+ir9YM5aJg6+rQP6ZO8T+annwyPykrimNbv7LbsmnjHnZG
 jeXext3rMwIDPLJq7tWPXiZdihly5jnUxpXj36MvOarzPUDaD9gQOfjpcC46tNLlz1
 FFjipt68Sy0gKMXG8aLV+ZTCnJLN4PKeCfvGirbBmotyg1SOlRvLgBrTKGf+Sw/2u4
 oHQWRJZfY6+wg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.191.252]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2Dx8-1ofKac0yX0-013aT6; Fri, 27
 Jan 2023 21:58:48 +0100
Date: Fri, 27 Jan 2023 21:58:46 +0100
From: Helge Deller <deller@gmx.de>
To: Helge Deller <deller@gmx.de>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH v2] linux-user: Improve strace output of pread64() and
 pwrite64()
Message-ID: <Y9Q7BlDc/VX+1SBL@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:UcYjgEIJ7OepMuLaTnJqVlB79EfOuMvF5zeXFNmEkBXV0qxuo2p
 7cLgtcQCA3gQbwxoBSVLxs5NmRSNGNr4SHTVy/foK33ZAN4AEVKIVrIR/qti+NwMADyIqSB
 cDOrZ8A5k4nDSa8zxK5mFKDRvNq/g2CrNovI03H5lIRJ24Xh/JUpaKHhaifEOr1xm1I4NO/
 BN/m6zDBD1C3aLRSFesNA==
UI-OutboundReport: notjunk:1;M01:P0:DRvVa8bn/2k=;Avjza1/E4RKkhEyGrCXEm9y9rcB
 y4wLEM3NUUvEUDRtTEyLkAkKfMGTJ0ZgYN1EmgWA/2D4hD3iouDIPJZkJsGXc4D56y459l25A
 wJ6Tk7dtqd3kEKzg4lj3m2/2JzMCSi7eCUN28s5P+Mu+SqKAVVbttMyAscM0SzlPuX9wUTHOA
 J4ONSnZH8UphIvQOPj737Bm4kvyeW+pOHRlhg4YZWTMl68P02SZK1FFr8giZQat41nRTehCOG
 8Z5199r/1VTfoCJEi8pErpgxdmaAniHrm30F9xWq6106BkdamInybZxtChwIbea9qB4283MWM
 QxHX1uNZwAsSo7p8sw6tN4J6WjT/SVF6gwcKXE94vWWHRAEI2JlptsFIfF2YJRv+joQDyRPfF
 /og8EyhUVjSy1zcmTfQ6u3fi657r+g/A39Y6JcgBZnwnfVwxPhu2XrsIqzjGtQ7f5Xu70vf9k
 R6WvtZFSMzgkHRIerKssFJdb8RjNiajVJKihn/J3gTYa1Z7HxxEqkap6WlQyQNEFS1X7OqPRm
 UROCogilPc0UCT+vMcWbPAnmyS2Uem0qdbMU55k+0vn3L1wIsZ8QYIwDm/9XhERQxHcAPeaGX
 36EvmPhr3c1cPyO+oPji/BGQ5al26jwdmp4OSS3q7JqVa7/s1VrOQt0Hq61pDOJeEw1NOkMPe
 M6h08w+lbw0qjIslm03AScAE39X/g1GQE+22gRK1H7xhJzFiKBS38bzxk9EphHwyHwCngQHlx
 xQUn3k65aWmNjSSk8pXHwH3P2b/KD0DZ6pE5ZQhxIYFfkbWkeihYlHpGKBgVoZ1ePQpN6H9h3
 w4m7PitsDVXnVGth4Dn4Fnv6ML0jpftf08vbzt5QetU20yXSx/UM8FFAk/QwObJeAEjPjQzwy
 VwZozQW/57RyiGpCamI9weSc3xWg0dSs+0/tF6Qwghr7sWPdbPDLyk40KhX6+mE1NGhupavwe
 QSJ7s/87dDI+XcbW+tUNAIpXF0U=
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
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

Make the strace look nicer for those two syscalls.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
v2: Use regpairs_aligned() and target_offset64(), noticed by Laurent Vivie=
r

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 82dc1a1e20..379536f5c9 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -3824,6 +3824,25 @@ print_rlimit64(abi_ulong rlim_addr, int last)
     }
 }

+#if defined(TARGET_NR_pread64) || defined(TARGET_NR_pwrite64)
+static void
+print_preadwrite64(CPUArchState *cpu_env, const struct syscallname *name,
+           abi_long arg0, abi_long arg1, abi_long arg2,
+           abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    if (regpairs_aligned(cpu_env, TARGET_NR_pread64)) {
+        arg3 =3D arg4;
+        arg4 =3D arg5;
+    }
+    print_syscall_prologue(name);
+    print_raw_param("%d", arg0, 0);
+    print_pointer(arg1, 0);
+    print_raw_param("%d", arg2, 0);
+    qemu_log("%lld", (long long)target_offset64(arg3, arg4));
+    print_syscall_epilogue(name);
+}
+#endif
+
 static void
 print_prlimit64(CPUArchState *cpu_env, const struct syscallname *name,
            abi_long arg0, abi_long arg1, abi_long arg2,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 909298099e..4ae60e5e87 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1061,7 +1061,7 @@
 { TARGET_NR_prctl, "prctl" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_pread64
-{ TARGET_NR_pread64, "pread64" , NULL, NULL, NULL },
+{ TARGET_NR_pread64, "pread64" , NULL, print_preadwrite64, NULL },
 #endif
 #ifdef TARGET_NR_preadv
 { TARGET_NR_preadv, "preadv" , NULL, NULL, NULL },
@@ -1092,7 +1092,7 @@
 { TARGET_NR_putpmsg, "putpmsg" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_pwrite64
-{ TARGET_NR_pwrite64, "pwrite64" , NULL, NULL, NULL },
+{ TARGET_NR_pwrite64, "pwrite64" , NULL, print_preadwrite64, NULL },
 #endif
 #ifdef TARGET_NR_pwritev
 { TARGET_NR_pwritev, "pwritev" , NULL, NULL, NULL },

