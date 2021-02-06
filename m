Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D433120CD
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 02:59:34 +0100 (CET)
Received: from localhost ([::1]:42924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ZMK-0005Wx-T1
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 20:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elias-djossou.git@gmx.de>)
 id 1l8Wt6-0000fj-0i
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 18:21:12 -0500
Received: from mout.gmx.net ([212.227.15.15]:47073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elias-djossou.git@gmx.de>)
 id 1l8Wt3-0000jI-4c
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 18:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612653661;
 bh=PT19v41SqS65jgrs8h/0poqxEWixUtjhKw9gkOodwgg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=My+iEnHzGB2QxFz62ymjgb79HUNHeoywUoGlKjd6UHwuxwniI4nZWfLGfeKmMp7sU
 Oy944l0E9bJEdamZ5IbQQ1oP394Qp0vdbeA9VnfMKOkHR9KAUIjEnW/+8xqjjV+uPQ
 uM3cbVaABuveMzsm3Tc8K2W86q00Od/GTAVjbq10=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from EDJ-L.Speedport_W_724V_01011603_07_002 ([84.185.53.154]) by
 mail.gmx.net (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MbAh0-1lffqH37V2-00bdDA; Sun, 07 Feb 2021 00:21:01 +0100
From: Elias Djossou <elias-djossou.git@gmx.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] Expose i386 model specific registers via HMP
Date: Sun,  7 Feb 2021 00:20:58 +0100
Message-Id: <20210206232058.4209-1-elias-djossou.git@gmx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Eo7AETKoTeo6W0N7e99eFT5KFGfJ1+HGPZ0wCYHPgqcp1veyIvF
 NDyLpW8/XhWPuHYdBnJ9zJR78JppA4o3Zi1HF2Eufi4OlWLUx9Oo3nEw3UN7N5G/OOVQz7y
 rNhIb/NUQAn+ANZIuTvNfmEhOz/mVulemhbkfuo15Z89t9DlTmCJNsU/x5N1fdYlkhqOE0k
 5kmaDTEcyIHxZuSMHZf/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:prajYkMOigg=:vvykFCSXAE5pvRm6CPAqB7
 S1j1adnPvjVOxomco2aBDpMdMMF7Weo7/LoVpf851aw8WnDT3/46fExuP1KA06syiHfx4EzU1
 3Ycr26mbZKbQHj1cFG44m6bquBu05lxJekOEf9UoNE1CkDpZIwZFy/0iSJbb+zmUn5NXJXRWT
 D6Y5MVT9VVv+794NGEWJuHzYZ2muT63XS+prSrqIlSAaO1/EPpXY5UloaYr0FMjZ5bfFgrsuh
 JLwIPqkY2ZV7h/vYUUqoRfrRxO/9AAFt93mty8eLygPMOvcLZ5uX/KTLhBWu41qPrgRSNBECg
 vkh5DIXFGz5466pp2wMJXFNTKRd1IG5iKyhOLnak4ftGQWvrYdxu51ZKHq0iifwDXttWo+VCK
 3ttl0lpuBDN/D7YSCK1h1h3XrmxjnCCkXOMGRbAE2PY8a4n5NiUJ6g4vkBDWFzomUKFi3K/Wu
 iERvucWeiLUqAU6mtaqC5Qyr3Dr7RvL6tAonqgChVDsrLhRnlzFVUMAdbWWkfZzvuZY777+Ud
 l9sKmD7zUzpxkBHo6eVRmmJOR5C3xUhAIxNr6Bd/n1WsGlsTivLcVrJapygvFpR+crYo38H87
 +TaYaJtT2i3mvWi2a5D+Urf+9LtL4efs4qnSKEvr6lwbnEay1IHFWvxNIT3H3PdlVZZORPPre
 MnMo8qrhMlKM2NFjuSpz3wwIxvW3nVNVN7kkwZplnEpGCrYKFB51di9RAMAtMmeATQPHh4eY6
 sxteGbrj2z4WwLBNW2vTI5wt42b9RFaR8AzR5w0p3e1zK/RPAg/5lLCv2TArsNJrTSlCCxP0q
 bCteOBrtr8XqayZYUD+Jk6f2GnDVeOHx2m3b1n3EQOU8bzlRSfAaZv7V+2GPEFzU8YEA+T0+u
 Yu01mfegyAo7jez0BnLVFYN13TphM4iuzZdjrU9Ls=
Received-SPF: pass client-ip=212.227.15.15;
 envelope-from=elias-djossou.git@gmx.de; helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 06 Feb 2021 20:58:08 -0500
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, dgilbert@redhat.com,
 Elias Djossou <elias-djossou.git@gmx.de>, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch aims to expose certain model specific registers on i386 to the =
HMP.

To achieve this a new HMP command "info msr-registers" is added. Since
this is only relevant for i386 an "#if defined(TARGET_I386)" ensures it st=
ays there.
The corrsponding function "hmp_info_msr_registers()" is then implemented
in target/i386/monitor.c which uses the helper function
"x86_print_msr_registers()" in the same file where the print
itself happens.

Signed-of-by: Elias Djossou <elias-djossou.git@gmx.de>

=2D--

This feature can be crucial in certain Debug scenarios since the MSR
registers maintain acceas to highly relevant data structures on the i386 a=
rchitecture.
(e.g. on x86_64 LSTAR stores the OS's system call entrance point) Being
able to access these can immensly enhance introspection capabilities.
Also providing this functionality via the HMP makes the feature available =
to
both the QEMU Monitor itself as well as utilities like for example GDB
(via the "monitor info msr-registers" command).

=2D--

This patch follows up on an idea of Mar 2017
(see https://lists.gnu.org/archive/html/qemu-devel/2017-03/msg01559.html)
but is intended to be more light-weight.

While working on this I came across a problem i would like to get your opi=
nion on.
I would really much like to expose more of the MSRs in struct CPUX86State
(ideally all of them) at sometime in a future patch.
I decided to limit myself to these ones for this one for the following rea=
son:

While these registers would in principle be easily available. Problem
is that there is no function available that allows to read MSRs.
The only related function seems to be "helper_rdmsr()" from target/i386/tc=
g
which doesn't return the value but writes it directly into R_EAX / R_EDX i=
nstead.

So my only options to realize this seem to be:

  1. copy the content of the individual cases from
     helper_rdmsr() to my helper x86_print_msr_registers()

  2. backup R_EAX and R_EDX - call helper_rdmsr() - copy R_EAX, R_EDX
     - apply backup (seems much too hacky to me)

  3. write a new interface similar to helper_rdmsr that really returns the=
 value
     - maybe rewrite helper_rdmsr() to use that helper function as well
     (such a function existed back in the times of the above referenced pa=
tch
     as "x86_cpu_rdmsr()" in target/i386/misc_helper.c)

I would really appreciate your opinions on this
=2D--
 hmp-commands-info.hx         | 15 ++++++++++
 include/monitor/hmp-target.h |  1 +
 target/i386/monitor.c        | 55 ++++++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 117ba25f91..d78c3e799d 100644
=2D-- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -893,3 +893,18 @@ SRST
   ``info replay``
     Display the record/replay information: mode and the current icount.
 ERST
+
+#if defined(TARGET_I386)
+    {
+        .name       =3D "msr-registers",
+        .args_type  =3D "cpustate_all:-a",
+        .params     =3D "[-a]",
+        .help       =3D "show the cpu msr registers (-a: all - show msr r=
egister info for all cpus)",
+        .cmd        =3D hmp_info_msr_registers,
+    },
+#endif
+
+SRST
+  ``info msr-registers``
+    Show the cpu msr registers.
+ERST
diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
index 60fc92722a..756102a773 100644
=2D-- a/include/monitor/hmp-target.h
+++ b/include/monitor/hmp-target.h
@@ -49,5 +49,6 @@ void hmp_info_tlb(Monitor *mon, const QDict *qdict);
 void hmp_mce(Monitor *mon, const QDict *qdict);
 void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
 void hmp_info_io_apic(Monitor *mon, const QDict *qdict);
+void hmp_info_msr_registers(Monitor *mon, const QDict *qdict);

 #endif /* MONITOR_HMP_TARGET_H */
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 1bc91442b1..b274c42bf3 100644
=2D-- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -736,3 +736,58 @@ void qmp_sev_inject_launch_secret(const char *packet_=
hdr,
 {
     sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
 }
+
+static void x86_print_msr_registers(Monitor *mon, CPUState *cs)
+{
+    X86CPU *cpu =3D X86_CPU(cs);
+    CPUX86State *env =3D &cpu->env;
+
+    monitor_printf(mon,
+                "MSR_IA32_SYSENTER_CS=3D%08x\n"
+                "MSR_IA32_SYSENTER_ESP=3D%016lx\n"
+                "MSR_IA32_SYSENTER_EIP=3D%016lx\n"
+                "MSR_STAR=3D%016lx\n",
+                env->sysenter_cs,
+                env->sysenter_esp,
+                env->sysenter_eip,
+                env->star);
+
+#ifdef TARGET_X86_64
+    monitor_printf(mon,
+                "MSR_LSTAR=3D%016lx\n"
+                "MSR_CSTAR=3D%016lx\n"
+                "MSR_FMASK=3D%016lx\n"
+                "MSR_FSBASE=3D%016lx\n"
+                "MSR_GSBASE=3D%016lx\n"
+                "MSR_KERNELGSBASE=3D%016lx\n",
+                env->lstar,
+                env->cstar,
+                env->fmask,
+                env->segs[R_FS].base,
+                env->segs[R_GS].base,
+                env->kernelgsbase);
+#endif
+
+}
+
+void hmp_info_msr_registers(Monitor *mon, const QDict *qdict)
+{
+    bool all_cpus =3D qdict_get_try_bool(qdict, "cpustate_all", false);
+    CPUState *cs;
+
+    if (all_cpus) {
+        CPU_FOREACH(cs) {
+            monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
+            x86_print_msr_registers(mon, cs);
+        }
+    } else {
+        cs =3D mon_get_cpu(mon);
+
+        if (!cs) {
+            monitor_printf(mon, "No CPU available\n");
+            return;
+        }
+
+        x86_print_msr_registers(mon, cs);
+    }
+}
=2D-
2.25.1


