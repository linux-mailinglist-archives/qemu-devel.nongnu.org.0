Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5671810F3C5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 01:03:34 +0100 (CET)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibvfA-0003gO-BW
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 19:03:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46275)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dirty@apple.com>) id 1ibvXf-0006fY-2V
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 18:55:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dirty@apple.com>) id 1ibvXc-0008QY-N0
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 18:55:45 -0500
Received: from nwk-aaemail-lapp01.apple.com ([17.151.62.66]:37072)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dirty@apple.com>) id 1ibvXc-0008Nz-CL
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 18:55:44 -0500
Received: from pps.filterd (nwk-aaemail-lapp01.apple.com [127.0.0.1])
 by nwk-aaemail-lapp01.apple.com (8.16.0.27/8.16.0.27) with SMTP id
 xB2Nq6Lu044435; Mon, 2 Dec 2019 15:55:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=sender : from : to :
 cc : subject : date : message-id : in-reply-to : references : mime-version
 : content-transfer-encoding; s=20180706;
 bh=FG09fH2kz8jEX/xXK1yo35vtn8o4/Q0MVF2XlhtILaU=;
 b=vmpSSLiLVJG5BbyiSs8CDSBR1EoHzMXPS/UrGZlDLDVApuzxh3ZSg3XJ9mpP7NfkBxd+
 6sk0ErlEQeKO0rFL5FJGf27aqwp6isq7SQUswIhsUzTYAuq3SiDxFZY1xB96aRdpoXuM
 j9P2N8tQ6V7LUSQHLzEIAraGRPXk13qo+csNBF/IsGtGUE4TwxraE5IgbWspOtCcZK+v
 DGgO28fkvZGUPs22O+drDXgibtlXf8wlADxyHXRSzoykALYnf1NCpQsLffeB5AM+3rH9
 5paK/iOqY3alRG1mNwsPLxH7Bs2zmvd73ZLIjM0HND8QqmQWi4M7ZGNzHLg4Mzg3YpkN UQ== 
Received: from ma1-mtap-s03.corp.apple.com (ma1-mtap-s03.corp.apple.com
 [17.40.76.7])
 by nwk-aaemail-lapp01.apple.com with ESMTP id 2wkr83ys1h-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Mon, 02 Dec 2019 15:55:43 -0800
Received: from nwk-mmpp-sz12.apple.com
 (nwk-mmpp-sz12.apple.com [17.128.115.204]) by ma1-mtap-s03.corp.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPS id <0Q1W00D69T4U1O50@ma1-mtap-s03.corp.apple.com>; Mon,
 02 Dec 2019 15:55:42 -0800 (PST)
Received: from process_milters-daemon.nwk-mmpp-sz12.apple.com by
 nwk-mmpp-sz12.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) id <0Q1W00A00SGIRL00@nwk-mmpp-sz12.apple.com>; Mon,
 02 Dec 2019 15:55:42 -0800 (PST)
X-Va-A: 
X-Va-T-CD: c56cc4374afe9162bf6a337f3d661529
X-Va-E-CD: 3a0700f7bd232aa2e14bd4948494cd90
X-Va-R-CD: 8d09ec05a2462c69b598a16229b39d18
X-Va-CD: 0
X-Va-ID: d8a8f06a-7dec-469b-ba33-1a74b6198b12
X-V-A: 
X-V-T-CD: c56cc4374afe9162bf6a337f3d661529
X-V-E-CD: 3a0700f7bd232aa2e14bd4948494cd90
X-V-R-CD: 8d09ec05a2462c69b598a16229b39d18
X-V-CD: 0
X-V-ID: ed368b89-e80d-429d-b32c-9cc63f798036
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2019-12-02_06:,, signatures=0
Received: from pontoon.com (unknown [17.193.42.217]) by nwk-mmpp-sz12.apple.com
 (Oracle Communications Messaging Server 8.0.2.4.20190507 64bit (built May  7
 2019)) with ESMTPSA id <0Q1W00JNAT4TQI20@nwk-mmpp-sz12.apple.com>; Mon,
 02 Dec 2019 15:55:42 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 2/5] hvf: remove TSC synchronization code because it isn't
 fully complete
Date: Mon, 02 Dec 2019 15:55:38 -0800
Message-id: <211818e56f8f4900800274e769470e46987e337c.1575330463.git.dirty@apple.com>
X-Mailer: git-send-email 2.24.0
In-reply-to: <cover.1575330463.git.dirty@apple.com>
References: <cover.1575330463.git.dirty@apple.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-12-02_06:, , signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 17.151.62.66
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/hvf/hvf.c     | 3 +--
 target/i386/hvf/x86_emu.c | 3 ---
 target/i386/hvf/x86hvf.c  | 4 ----
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 0b50cfcbc6..90fd50acfc 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -518,7 +518,6 @@ void hvf_reset_vcpu(CPUState *cpu) {
         wreg(cpu->hvf_fd, HV_X86_R8 + i, 0x0);
     }
 
-    hv_vm_sync_tsc(0);
     hv_vcpu_invalidate_tlb(cpu->hvf_fd);
     hv_vcpu_flush(cpu->hvf_fd);
 }
@@ -612,7 +611,7 @@ int hvf_init_vcpu(CPUState *cpu)
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


