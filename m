Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44085699B12
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:16:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShs0-0002Ef-1Z; Thu, 16 Feb 2023 12:16:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShrc-0001tE-1N
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:16:12 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShra-0000QG-8d
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:16:07 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 d13-20020a17090ad3cd00b0023127b2d602so2791103pjw.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676567765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C0KokJHopfhhM46dAI8X3vpi3gbv7qDJ5m0Cl519uGE=;
 b=GbDqE5f5C2sjmu4ZsM6fpr3aivBse9YKOt06w7f8lsceFlliesoNTE9icFF18XlbmR
 jP5IiRnMJyJ6z3TRXGdxhy4fXgXyuZFxt2nmvQjdLVO3NOCAbssO++ylmt95Ci3DF/wo
 jpaa7bfAwP13vpQEpXGz2J7TwjbeEiuV+bRzjq9FnInRRQ4Oy3uemN1AjqwIinJZLnFI
 bLjCZ5czNuISOjEMpGyOFUUt1F1GON9+3NRtgVoiq+b9+bvz3ryUPZlzRTBcFPH3ZHxd
 XSDnwAUe5bgHMMlkAvGZMXMTGPqGJA4Bx93AeSkre56GPuF8Mj2i7/ijcWgejXYUAAVk
 7OiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676567765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C0KokJHopfhhM46dAI8X3vpi3gbv7qDJ5m0Cl519uGE=;
 b=W+JXUIYMTy/QZiMloMy8Mvm5UgMWOcvKmsWVDT2pdJgTaxiZ/9vjV9AeVOr0+XQG8C
 Ow8kykMOlQVevPj1sL3sMa1l7GwpVvzPfRuzvK4Tf7G8fDi+MLu0Dr52f3IY5AAIxxkq
 N5mcF82INCZbpR8SJc+fyhQ3LfuEazm0UwbpAy1uSXSVeilKX6BlF3Y5npgb7dx28omK
 P67n/q8/ceoE8h8DuiZ9PLjxkJqfek0tbbnB16pZmtOEOImXY+tWn8HJsOP4CYNpSvxO
 0nJ5v4TROFyZhBPs2RpPUVkxyl8f9r5hjormUMFN3UscTxlSH4q/kobN4xhojTxIa/9h
 pLcQ==
X-Gm-Message-State: AO0yUKWxO7L/DOIEQT7RMWeKH04XGP4V5RK2ciXxe7R1Yqw802mFT9Q7
 xC93HmgPg1RODTSqd//TCB1mHJTMSnifi4vLbgkkzGISEEykEzsj
X-Google-Smtp-Source: AK7set9ZulIlBEuqIpnFprtFlgsLdgkObEPro/Xtpaij76+FUh07FOCxblTa2FX0SCI/aYZUvuI2WgADl0E1UR91Jow=
X-Received: by 2002:a17:903:1c9:b0:19a:721b:bce1 with SMTP id
 e9-20020a17090301c900b0019a721bbce1mr1431814plh.23.1676567764788; Thu, 16 Feb
 2023 09:16:04 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2302141541100.2025117@ubuntu-linux-20-04-desktop>
 <CAFEAcA96Mb5KAdPQrncqh9SM2iRc7aE2f4deoiF_2vChdMF0rw@mail.gmail.com>
 <87bkluelt7.fsf@suse.de>
 <alpine.DEB.2.22.394.2302151316570.2127160@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2302151316570.2127160@ubuntu-linux-20-04-desktop>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 17:15:53 +0000
Message-ID: <CAFEAcA8D4O9aGKX4fv_RVhc+-OMWsfyvaCQk50gvtqWGaDf0Ow@mail.gmail.com>
Subject: Re: [PULL v2 0/10] xenpvh
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 vikram.garhwal@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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

On Wed, 15 Feb 2023 at 21:17, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>
> On Wed, 15 Feb 2023, Fabiano Rosas wrote:
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > On Tue, 14 Feb 2023 at 23:43, Stefano Stabellini <sstabellini@kernel.=
org> wrote:
> > >>
> > >> The following changes since commit 6a50f64ca01d0a7b97f14f069762bfd88=
160f31e:
> > >>
> > >>   Merge tag 'pull-request-2023-02-14' of https://gitlab.com/thuth/qe=
mu into staging (2023-02-14 14:46:10 +0000)
> > >>
> > >> are available in the Git repository at:
> > >>
> > >>   https://gitlab.com/sstabellini/qemu xenpvh2
> > >>
> > >> for you to fetch changes up to 86b01d58ca2840bea6e4e7260aad450a660fb=
d46:
> > >>
> > >>   meson.build: enable xenpv machine build for ARM (2023-02-14 15:39:=
25 -0800)
> > >>
> > >> ----------------------------------------------------------------
> > >
> > > Fails to compile for some configs, eg:
> > >
> > > https://gitlab.com/qemu-project/qemu/-/jobs/3775820949
> > > https://gitlab.com/qemu-project/qemu/-/jobs/3775820984
> > >
> > > In file included from ../target/arm/machine.c:6:
> > > ../target/arm/internals.h:1141:21: error: field =E2=80=98f=E2=80=99 h=
as incomplete type
> > > 1141 | CPUTLBEntryFull f;
> > >
> >
> > For this to work we'll probably need to cherry-pick some parts of my
> > disable-tcg series:
> >
> > https://lore.kernel.org/r/20230213202927.28992-1-farosas@suse.de
> >
> > For this error specifically, patch 16.
>
> Thanks for the quick reply!
>
> Peter, how would you like to proceed? Vikram (the original contributor)
> will be AFK for a few weeks but I might be able to have a look this in
> the meantime. But if this is a known issue with already a fix available,
> then what should be the action for me?

You need to submit a pullreq which applies to current head-of-git.
If it depends on other patches, then if those are reviewed then
you can include them. In this case patch 16 of Fabiano's series
looks OK to include, assuming that's the only thing you need.

(But other stuff in that patchseries may be rather trickier to
extract from it.)

Make sure you test the xen-only build config in case there's
something else.

thanks
-- PMM

