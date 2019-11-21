Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C1105CE5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 23:57:08 +0100 (CET)
Received: from localhost ([::1]:46300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXvNq-0005OI-NA
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 17:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty@apple.com>) id 1iXvLq-00048U-Eb
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 17:55:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty@apple.com>) id 1iXvLp-0004Zx-CU
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 17:55:02 -0500
Received: from ma1-aaemail-dr-lapp03.apple.com ([17.171.2.72]:57350)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dirty@apple.com>) id 1iXvLp-0004ZF-70
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 17:55:01 -0500
Received: from pps.filterd (ma1-aaemail-dr-lapp03.apple.com [127.0.0.1])
 by ma1-aaemail-dr-lapp03.apple.com (8.16.0.27/8.16.0.27) with SMTP id
 xALMppVS004638; Thu, 21 Nov 2019 14:54:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=sender : from : to :
 cc : subject : date : message-id : in-reply-to : references : mime-version
 : content-transfer-encoding; s=20180706;
 bh=ugxfdIQDZ2+zAAugyFwhvkbCKLbpBzoyHYTLkvgf1To=;
 b=Peb9+egxparnXp45kcO3oCPWBU9ji3L7uWj/kmh0ima75Z0phCSGqoPZ9oxVx9PAytsz
 d7PeSgHl50h8b0ySu4mFGFvelsp4F7QWU5J8dcmR2q3VuXalLYadY8PMyU4FwIVC4tNB
 sVCz90YHLw0HTmFIfcLfDsQYsIVgRDUntwcOrWEXoKEb3I8H6uoWulRkaI9nQPAtDyEN
 HYotRGkDpPZ284+s/TvPst6QcwLyBZCtMU6m0gKvqZ/oPv710QPbuIyZm8MuNamCzvs6
 dtpJYv4ZLBy3yqV9LzoX2wEV9fN6aZ9a32oxHDgd6uKtwCOIA6Rf8/EErLO6wZct6iVB /g== 
Received: from ma1-mtap-s02.corp.apple.com (ma1-mtap-s02.corp.apple.com
 [17.40.76.6])
 by ma1-aaemail-dr-lapp03.apple.com with ESMTP id 2wah00wd8y-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Thu, 21 Nov 2019 14:54:56 -0800
Received: from nwk-mmpp-sz11.apple.com
 (nwk-mmpp-sz11.apple.com [17.128.115.155]) by ma1-mtap-s02.corp.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPS id <0Q1C00F8GCZFA3G0@ma1-mtap-s02.corp.apple.com>; Thu,
 21 Nov 2019 14:54:56 -0800 (PST)
Received: from process_milters-daemon.nwk-mmpp-sz11.apple.com by
 nwk-mmpp-sz11.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) id <0Q1C00J00CBT3A00@nwk-mmpp-sz11.apple.com>; Thu,
 21 Nov 2019 14:54:55 -0800 (PST)
X-Va-A: 
X-Va-T-CD: c56cc4374afe9162bf6a337f3d661529
X-Va-E-CD: f23415f63b722fb95feca2bca8131434
X-Va-R-CD: c78501f95052ee2b5bc08865af9ba005
X-Va-CD: 0
X-Va-ID: 917e3943-1bde-4b05-bf42-8d5eab975aae
X-V-A: 
X-V-T-CD: c56cc4374afe9162bf6a337f3d661529
X-V-E-CD: f23415f63b722fb95feca2bca8131434
X-V-R-CD: c78501f95052ee2b5bc08865af9ba005
X-V-CD: 0
X-V-ID: 13e2a72c-f1da-4c48-8041-9c7e8146e3ca
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2019-11-21_06:,, signatures=0
Received: from pontoon.com (unknown [17.193.42.199]) by nwk-mmpp-sz11.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPSA id <0Q1C00JWACZIHUA0@nwk-mmpp-sz11.apple.com>; Thu,
 21 Nov 2019 14:54:54 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH 2/5] hvf: remove TSC synchronization code because it isn't
 fully complete
Date: Thu, 21 Nov 2019 14:54:51 -0800
Message-id: <ba641b7f6bc9b9a84d7f0fefc9a5ef9ec78c5d11.1574375668.git.dirty@apple.com>
X-Mailer: git-send-email 2.24.0
In-reply-to: <cover.1574375668.git.dirty@apple.com>
References: <cover.1574375668.git.dirty@apple.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-21_06:, , signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 17.171.2.72
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Cameron Esfahani <dirty@apple.com>
From: Cameron Esfahani via <qemu-devel@nongnu.org>

The existing code in QEMU's HVF support to attempt to synchronize TSC
across multiple cores is not sufficient.  TSC value on other cores
can go backwards.  Until implementation is fixed, remove calls to
hv_vm_sync_tsc().  Pass through TSC to guest OS.

Signed-off-by: Cameron Esfahani <dirty@apple.com>
---
 target/i386/hvf/hvf.c     | 3 +--
 target/i386/hvf/x86_emu.c | 3 ---
 target/i386/hvf/x86hvf.c  | 4 ----
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 60c995470b..fda0273ba1 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -511,7 +511,6 @@ void hvf_reset_vcpu(CPUState *cpu) {
         wreg(cpu->hvf_fd, HV_X86_R8 + i, 0x0);
     }
 
-    hv_vm_sync_tsc(0);
     hv_vcpu_invalidate_tlb(cpu->hvf_fd);
     hv_vcpu_flush(cpu->hvf_fd);
 }
@@ -605,7 +604,7 @@ int hvf_init_vcpu(CPUState *cpu)
     hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_GSBASE, 1);
     hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_KERNELGSBASE, 1);
     hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_TSC_AUX, 1);
-    /*hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_IA32_TSC, 1);*/
+    hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_IA32_TSC, 1);
     hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_IA32_SYSENTER_CS, 1);
     hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_IA32_SYSENTER_EIP, 1);
     hv_vcpu_enable_native_msr(cpu->hvf_fd, MSR_IA32_SYSENTER_ESP, 1);
diff --git a/target/i386/hvf/x86_emu.c b/target/i386/hvf/x86_emu.c
index 1b04bd7e94..3df767209d 100644
--- a/target/i386/hvf/x86_emu.c
+++ b/target/i386/hvf/x86_emu.c
@@ -772,9 +772,6 @@ void simulate_wrmsr(struct CPUState *cpu)
 
     switch (msr) {
     case MSR_IA32_TSC:
-        /* if (!osx_is_sierra())
-             wvmcs(cpu->hvf_fd, VMCS_TSC_OFFSET, data - rdtscp());
-        hv_vm_sync_tsc(data);*/
         break;
     case MSR_IA32_APICBASE:
         cpu_set_apic_base(X86_CPU(cpu)->apic_state, data);
diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
index e0ea02d631..1485b95776 100644
--- a/target/i386/hvf/x86hvf.c
+++ b/target/i386/hvf/x86hvf.c
@@ -152,10 +152,6 @@ void hvf_put_msrs(CPUState *cpu_state)
 
     hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_GSBASE, env->segs[R_GS].base);
     hv_vcpu_write_msr(cpu_state->hvf_fd, MSR_FSBASE, env->segs[R_FS].base);
-
-    /* if (!osx_is_sierra())
-         wvmcs(cpu_state->hvf_fd, VMCS_TSC_OFFSET, env->tsc - rdtscp());*/
-    hv_vm_sync_tsc(env->tsc);
 }
 
 
-- 
2.24.0


