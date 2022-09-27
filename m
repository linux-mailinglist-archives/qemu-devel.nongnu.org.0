Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E358D5EC3EC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:14:25 +0200 (CEST)
Received: from localhost ([::1]:34146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAPo-0007nU-Su
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od8eb-0000om-LQ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:21:35 -0400
Received: from mout.gmx.net ([212.227.17.20]:58433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1od8eZ-0000Yo-K8
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664277687;
 bh=+fCikU8oGewwV5fb2gZaw3RxXW570qCENzy9my8B3ZY=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=Z3uI4yvp0ugIVc32YEQYaO3gXHChbZuRcQ9V4iNbBBgV9BafKYep73wa4r6sd2cL9
 Vg3woN+3wQjCwjJU2Nkdvb4mk51rZzYKinS3DG5Si34AdormMh8AwPhO+JNGpIUiqp
 nvhSg7DS22YdimMNsXHXRLs2tC9u5RdKmIiSznUE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.138.255]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MGz1f-1oPgVY3Fw3-00E1hI; Tue, 27
 Sep 2022 13:21:27 +0200
Date: Tue, 27 Sep 2022 13:21:24 +0200
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Subject: ddd
Message-ID: <YzLctFYiBG/JkNuH@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:gg/pa041vPkrDBSWx+lg1bJ0vxAALOt7vnU6b1008aj6t0NQ9OS
 04dn8VvGpP1fGtT4R+cQzZkJ7eG5+ad++boqc3tcAcYG+AOIAaMeSeGk8WknfeWWQrcGzo2
 nDmvzLdH97QTts5RK/qAdmcpEramvyiIhN2PcP2D4pHvfHnPjVdJmdkKpl9tKtXMUcyo8/1
 2gx+Gp5uF6ynlYuXz4geQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HeP3RMO7vzs=:TZbhUnCR5bXOgYFmCNUxQ/
 I3MDekmQUrYdZphhzMftJqoB92K0OqtX4OLE5IdwysEjMqW1NoWngx8HrHkYU26qjG0UTKWTW
 yRumIUXxde2O1Qgn8Pb/2apmzGk5mrnszRXcqelu3LlSEXwajAoGTrUwm3u9KC/McFfp7wWUs
 wiIcjnnJMAgDvtwF6xPahfq1z30WdPAYBQixZHEX4uPrz+Eg1zdNAIZczMy/ZUOJ+0ywcJOwe
 yJeLHlQkNZ7eAbEgVNuRlSFtGvmFOYn4ySqIay7Uf4Q3XdLUlktv0pH2uAcfib3xKYnnEbto0
 v3rfwIw/Bgndf/D7//E4OMT895zqtIJBx4axxMqY8RVHvtvA3qipn5METrVip4twmomtjBSjS
 qpE1crDKBCZr63kFusaJvEWjUsUVjDnydQSDl9hlEh1VWD2qXnxJYFBPgCkjs+g5LSQ6Xz5L1
 cuGescpXBc0/zgiuykSzDXg7m8HQfdPIkHn+ZZKMMaTahwXxD9v8l2j/SFkwa45JHkJdxyWZK
 T6N/4NT9fW0AJqk8vNMRzs3IuyUhg09ROWKr3WQHmM5Dcj4e7R9PMruUU12tPjY5S+EpyD/Wq
 83/zyQ0Cydg4PIE4yNGFc9BmPesHUiaO66xt1CPWqLJb7ugiBvYczORepMnbAkaiYvMox+4EJ
 +rRvl17Apnk8ammQeMT1SkQBkTbm5qYC3/ZSx66i2JL6bNju5CaKwdo4tPvjmAekqyP1/f9xY
 2Pq5AgLIyCLsS027m91GvCT314//4hroWlg2FP7Kz2jAhp9uyGJNn/FpDFtp5P2o5EXq3wQPy
 QG6bQX2T+h8FXjCCyfMtzpUhu4PB3eZjofaoU9Fjxlt9+o5rc2vfWOOf2sDgz5jd6Ac8iQg0K
 0ciXFY4NIAujkA1ggMNwp6igA3xg6BT9iuTfRgbdFE2xEdFNo/Z+2NXZj3SayntE4FxCJF1Do
 5wKe41zPURXJbUz9aMgTnqGP87FTkIIG37tD3Brp/JpLviLSwjPEX+gemEa21xy5jeq3ypPr8
 BYfh8CffbjZEc+vX8nfY1BvlVtExGXZaWngc4o4Np04Qx0mXpf1/q343OEH1Ho0P+ZcqXAuH9
 vCIUFpp6D2D7J3rWLXt5S8Gc9yB5F2F80r/3rO0yPXl1hIxW2Ge3rEi5FoUGUlp/NiDkdrfeJ
 L60neZYtNO7WG71FhiZ9K3VMgi
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add faccessat2() with strace output.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D--
v2: Resending with minor commit message changes.

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 7d882526da..307d19f5d0 100644
=2D-- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1931,7 +1931,7 @@ print_execv(CPUArchState *cpu_env, const struct sysc=
allname *name,
 }
 #endif

-#ifdef TARGET_NR_faccessat
+#if defined(TARGET_NR_faccessat) || defined(TARGET_NR_faccessat2)
 static void
 print_faccessat(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
diff --git a/linux-user/strace.list b/linux-user/strace.list
index 72e17b1acf..ef120ddd11 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -177,6 +177,9 @@
 #ifdef TARGET_NR_faccessat
 { TARGET_NR_faccessat, "faccessat" , NULL, print_faccessat, NULL },
 #endif
+#ifdef TARGET_NR_faccessat2
+{ TARGET_NR_faccessat2, "faccessat2" , NULL, print_faccessat, NULL },
+#endif
 #ifdef TARGET_NR_fadvise64
 { TARGET_NR_fadvise64, "fadvise64" , NULL, NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f409121202..f51c4fbabd 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -399,6 +399,9 @@ _syscall3(int, ioprio_set, int, which, int, who, int, =
ioprio)
 #if defined(TARGET_NR_getrandom) && defined(__NR_getrandom)
 _syscall3(int, getrandom, void *, buf, size_t, buflen, unsigned int, flag=
s)
 #endif
+#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
+_syscall4(int, faccessat2, int, dirfd, char *, pathname, int, mode, int, =
flags)
+#endif

 #if defined(TARGET_NR_kcmp) && defined(__NR_kcmp)
 _syscall5(int, kcmp, pid_t, pid1, pid_t, pid2, int, type,
@@ -9098,6 +9101,15 @@ static abi_long do_syscall1(CPUArchState *cpu_env, =
int num, abi_long arg1,
         unlock_user(p, arg2, 0);
         return ret;
 #endif
+#if defined(TARGET_NR_faccessat2) && defined(__NR_faccessat2)
+    case TARGET_NR_faccessat2:
+        if (!(p =3D lock_user_string(arg2))) {
+            return -TARGET_EFAULT;
+        }
+        ret =3D get_errno(faccessat2(arg1, p, arg3, arg4));
+        unlock_user(p, arg2, 0);
+        return ret;
+#endif
 #ifdef TARGET_NR_nice /* not on alpha */
     case TARGET_NR_nice:
         return get_errno(nice(arg1));

