Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A345633EF5C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:18:14 +0100 (CET)
Received: from localhost ([::1]:49344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUBp-0002Fj-3W
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMU8u-0000xU-HT
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:15:12 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMU8r-0004pt-F6
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:15:12 -0400
Received: by mail-ej1-x635.google.com with SMTP id lr13so1920789ejb.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 04:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XYkKxJMW4WWe23j8SNzD7OQLN6SuJ+NGsB2bBhcOX70=;
 b=eMSt4u4A0IiNx678itTz90IDGWu5GYyqq3GyYEqqQftABKz0HmSnG5Sd6inalnknhI
 RpVUY3q5S+nG2lnMR8LVl73P1o69hdQfNMP+5U5BWHObHpyzvACI0XQiAFvoQkikuq0I
 CtOwoPT1KJiAaEvhAZNFFaJqCl1EZaDhaRKcgzfE/QUJ4drrRrf4rMEZ4M9e1cEHd65l
 wAEuyaIT1IcJ9R1cZ2q8EVRZ+5/3A2vUBT871fE7nfwmILtRJ2fhUNJ73IhSaeK8mIg9
 j3mq9UGrqAXhVQZGcTneIjyOev3+74l0epgMlB3lXqaKHNRUKLSAeGhxidApxrAg5CRo
 f7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XYkKxJMW4WWe23j8SNzD7OQLN6SuJ+NGsB2bBhcOX70=;
 b=EHfkYCJFjAdWIvcL5EMsq2YL9K5+lmervXs/AC6B+FR5JydS0PsYZ0mJYXmhJaAJc1
 r5S+PwlnHJgmxk2R8Jl5fn3VZVSvRRkyMo5EbaKrq14wBof0dYx/qlWvXyMuANkWNGG4
 NYUB3DRs7JbNCjfrKJ97FyBMHMaPGxsNQQECVbW+8COvXPbMMKIWLgO/2DAvShlR3AnT
 BpbB3Z2vkJ1hrto5FJd30kmgNmZedkCHh/Pxmg4oK+tx45p55eCtaYdn4ehPhkgeMD5Y
 GXwCN75XEVLTX94ALAFTn+YWZQU1ISfNuGFw0AFR2SgD5JVIXC623Srf7p9difW1LLr/
 kkvQ==
X-Gm-Message-State: AOAM532W8oEi6q2DPP/TRjiV8KKCQwFDXwHzzd6q3J4u5mqkQT8O2wTJ
 5O7jdhrOclKOLAppW6fHLiFgx9AlYBR65nR+lA0HMg==
X-Google-Smtp-Source: ABdhPJzKwll7I6PJYWS2ATGIl6Ya2Q2kljyppNiTpv9Je55eDy25AQy4llvT4tRAWVsvUzV3FJtJBrI5P0mlU2wgahM=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr34927879ejg.482.1615979707707; 
 Wed, 17 Mar 2021 04:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210317044441.112313-1-gshan@redhat.com>
 <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
 <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
 <CAFEAcA_yuSR=KkpBTh+21JkqiB7gKfnFvgvxYgPN2yLfvxpi_A@mail.gmail.com>
 <3e7ba090-c45e-8fa4-1a59-16856241cbdc@redhat.com>
In-Reply-To: <3e7ba090-c45e-8fa4-1a59-16856241cbdc@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 11:14:56 +0000
Message-ID: <CAFEAcA_zYaOXw5yaXWEjgBy6YeTpB5FRBCO96To-bv9xpQzbMQ@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 10:59, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Peter,
>
> On 3/17/21 9:40 PM, Peter Maydell wrote:
> > On Wed, 17 Mar 2021 at 10:37, Gavin Shan <gshan@redhat.com> wrote:
> >> On 3/17/21 8:09 PM, Peter Maydell wrote:
> >>> On Wed, 17 Mar 2021 at 04:44, Gavin Shan <gshan@redhat.com> wrote:
> >>>>
> >>>>    static const VMStateDescription vmstate_pl011 = {
> >>>>        .name = "pl011",
> >>>>        .version_id = 2,
> >>>>        .minimum_version_id = 2,
> >>>> +    .post_load = pl011_post_load,
> >>>>        .fields = (VMStateField[]) {
> >>>>            VMSTATE_UINT32(readbuff, PL011State),
> >>>>            VMSTATE_UINT32(flags, PL011State),
> >>>> @@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
> >>>>            VMSTATE_INT32(read_trigger, PL011State),
> >>>>            VMSTATE_END_OF_LIST()
> >>>>        },
> >>>> -    .subsections = (const VMStateDescription * []) {
> >>>> -        &vmstate_pl011_clock,
> >>>> -        NULL
> >>>> -    }
> >>>>    };
> >>>
> >>> Doesn't dropping the subsection break migration compat ?
> >>>
> >>
> >> It's why this patch needs to be backported to stable branches.
> >> In that way, we won't have migration compatible issue.
> >
> > No, migration has to work from the existing already
> > shipped 5.1, 5.2, etc releases to 6.0 (assuming you use
> > the correct "virt-5.2" &c versioned machine type.)
> >
>
> Commit aac63e0e6ea3 ("hw/char/pl011: add a clock input") is merged
> to v5.2.0. The migration failure happens during migration from v6.0
> to v5.1 with machine type as "virt-5.1", instead of migrating from
> v5.1 to v6.0. One question is if we need support backwards migration?

Upstream doesn't care about backwards migration. AIUI
RedHat as a downstream care about the backwards-migration
case in some specific situations, but I don't know if that
would include this one.

I misread the commit message of this patch and hadn't
realised that it was talking about a 5.2 -> 5.1 migration.
From upstream's point of view, commit aac63e0e6ea3 is fine
because it preserves forwards migration (5.1 -> 5.2).
If there's a change that makes RH-as-a-downstream's life
easier without breaking upstream's forward-compat requirements,
we can look at it: but unless I'm misreading this patch,
it would break 5.2 -> 6.0 migration, because 5.2 sends the
subsection and 6.0 with this patch would say "I don't know
how to deal with this subsection I've been sent".

> If we do support backwards migration, I think there are two options:
> (1) merge this patch and backport it to v5.2+; (2) Backport commit
> aac63e0e6ea3 to v5.2-. I guess (1) would be right way to go because
> it's less effort than (2). Besides, the clock needn't to be migrated
> if I'm correct.

You can't fix a backwards migration issue (if you care about it)
by backporting any patch to anywhere -- you need to deal with what
has already shipped.

thanks
-- PMM

