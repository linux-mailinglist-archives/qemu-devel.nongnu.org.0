Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B4F4D5F0E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 11:01:36 +0100 (CET)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSc5X-0007o3-0d
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 05:01:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSc3H-00071c-B4
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:59:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSc3E-0001ct-VM
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 04:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646992749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNLN6Rcnm+EyA642+pm5AhWb3oVvYqPHdBZvnEFNVTU=;
 b=dNt1ZpaKcXOh1Xxx8H0t0SIhWQMuNawydqzvatWRXRNNXE6ToflDA4JPMhhCLRdJgY2fZU
 qOYyIEJ7TtmxEbAVleAReYFvwVyxiNe4KUd/XofsfQHBQLtk4YG/OO1KBiECujX1mvy5As
 AW/pUCsUF/dcoYtHCGD1B252KZaHK7c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-C8yWl99HMjuzlG0pDyDfNw-1; Fri, 11 Mar 2022 04:59:08 -0500
X-MC-Unique: C8yWl99HMjuzlG0pDyDfNw-1
Received: by mail-ej1-f69.google.com with SMTP id
 jy20-20020a170907763400b006db62b6f4e0so4668362ejc.11
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 01:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eNLN6Rcnm+EyA642+pm5AhWb3oVvYqPHdBZvnEFNVTU=;
 b=c1jigfnrT3Oeb29g5ckHZEkDL/iT9l6O8C1auadE08fBEzphsxDQkmqUZsP/jCHZOj
 NoFYmXIjYoqvvX6QLUWt7lQKjQsaazbdmpb/43NkQ17RWirTspBoEQwQXvMzA5TVIQDf
 j2R9uASIwKuYDW2GIWOkZ072D8pDefU6Jv70IyvoyFfL/hpezisJCjJ6UGbuvT5HOmkE
 /I7eeAfeDPWreGZAq/yPMT5TcQ8CSihKSLQ/fnwtSzq+aVTb1KbcCZu4rnSUU213UqlW
 UfHljMMcnxyrXRxRwDiQBFUCoDmMQRrK6W6uMavqM9u22Lgyr0YlHtAMlly/jgejUAHo
 3KLg==
X-Gm-Message-State: AOAM532dlKNYRmdhs4O1QiFkmi19nE9LfdHDQKf04UnRIWUlwkVpyCqI
 Hh26h6K7b3WCShpFocXWfkWm8uLhhjSIyfLuk5wt6KjcnmLkyFk93DUelMsTRfndRD3VjH+lzQ8
 JVgrN2YO0gTWJaNc=
X-Received: by 2002:a17:907:168f:b0:6da:b548:4f9f with SMTP id
 hc15-20020a170907168f00b006dab5484f9fmr7646608ejc.666.1646992747434; 
 Fri, 11 Mar 2022 01:59:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMNB+PwfmDG0x8mNg1nHYRrTtR7om6nMTswon0/J2mzrpEQl2WzrdS78eCgOVAP9fC6w0+Fg==
X-Received: by 2002:a17:907:168f:b0:6da:b548:4f9f with SMTP id
 hc15-20020a170907168f00b006dab5484f9fmr7646587ejc.666.1646992747189; 
 Fri, 11 Mar 2022 01:59:07 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a17090631c700b006b293ddbca1sm2728271ejf.35.2022.03.11.01.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 01:59:06 -0800 (PST)
Date: Fri, 11 Mar 2022 10:59:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Subject: Re: [PATCH v3] i386/cpu: Remove the deprecated cpu model
 'Icelake-Client'
Message-ID: <20220311105905.059ab339@redhat.com>
In-Reply-To: <8def2eb9aa6e195700e8ff02b9861e5514ca6177.camel@linux.intel.com>
References: <1619660147-136679-1-git-send-email-robert.hu@linux.intel.com>
 <7a73c09fd325e162e8dc595b31bb5b414c4962e7.camel@linux.intel.com>
 <8def2eb9aa6e195700e8ff02b9861e5514ca6177.camel@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 ehabkost@redhat.com, robert.hu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 08 Feb 2022 16:38:27 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> Hi,
> 
> Can we remove the deprecated 'Icelake-Client' CPU model now? if so, I
> can rebase patch to latest and resend.

Please rebase and resend.

PS:
Also looking at deprecation commit 3e6a015cbd0f, it doesn't
have any reason behind deprecation so please add explanation
to commit message why it's being removed.

> Thanks.
> 
> On Sat, 2021-05-08 at 11:16 +0800, Robert Hoo wrote:
> > Hi,
> > 
> > Ping...
> > 
> > Thanks.
> > 
> > On Thu, 2021-04-29 at 09:35 +0800, Robert Hoo wrote:  
> > > As it's been marked deprecated since v5.2, now I think it's time
> > > remove it
> > > from code.
> > > 
> > > Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> > > ---
> > > Changelog:
> > > v3:
> > > 	Update deprecated.rst. (Sorry for my carelessness in last
> > > search. I
> > > sware I did search.)
> > > v2:
> > >     Update removed-features.rst.
> > > ---
> > >  docs/system/deprecated.rst       |   6 --
> > >  docs/system/removed-features.rst |   5 ++
> > >  target/i386/cpu.c                | 118 ---------------------------
> > > ------------
> > >  3 files changed, 5 insertions(+), 124 deletions(-)
> > > 
> > > diff --git a/docs/system/deprecated.rst
> > > b/docs/system/deprecated.rst
> > > index 80cae86..780b756 100644
> > > --- a/docs/system/deprecated.rst
> > > +++ b/docs/system/deprecated.rst
> > > @@ -222,12 +222,6 @@ a future version of QEMU. Support for this CPU
> > > was removed from the
> > >  upstream Linux kernel, and there is no available upstream
> > > toolchain
> > >  to build binaries for it.
> > >  
> > > -``Icelake-Client`` CPU Model (since 5.2.0)
> > > -''''''''''''''''''''''''''''''''''''''''''
> > > -
> > > -``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-
> > > Server`` 
> > > CPU
> > > -Models instead.
> > > -
> > >  MIPS ``I7200`` CPU Model (since 5.2)
> > >  ''''''''''''''''''''''''''''''''''''
> > >  
> > > diff --git a/docs/system/removed-features.rst
> > > b/docs/system/removed-
> > > features.rst
> > > index 29e9060..f1b5a16 100644
> > > --- a/docs/system/removed-features.rst
> > > +++ b/docs/system/removed-features.rst
> > > @@ -285,6 +285,11 @@ The RISC-V no MMU cpus have been removed. The
> > > two CPUs: ``rv32imacu-nommu`` and
> > >  ``rv64imacu-nommu`` can no longer be used. Instead the MMU status
> > > can be specified
> > >  via the CPU ``mmu`` option when using the ``rv32`` or ``rv64``
> > > CPUs.
> > >  
> > > +x86 Icelake-Client CPU (removed in 6.1)
> > > +'''''''''''''''''''''''''''''''''''''''
> > > +
> > > +``Icelake-Client`` cpu can no longer be used. Use ``Icelake-
> > > Server`` 
> > > instead.
> > > +
> > >  System emulator machines
> > >  ------------------------
> > >  
> > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > > index ad99cad..75f2ad1 100644
> > > --- a/target/i386/cpu.c
> > > +++ b/target/i386/cpu.c
> > > @@ -3338,124 +3338,6 @@ static X86CPUDefinition builtin_x86_defs[]
> > > =
> > > {
> > >          .model_id = "Intel Xeon Processor (Cooperlake)",
> > >      },
> > >      {
> > > -        .name = "Icelake-Client",
> > > -        .level = 0xd,
> > > -        .vendor = CPUID_VENDOR_INTEL,
> > > -        .family = 6,
> > > -        .model = 126,
> > > -        .stepping = 0,
> > > -        .features[FEAT_1_EDX] =
> > > -            CPUID_VME | CPUID_SSE2 | CPUID_SSE | CPUID_FXSR |
> > > CPUID_MMX |
> > > -            CPUID_CLFLUSH | CPUID_PSE36 | CPUID_PAT | CPUID_CMOV |
> > > CPUID_MCA |
> > > -            CPUID_PGE | CPUID_MTRR | CPUID_SEP | CPUID_APIC |
> > > CPUID_CX8 |
> > > -            CPUID_MCE | CPUID_PAE | CPUID_MSR | CPUID_TSC |
> > > CPUID_PSE |
> > > -            CPUID_DE | CPUID_FP87,
> > > -        .features[FEAT_1_ECX] =
> > > -            CPUID_EXT_AVX | CPUID_EXT_XSAVE | CPUID_EXT_AES |
> > > -            CPUID_EXT_POPCNT | CPUID_EXT_X2APIC | CPUID_EXT_SSE42
> > > |
> > > -            CPUID_EXT_SSE41 | CPUID_EXT_CX16 | CPUID_EXT_SSSE3 |
> > > -            CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSE3 |
> > > -            CPUID_EXT_TSC_DEADLINE_TIMER | CPUID_EXT_FMA |
> > > CPUID_EXT_MOVBE |
> > > -            CPUID_EXT_PCID | CPUID_EXT_F16C | CPUID_EXT_RDRAND,
> > > -        .features[FEAT_8000_0001_EDX] =
> > > -            CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX |
> > > -            CPUID_EXT2_SYSCALL,
> > > -        .features[FEAT_8000_0001_ECX] =
> > > -            CPUID_EXT3_ABM | CPUID_EXT3_LAHF_LM |
> > > CPUID_EXT3_3DNOWPREFETCH,
> > > -        .features[FEAT_8000_0008_EBX] =
> > > -            CPUID_8000_0008_EBX_WBNOINVD,
> > > -        .features[FEAT_7_0_EBX] =
> > > -            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 |
> > > -            CPUID_7_0_EBX_HLE | CPUID_7_0_EBX_AVX2 |
> > > CPUID_7_0_EBX_SMEP |
> > > -            CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_ERMS |
> > > CPUID_7_0_EBX_INVPCID |
> > > -            CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_RDSEED |
> > > CPUID_7_0_EBX_ADX |
> > > -            CPUID_7_0_EBX_SMAP,
> > > -        .features[FEAT_7_0_ECX] =
> > > -            CPUID_7_0_ECX_AVX512_VBMI | CPUID_7_0_ECX_UMIP |
> > > CPUID_7_0_ECX_PKU |
> > > -            CPUID_7_0_ECX_AVX512_VBMI2 | CPUID_7_0_ECX_GFNI |
> > > -            CPUID_7_0_ECX_VAES | CPUID_7_0_ECX_VPCLMULQDQ |
> > > -            CPUID_7_0_ECX_AVX512VNNI | CPUID_7_0_ECX_AVX512BITALG
> > > |
> > > -            CPUID_7_0_ECX_AVX512_VPOPCNTDQ,
> > > -        .features[FEAT_7_0_EDX] =
> > > -            CPUID_7_0_EDX_SPEC_CTRL |
> > > CPUID_7_0_EDX_SPEC_CTRL_SSBD,
> > > -        /* Missing: XSAVES (not supported by some Linux versions,
> > > -                * including v4.1 to v4.12).
> > > -                * KVM doesn't yet expose any XSAVES state save
> > > component,
> > > -                * and the only one defined in Skylake (processor
> > > tracing)
> > > -                * probably will block migration anyway.
> > > -                */
> > > -        .features[FEAT_XSAVE] =
> > > -            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
> > > -            CPUID_XSAVE_XGETBV1,
> > > -        .features[FEAT_6_EAX] =
> > > -            CPUID_6_EAX_ARAT,
> > > -        /* Missing: Mode-based execute control (XS/XU), processor
> > > tracing, TSC scaling */
> > > -        .features[FEAT_VMX_BASIC] = MSR_VMX_BASIC_INS_OUTS |
> > > -             MSR_VMX_BASIC_TRUE_CTLS,
> > > -        .features[FEAT_VMX_ENTRY_CTLS] = VMX_VM_ENTRY_IA32E_MODE |
> > > -             VMX_VM_ENTRY_LOAD_IA32_PERF_GLOBAL_CTRL |
> > > VMX_VM_ENTRY_LOAD_IA32_PAT |
> > > -             VMX_VM_ENTRY_LOAD_DEBUG_CONTROLS |
> > > VMX_VM_ENTRY_LOAD_IA32_EFER,
> > > -        .features[FEAT_VMX_EPT_VPID_CAPS] = MSR_VMX_EPT_EXECONLY |
> > > -             MSR_VMX_EPT_PAGE_WALK_LENGTH_4 | MSR_VMX_EPT_WB |
> > > MSR_VMX_EPT_2MB |
> > > -             MSR_VMX_EPT_1GB | MSR_VMX_EPT_INVEPT |
> > > -             MSR_VMX_EPT_INVEPT_SINGLE_CONTEXT |
> > > MSR_VMX_EPT_INVEPT_ALL_CONTEXT |
> > > -             MSR_VMX_EPT_INVVPID | MSR_VMX_EPT_INVVPID_SINGLE_ADDR
> > > |
> > > -             MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT |
> > > MSR_VMX_EPT_INVVPID_ALL_CONTEXT |
> > > -             MSR_VMX_EPT_INVVPID_SINGLE_CONTEXT_NOGLOBALS |
> > > MSR_VMX_EPT_AD_BITS,
> > > -        .features[FEAT_VMX_EXIT_CTLS] =
> > > -             VMX_VM_EXIT_ACK_INTR_ON_EXIT |
> > > VMX_VM_EXIT_SAVE_DEBUG_CONTROLS |
> > > -             VMX_VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL |
> > > -             VMX_VM_EXIT_LOAD_IA32_PAT |
> > > VMX_VM_EXIT_LOAD_IA32_EFER  
> > > >   
> > > 
> > > -             VMX_VM_EXIT_SAVE_IA32_PAT |
> > > VMX_VM_EXIT_SAVE_IA32_EFER  
> > > >   
> > > 
> > > -             VMX_VM_EXIT_SAVE_VMX_PREEMPTION_TIMER,
> > > -        .features[FEAT_VMX_MISC] = MSR_VMX_MISC_ACTIVITY_HLT |
> > > -             MSR_VMX_MISC_STORE_LMA | MSR_VMX_MISC_VMWRITE_VMEXIT,
> > > -        .features[FEAT_VMX_PINBASED_CTLS] =
> > > VMX_PIN_BASED_EXT_INTR_MASK |
> > > -             VMX_PIN_BASED_NMI_EXITING |
> > > VMX_PIN_BASED_VIRTUAL_NMIS  
> > > >   
> > > 
> > > -             VMX_PIN_BASED_VMX_PREEMPTION_TIMER,
> > > -        .features[FEAT_VMX_PROCBASED_CTLS] =
> > > VMX_CPU_BASED_VIRTUAL_INTR_PENDING |
> > > -             VMX_CPU_BASED_USE_TSC_OFFSETING |
> > > VMX_CPU_BASED_HLT_EXITING |
> > > -             VMX_CPU_BASED_INVLPG_EXITING |
> > > VMX_CPU_BASED_MWAIT_EXITING |
> > > -             VMX_CPU_BASED_RDPMC_EXITING |
> > > VMX_CPU_BASED_RDTSC_EXITING |
> > > -             VMX_CPU_BASED_CR8_LOAD_EXITING |
> > > VMX_CPU_BASED_CR8_STORE_EXITING |
> > > -             VMX_CPU_BASED_TPR_SHADOW |
> > > VMX_CPU_BASED_MOV_DR_EXITING  
> > > >   
> > > 
> > > -             VMX_CPU_BASED_UNCOND_IO_EXITING |
> > > VMX_CPU_BASED_USE_IO_BITMAPS |
> > > -             VMX_CPU_BASED_MONITOR_EXITING |
> > > VMX_CPU_BASED_PAUSE_EXITING |
> > > -             VMX_CPU_BASED_VIRTUAL_NMI_PENDING |
> > > VMX_CPU_BASED_USE_MSR_BITMAPS |
> > > -             VMX_CPU_BASED_CR3_LOAD_EXITING |
> > > VMX_CPU_BASED_CR3_STORE_EXITING |
> > > -             VMX_CPU_BASED_MONITOR_TRAP_FLAG |
> > > -             VMX_CPU_BASED_ACTIVATE_SECONDARY_CONTROLS,
> > > -        .features[FEAT_VMX_SECONDARY_CTLS] =
> > > -             VMX_SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES |
> > > -             VMX_SECONDARY_EXEC_WBINVD_EXITING |
> > > VMX_SECONDARY_EXEC_ENABLE_EPT |
> > > -             VMX_SECONDARY_EXEC_DESC | VMX_SECONDARY_EXEC_RDTSCP |
> > > -             VMX_SECONDARY_EXEC_ENABLE_VPID |
> > > VMX_SECONDARY_EXEC_UNRESTRICTED_GUEST |
> > > -             VMX_SECONDARY_EXEC_RDRAND_EXITING |
> > > VMX_SECONDARY_EXEC_ENABLE_INVPCID |
> > > -             VMX_SECONDARY_EXEC_ENABLE_VMFUNC |
> > > VMX_SECONDARY_EXEC_SHADOW_VMCS |
> > > -             VMX_SECONDARY_EXEC_RDSEED_EXITING |
> > > VMX_SECONDARY_EXEC_ENABLE_PML,
> > > -        .features[FEAT_VMX_VMFUNC] = MSR_VMX_VMFUNC_EPT_SWITCHING,
> > > -        .xlevel = 0x80000008,
> > > -        .model_id = "Intel Core Processor (Icelake)",
> > > -        .versions = (X86CPUVersionDefinition[]) {
> > > -            {
> > > -                .version = 1,
> > > -                .note = "deprecated"
> > > -            },
> > > -            {
> > > -                .version = 2,
> > > -                .note = "no TSX, deprecated",
> > > -                .alias = "Icelake-Client-noTSX",
> > > -                .props = (PropValue[]) {
> > > -                    { "hle", "off" },
> > > -                    { "rtm", "off" },
> > > -                    { /* end of list */ }
> > > -                },
> > > -            },
> > > -            { /* end of list */ }
> > > -        },
> > > -        .deprecation_note = "use Icelake-Server instead"
> > > -    },
> > > -    {
> > >          .name = "Icelake-Server",
> > >          .level = 0xd,
> > >          .vendor = CPUID_VENDOR_INTEL,  
> 
> 


