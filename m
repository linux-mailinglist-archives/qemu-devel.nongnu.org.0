Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1552263EF54
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 12:21:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0hba-00087S-T2; Thu, 01 Dec 2022 06:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0hbY-00086t-UQ
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:19:48 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p0hbW-0007Dv-N5
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 06:19:48 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so1685656pjd.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 03:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZCwPsFz1IkWwGG4R6t3UgktQUADEE2ekOmTBUSLj5QQ=;
 b=cIxLUszB2z5bDm5O0CmRTHxEYzyWtweVN5He5qGbjii8sSu3MqEsmM2PaHrtS53AEv
 HsJCakHaaMDd/oHj6+XqnYo+VZ3sc8SBDGDuSTPNs1oYP6Pjl+Vmb2MQ4U/56pakkxqc
 QkdVAf2BbA7hY/nqKF1jyJ9y6RT4+V8cOxF+05Ic39r/mrvBfFoKwh/KkrL8eMqVYoMq
 Z9bwAD/R7Tf86qqGpxqmZQ2ww7ZPxVS4pxNpSWn09ByMQkPYdJL0phA5qbBei79akHkE
 hq6XS0sZN8Kls7DA+PoR+49kUZy0OcWyGVUO9pyx9d5CCRKAftcUvAJU//gxgeJlDQjN
 91fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZCwPsFz1IkWwGG4R6t3UgktQUADEE2ekOmTBUSLj5QQ=;
 b=rzGmLRWL49OB3Snb4Qf2mJzjsloqu0NTH93wNZCE1poq0PfQn7513SV6CIikh0X6lL
 un1IAk/diaeI/+8g8IuhylpIv8XKQCFiWHoGqglKkSxu+/BhAxqRsfnTqRFZcPzxAC1k
 S3Qe7V2DLSR0dyMxBTkuqoFbepz/Vu4e80e667hDmX8NLYYRIfyi8JE3As/BCkNUHLk/
 g68iLhSXnd0piOlUKYtHAGBpxhi79cf5kE4ip4xK1DDMjHUZkT+vzE7liVm2jlY+9h93
 lkMRkeJ8JitaPqXnAABCs20AFSSjnNFRRNc1yhASISa/mY/l2zbJZWnbbOWDwmSl5PY4
 AegA==
X-Gm-Message-State: ANoB5plEHaw5JKSw1m0bEbmO1EquHGn10zJ0Iq4XSaePMv+mXus+F+BP
 2MAbuCAPS+UQz+Rhem6M5hjQNErjKmGHdYdaY3AhkQ==
X-Google-Smtp-Source: AA0mqf7UMy6ysGlQ3+/XD7dS8P2MxrsQY9kPgeIfvGB5PlatZrFd4JuP5EubBXDXR1GXCt0u4WNeR+tJxXUh4lA1gDM=
X-Received: by 2002:a17:90a:460f:b0:218:c47f:ed9a with SMTP id
 w15-20020a17090a460f00b00218c47fed9amr50445242pjg.19.1669893584580; Thu, 01
 Dec 2022 03:19:44 -0800 (PST)
MIME-Version: 1.0
References: <20221201102728.69751-1-akihiko.odaki@daynix.com>
 <CAFEAcA_ORM9CpDCvPMs1XcZVhh_4fKE2wnaS_tp1s4DzZCHsXQ@mail.gmail.com>
 <a3cc1116-272d-a8e5-a131-7becf98115e0@daynix.com>
In-Reply-To: <a3cc1116-272d-a8e5-a131-7becf98115e0@daynix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Dec 2022 11:19:32 +0000
Message-ID: <CAFEAcA_ECpCV+6Z+jom-sP0PNQpoU0fFG_3L_70PrQEWrarH_g@mail.gmail.com>
Subject: Re: [PATCH] accel/kvm/kvm-all: Handle register access errors
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 1 Dec 2022 at 11:00, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>
> On 2022/12/01 19:40, Peter Maydell wrote:
> > On Thu, 1 Dec 2022 at 10:27, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
> >>
> >> A register access error typically means something seriously wrong
> >> happened so that anything bad can happen after that and recovery is
> >> impossible.
> >> Even failing one register access is catastorophic as
> >> architecture-specific code are not written so that it torelates such
> >> failures.
> >>
> >> Make sure the VM stop and nothing worse happens if such an error occurs.
> >>
> >> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> >
> > In a similar vein there was also
> > https://lore.kernel.org/all/20220617144857.34189-1-peterx@redhat.com/
> > back in June, which on the one hand was less comprehensive but on
> > the other does the plumbing to pass the error upwards rather than
> > reporting it immediately at point of failure.
> >
> > I'm in principle in favour but suspect we'll run into some corner
> > cases where we were happily ignoring not-very-important failures
> > (eg if you're running Linux as the host OS on a Mac M1 and your
> > host kernel doesn't have this fix:
> > https://lore.kernel.org/all/YnHz6Cw5ONR2e+KA@google.com/T/
> > then QEMU will go from "works by sheer luck" to "consistently
> > hits this error check"). So we should aim to land this extra
> > error checking early in the release cycle so we have plenty of
> > time to deal with any bug reports we get about it.

> Actually I found this problem when I tried to run QEMU with KVM on M2
> MacBook Air and encountered a failure described and fixed at:
> https://lore.kernel.org/all/20221201104914.28944-2-akihiko.odaki@daynix.com/

Ah, yeah, you're trying to run QEMU+KVM on a heterogenous cluster.
You need to force all the vCPUs to run on only a single host
CPU type. It's a shame the error-reporting for this situation
is not very good, but there's not really any way to tell in
advance, the best you get is an error at the point where a vCPU
happens to migrate over to a different host CPU.

> Although the affected register was not really important, QEMU couldn't
> run the guest well enough because kvm_arch_put_registers for ARM64 is
> written in a way that it fails early. I guess the situation is not so
> different for other architectures as well.

I think Arm is the only one that does this kind of "leave the
handling of the system registers up to the host kernel and treat
them as mostly black-box values to be passed around on migration"
approach. Most other architectures have QEMU know about specific system
registers in the vCPU and only ask the kernel about those, I think.

-- PMM

