Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE017518D77
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:49:58 +0200 (CEST)
Received: from localhost ([::1]:48892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyWz-0000h6-M9
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nlyTF-0004Sp-0P
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:46:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1nlyT9-0001VJ-Kv
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651606945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k4PPJ/yKOYbYfIlIYWzwGuf2tZLdYakDFvUgbJOwVv8=;
 b=W6JNBNIG6hcSrpno+DhfAHta3ONcstJexIA9F72QSaC0IXt7fqE9mO2DqdYB7AWkxdGC82
 lkvzHt9g/bVoduW1f6qvyoNsPCPFG2ZU6ocdtpnJgakMgMXUOdlYEjjmTvqgyqmG+44DXf
 2Nlr0UPMohNCkqLWvHMvLJNfUjdWkgQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-gNgyIkzYNq-aF4t7ecwzXA-1; Tue, 03 May 2022 11:04:01 -0400
X-MC-Unique: gNgyIkzYNq-aF4t7ecwzXA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 208E11DD7E07
 for <qemu-devel@nongnu.org>; Tue,  3 May 2022 14:49:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.192.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF0E740CFD19;
 Tue,  3 May 2022 14:49:07 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] i386: docs:  Convert hyperv.txt to rST
Date: Tue,  3 May 2022 16:49:06 +0200
Message-Id: <20220503144906.3618426-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

rSTify docs/hyperv.txt and link it from docs/system/target-i386.rst.

Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
- The patch is supposed to be applied on top of "[PATCH v3 0/5] i386:
Enable newly introduced KVM Hyper-V enlightenments".
---
 docs/hyperv.txt             | 289 ------------------------------------
 docs/system/i386/hyperv.rst | 275 ++++++++++++++++++++++++++++++++++
 docs/system/target-i386.rst |   1 +
 3 files changed, 276 insertions(+), 289 deletions(-)
 delete mode 100644 docs/hyperv.txt
 create mode 100644 docs/system/i386/hyperv.rst

diff --git a/docs/hyperv.txt b/docs/hyperv.txt
deleted file mode 100644
index 9553e5c03c6b..000000000000
--- a/docs/hyperv.txt
+++ /dev/null
@@ -1,289 +0,0 @@
-Hyper-V Enlightenments
-======================
-
-
-1. Description
-===============
-In some cases when implementing a hardware interface in software is slow, KVM
-implements its own paravirtualized interfaces. This works well for Linux as
-guest support for such features is added simultaneously with the feature itself.
-It may, however, be hard-to-impossible to add support for these interfaces to
-proprietary OSes, namely, Microsoft Windows.
-
-KVM on x86 implements Hyper-V Enlightenments for Windows guests. These features
-make Windows and Hyper-V guests think they're running on top of a Hyper-V
-compatible hypervisor and use Hyper-V specific features.
-
-
-2. Setup
-=========
-No Hyper-V enlightenments are enabled by default by either KVM or QEMU. In
-QEMU, individual enlightenments can be enabled through CPU flags, e.g:
-
-  qemu-system-x86_64 --enable-kvm --cpu host,hv_relaxed,hv_vpindex,hv_time, ...
-
-Sometimes there are dependencies between enlightenments, QEMU is supposed to
-check that the supplied configuration is sane.
-
-When any set of the Hyper-V enlightenments is enabled, QEMU changes hypervisor
-identification (CPUID 0x40000000..0x4000000A) to Hyper-V. KVM identification
-and features are kept in leaves 0x40000100..0x40000101.
-
-
-3. Existing enlightenments
-===========================
-
-3.1. hv-relaxed
-================
-This feature tells guest OS to disable watchdog timeouts as it is running on a
-hypervisor. It is known that some Windows versions will do this even when they
-see 'hypervisor' CPU flag.
-
-3.2. hv-vapic
-==============
-Provides so-called VP Assist page MSR to guest allowing it to work with APIC
-more efficiently. In particular, this enlightenment allows paravirtualized
-(exit-less) EOI processing.
-
-3.3. hv-spinlocks=xxx
-======================
-Enables paravirtualized spinlocks. The parameter indicates how many times
-spinlock acquisition should be attempted before indicating the situation to the
-hypervisor. A special value 0xffffffff indicates "never notify".
-
-3.4. hv-vpindex
-================
-Provides HV_X64_MSR_VP_INDEX (0x40000002) MSR to the guest which has Virtual
-processor index information. This enlightenment makes sense in conjunction with
-hv-synic, hv-stimer and other enlightenments which require the guest to know its
-Virtual Processor indices (e.g. when VP index needs to be passed in a
-hypercall).
-
-3.5. hv-runtime
-================
-Provides HV_X64_MSR_VP_RUNTIME (0x40000010) MSR to the guest. The MSR keeps the
-virtual processor run time in 100ns units. This gives guest operating system an
-idea of how much time was 'stolen' from it (when the virtual CPU was preempted
-to perform some other work).
-
-3.6. hv-crash
-==============
-Provides HV_X64_MSR_CRASH_P0..HV_X64_MSR_CRASH_P5 (0x40000100..0x40000105) and
-HV_X64_MSR_CRASH_CTL (0x40000105) MSRs to the guest. These MSRs are written to
-by the guest when it crashes, HV_X64_MSR_CRASH_P0..HV_X64_MSR_CRASH_P5 MSRs
-contain additional crash information. This information is outputted in QEMU log
-and through QAPI.
-Note: unlike under genuine Hyper-V, write to HV_X64_MSR_CRASH_CTL causes guest
-to shutdown. This effectively blocks crash dump generation by Windows.
-
-3.7. hv-time
-=============
-Enables two Hyper-V-specific clocksources available to the guest: MSR-based
-Hyper-V clocksource (HV_X64_MSR_TIME_REF_COUNT, 0x40000020) and Reference TSC
-page (enabled via MSR HV_X64_MSR_REFERENCE_TSC, 0x40000021). Both clocksources
-are per-guest, Reference TSC page clocksource allows for exit-less time stamp
-readings. Using this enlightenment leads to significant speedup of all timestamp
-related operations.
-
-3.8. hv-synic
-==============
-Enables Hyper-V Synthetic interrupt controller - an extension of a local APIC.
-When enabled, this enlightenment provides additional communication facilities
-to the guest: SynIC messages and Events. This is a pre-requisite for
-implementing VMBus devices (not yet in QEMU). Additionally, this enlightenment
-is needed to enable Hyper-V synthetic timers. SynIC is controlled through MSRs
-HV_X64_MSR_SCONTROL..HV_X64_MSR_EOM (0x40000080..0x40000084) and
-HV_X64_MSR_SINT0..HV_X64_MSR_SINT15 (0x40000090..0x4000009F)
-
-Requires: hv-vpindex
-
-3.9. hv-stimer
-===============
-Enables Hyper-V synthetic timers. There are four synthetic timers per virtual
-CPU controlled through HV_X64_MSR_STIMER0_CONFIG..HV_X64_MSR_STIMER3_COUNT
-(0x400000B0..0x400000B7) MSRs. These timers can work either in single-shot or
-periodic mode. It is known that certain Windows versions revert to using HPET
-(or even RTC when HPET is unavailable) extensively when this enlightenment is
-not provided; this can lead to significant CPU consumption, even when virtual
-CPU is idle.
-
-Requires: hv-vpindex, hv-synic, hv-time
-
-3.10. hv-tlbflush
-==================
-Enables paravirtualized TLB shoot-down mechanism. On x86 architecture, remote
-TLB flush procedure requires sending IPIs and waiting for other CPUs to perform
-local TLB flush. In virtualized environment some virtual CPUs may not even be
-scheduled at the time of the call and may not require flushing (or, flushing
-may be postponed until the virtual CPU is scheduled). hv-tlbflush enlightenment
-implements TLB shoot-down through hypervisor enabling the optimization.
-
-Requires: hv-vpindex
-
-3.11. hv-ipi
-=============
-Enables paravirtualized IPI send mechanism. HvCallSendSyntheticClusterIpi
-hypercall may target more than 64 virtual CPUs simultaneously, doing the same
-through APIC requires more than one access (and thus exit to the hypervisor).
-
-Requires: hv-vpindex
-
-3.12. hv-vendor-id=xxx
-=======================
-This changes Hyper-V identification in CPUID 0x40000000.EBX-EDX from the default
-"Microsoft Hv". The parameter should be no longer than 12 characters. According
-to the specification, guests shouldn't use this information and it is unknown
-if there is a Windows version which acts differently.
-Note: hv-vendor-id is not an enlightenment and thus doesn't enable Hyper-V
-identification when specified without some other enlightenment.
-
-3.13. hv-reset
-===============
-Provides HV_X64_MSR_RESET (0x40000003) MSR to the guest allowing it to reset
-itself by writing to it. Even when this MSR is enabled, it is not a recommended
-way for Windows to perform system reboot and thus it may not be used.
-
-3.14. hv-frequencies
-============================================
-Provides HV_X64_MSR_TSC_FREQUENCY (0x40000022) and HV_X64_MSR_APIC_FREQUENCY
-(0x40000023) allowing the guest to get its TSC/APIC frequencies without doing
-measurements.
-
-3.15 hv-reenlightenment
-========================
-The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
-enabled, it provides HV_X64_MSR_REENLIGHTENMENT_CONTROL (0x40000106),
-HV_X64_MSR_TSC_EMULATION_CONTROL (0x40000107)and HV_X64_MSR_TSC_EMULATION_STATUS
-(0x40000108) MSRs allowing the guest to get notified when TSC frequency changes
-(only happens on migration) and keep using old frequency (through emulation in
-the hypervisor) until it is ready to switch to the new one. This, in conjunction
-with hv-frequencies, allows Hyper-V on KVM to pass stable clocksource (Reference
-TSC page) to its own guests.
-
-Note, KVM doesn't fully support re-enlightenment notifications and doesn't
-emulate TSC accesses after migration so 'tsc-frequency=' CPU option also has to
-be specified to make migration succeed. The destination host has to either have
-the same TSC frequency or support TSC scaling CPU feature.
-
-Recommended: hv-frequencies
-
-3.16. hv-evmcs
-===============
-The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
-enabled, it provides Enlightened VMCS version 1 feature to the guest. The feature
-implements paravirtualized protocol between L0 (KVM) and L1 (Hyper-V)
-hypervisors making L2 exits to the hypervisor faster. The feature is Intel-only.
-Note: some virtualization features (e.g. Posted Interrupts) are disabled when
-hv-evmcs is enabled. It may make sense to measure your nested workload with and
-without the feature to find out if enabling it is beneficial.
-
-Requires: hv-vapic
-
-3.17. hv-stimer-direct
-=======================
-Hyper-V specification allows synthetic timer operation in two modes: "classic",
-when expiration event is delivered as SynIC message and "direct", when the event
-is delivered via normal interrupt. It is known that nested Hyper-V can only
-use synthetic timers in direct mode and thus 'hv-stimer-direct' needs to be
-enabled.
-
-Requires: hv-vpindex, hv-synic, hv-time, hv-stimer
-
-3.18. hv-avic (hv-apicv)
-=======================
-The enlightenment allows to use Hyper-V SynIC with hardware APICv/AVIC enabled.
-Normally, Hyper-V SynIC disables these hardware feature and suggests the guest
-to use paravirtualized AutoEOI feature.
-Note: enabling this feature on old hardware (without APICv/AVIC support) may
-have negative effect on guest's performance.
-
-3.19. hv-no-nonarch-coresharing=on/off/auto
-===========================================
-This enlightenment tells guest OS that virtual processors will never share a
-physical core unless they are reported as sibling SMT threads. This information
-is required by Windows and Hyper-V guests to properly mitigate SMT related CPU
-vulnerabilities.
-When the option is set to 'auto' QEMU will enable the feature only when KVM
-reports that non-architectural coresharing is impossible, this means that
-hyper-threading is not supported or completely disabled on the host. This
-setting also prevents migration as SMT settings on the destination may differ.
-When the option is set to 'on' QEMU will always enable the feature, regardless
-of host setup. To keep guests secure, this can only be used in conjunction with
-exposing correct vCPU topology and vCPU pinning.
-
-3.20. hv-version-id-{build,major,minor,spack,sbranch,snumber}
-=============================================================
-This changes Hyper-V version identification in CPUID 0x40000002.EAX-EDX from the
-default (WS2016).
-- hv-version-id-build sets 'Build Number' (32 bits)
-- hv-version-id-major sets 'Major Version' (16 bits)
-- hv-version-id-minor sets 'Minor Version' (16 bits)
-- hv-version-id-spack sets 'Service Pack' (32 bits)
-- hv-version-id-sbranch sets 'Service Branch' (8 bits)
-- hv-version-id-snumber sets 'Service Number' (24 bits)
-
-Note: hv-version-id-* are not enlightenments and thus don't enable Hyper-V
-identification when specified without any other enlightenments.
-
-3.21. hv-emsr-bitmap
-=====================
-The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
-enabled, it allows L0 (KVM) and L1 (Hyper-V) hypervisors to collaborate to
-avoid unnecessary updates to L2 MSR-Bitmap upon vmexits. While the protocol is
-supported for both VMX (Intel) and SVM (AMD), the VMX implementation requires
-Enlightened VMCS ('hv-evmcs') feature to also be enabled.
-
-Recommended: hv-evmcs (Intel)
-
-3.22. hv-xmm-input
-===================
-Hyper-V specification allows to pass parameters for certain hypercalls using XMM
-registers ("XMM Fast Hypercall Input"). When the feature is in use, it allows
-for faster hypercalls processing as KVM can avoid reading guest's memory.
-
-3.23. hv-tlbflush-ext
-=====================
-Allow for extended GVA ranges to be passed to Hyper-V TLB flush hypercalls
-(HvFlushVirtualAddressList/HvFlushVirtualAddressListEx).
-
-Requires: hv-tlbflush
-
-3.24. hv-tlbflush-direct
-=========================
-The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
-enabled, it allows L0 (KVM) to directly handle TLB flush hypercalls from L2
-guest without the need to exit to L1 (Hyper-V) hypervisor. While the feature is
-supported for both VMX (Intel) and SVM (AMD), the VMX implementation requires
-Enlightened VMCS ('hv-evmcs') feature to also be enabled.
-
-Requires: hv-vapic
-Recommended: hv-evmcs (Intel)
-
-4. Supplementary features
-=========================
-
-4.1. hv-passthrough
-===================
-In some cases (e.g. during development) it may make sense to use QEMU in
-'pass-through' mode and give Windows guests all enlightenments currently
-supported by KVM. This pass-through mode is enabled by "hv-passthrough" CPU
-flag.
-Note: "hv-passthrough" flag only enables enlightenments which are known to QEMU
-(have corresponding "hv-*" flag) and copies "hv-spinlocks="/"hv-vendor-id="
-values from KVM to QEMU. "hv-passthrough" overrides all other "hv-*" settings on
-the command line. Also, enabling this flag effectively prevents migration as the
-list of enabled enlightenments may differ between target and destination hosts.
-
-4.2. hv-enforce-cpuid
-=====================
-By default, KVM allows the guest to use all currently supported Hyper-V
-enlightenments when Hyper-V CPUID interface was exposed, regardless of if
-some features were not announced in guest visible CPUIDs. 'hv-enforce-cpuid'
-feature alters this behavior and only allows the guest to use exposed Hyper-V
-enlightenments.
-
-
-5. Useful links
-================
-Hyper-V Top Level Functional specification and other information:
-https://github.com/MicrosoftDocs/Virtualization-Documentation
diff --git a/docs/system/i386/hyperv.rst b/docs/system/i386/hyperv.rst
new file mode 100644
index 000000000000..67fffbf06f48
--- /dev/null
+++ b/docs/system/i386/hyperv.rst
@@ -0,0 +1,275 @@
+Hyper-V Enlightenments
+======================
+
+
+Description
+-----------
+
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
+Setup
+-----
+
+No Hyper-V enlightenments are enabled by default by either KVM or QEMU. In
+QEMU, individual enlightenments can be enabled through CPU flags, e.g:
+
+.. parsed-literal::
+
+  |qemu_system| --enable-kvm --cpu host,hv_relaxed,hv_vpindex,hv_time, ...
+
+Sometimes there are dependencies between enlightenments, QEMU is supposed to
+check that the supplied configuration is sane.
+
+When any set of the Hyper-V enlightenments is enabled, QEMU changes hypervisor
+identification (CPUID 0x40000000..0x4000000A) to Hyper-V. KVM identification
+and features are kept in leaves 0x40000100..0x40000101.
+
+
+Existing enlightenments
+-----------------------
+
+``hv-relaxed``
+  This feature tells guest OS to disable watchdog timeouts as it is running on a
+  hypervisor. It is known that some Windows versions will do this even when they
+  see 'hypervisor' CPU flag.
+
+``hv-vapic``
+  Provides so-called VP Assist page MSR to guest allowing it to work with APIC
+  more efficiently. In particular, this enlightenment allows paravirtualized
+  (exit-less) EOI processing.
+
+``hv-spinlocks`` = xxx
+  Enables paravirtualized spinlocks. The parameter indicates how many times
+  spinlock acquisition should be attempted before indicating the situation to the
+  hypervisor. A special value 0xffffffff indicates "never notify".
+
+``hv-vpindex``
+  Provides HV_X64_MSR_VP_INDEX (0x40000002) MSR to the guest which has Virtual
+  processor index information. This enlightenment makes sense in conjunction with
+  hv-synic, hv-stimer and other enlightenments which require the guest to know its
+  Virtual Processor indices (e.g. when VP index needs to be passed in a
+  hypercall).
+
+``hv-runtime``
+  Provides HV_X64_MSR_VP_RUNTIME (0x40000010) MSR to the guest. The MSR keeps the
+  virtual processor run time in 100ns units. This gives guest operating system an
+  idea of how much time was 'stolen' from it (when the virtual CPU was preempted
+  to perform some other work).
+
+``hv-crash``
+  Provides HV_X64_MSR_CRASH_P0..HV_X64_MSR_CRASH_P5 (0x40000100..0x40000105) and
+  HV_X64_MSR_CRASH_CTL (0x40000105) MSRs to the guest. These MSRs are written to
+  by the guest when it crashes, HV_X64_MSR_CRASH_P0..HV_X64_MSR_CRASH_P5 MSRs
+  contain additional crash information. This information is outputted in QEMU log
+  and through QAPI.
+  Note: unlike under genuine Hyper-V, write to HV_X64_MSR_CRASH_CTL causes guest
+  to shutdown. This effectively blocks crash dump generation by Windows.
+
+``hv-time``
+  Enables two Hyper-V-specific clocksources available to the guest: MSR-based
+  Hyper-V clocksource (HV_X64_MSR_TIME_REF_COUNT, 0x40000020) and Reference TSC
+  page (enabled via MSR HV_X64_MSR_REFERENCE_TSC, 0x40000021). Both clocksources
+  are per-guest, Reference TSC page clocksource allows for exit-less time stamp
+  readings. Using this enlightenment leads to significant speedup of all timestamp
+  related operations.
+
+``hv-synic``
+  Enables Hyper-V Synthetic interrupt controller - an extension of a local APIC.
+  When enabled, this enlightenment provides additional communication facilities
+  to the guest: SynIC messages and Events. This is a pre-requisite for
+  implementing VMBus devices (not yet in QEMU). Additionally, this enlightenment
+  is needed to enable Hyper-V synthetic timers. SynIC is controlled through MSRs
+  HV_X64_MSR_SCONTROL..HV_X64_MSR_EOM (0x40000080..0x40000084) and
+  HV_X64_MSR_SINT0..HV_X64_MSR_SINT15 (0x40000090..0x4000009F)
+
+  Requires: ``hv-vpindex``
+
+``hv-stimer``
+  Enables Hyper-V synthetic timers. There are four synthetic timers per virtual
+  CPU controlled through HV_X64_MSR_STIMER0_CONFIG..HV_X64_MSR_STIMER3_COUNT
+  (0x400000B0..0x400000B7) MSRs. These timers can work either in single-shot or
+  periodic mode. It is known that certain Windows versions revert to using HPET
+  (or even RTC when HPET is unavailable) extensively when this enlightenment is
+  not provided; this can lead to significant CPU consumption, even when virtual
+  CPU is idle.
+
+  Requires: ``hv-vpindex``, ``hv-synic``, ``hv-time``
+
+``hv-tlbflush``
+  Enables paravirtualized TLB shoot-down mechanism. On x86 architecture, remote
+  TLB flush procedure requires sending IPIs and waiting for other CPUs to perform
+  local TLB flush. In virtualized environment some virtual CPUs may not even be
+  scheduled at the time of the call and may not require flushing (or, flushing
+  may be postponed until the virtual CPU is scheduled). hv-tlbflush enlightenment
+  implements TLB shoot-down through hypervisor enabling the optimization.
+
+  Requires: ``hv-vpindex``
+
+``hv-ipi``
+  Enables paravirtualized IPI send mechanism. HvCallSendSyntheticClusterIpi
+  hypercall may target more than 64 virtual CPUs simultaneously, doing the same
+  through APIC requires more than one access (and thus exit to the hypervisor).
+
+  Requires: ``hv-vpindex``
+
+``hv-vendor-id`` = xxx
+  This changes Hyper-V identification in CPUID 0x40000000.EBX-EDX from the default
+  "Microsoft Hv". The parameter should be no longer than 12 characters. According
+  to the specification, guests shouldn't use this information and it is unknown
+  if there is a Windows version which acts differently.
+  Note: hv-vendor-id is not an enlightenment and thus doesn't enable Hyper-V
+  identification when specified without some other enlightenment.
+
+``hv-reset``
+  Provides HV_X64_MSR_RESET (0x40000003) MSR to the guest allowing it to reset
+  itself by writing to it. Even when this MSR is enabled, it is not a recommended
+  way for Windows to perform system reboot and thus it may not be used.
+
+``hv-frequencies``
+  Provides HV_X64_MSR_TSC_FREQUENCY (0x40000022) and HV_X64_MSR_APIC_FREQUENCY
+  (0x40000023) allowing the guest to get its TSC/APIC frequencies without doing
+  measurements.
+
+``hv-reenlightenment``
+  The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
+  enabled, it provides HV_X64_MSR_REENLIGHTENMENT_CONTROL (0x40000106),
+  HV_X64_MSR_TSC_EMULATION_CONTROL (0x40000107)and HV_X64_MSR_TSC_EMULATION_STATUS
+  (0x40000108) MSRs allowing the guest to get notified when TSC frequency changes
+  (only happens on migration) and keep using old frequency (through emulation in
+  the hypervisor) until it is ready to switch to the new one. This, in conjunction
+  with ``hv-frequencies``, allows Hyper-V on KVM to pass stable clocksource
+  (Reference TSC page) to its own guests.
+
+  Note, KVM doesn't fully support re-enlightenment notifications and doesn't
+  emulate TSC accesses after migration so 'tsc-frequency=' CPU option also has to
+  be specified to make migration succeed. The destination host has to either have
+  the same TSC frequency or support TSC scaling CPU feature.
+
+  Recommended: ``hv-frequencies``
+
+``hv-evmcs``
+  The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
+  enabled, it provides Enlightened VMCS version 1 feature to the guest. The feature
+  implements paravirtualized protocol between L0 (KVM) and L1 (Hyper-V)
+  hypervisors making L2 exits to the hypervisor faster. The feature is Intel-only.
+
+  Note: some virtualization features (e.g. Posted Interrupts) are disabled when
+  hv-evmcs is enabled. It may make sense to measure your nested workload with and
+  without the feature to find out if enabling it is beneficial.
+
+  Requires: ``hv-vapic``
+
+``hv-stimer-direct``
+  Hyper-V specification allows synthetic timer operation in two modes: "classic",
+  when expiration event is delivered as SynIC message and "direct", when the event
+  is delivered via normal interrupt. It is known that nested Hyper-V can only
+  use synthetic timers in direct mode and thus ``hv-stimer-direct`` needs to be
+  enabled.
+
+  Requires: ``hv-vpindex``, ``hv-synic``, ``hv-time``, ``hv-stimer``
+
+``hv-avic`` (``hv-apicv``)
+  The enlightenment allows to use Hyper-V SynIC with hardware APICv/AVIC enabled.
+  Normally, Hyper-V SynIC disables these hardware feature and suggests the guest
+  to use paravirtualized AutoEOI feature.
+  Note: enabling this feature on old hardware (without APICv/AVIC support) may
+  have negative effect on guest's performance.
+
+``hv-no-nonarch-coresharing`` = on/off/auto
+  This enlightenment tells guest OS that virtual processors will never share a
+  physical core unless they are reported as sibling SMT threads. This information
+  is required by Windows and Hyper-V guests to properly mitigate SMT related CPU
+  vulnerabilities.
+
+  When the option is set to 'auto' QEMU will enable the feature only when KVM
+  reports that non-architectural coresharing is impossible, this means that
+  hyper-threading is not supported or completely disabled on the host. This
+  setting also prevents migration as SMT settings on the destination may differ.
+  When the option is set to 'on' QEMU will always enable the feature, regardless
+  of host setup. To keep guests secure, this can only be used in conjunction with
+  exposing correct vCPU topology and vCPU pinning.
+
+``hv-version-id-build``, ``hv-version-id-major``, ``hv-version-id-minor``, ``hv-version-id-spack``, ``hv-version-id-sbranch``, ``hv-version-id-snumber``
+  This changes Hyper-V version identification in CPUID 0x40000002.EAX-EDX from the
+  default (WS2016).
+
+  - ``hv-version-id-build`` sets 'Build Number' (32 bits)
+  - ``hv-version-id-major`` sets 'Major Version' (16 bits)
+  - ``hv-version-id-minor`` sets 'Minor Version' (16 bits)
+  - ``hv-version-id-spack`` sets 'Service Pack' (32 bits)
+  - ``hv-version-id-sbranch`` sets 'Service Branch' (8 bits)
+  - ``hv-version-id-snumber`` sets 'Service Number' (24 bits)
+
+  Note: hv-version-id-* are not enlightenments and thus don't enable Hyper-V
+  identification when specified without any other enlightenments.
+
+``hv-emsr-bitmap``
+  The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
+  enabled, it allows L0 (KVM) and L1 (Hyper-V) hypervisors to collaborate to
+  avoid unnecessary updates to L2 MSR-Bitmap upon vmexits. While the protocol is
+  supported for both VMX (Intel) and SVM (AMD), the VMX implementation requires
+  Enlightened VMCS (``hv-evmcs``) feature to also be enabled.
+
+  Recommended: ``hv-evmcs`` (Intel)
+
+``hv-xmm-input``
+  Hyper-V specification allows to pass parameters for certain hypercalls using XMM
+  registers ("XMM Fast Hypercall Input"). When the feature is in use, it allows
+  for faster hypercalls processing as KVM can avoid reading guest's memory.
+
+``hv-tlbflush-ext``
+  Allow for extended GVA ranges to be passed to Hyper-V TLB flush hypercalls
+  (HvFlushVirtualAddressList/HvFlushVirtualAddressListEx).
+
+  Requires: ``hv-tlbflush``
+
+``hv-tlbflush-direct``
+  The enlightenment is nested specific, it targets Hyper-V on KVM guests. When
+  enabled, it allows L0 (KVM) to directly handle TLB flush hypercalls from L2
+  guest without the need to exit to L1 (Hyper-V) hypervisor. While the feature is
+  supported for both VMX (Intel) and SVM (AMD), the VMX implementation requires
+  Enlightened VMCS (``hv-evmcs``) feature to also be enabled.
+
+  Requires: ``hv-vapic``
+
+  Recommended: ``hv-evmcs`` (Intel)
+
+Supplementary features
+----------------------
+
+``hv-passthrough``
+  In some cases (e.g. during development) it may make sense to use QEMU in
+  'pass-through' mode and give Windows guests all enlightenments currently
+  supported by KVM. This pass-through mode is enabled by "hv-passthrough" CPU
+  flag.
+
+  Note: ``hv-passthrough`` flag only enables enlightenments which are known to QEMU
+  (have corresponding 'hv-' flag) and copies ``hv-spinlocks`` and ``hv-vendor-id``
+  values from KVM to QEMU. ``hv-passthrough`` overrides all other 'hv-' settings on
+  the command line. Also, enabling this flag effectively prevents migration as the
+  list of enabled enlightenments may differ between target and destination hosts.
+
+``hv-enforce-cpuid``
+  By default, KVM allows the guest to use all currently supported Hyper-V
+  enlightenments when Hyper-V CPUID interface was exposed, regardless of if
+  some features were not announced in guest visible CPUIDs. ``hv-enforce-cpuid``
+  feature alters this behavior and only allows the guest to use exposed Hyper-V
+  enlightenments.
+
+
+Useful links
+------------
+Hyper-V Top Level Functional specification and other information:
+
+- https://github.com/MicrosoftDocs/Virtualization-Documentation
+- https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/tlfs/tlfs
+
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 96bf54889a82..e64c0130772d 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -26,6 +26,7 @@ Architectural features
    :maxdepth: 1
 
    i386/cpu
+   i386/hyperv
    i386/kvm-pv
    i386/sgx
    i386/amd-memory-encryption
-- 
2.35.1


