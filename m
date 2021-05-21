Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B8C38C1B9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 10:24:20 +0200 (CEST)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk0SB-0002ge-0t
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 04:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1lk0R8-00020Y-L6
 for qemu-devel@nongnu.org; Fri, 21 May 2021 04:23:14 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:42982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1lk0R6-0002N7-Tu
 for qemu-devel@nongnu.org; Fri, 21 May 2021 04:23:14 -0400
Received: by mail-lf1-x12a.google.com with SMTP id a2so28434961lfc.9
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 01:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E5BzorGsri5488PSjL1siEN5kekGXz/1aX5aJvAEN+U=;
 b=IWXIQBLEb9e1Sj1s4dOXalSrJzpAasLAI9bAOkcpIwhDghJ15i/kr/gBcVltz4gu5J
 1ANJo35KfXx9ZMDE8ZsR6wAey3dTTxWABR5Pd0TUf+1BzP3wvWlfWO3eTqUm8HKoKZtX
 p9AJQA9jjU882lGpte7NucfRmybEtPLgN3JA1yl/KdcEdweILCjKgwBIPRPykveDcahH
 uCZhYQsfOuyXkbEW4ehMSybVjCWfVqNQyUs1CiYtlhOBijatgBrM6GPwAaFnZq4oclVS
 EfLqfr32VgUxSZhTJ5oaj+Wzhf2CLDe2ZTZoRANj9611fRKMcGbG9rOq1rDBM8UXEmLF
 3mSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E5BzorGsri5488PSjL1siEN5kekGXz/1aX5aJvAEN+U=;
 b=U0AVedUYdX/vkj4kBjoYra/15zVlDtVywLxhievE4RM7KwD1iiOQlGFQu3eC3VMdDz
 lI3EsPl3eiNu1SFblyidpv8vGQPHgbOo1y4y3LFiGOohBBe1glf/b3O4Fn12ZVY4j3gP
 QRWqdhXX+zb9odAhmFJ4LQsHKtULn8pxbQWfGh19XyVSFtzLopJ9Rq7+WsFqythECPsT
 Ja4YodGzLRJfUQbY6SYSyrigfJ4NOSUAlZ+dAPkolugkOW2GtL3svjPJILXE+Lix2dhw
 LeF8Fbh7b4A27UsG4IroCZQM6BSMAPpjs2RHYrh+CqMR8k4s0J4orBNcyjWQ2G6pNlKo
 jNCA==
X-Gm-Message-State: AOAM530q55nwQqQhyva+5tz3NBVE8bpqry8O2nqI2mjBt9r05wJTLBLU
 CvLLljqK/DSq3PDQtq0SKNBGJBRKrZ2gdbZpuuU=
X-Google-Smtp-Source: ABdhPJyS44Ti1OVEFySlaupWDk5WVhczzgVIgAOAkvsOoTOPdg5CVNd5Td6i2iiVTizwX9DTqg19oDU0p4RawDY6qyI=
X-Received: by 2002:a05:6512:2398:: with SMTP id
 c24mr1420928lfv.638.1621585390193; 
 Fri, 21 May 2021 01:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <CA+2MQi-_06J1cmLhKAmV1vkPEnvDx6+bOnK06OciYmdymaNruw@mail.gmail.com>
 <87cztmkdlp.fsf@vitty.brq.redhat.com>
In-Reply-To: <87cztmkdlp.fsf@vitty.brq.redhat.com>
From: Liang Li <liliang324@gmail.com>
Date: Fri, 21 May 2021 16:22:58 +0800
Message-ID: <CA+2MQi_LG57KRRFjMR_zPvJBDaH4z16S5J=c+U+-Ss_Z71Ax7g@mail.gmail.com>
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

> > Hi Vitaly,
> >
> > I found a case that the virtualization overhead was almost doubled
> > when turning on Hper-v related features compared to that without any
> > no hyper-v feature.  It happens when running a 3D game in windows
> > guest in qemu kvm environment.
> >
> > By investigation, I found there are a lot of IPIs triggered by guest,
> > when turning on the hyer-v related features including stimer, for the
> > apicv is turned off, at least two vm exits are needed for processing a
> > single IPI.
> >
> >
> > perf stat will show something like below [recorded for 5 seconds]
> >
> > ---------
> >
> > Analyze events for all VMs, all VCPUs:
> >              VM-EXIT    Samples  Samples%     Time%    Min Time    Max
> > Time         Avg time
> >   EXTERNAL_INTERRUPT     471831    59.89%    68.58%      0.64us
> > 65.42us      2.34us ( +-   0.11% )
> >            MSR_WRITE     238932    30.33%    23.07%      0.48us
> > 41.05us      1.56us ( +-   0.14% )
> >
> > Total Samples:787803, Total events handled time:1611193.84us.
> >
> > I tried turning off hyper-v for the same workload and repeat the test,
> > the overall virtualization overhead reduced by about of 50%:
> >
> > -------
> >
> > Analyze events for all VMs, all VCPUs:
> >
> >              VM-EXIT    Samples  Samples%     Time%    Min Time    Max
> > Time         Avg time
> >           APIC_WRITE     255152    74.43%    50.72%      0.49us
> > 50.01us      1.42us ( +-   0.14% )
> >        EPT_MISCONFIG      39967    11.66%    40.58%      1.55us
> > 686.05us      7.27us ( +-   0.43% )
> >            DR_ACCESS      35003    10.21%     4.64%      0.32us
> > 40.03us      0.95us ( +-   0.32% )
> >   EXTERNAL_INTERRUPT       6622     1.93%     2.08%      0.70us
> > 57.38us      2.25us ( +-   1.42% )
> >
> > Total Samples:342788, Total events handled time:715695.62us.
> >
> > For this scenario,  hyper-v works really bad.  stimer works better
> > than hpet, but on the other hand, it relies on SynIC which has
> > negative effects for IPI intensive workloads.
> > Do you have any plans for improvement?
> >
>
> Hey,
>
> the above can be caused by the fact that when 'hv-synic' is enabled, KVM
> automatically disables APICv and this can explain the overhead and the
> fact that you're seeing more vmexits. KVM disables APICv because SynIC's
> 'AutoEOI' feature is incompatible with it. We can, however, tell Windows
> to not use AutoEOI ('Recommend deprecating AutoEOI' bit) and only
> inhibit APICv if the recommendation was ignored. This is implemented in
> the following KVM patch series:
> https://lore.kernel.org/kvm/20210518144339.1987982-1-vkuznets@redhat.com/
>
> It will, however, require a new 'hv-something' flag to QEMU. For now, it
> can be tested with 'hv-passthrough'.
>
> It would be great if you could give it a spin!
>
> --
> Vitaly

It's great to know that you already have a solution for this. :)

By the way,  is there any requirement for the version of windows or
windows updates for the new feature to work?

Thanks!

Liang

