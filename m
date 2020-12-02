Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4EC2CC75A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 21:03:42 +0100 (CET)
Received: from localhost ([::1]:54090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkYLl-0002T9-U6
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 15:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkYKO-0001ri-Is
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 15:02:16 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:36609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkYKM-0004AM-TI
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 15:02:16 -0500
Received: by mail-il1-x141.google.com with SMTP id z10so2719589ilu.3
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 12:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Tnx1/g/Fq99lzQzhHiuxAqrwBmkAdDBRHd0RGAObQo=;
 b=d1sPGZHKqba42eW1L2jtTFWkUOZtJ6a1F6rJUEuv3//R28tu9gg0Woap9yfHzQEHCS
 Eih7ldmhdE0aGhMGfuFneJmoY5pJ8hYbWWbJy/PMCoYczTEio4Qd5rZ7hxQIsMMbDmbs
 kN91pf3Dgoe6TODaByKAyeKXmXPramNCaqXNVWYYf9n6/3DAqqf2vSx6yPTSySzOlMDK
 Q/vS/VYJb6irCAgG8NPWQW9wJxsgMBaMegX7PiXUKWwMttHJrRoX87b7sh1TVxtMc5pK
 37JbvBgprw5oihLie5e65Jr29LdhYrGoHTPTuZmwgGAnMpc3rZRI+ztA3bVgUp+zguBO
 /a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Tnx1/g/Fq99lzQzhHiuxAqrwBmkAdDBRHd0RGAObQo=;
 b=YVBzYUJ8SvL2lASFlTW18l7/btsYc1Pitw6QG4RGNtzmycSVkeQf1zn5agCnRSY2rW
 eEMBYZyOjx4G4VEOXwQ7Q5ZAt2D8lhWC7LlMtjhjDy51SSZq+XvjbED3ILYOKOcQw4+a
 tQdSpvuDA/QPKsxIwn5BFtUU0lK7ZdPCWugKbPBzxwoiKIaYXIWSqs69qbjgBSdrywZG
 GBy3YKtpqXKjlxzi541u6vIsXIGEEuktZQYhXC78s8VsG1UOs0lNVE0o1nAJLxusWBEN
 07hQowtjDBoBoRw+clcQQABVPwPSws7z9WZRwMpXNLxRvNApWMUICaiUIIOPiGJGARTU
 45Yw==
X-Gm-Message-State: AOAM533X44YBJq7SCIwNJJIEG1g4JWK8GdjXjaTH9gciTeTgOk/7081f
 trfC2LKf9cxtsn1zLgWU+dEyYplbaNPot+Ln+v02oA==
X-Google-Smtp-Source: ABdhPJxRsqoa3S6nbn5+342ke8/TKDkpFVG4SDo1HLiBf7+HsDTLDPVaEBf1NsoMb0Ok4CSBYDakdaK2cBsa9nWzcas=
X-Received: by 2002:a05:6e02:f86:: with SMTP id
 v6mr2178086ilo.56.1606939333506; 
 Wed, 02 Dec 2020 12:02:13 -0800 (PST)
MIME-Version: 1.0
References: <27f51056925889c41b763b71c992f04d935157c4.1606884132.git.pcc@google.com>
 <f01281f814ceba088595917eb06d4cb21db820f1.1606884132.git.pcc@google.com>
 <23335280-d732-4bf7-af49-068e00601414@csgraf.de>
In-Reply-To: <23335280-d732-4bf7-af49-068e00601414@csgraf.de>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 2 Dec 2020 12:02:02 -0800
Message-ID: <CAMn1gO4bze4PsU6LbXAGxe3VC2xop-h=xXjdUuv4ZP0P66R01g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm/hvf: Add a WFI handler
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=pcc@google.com; helo=mail-il1-x141.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 2, 2020 at 10:49 AM Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 02.12.20 05:44, Peter Collingbourne wrote:
> > Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> > up on IPI.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > v3:
> > - move the simplified locking to a separate patch
> > - spin on sleep <2ms
> >
> > v2:
> > - simplify locking further
> > - wait indefinitely on disabled or masked timers
> >
> >   accel/hvf/hvf-cpus.c     |  4 +--
> >   include/sysemu/hvf_int.h |  1 +
> >   target/arm/hvf/hvf.c     | 56 ++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 59 insertions(+), 2 deletions(-)
> >
> > diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> > index e613c22ad0..b2c8fb57f6 100644
> > --- a/accel/hvf/hvf-cpus.c
> > +++ b/accel/hvf/hvf-cpus.c
> > @@ -344,8 +344,8 @@ static int hvf_init_vcpu(CPUState *cpu)
> >       sigact.sa_handler = dummy_signal;
> >       sigaction(SIG_IPI, &sigact, NULL);
> >
> > -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> > -    sigdelset(&set, SIG_IPI);
> > +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
> > +    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
>
>
> That turns set into an unused variable, no? I'll fix it up while
> applying though. The rest looks great, I'll push it as part of my next
> patch set.

Yes, thanks for spotting that, your fixup looks good.

Peter

