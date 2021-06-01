Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62927397472
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:38:12 +0200 (CEST)
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4ax-0002bV-Gx
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1lo4TH-0007Cm-9P
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:30:16 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:36694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1lo4TC-0002Oi-PY
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:30:15 -0400
Received: by mail-lf1-x12a.google.com with SMTP id q1so21821174lfo.3
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jkQlDO685xDJqrzL2iqgvvvwo6S6SiI7DXtQHAtFDwE=;
 b=J2TEc2TsluRQv/aSFtt9HpGQNKdiHCrBqozRc97ihuc5xiZPS6OqQ3stQTBNhT9JdV
 KFD+pMaw7mLE09bHOlbpjzxoa0ikJ0bebIkNN/Nxm9hiidBxP7VTKhwAYryT6Bliixc9
 88HROxFQAJw/z368D2tz7tkM1YpZ798OTDEadfycJSP9GEyRlKG1nc585/Ef3ja0751d
 MEji4FkTBSEUwLAh4oc3kfMV7DoRnXzfnz0Q5465WY37VwWPTvFSUP5hDDH9TX/Oiyh3
 +iD0JiScaMb3ZgktZVNoWivg3omtHQywtkwLk8aSHyytQ4Ad8H5DYASrJq+BxwN9WGMN
 5Q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jkQlDO685xDJqrzL2iqgvvvwo6S6SiI7DXtQHAtFDwE=;
 b=ITal4hNyjDz014+r6k5tjyQeOrUUJ/TYpZjg2Mun5RB3S1nRY3lwjgv3sLFfKALGsD
 c35thj3mplQAOeqR/NiqviYNujp9TH9DSwgaXVnsBUibuys01dn2RHsMgJXcjQJtFxff
 3ByaRwT0NQxMNHjGEQiicogwetTscJ+oU/Wv1QRfMDDfyoE6wB6m8yx7ir52NGqYkjY/
 /29QFOYM4qGWQkQm5oFnwpHljzEAZ++uRopypA7DQQJqaoAUE4+z6bcpweYdFMLr+5K8
 rseXT7FfrgqdSLnkbvsLHk+UkTNlOhzGMONjE/XXT8a90IAJRBT0BfMFfP49+JR/r8jL
 sb9g==
X-Gm-Message-State: AOAM530XDyk01ZQL00cfQO4iEoB0S3YPEPzqgpI8GrLpKxN1NSu0BGq5
 zqDKvo7SpY6zKd22ayiv3IfSwMy1/uLYFbuod5w=
X-Google-Smtp-Source: ABdhPJzei4zXDgEQqyxuNHcw6Z/T2nPFniWQDacaeCUN6yb55DWytOea/sHrBJu7MEsj6XeA+jmy2gxyfJ97IXbkjsY=
X-Received: by 2002:ac2:5d29:: with SMTP id i9mr18833884lfb.638.1622554208031; 
 Tue, 01 Jun 2021 06:30:08 -0700 (PDT)
MIME-Version: 1.0
References: <CA+2MQi-_06J1cmLhKAmV1vkPEnvDx6+bOnK06OciYmdymaNruw@mail.gmail.com>
 <87cztmkdlp.fsf@vitty.brq.redhat.com>
 <CA+2MQi_LG57KRRFjMR_zPvJBDaH4z16S5J=c+U+-Ss_Z71Ax7g@mail.gmail.com>
 <87y2c8iia0.fsf@vitty.brq.redhat.com>
 <CA+2MQi-OK5zK_sBtm8k-nnqVPQTSzE1UVTEfQ4KBChMHc=Npzg@mail.gmail.com>
 <87k0no4k4q.fsf@vitty.brq.redhat.com>
In-Reply-To: <87k0no4k4q.fsf@vitty.brq.redhat.com>
From: Liang Li <liliang324@gmail.com>
Date: Tue, 1 Jun 2021 21:29:56 +0800
Message-ID: <CA+2MQi_1N=HD7z7s6-MOcQ6xS14KxPS=TqjHTrWDdTP7jteMPw@mail.gmail.com>
Subject: Re: About the performance of hyper-v
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=liliang324@gmail.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Tianyu.Lan@microsoft.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

==========================
> > Analyze events for all VMs, all VCPUs:
> >              VM-EXIT    Samples  Samples%     Time%    Min Time    Max
> > Time         Avg time
> >            MSR_WRITE     924045    89.96%    81.10%      0.42us
> > 68.42us      1.26us ( +-   0.07% )
> >            DR_ACCESS      44669     4.35%     2.36%      0.32us
> > 50.74us      0.76us ( +-   0.32% )
> >   EXTERNAL_INTERRUPT      29809     2.90%     6.42%      0.66us
> > 70.75us      3.10us ( +-   0.54% )
> >               VMCALL      17819     1.73%     5.21%      0.75us
> > 15.64us      4.20us ( +-   0.33%
> >
> > Total Samples:1027227, Total events handled time:1436343.94us.
> > ===============================
> >
> > The result shows the overhead increased.  enable the apicv can help to
> > reduce the vm-exit
> > caused by interrupt injection, but on the other side, there are a lot
> > of vm-exit caused by APIC_EOI.
> >
> > When turning off the hyper-v and using the kvm apicv, there is no such
> > overhead.
>
> I think I know what's happening. We've asked Windows to use synthetic
> MSRs to access APIC (HV_APIC_ACCESS_RECOMMENDED) and this can't be
> accelerated in hardware.
>
> Could you please try the following hack (KVM):
>
> diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> index c8f2592ccc99..66ee85a83e9a 100644
> --- a/arch/x86/kvm/cpuid.c
> +++ b/arch/x86/kvm/cpuid.c
> @@ -145,6 +145,13 @@ void kvm_update_cpuid_runtime(struct kvm_vcpu *vcpu)
>                                            vcpu->arch.ia32_misc_enable_msr &
>                                            MSR_IA32_MISC_ENABLE_MWAIT);
>         }
> +
> +       /* Dirty hack: force HV_DEPRECATING_AEOI_RECOMMENDED. Not to be merged! */
> +       best = kvm_find_cpuid_entry(vcpu, HYPERV_CPUID_ENLIGHTMENT_INFO, 0);
> +       if (best) {
> +               best->eax &= ~HV_X64_APIC_ACCESS_RECOMMENDED;
> +               best->eax |= HV_DEPRECATING_AEOI_RECOMMENDED;
> +       }
>  }
>  EXPORT_SYMBOL_GPL(kvm_update_cpuid_runtime);
>
> > It seems turning on hyper V related features is not always the best
> > choice for a windows guest.
>
> Generally it is, we'll just need to make QEMU smarter when setting
> 'recommendation' bits.
>

Hi Vitaly,

I have tried your patch and found it can help to reduce the overhead.
it works as well as
the  option  "<feature policy='disable' name='hypervisor'/>" is set in
libvirt xml.

=======with your patch and stimer enabled=====
Analyze events for all VMs, all VCPUs:
             VM-EXIT    Samples  Samples%     Time%    Min Time    Max
Time         Avg time
          APIC_WRITE     172232    78.36%    68.99%      0.70us
47.71us      1.48us ( +-   0.18% )
         DR_ACCESS      19136     8.71%     4.42%      0.55us
4.42us      0.85us ( +-   0.32% )
  EXTERNAL_INTERRUPT      15921     7.24%    13.84%      0.87us
55.28us      3.21us ( +-   0.55% )
              VMCALL       6971     3.17%    10.34%      1.16us
12.02us      5.48us ( +-   0.49%
Total Samples:219802, Total events handled time:369310.30us.

===========with hypervisor disabled=========

Analyze events for all VMs, all VCPUs:
             VM-EXIT    Samples  Samples%     Time%    Min Time    Max
Time         Avg time
          APIC_WRITE     200482    78.51%    68.62%      0.64us
49.51us      1.37us ( +-   0.16% )
           DR_ACCESS      24235     9.49%     4.92%      0.55us
3.65us      0.81us ( +-   0.26% )
  EXTERNAL_INTERRUPT      17084     6.69%    13.20%      0.89us
56.38us      3.09us ( +-   0.53% )
              VMCALL       7124     2.79%     9.87%      1.26us
12.39us      5.54us ( +-   0.49% )
         EOI_INDUCED       5066     1.98%     1.36%      0.66us
2.64us      1.07us ( +-   0.25% )
      IO_INSTRUCTION        591     0.23%     1.27%      3.37us
673.23us      8.59us ( +-  13.69% )
Total Samples:255363, Total events handled time:399954.27us.


Thanks!
Liang

