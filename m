Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2A54E73E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 13:38:21 +0200 (CEST)
Received: from localhost ([::1]:59882 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heHs5-0006VX-2g
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 07:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49029)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHkY-0000fj-Ai
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1heHkU-0005Qk-CV
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:34 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45647)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1heHkU-0005OJ-6A
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:30:30 -0400
Received: by mail-wr1-x42d.google.com with SMTP id f9so6189824wre.12
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 04:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Iq0W4QsPIXfjOn4JNS6Kd8bNeG3F7+GRE1ESQz9CIvE=;
 b=KEn+RO9jA57d9xQy63pdzqzckOOwhKNmBSxlZAWjWyy8a4kWGeUZbLm+4R7hA8eeVI
 NTQN1fULRyFxe2WBPveCWcTEsSTztQ8eP2VuS/pOfjJQ3E2yIA3NJOEo2zYmTlOG6jYs
 d8UM/v/CGL+4yyYt7H4edWkot6A9O/dMPkHLy5s+ALo8NGC+h2DNJgX9OBfmDo3GnbCJ
 yHnrUZlY8MZj4kt6LY2qN9Mx/fpptkLqt5wU9j9t3e/RhsB9l4aAq166K1BNvWCVmqvn
 fTJB3yQszDPzsLuUcXJuFsMxYr3ymoirKnfRjXHbCIYE/yOceEVjpKUshu1yV9zdzZyj
 TX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=Iq0W4QsPIXfjOn4JNS6Kd8bNeG3F7+GRE1ESQz9CIvE=;
 b=Bk30HC6WTiIcod7DBuJyaI4mhr5kehg73tBId+z2jZlIirgTJbobtqGbvLKPKI7152
 lO51E25ctEsJm09ERuKHiQnKhOP7sfst9wxfkgM5czqoh7tuPXuhrGI8BzO5lv8s97s5
 YWbbCcR1N35Ir/ABMISNSqTevk1iSXnkoUyyzXRjkqy6D4BfwA1RIDI95tQN/UNqUPRl
 MPUuI6ykmkqO5tJgp1b1A1F6k+uQd0p4ZOa3xt2xbdS/3pHAn83kdMjv0eTtgePqw/MY
 La4KGQvXAkVS/GgL6hJVXD/Z9i+hMiWeV0mFTG4Sg3wjoRn4smhHgBtzau+QbwHuD4Nv
 OnkA==
X-Gm-Message-State: APjAAAVDri+nYchrSUx3PY1uY4VpNfvgLYGfQs+/bCp/a7BroGPu2Yla
 eGrQ3MDS0lr03si1xH75sXnXhA7g
X-Google-Smtp-Source: APXvYqxAARNKzFKDIO9jej04MkvryfmnCHMpL/lX/j6Ca2FsMPjjEnmYtiTZUWGrg11wo/ZoVNPotA==
X-Received: by 2002:adf:eb4e:: with SMTP id u14mr49657531wrn.168.1561116628781; 
 Fri, 21 Jun 2019 04:30:28 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id r3sm2712851wrr.61.2019.06.21.04.30.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 04:30:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 13:30:01 +0200
Message-Id: <1561116620-22245-7-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
References: <1561116620-22245-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42d
Subject: [Qemu-devel] [PULL 06/25] i386/kvm: document existing Hyper-V
 enlightenments
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com>

Currently, there is no doc describing hv-* CPU flags, people are
encouraged to get the information from Microsoft Hyper-V Top Level
Functional specification (TLFS). There is, however, a bit of QEMU
specifics.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Message-Id: <20190517141924.19024-5-vkuznets@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/hyperv.txt | 181 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)
 create mode 100644 docs/hyperv.txt

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
new file mode 100644
index 0000000..c423e0f
--- /dev/null
+++ b/docs/hyperv.txt
@@ -0,0 +1,181 @@
+Hyper-V Enlightenments
+======================
+
+
+1. Description
+===============
+In some cases when implementing a hardware interface in software is slow, KVM
+implements its own paravirtualized interfaces. This works well for Linux as
+guest support for such features is added simultaneously with the feature itself.
+It may, however, be hard-to-impossible to add support for these interfaces to
+proprietary OSes, namely, Microsoft Windows.
+
+KVM on x86 implements Hyper-V Enlightenments for Windows guests. These features
+make Windows and Hyper-V guests think they're running on top of a Hyper-V
+compatible hypervisor and use Hyper-V specific features.
+
+
+2. Setup
+=========
+No Hyper-V enlightenments are enabled by default by either KVM or QEMU. In
+QEMU, individual enlightenments can be enabled through CPU flags, e.g:
+
+  qemu-system-x86_64 --enable-kvm --cpu host,hv_relaxed,hv_vpindex,hv_time, ...
+
+Sometimes there are dependencies between enlightenments, QEMU is supposed to
+check that the supplied configuration is sane.
+
+When any set of the Hyper-V enlightenments is enabled, QEMU changes hypervisor
+identification (CPUID 0x40000000..0x4000000A) to Hyper-V. KVM identification
+and features are kept in leaves 0x40000100..0x40000101.
+
+
+3. Existing enlightenments
+===========================
+
+3.1. hv-relaxed
+================
+This feature tells guest OS to disable watchdog timeouts as it is running on a
+hypervisor. It is known that some Windows versions will do this even when they
+see 'hypervisor' CPU flag.
+
+3.2. hv-vapic
+==============
+Provides so-called VP Assist page MSR to guest allowing it to work with APIC
+more efficiently. In particular, this enlightenment allows paravirtualized
+(exit-less) EOI processing.
+
+3.3. hv-spinlocks=xxx
+======================
+Enables paravirtualized spinlocks. The parameter indicates how many times
+spinlock acquisition should be attempted before indicating the situation to the
+hypervisor. A special value 0xffffffff indicates "never to retry".
+
+3.4. hv-vpindex
+================
+Provides HV_X64_MSR_VP_INDEX (0x40000002) MSR to the guest which has Virtual
+processor index information. This enlightenment makes sense in conjunction with
+hv-synic, hv-stimer and other enlightenments which require the guest to know its
+Virtual Processor indices (e.g. when VP index needs to be passed in a
+hypercall).
+
+3.5. hv-runtime
+================
+Provides HV_X64_MSR_VP_RUNTIME (0x40000010) MSR to the guest. The MSR keeps the
+virtual processor run time in 100ns units. This gives guest operating system an
+idea of how much time was 'stolen' from it (when the virtual CPU was preempted
+to perform some other work).
+
+3.6. hv-crash
+==============
+Provides HV_X64_MSR_CRASH_P0..HV_X64_MSR_CRASH_P5 (0x40000100..0x40000105) and
+HV_X64_MSR_CRASH_CTL (0x40000105) MSRs to the guest. These MSRs are written to
+by the guest when it crashes, HV_X64_MSR_CRASH_P0..HV_X64_MSR_CRASH_P5 MSRs
+contain additional crash information. This information is outputted in QEMU log
+and through QAPI.
+Note: unlike under genuine Hyper-V, write to HV_X64_MSR_CRASH_CTL causes guest
+to shutdown. This effectively blocks crash dump generation by Windows.
+
+3.7. hv-time
+=============
+Enables two Hyper-V-specific clocksources available to the guest: MSR-based
+Hyper-V clocksource (HV_X64_MSR_TIME_REF_COUNT, 0x40000020) and Reference TSC
+page (enabled via MSR HV_X64_MSR_REFERENCE_TSC, 0x40000021). Both clocksources
+are per-guest, Reference TSC page clocksource allows for exit-less time stamp
+readings. Using this enlightenment leads to significant speedup of all timestamp
+related operations.
+
+3.8. hv-synic
+==============
+Enables Hyper-V Synthetic interrupt controller - an extension of a local APIC.
+When enabled, this enlightenment provides additional communication facilities
+to the guest: SynIC messages and Events. This is a pre-requisite for
+implementing VMBus devices (not yet in QEMU). Additionally, this enlightenment
+is needed to enable Hyper-V synthetic timers. SynIC is controlled through MSRs
+HV_X64_MSR_SCONTROL..HV_X64_MSR_EOM (0x40000080..0x40000084) and
+HV_X64_MSR_SINT0..HV_X64_MSR_SINT15 (0x40000090..0x4000009F)
+
+Requires: hv-vpindex
+
+3.9. hv-stimer
+===============
+Enables Hyper-V synthetic timers. There are four synthetic timers per virtual
+CPU controlled through HV_X64_MSR_STIMER0_CONFIG..HV_X64_MSR_STIMER3_COUNT
+(0x400000B0..0x400000B7) MSRs. These timers can work either in single-shot or
+periodic mode. It is known that certain Windows versions revert to using HPET
+(or even RTC when HPET is unavailable) extensively when this enlightenment is
+not provided; this can lead to significant CPU consumption, even when virtual
+CPU is idle.
+
+Requires: hv-vpindex, hv-synic, hv-time
+
+3.10. hv-tlbflush
+==================
+Enables paravirtualized TLB shoot-down mechanism. On x86 architecture, remote
+TLB flush procedure requires sending IPIs and waiting for other CPUs to perform
+local TLB flush. In virtualized environment some virtual CPUs may not even be
+scheduled at the time of the call and may not require flushing (or, flushing
+may be postponed until the virtual CPU is scheduled). hv-tlbflush enlightenment
+implements TLB shoot-down through hypervisor enabling the optimization.
+
+Requires: hv-vpindex
+
+3.11. hv-ipi
+=============
+Enables paravirtualized IPI send mechanism. HvCallSendSyntheticClusterIpi
+hypercall may target more than 64 virtual CPUs simultaneously, doing the same
+through APIC requires more than one access (and thus exit to the hypervisor).
+
+Requires: hv-vpindex
+
+3.12. hv-vendor-id=xxx
+=======================
+This changes Hyper-V identification in CPUID 0x40000000.EBX-EDX from the default
+"Microsoft Hv". The parameter should be no longer than 12 characters. According
+to the specification, guests shouldn't use this information and it is unknown
+if there is a Windows version which acts differently.
+Note: hv-vendor-id is not an enlightenment and thus doesn't enable Hyper-V
+identification when specified without some other enlightenment.
+
+3.13. hv-reset
+===============
+Provides HV_X64_MSR_RESET (0x40000003) MSR to the guest allowing it to reset
+itself by writing to it. Even when this MSR is enabled, it is not a recommended
+way for Windows to perform system reboot and thus it may not be used.
+
+3.14. hv-frequencies
+============================================
+Provides HV_X64_MSR_TSC_FREQUENCY (0x40000022) and HV_X64_MSR_APIC_FREQUENCY
+(0x40000023) allowing the guest to get its TSC/APIC frequencies without doing
+measurements.
+
+3.15 hv-reenlightenment
+========================
+The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
+enabled, it provides HV_X64_MSR_REENLIGHTENMENT_CONTROL (0x40000106),
+HV_X64_MSR_TSC_EMULATION_CONTROL (0x40000107)and HV_X64_MSR_TSC_EMULATION_STATUS
+(0x40000108) MSRs allowing the guest to get notified when TSC frequency changes
+(only happens on migration) and keep using old frequency (through emulation in
+the hypervisor) until it is ready to switch to the new one. This, in conjunction
+with hv-frequencies, allows Hyper-V on KVM to pass stable clocksource (Reference
+TSC page) to its own guests.
+
+Recommended: hv-frequencies
+
+3.16. hv-evmcs
+===============
+The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
+enabled, it provides Enlightened VMCS feature to the guest. The feature
+implements paravirtualized protocol between L0 (KVM) and L1 (Hyper-V)
+hypervisors making L2 exits to the hypervisor faster. The feature is Intel-only.
+Note: some virtualization features (e.g. Posted Interrupts) are disabled when
+hv-evmcs is enabled. It may make sense to measure your nested workload with and
+without the feature to find out if enabling it is beneficial.
+
+Requires: hv-vapic
+
+
+4. Useful links
+================
+Hyper-V Top Level Functional specification and other information:
+https://github.com/MicrosoftDocs/Virtualization-Documentation
-- 
1.8.3.1



