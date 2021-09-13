Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5120408B24
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:39:01 +0200 (CEST)
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlEi-0005us-K7
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPl7s-0007Gk-8C
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:31:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:42641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPl7n-0003aR-Pm
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:31:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso6483169wmc.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 05:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VVc/Q6/+YvvGO7AenIm7lYW8VHc0+Irln8tlbkkj/lI=;
 b=uO73eqTVnTDyvvmYZbKfruSaOb0KqPn3/3DbX9ZVznrbw2DooInDLWEtXi7QBm6TzY
 3Y2UNHEF5gYP2pOQRdzEa4qAL/JGT3SeFsp0rIxOPOtVNwniGigDYCjbbm67iX9A5FZw
 QFRegUeKLq49MODfZnl1oBDir70g/gFZSM4vtAyPmGa2/nPttWwq6PqhLMYMVMcBh9GR
 Fovxt/Xbv/p5gpD68RkjCiiWCG6ve+EHBKnPW1HIPgT4+gEb0iQ0mDx/lKjpmNyBbWC8
 k2lLTu/SwznEa9b9CLNMpoCjbysdPoefldJQszPGpWheoNCBmSbhGHS4GZ0uEChVCgMb
 6irQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VVc/Q6/+YvvGO7AenIm7lYW8VHc0+Irln8tlbkkj/lI=;
 b=03dxgTBTH8EB3k/RNkHzi3neWQ14e2Y29uqywDrhHTZhhvycF7XIu32PH5sO1JhH6q
 7okvtjN7mra5EzRIekBvdIVzT9b4FZ9zvtaWgOuTbBznM75+LVFv+OPfRBsn2Y9EexYU
 kkdfOwWRSLdOxo6lsMMBQw2zuNHY3konlNVrRzmjw0qVvZWhCrSM/oC6bm1cq85Dwg8R
 IDI7bhiIs+8n91ymyhf2CYhCi7E7VPcyV4KZiG1hcnIzaVZew121yJxXpHt49FtPQuvR
 xAZQsVeiNnc2zIZ10tyXq4fut18gMnoIx4xuIjFWLzRAjDUsIivuZdJr15Vtzj9KB0Vc
 bPWA==
X-Gm-Message-State: AOAM533dR1g+GvS5K5Lc27dIfXEh0IWdIrprpJYP9iNTa0O16qCv58fU
 zREcUVe+yUA8xJ5dviF59P1Of7cBu3AKRkUnErsD4w==
X-Google-Smtp-Source: ABdhPJwVF+ytH5EYrhH7t9YlVuAhbjy+1c+43J+GwEhApy14qGe3LqveJG0zPu6IG0NRnsBxwjwRVpAnUlgJCX/BGVg=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr10969432wmj.37.1631536308419; 
 Mon, 13 Sep 2021 05:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-8-agraf@csgraf.de>
 <CAFEAcA8BybrfxNxkWbEjxji4DvDumr6Otb_RK_f84Dt_TWXfpA@mail.gmail.com>
 <ad707e0d-8d4a-0248-80f4-a02a7226ce0a@csgraf.de>
 <CAFEAcA_OBK1hbqC1Nc7J+VEwkO54WvqBrNa=bR5T3tZW+nfEkQ@mail.gmail.com>
 <3132e2f5-41a6-6011-808b-7ea12abec1c0@csgraf.de>
In-Reply-To: <3132e2f5-41a6-6011-808b-7ea12abec1c0@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 13:30:57 +0100
Message-ID: <CAFEAcA9k0-przZxAXpdwZKju9GW4gFpTcqAxTD4z_QoueHg=NQ@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>, Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 13:02, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 13.09.21 13:44, Peter Maydell wrote:
> > On Mon, 13 Sept 2021 at 12:07, Alexander Graf <agraf@csgraf.de> wrote:
> >> To keep your train of thought though, what would you do if we encounter
> >> a conduit that is different from the chosen one? Today, I am aware of 2
> >> different implementations: TCG injects #UD [1] while KVM sets x0 to -1 [2].
> > If the SMC or HVC insn isn't being used for PSCI then it should
> > have its standard architectural behaviour.
>
> Why?

QEMU's assumption here is that there are basically two scenarios
for these instructions:
 (1) we're providing an emulation of firmware that uses this
     instruction (and only this insn, not the other one) to
     provide PSCI services
 (2) we're not emulating any firmware at all, we're running it
     in the guest, and that guest firmware is providing PSCI

In case (1) we provide a PSCI ABI on the end of the insn.
In case (2) we provide the architectural behaviour for the insn
so that the guest firmware can use it.

We don't currently have
 (3) we're providing an emulation of firmware that does something
     other than providing PSCI services on this instruction

which is what I think you're asking for. (Alternatively, you might
be after "provide PSCI via SMC, not HVC", ie use a different conduit.
If hvf documents that SMC is guaranteed to trap that would be
possible, I guess.)

> Also, why does KVM behave differently?

Looks like Marc made KVM set x0 to -1 for SMC calls in kernel commit
c0938c72f8070aa; conveniently he's on the cc list here so we can
ask him :-)

> And why does Windows rely on
> SMC availability on boot?

Ask Microsoft, but probably either they don't realize that
SMC might not exist and be trappable, or they only have a limited
set of hosts they care about. CPUs with no EL3 are not that common.

> If you really insist that you don't care about users running Windows
> with TCG and EL2=0, so be it. At least you can enable EL2 and it works
> then. But I can't on hvf. It's one of the most useful use cases for hvf
> on QEMU and I won't break it just because you insist that "SMC behavior
> is IMPDEF, so it must be UNDEF". If it's IMPDEF, it may as well be "set
> x0 to -1 and add 4 to pc".

I am not putting in random hacks for the benefit of specific guest OSes.
If there's a good reason why QEMU's behaviour is wrong then we can change
it, but "I want Windows to boot" doesn't count.

thanks
-- PMM

