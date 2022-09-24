Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED5C5E8C05
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 13:59:58 +0200 (CEST)
Received: from localhost ([::1]:55560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc3p7-0001jN-CG
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 07:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3at-0004Lm-Rc
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:15 -0400
Received: from mout.gmx.net ([212.227.15.15]:59043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3an-0003Qn-Ui
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664019905;
 bh=prBuuUKqXQ/QQZOTLE66uCdrZzZWYpud5lfUUjs7PRk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ggxE4kRbj3RpIUSjHFJAyL9LFgh4SzvR2R9ZErhcTg487UkDZa62lR+HX+726Po7v
 hitN0LcxH2w/4NOLH9kwXI/i9xwWkzvEx3APc0dCsycqcdnhpHfEWLKgIDEbvAs1Ld
 IfP75xtqCVAdyC/YxZOUQd7lLUb1YMUnLY8lYXhQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.155.187]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1My32L-1pTTdH3xrr-00zYxV; Sat, 24
 Sep 2022 13:45:04 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 5/7] linux-user/hppa: Increase guest stack size to 80MB for
 hppa target
Date: Sat, 24 Sep 2022 13:44:59 +0200
Message-Id: <20220924114501.21767-6-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924114501.21767-1-deller@gmx.de>
References: <20220924114501.21767-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ok+i4KaY1Q5D4nXvPPLl7oC3RUd+WsmUW0Z/yy4snOUrCBbrjdZ
 OCkvpG0w1JlrH5lZwlaZeIXOZk0dCjbDzYypQfPS+LM3y0ScvucHpkvEJ+dWfn52L0L74SK
 mZ8ZXeaWJ2Wq4IUFATFjWC1ksySclrOYpKUlZWMSf2guTWBH1t+sBusUgldxHrv7bRNiiev
 lP2AY04iJ4zXqezfQJgmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jUY/q50uvcM=:MIWojSN5VYdoaHoNVQlW1v
 ljthnACdh/E7ewhHOeIkVxmQ6HethqH4XH1eYvUbXxybu+LTNGwC7WE4Y6r+FPv4c8u0/5EZ7
 pCWtDWWwpfpSgAjImJ0lo52vbFWxIl95fwP0HZ2d5/fqTqu1DNrZR+LT+2LYxExjnszdzWm+T
 NjAKie0utn9QyntLS+QM4EaMyVAkLpEfd74aCKCSmip7JwQPcHHuhKpx4aMRQargCeXhmTMIo
 Lv0PYd8grbgBpSBd6nRrW/eNpsNevgfCRuWRK0yFpmpgbnkEWmfu1Ewb1WYIn1drixVW7lVCs
 pbVr+1ccVmenFhlVQiNE7+CmWI4EWKzNKPVz70BQLunKw3IocwEKrRGyqTtZn80z7OWp4vi/k
 u+6rgobYxBbTPX2P+jbKYWo/gFOuVaYc3v7TKifmvMeiViU6FVKkb6DwIQ5LvznCyo0nfRMWM
 2XJI5beCx/9mmSZkvH+B8H78BeYlenyDsaYZAODZvaigH8t13Vrk9+nSkbXAWNk85yU0iUhif
 2u7r+CM3tCV0f9DZNm6PMohv+hhuNQXA3flip19Ux3n+W+ErfYLbOZmt6+20SF/XTjfuB3jxK
 k/OEgRFsn8c+4jUDbyigN/3sitfwAR870ha4hpReqO+8N+/eRaw7e6ra6wuCs1YnweCdmKjoe
 3Nx/uuQZRzHvXEJuQm1cBhAQ7gT1ZSMXdfFWagKYG1UCqQUvniNS20AU5eyPwalOrfoIGfDcK
 dE+W358SDw/JIOqJzl6QOmXHFxmNPaHfeMhHxwkH1ByTgb4md+O55KDmKYf+YyhMzkKsxwPD8
 i1pTTarHvBf0Y/Z6PUcT3TK5ZNBEHW3OeTLdSIjpYNNIre6M/19s7lFb18MQQRgxlTwblkrno
 0P3VLUFUu2wZzwzHmDPt+2rmHFPlgOgqX+oCwsKYqaHPHu/bZTxhCkwVmg8ShxC+3opWKWld4
 y/mBgTvEZ1EpduYgyOoD1mNEi8Bu5LP1UANvkEuk+bjsqtz+f0yEUQtQLIcaDCnB9L2A395w8
 nTVKmgFF8KvbM4uun1QvXcrblv1WU9435/4pfO2czyQd0Nm98xnHLXaucZdVQMn9FNcuvcVuM
 2pEKhCzRFXgqSjjGfGlEV6MfBsr8I+DasYT0MjRSMHrX41sIZ90p+4GrVsp19xlTP9OxWo7AL
 LrvlIrUaoYsf/WuJlz4MOx2M3w
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
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

The hppa target requires a much bigger stack than many other targets,
and the Linux kernel allocates 80 MB by default for it.

This patch increases the guest stack for hppa to 80MB, and prevents
that this default stack size gets reduced by a lower stack limit on the
host.

Since the stack grows upwards on hppa, the stack_limit value marks the
upper boundary of the stack. Fix the output of /proc/self/maps (in the
guest) to show the [stack] marker on the correct memory area.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/hppa/target_syscall.h | 2 ++
 linux-user/main.c                | 9 +++++++--
 linux-user/syscall.c             | 4 ++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/linux-user/hppa/target_syscall.h b/linux-user/hppa/target_sys=
call.h
index 4b382c1fcf..9a8f8ca628 100644
=2D-- a/linux-user/hppa/target_syscall.h
+++ b/linux-user/hppa/target_syscall.h
@@ -26,4 +26,6 @@ struct target_pt_regs {
 #define TARGET_MCL_FUTURE  2
 #define TARGET_MCL_ONFAULT 4

+#define TARGET_DEFAULT_STACK_SIZE	80 * 1024 * 1024UL
+
 #endif /* HPPA_TARGET_SYSCALL_H */
diff --git a/linux-user/main.c b/linux-user/main.c
index 587bd02db2..3a86feb09a 100644
=2D-- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -124,10 +124,14 @@ static void usage(int exitcode);
 static const char *interp_prefix =3D CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;

+#if !defined(TARGET_DEFAULT_STACK_SIZE)
 /* XXX: on x86 MAP_GROWSDOWN only works if ESP <=3D address + 32, so
    we allocate a bigger stack. Need a better solution, for example
    by remapping the process stack directly at the right place */
-unsigned long guest_stack_size =3D 8 * 1024 * 1024UL;
+#define TARGET_DEFAULT_STACK_SIZE	8 * 1024 * 1024UL
+#endif
+
+unsigned long guest_stack_size =3D TARGET_DEFAULT_STACK_SIZE;

 /***********************************************************/
 /* Helper routines for implementing atomic operations.  */
@@ -690,7 +694,8 @@ int main(int argc, char **argv, char **envp)
         struct rlimit lim;
         if (getrlimit(RLIMIT_STACK, &lim) =3D=3D 0
             && lim.rlim_cur !=3D RLIM_INFINITY
-            && lim.rlim_cur =3D=3D (target_long)lim.rlim_cur) {
+            && lim.rlim_cur =3D=3D (target_long)lim.rlim_cur
+            && lim.rlim_cur > guest_stack_size) {
             guest_stack_size =3D lim.rlim_cur;
         }
     }
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4bbf46b622..d17f5d1c66 100644
=2D-- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8043,7 +8043,11 @@ static int open_self_maps(CPUArchState *cpu_env, in=
t fd)
                 continue;
             }

+#ifdef TARGET_HPPA
+            if (h2g(max) =3D=3D ts->info->stack_limit) {
+#else
             if (h2g(min) =3D=3D ts->info->stack_limit) {
+#endif
                 path =3D "[stack]";
             } else {
                 path =3D e->path;
=2D-
2.37.3


