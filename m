Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0416464B950
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:11:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p57re-0007EA-Eq; Tue, 13 Dec 2022 11:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p57rL-00079B-IV
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:10:23 -0500
Received: from mout.gmx.net ([212.227.15.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p57rJ-00006z-Hz
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 11:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1670947819; bh=EvqXHaoecpcbvZ7l2/xpaihdH/rCWjIFiFVi14jkw/4=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=mmSCD/S4PF0J8+4GWeygxrOZW+Nm8igl0f7rvqMbJPvGp6sNMSPx+pXZyi+mo90oL
 yI3rXXFYosha+thck7e26peRGj68TBzAiulUa1rGhFxazarcB9ZT0oT+ZcPkkhuYCc
 9zpssTIw6vhPmGJH+9Q8FXOzEWhFihGfsWF4AGfafzuXBFlpXPGOO7tCSwvELqHDOZ
 yitD6Xm3tQchIU8V5CW2hpuRav/NE6PiFPrWijnQhQnRrWqPLR9PIAXu7XO06P97ZD
 E7Z5EsL7sd4RYVJFdAmR9gB7OJS6r2cLeknJHob9bOspuPtj95MZpnXltG1awF5wJV
 HiWZDjQ689Y0w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([92.116.135.201]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6UZv-1oypGd430j-006yCw; Tue, 13
 Dec 2022 17:10:19 +0100
Date: Tue, 13 Dec 2022 17:10:17 +0100
From: Helge Deller <deller@gmx.de>
To: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Enhance /proc/cpuinfo output for sparc, hppa and
 m68k
Message-ID: <Y5ij6ST3s5dLNHPM@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:XDWZnSesEsQnRAjua4dTuww7oYIrnnnpuTskshXYHgdq3sS6YC/
 h/hvApun5yCVwkph/nfqdUA0orL0nuiwuYp1g3ivXcm5wuHWLqMYfsUWCl98Cmn+EHXp9w8
 srDlZRWjAgXH3PsjnHJpbWrm3tEPch+sWjFYjaEokXaOoPLT6rWCYvx+Vj3SP5qR6ez3mP1
 wKYwqjhmhDXd9IiltTf8w==
UI-OutboundReport: notjunk:1;M01:P0:5JklsFJC+vI=;BCBOSNHuNEaPi/j9K7Cf4c2q/pU
 3gHbIlK/984BwMyam5m93NCgPmgeaxrh7tfPEwzjJEfgO9acJ2PYz1j0liLbxOtlIgqdh7ZDq
 ejbWbNHwF/TU33oMoxY/l3ZEDz8T4doksttWa7dH1J7ECMEFeLf8Fu8jr5Uyi81ivhjaIAUbu
 idhKqZLYUOCpG1V/53olD6azt7FeFqb9nBErqsrG6/cFsdUYeCHI8tepMffEW5KzH4I54HHNR
 T/gn1Z8R5VrUkwmTToxKn1eKplOCv9qGCPmTu33scfoVewdQ7BMxfhaCI41Lliufbavjs8GK+
 A2NCuwOXARTkZH81HmwJcKocP1buWhZkfBm/RJDaQyBBfRtr5+kJBhNdhfdnQ+Gb8Yp/p12wX
 Q6AGuLuIVeZ4dJEsGCos52r2iaesAzZfSxnRguY7IHtj3wzOB5GEkyzPPghjSWl0o5dvJDjHc
 To0gm3HzMyJF+R4Ya2fWPo3M3MAlT5ibbLZJr5WiVNvJpUgebH2j5FBIZ969NKYLjxTLzlFOX
 BnbYunt+79oky2NAq2eZs4RsEXw1RfEkOoJ6R76hiiD66Q5XgmR+LsH1tPUvDQWoI1/VTK/3y
 GnuJySk5iq55BOrZcZoc1mFgshQhAW1CV6McKS9ErZzG/4koyXzw5/s9h/4pOvc7BiWc6sNY6
 9mjLpLx2qCD9DMjolsSHLe4M4rbQna0zW6OUmw3YxCY1Q0vxyksegDuVU7dB39u9daWYKHyBG
 H1nsfiG4rNeryJ/QUimGzMUXr0XW/oRQidnSTRCfZqbfX0K2w88v3AKb8NC9io4hnyMZ9R5gt
 t0NC0mK8GQF/n9NBAjnObo0StWMh8RJJBEtjhvNqsTdaezVUseqQt52vA9mgxHxVizbnpMHxe
 O4Dr05gPNovPzuxQQwIz0gzKnl0ynHU4oQnqmYMPoM8sUTlfObyTOLl7qCQmfrxlfahEkk6TQ
 dLlPJybNhpvh+C4vt72cWYOGDIU=
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

The sparc, hppa and m68k architectures provide an own output for the
emulated /proc/cpuinfo file.

Some userspace applications count (even if that's not the recommended
way) the number of lines which start with "processor:" and assume that
this number then reflects the number of online CPUs. Since those 3
architectures don't provide any such line, applications may assume "0"
CPUs.  One such issue can be seen in debian bug report:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024653

Avoid such issues by adding a "processor:" line for each of the online
CPUs.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9e2c0a18fc..d58e9b8d10 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8299,7 +8299,13 @@ static int open_net_route(CPUArchState *cpu_env, int fd)
 #if defined(TARGET_SPARC)
 static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 {
-    dprintf(fd, "type\t\t: sun4u\n");
+    int i, num_cpus;
+
+    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
+    for (i = 0; i < num_cpus; i++) {
+        dprintf(fd, "%sprocessor\t: %d\n", (i > 0) ? "\n":"", i);
+        dprintf(fd, "type\t\t: sun4u\n");
+    }
     return 0;
 }
 #endif
@@ -8307,11 +8313,17 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 #if defined(TARGET_HPPA)
 static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 {
-    dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
-    dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
-    dprintf(fd, "capabilities\t: os32\n");
-    dprintf(fd, "model\t\t: 9000/778/B160L\n");
-    dprintf(fd, "model name\t: Merlin L2 160 QEMU (9000/778/B160L)\n");
+    int i, num_cpus;
+
+    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
+    for (i = 0; i < num_cpus; i++) {
+        dprintf(fd, "%sprocessor\t: %d\n", (i > 0) ? "\n":"", i);
+        dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
+        dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
+        dprintf(fd, "capabilities\t: os32\n");
+        dprintf(fd, "model\t\t: 9000/778/B160L - "
+                    "Merlin L2 160 QEMU (9000/778/B160L)\n");
+    }
     return 0;
 }
 #endif
@@ -8319,6 +8331,7 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 #if defined(TARGET_M68K)
 static int open_hardware(CPUArchState *cpu_env, int fd)
 {
+    dprintf(fd, "processor\t: 0\n");
     dprintf(fd, "Model:\t\tqemu-m68k\n");
     return 0;
 }

