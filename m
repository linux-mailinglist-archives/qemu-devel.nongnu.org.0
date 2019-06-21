Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1A84E73D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 13:38:20 +0200 (CEST)
Received: from localhost ([::1]:59880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heHs4-0006To-1D
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 07:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48963)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHkT-0000ar-Fh
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHkQ-0005Ev-Bu
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:29 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38544)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1heHkQ-0005Cn-42
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:26 -0400
Received: by mail-wm1-x341.google.com with SMTP id s15so6220186wmj.3
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 04:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ke6hwa+fUFiQaqvIXIEK/11GyBhYea2HOMTU01E3LaM=;
 b=ICy7sHW5samAXJ7/H8BTDY1DCLswqB7AegKSlPf4opmnZtESAMSlHM81f2Apcj+kVs
 2L2gEQgWet/3V+UkxfNj/r3pk5h5L1jhyZaPssTkmAg9WtzaJAixE5PUr9EDyT4qM3mH
 0vZpL4nYLFomhC/jthDJxrKjhGd1O0D7QMQEq9phdFphKiH10dUVkYUa7xhv3pTRtjmw
 481/vO99Z/Z7OhuTo5uhFQuyWWpFRfk7Y8LUZ+Pej1MHOgep3sOZ0WulmyVb3fNyMVUR
 Jp7atNdCP+9js/qzmV30yw+rDw3nL6fwtKTp9deFbDSwstKplmLRfbM2beaS8QiK6S8Y
 luLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=ke6hwa+fUFiQaqvIXIEK/11GyBhYea2HOMTU01E3LaM=;
 b=gw9K1KMr1L8xD97Z3wYO3cUugTehWandVZUFVaQEnfTOMjI9NP0RFghx6occgGOvh+
 gdszCflNB6wJdCZJKf9g+r+bA4j19qzzCU0kaiZ9irVkHr0s1S1D+7kxipM+rKm0/qzg
 l4qsWstlmswkaFYML8llugYBvn3cWxiqXVpk5U1zTi+JZ+y2R+4ZcK9oesP25LGxShrJ
 DStQgiC6M0dAarWgNJoZ7yhgikJkdpDdhsKnxYeK9sIZapYX682204VroNmjHG2YTRm2
 vsg4NWMOEYNttxB9ypOS8DQrK3jun9Oq5NYN7qCE/gPGrpAJdEr+Thg1b9SOE8RSH/lw
 bRYw==
X-Gm-Message-State: APjAAAUx9mdGHBtANiE3IsoqR5cNieI7np0CGjdgmfQye3LlhOJHuILv
 iATpr6oBcpkBpbFQGHDVdaAjvZAe
X-Google-Smtp-Source: APXvYqzs5bQBhvJk07wBq1ilqh66P6ED7DpRePxiIYfEagBtxpEVvAS4d3qjQcPgcanWWaewn20WZw==
X-Received: by 2002:a1c:9a53:: with SMTP id c80mr3609041wme.173.1561116624284; 
 Fri, 21 Jun 2019 04:30:24 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id r3sm2712851wrr.61.2019.06.21.04.30.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 04:30:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 13:29:57 +0200
Message-Id: <1561116620-22245-3-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
References: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PULL 02/25] hax: Honor CPUState::halted
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
Cc: Colin Xu <colin.xu@intel.com>, Yu Ning <yu.ning@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Colin Xu <colin.xu@intel.com>

QEMU tracks whether a vcpu is halted using CPUState::halted. E.g.,
after initialization or reset, halted is 0 for the BSP (vcpu 0)
and 1 for the APs (vcpu 1, 2, ...). A halted vcpu should not be
handed to the hypervisor to run (e.g. hax_vcpu_run()).

Under HAXM, Android Emulator sometimes boots into a "vcpu shutdown
request" error while executing in SeaBIOS, with the HAXM driver
logging a guest triple fault in vcpu 1, 2, ... at RIP 0x3. That is
ultimately because the HAX accelerator asks HAXM to run those APs
when they are still in the halted state.

Normally, the vcpu thread for an AP will start by looping in
qemu_wait_io_event(), until the BSP kicks it via a pair of IPIs
(INIT followed by SIPI). But because the HAX accelerator does not
honor cpu->halted, it allows the AP vcpu thread to proceed to
hax_vcpu_run() as soon as it receives any kick, even if the kick
does not come from the BSP. It turns out that emulator has a
worker thread which periodically kicks every vcpu thread (possibly
to collect CPU usage data), and if one of these kicks comes before
those by the BSP, the AP will start execution from the wrong RIP,
resulting in the aforementioned SMP boot failure.

The solution is inspired by the KVM accelerator (credit to
Chuanxiao Dong <chuanxiao.dong@intel.com> for the pointer):

1. Get rid of questionable logic that unconditionally resets
   cpu->halted before hax_vcpu_run(). Instead, only reset it at the
   right moments (there are only a few "unhalt" events).
2. Add a check for cpu->halted before hax_vcpu_run().

Note that although the non-Unrestricted Guest (!ug_platform) code
path also forcibly resets cpu->halted, it is left untouched,
because only the UG code path supports SMP guests.

The patch is first merged to android emulator with Change-Id:
I9c5752cc737fd305d7eace1768ea12a07309d716

Cc: Yu Ning <yu.ning@intel.com>
Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Signed-off-by: Colin Xu <colin.xu@intel.com>
Message-Id: <20190610021939.13669-1-colin.xu@intel.com>
---
 cpus.c                |  1 -
 target/i386/hax-all.c | 36 ++++++++++++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/cpus.c b/cpus.c
index dde3b7b..1af51b7 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1594,7 +1594,6 @@ static void *qemu_hax_cpu_thread_fn(void *arg)
 
     cpu->thread_id = qemu_get_thread_id();
     cpu->created = true;
-    cpu->halted = 0;
     current_cpu = cpu;
 
     hax_init_vcpu(cpu);
diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index 64fd51a..9e7b779 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -471,13 +471,35 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
         return 0;
     }
 
-    cpu->halted = 0;
-
     if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
         cpu->interrupt_request &= ~CPU_INTERRUPT_POLL;
         apic_poll_irq(x86_cpu->apic_state);
     }
 
+    /* After a vcpu is halted (either because it is an AP and has just been
+     * reset, or because it has executed the HLT instruction), it will not be
+     * run (hax_vcpu_run()) until it is unhalted. The next few if blocks check
+     * for events that may change the halted state of this vcpu:
+     *  a) Maskable interrupt, when RFLAGS.IF is 1;
+     *     Note: env->eflags may not reflect the current RFLAGS state, because
+     *           it is not updated after each hax_vcpu_run(). We cannot afford
+     *           to fail to recognize any unhalt-by-maskable-interrupt event
+     *           (in which case the vcpu will halt forever), and yet we cannot
+     *           afford the overhead of hax_vcpu_sync_state(). The current
+     *           solution is to err on the side of caution and have the HLT
+     *           handler (see case HAX_EXIT_HLT below) unconditionally set the
+     *           IF_MASK bit in env->eflags, which, in effect, disables the
+     *           RFLAGS.IF check.
+     *  b) NMI;
+     *  c) INIT signal;
+     *  d) SIPI signal.
+     */
+    if (((cpu->interrupt_request & CPU_INTERRUPT_HARD) &&
+         (env->eflags & IF_MASK)) ||
+        (cpu->interrupt_request & CPU_INTERRUPT_NMI)) {
+        cpu->halted = 0;
+    }
+
     if (cpu->interrupt_request & CPU_INTERRUPT_INIT) {
         DPRINTF("\nhax_vcpu_hax_exec: handling INIT for %d\n",
                 cpu->cpu_index);
@@ -493,6 +515,16 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
         hax_vcpu_sync_state(env, 1);
     }
 
+    if (cpu->halted) {
+        /* If this vcpu is halted, we must not ask HAXM to run it. Instead, we
+         * break out of hax_smp_cpu_exec() as if this vcpu had executed HLT.
+         * That way, this vcpu thread will be trapped in qemu_wait_io_event(),
+         * until the vcpu is unhalted.
+         */
+        cpu->exception_index = EXCP_HLT;
+        return 0;
+    }
+
     do {
         int hax_ret;
 
-- 
1.8.3.1



