Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E84AE30D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 22:29:45 +0100 (CET)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHY3U-00080o-PV
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 16:29:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nHXyj-0005yl-SQ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 16:24:50 -0500
Received: from rn-mailsvcp-ppex-lapp45.rno.apple.com ([17.179.253.49]:37246
 helo=rn-mailsvcp-ppex-lapp45.apple.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dirty@apple.com>) id 1nHXyh-0001kx-Hh
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 16:24:49 -0500
Received: from pps.filterd (rn-mailsvcp-ppex-lapp45.rno.apple.com [127.0.0.1])
 by rn-mailsvcp-ppex-lapp45.rno.apple.com (8.16.1.2/8.16.1.2) with
 SMTP id 218LA3aP016525; Tue, 8 Feb 2022 13:24:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=20180706;
 bh=hCFOss1gt3mEA4q/dRTmUvK6MJkOFJihBeySWzGSfcE=;
 b=u6qfaOgMIw6OirIhTOEiym5llXsgcdFoeiq04X8VRzYYnWXkpqiT6KOhBIKzLs8b0vXz
 hiV8j9HTyxTiBXNcPYE3EzEo+tTkn18198llF2lji3CooFZTV6UtNWpU3zY6MHd4Dcs8
 9DZP22pos3zIbiRaMWxGpZVxMnGDob7EVUOfg4bfelm3pb1qgTaT7EKC1Sk8r4Ku2vmx
 cXIPiidwuOUAFJswnKGu7fjjhyPhd0uAqr6/aZpRkemfTw2/yL13EXure/ODooMQ3OEO
 7/KsPAB04cRA+MubJP8Zb8NQVijoRh/uCc/KQrhCLp74Q9y7DwFuzzeRKIlO0rgb1wfp Ag== 
Received: from rn-mailsvcp-mta-lapp03.rno.apple.com
 (rn-mailsvcp-mta-lapp03.rno.apple.com [10.225.203.151])
 by rn-mailsvcp-ppex-lapp45.rno.apple.com with ESMTP id 3e1rdw2vaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
 Tue, 08 Feb 2022 13:24:46 -0800
Received: from rn-mailsvcp-mmp-lapp02.rno.apple.com
 (rn-mailsvcp-mmp-lapp02.rno.apple.com [17.179.253.15])
 by rn-mailsvcp-mta-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) with ESMTPS id <0R7000N4B8TASD70@rn-mailsvcp-mta-lapp03.rno.apple.com>; 
 Tue, 08 Feb 2022 13:24:46 -0800 (PST)
Received: from process_milters-daemon.rn-mailsvcp-mmp-lapp02.rno.apple.com by
 rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021)) id <0R7000H008RSOL00@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Tue,
 08 Feb 2022 13:24:46 -0800 (PST)
X-Va-A: 
X-Va-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-Va-E-CD: e6ca15a2d4412999008b7ffba9962899
X-Va-R-CD: 1b9983dabb71bcd9fa14321a7b2c5522
X-Va-CD: 0
X-Va-ID: 973a7fae-e1f2-42ce-bb0e-f7feba345633
X-V-A: 
X-V-T-CD: 51115aee971724d6ddf329fb28aa7ad5
X-V-E-CD: e6ca15a2d4412999008b7ffba9962899
X-V-R-CD: 1b9983dabb71bcd9fa14321a7b2c5522
X-V-CD: 0
X-V-ID: 8330ebad-6ee8-420d-9eeb-e22096c30ebb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-08_06:2022-02-07,
 2022-02-08 signatures=0
Received: from smtpclient.apple ([17.149.229.60])
 by rn-mailsvcp-mmp-lapp02.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.12.20210903 64bit (built Sep 3
 2021))
 with ESMTPSA id <0R70002M78T1QD10@rn-mailsvcp-mmp-lapp02.rno.apple.com>; Tue,
 08 Feb 2022 13:24:46 -0800 (PST)
Content-type: text/plain; charset=us-ascii
MIME-version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH] hvf: Enable RDTSCP support
From: Cameron Esfahani <dirty@apple.com>
In-reply-to: <20211101054836.21471-1-dirty@apple.com>
Date: Tue, 08 Feb 2022 13:24:45 -0800
Cc: r.bolshakov@yadro.com
Content-transfer-encoding: quoted-printable
Message-id: <D41A7B05-42D9-47EF-BC52-26E352DAB98E@apple.com>
References: <20211101054836.21471-1-dirty@apple.com>
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.816
 definitions=2022-02-08_06:2022-02-07,
 2022-02-08 signatures=0
Received-SPF: pass client-ip=17.179.253.49; envelope-from=dirty@apple.com;
 helo=rn-mailsvcp-ppex-lapp45.apple.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ping

Cameron

> On Oct 31, 2021, at 10:48 PM, Cameron Esfahani <dirty@apple.com> =
wrote:
>=20
> Pass through RDPID and RDTSCP support in CPUID if host supports it.
> Correctly detect if CPU_BASED_TSC_OFFSET and CPU_BASED2_RDTSCP would
> be supported in primary and secondary processor-based VM-execution
> controls.  Enable RDTSCP in secondary processor controls if RDTSCP
> support is indicated in CPUID.
>=20
> Signed-off-by: Cameron Esfahani <dirty@apple.com>
> ---
> target/i386/hvf/hvf.c       | 26 +++++++++++++++++---------
> target/i386/hvf/vmcs.h      |  3 ++-
> target/i386/hvf/x86_cpuid.c |  7 ++++---
> 3 files changed, 23 insertions(+), 13 deletions(-)
>=20
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index 4ba6e82fab..4712fe66d4 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -221,6 +221,7 @@ int hvf_arch_init_vcpu(CPUState *cpu)
> {
>     X86CPU *x86cpu =3D X86_CPU(cpu);
>     CPUX86State *env =3D &x86cpu->env;
> +    uint64_t reqCap;
>=20
>     init_emu();
>     init_decoder();
> @@ -257,19 +258,26 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>     /* set VMCS control fields */
>     wvmcs(cpu->hvf->fd, VMCS_PIN_BASED_CTLS,
>           cap2ctrl(hvf_state->hvf_caps->vmx_cap_pinbased,
> -          VMCS_PIN_BASED_CTLS_EXTINT |
> -          VMCS_PIN_BASED_CTLS_NMI |
> -          VMCS_PIN_BASED_CTLS_VNMI));
> +                   VMCS_PIN_BASED_CTLS_EXTINT |
> +                   VMCS_PIN_BASED_CTLS_NMI |
> +                   VMCS_PIN_BASED_CTLS_VNMI));
>     wvmcs(cpu->hvf->fd, VMCS_PRI_PROC_BASED_CTLS,
>           cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased,
> -          VMCS_PRI_PROC_BASED_CTLS_HLT |
> -          VMCS_PRI_PROC_BASED_CTLS_MWAIT |
> -          VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET |
> -          VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW) |
> +                   VMCS_PRI_PROC_BASED_CTLS_HLT |
> +                   VMCS_PRI_PROC_BASED_CTLS_MWAIT |
> +                   VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET |
> +                   VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW) |
>           VMCS_PRI_PROC_BASED_CTLS_SEC_CONTROL);
> +
> +    reqCap =3D VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES;
> +
> +    /* Is RDTSCP support in CPUID?  If so, enable it in the VMCS. */
> +    if (hvf_get_supported_cpuid(0x80000001, 0, R_EDX) & =
CPUID_EXT2_RDTSCP) {
> +        reqCap |=3D VMCS_PRI_PROC_BASED2_CTLS_RDTSCP;
> +    }
> +
>     wvmcs(cpu->hvf->fd, VMCS_SEC_PROC_BASED_CTLS,
> -          cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased2,
> -                   VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES));
> +          cap2ctrl(hvf_state->hvf_caps->vmx_cap_procbased2, reqCap));
>=20
>     wvmcs(cpu->hvf->fd, VMCS_ENTRY_CTLS, =
cap2ctrl(hvf_state->hvf_caps->vmx_cap_entry,
>           0));
> diff --git a/target/i386/hvf/vmcs.h b/target/i386/hvf/vmcs.h
> index 42de7ebc3a..bb4c764557 100644
> --- a/target/i386/hvf/vmcs.h
> +++ b/target/i386/hvf/vmcs.h
> @@ -354,7 +354,7 @@
> #define VMCS_PRI_PROC_BASED_CTLS_TSC_OFFSET (1 << 3)
> #define VMCS_PRI_PROC_BASED_CTLS_HLT (1 << 7)
> #define VMCS_PRI_PROC_BASED_CTLS_MWAIT         (1 << 10)
> -#define VMCS_PRI_PROC_BASED_CTLS_TSC           (1 << 12)
> +#define VMCS_PRI_PROC_BASED_CTLS_RDTSC         (1 << 12)
> #define VMCS_PRI_PROC_BASED_CTLS_CR8_LOAD      (1 << 19)
> #define VMCS_PRI_PROC_BASED_CTLS_CR8_STORE     (1 << 20)
> #define VMCS_PRI_PROC_BASED_CTLS_TPR_SHADOW    (1 << 21)
> @@ -362,6 +362,7 @@
> #define VMCS_PRI_PROC_BASED_CTLS_SEC_CONTROL   (1 << 31)
>=20
> #define VMCS_PRI_PROC_BASED2_CTLS_APIC_ACCESSES (1 << 0)
> +#define VMCS_PRI_PROC_BASED2_CTLS_RDTSCP        (1 << 3)
> #define VMCS_PRI_PROC_BASED2_CTLS_X2APIC        (1 << 4)
>=20
> enum task_switch_reason {
> diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
> index 32b0d131df..b11ddaa349 100644
> --- a/target/i386/hvf/x86_cpuid.c
> +++ b/target/i386/hvf/x86_cpuid.c
> @@ -96,7 +96,8 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, =
uint32_t idx,
>                 ebx &=3D ~CPUID_7_0_EBX_INVPCID;
>             }
>=20
> -            ecx &=3D CPUID_7_0_ECX_AVX512_VBMI | =
CPUID_7_0_ECX_AVX512_VPOPCNTDQ;
> +            ecx &=3D CPUID_7_0_ECX_AVX512_VBMI | =
CPUID_7_0_ECX_AVX512_VPOPCNTDQ |
> +                   CPUID_7_0_ECX_RDPID;
>             edx &=3D CPUID_7_0_EDX_AVX512_4VNNIW | =
CPUID_7_0_EDX_AVX512_4FMAPS;
>         } else {
>             ebx =3D 0;
> @@ -133,11 +134,11 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, =
uint32_t idx,
>                 CPUID_FXSR | CPUID_EXT2_FXSR | CPUID_EXT2_PDPE1GB | =
CPUID_EXT2_3DNOWEXT |
>                 CPUID_EXT2_3DNOW | CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | =
CPUID_EXT2_NX;
>         hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
> -        if (!(cap & CPU_BASED2_RDTSCP)) {
> +        if (!(cap2ctrl(cap, CPU_BASED2_RDTSCP) & CPU_BASED2_RDTSCP)) =
{
>             edx &=3D ~CPUID_EXT2_RDTSCP;
>         }
>         hv_vmx_read_capability(HV_VMX_CAP_PROCBASED, &cap);
> -        if (!(cap & CPU_BASED_TSC_OFFSET)) {
> +        if (!(cap2ctrl(cap, CPU_BASED_TSC_OFFSET) & =
CPU_BASED_TSC_OFFSET)) {
>             edx &=3D ~CPUID_EXT2_RDTSCP;
>         }
>         ecx &=3D CPUID_EXT3_LAHF_LM | CPUID_EXT3_CMP_LEG | =
CPUID_EXT3_CR8LEG |
> --=20
> 2.30.1 (Apple Git-130)
>=20
>=20


