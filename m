Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7293B719B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 13:52:49 +0200 (CEST)
Received: from localhost ([::1]:45780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyCIJ-0003oA-LI
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 07:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyCH8-0002vU-Kn
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 07:51:34 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyCH6-0006N2-Pq
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 07:51:34 -0400
Received: by mail-ed1-x529.google.com with SMTP id t3so30889284edc.7
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 04:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v3IXpGUjc8qI5vhQ4wc3cozPxAi1jf0ua+NuDgJhUQQ=;
 b=mPusSC6Zc9bGX6mGQ2MkMhwo7Zjrsq2TVmCk6wHRfymwAKrE0zQJELCdItuQ4r+C1V
 e2EuBOBvnayPBGjZJ+tlQ8bLBxFPgBja2OXBW8aCzHhx6RG9CDfRsFAF9OnuNcHX/fey
 OnMdFf4PsBFr5wML8eH1Hq4N3ujS7JESkfm0/7Qq0ic3FwC84eeaWNImvWKDGTdzKo0Y
 Z7BMg21Aj2EtO4wk7beeqZ2rr2vWP6gERvOVqKH2zo36cFuJVhsded2UJfbZHjszXlfp
 ubOj2nDkjFUo0+yAJPht9plZBgvlKhFxEQvLRW9lfP30s3Db7REgJE1yyk1n0GA+qb4p
 r95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v3IXpGUjc8qI5vhQ4wc3cozPxAi1jf0ua+NuDgJhUQQ=;
 b=VZf3ba7d76SVSVTSMgbd2X6aZRBsUs2qkvHpP+uuSKkg+k/PSjX2D/ytYomESgEHMZ
 oA9xxqlMx94rZRSDt7bigUFImRMiI9S4LwQQ2DnbO8ZX7MNnC9gGFjVaqbEAkZ/RWFQw
 bIbS6eV0O+raw/MtE38ysfMTTrk15M9bCArWzDfTVV+61tAF/ozhWFAyiyE+XaSwBOih
 2hrtpfd/sxfWOejriIXXtAhY0WgXgMYaoGQNHp2wfTV60XuwRhys4FqhUP4aalqmDMTu
 upWPosEPNYC+yZeME2lXacujRZvJIyBAU+bXSSGapX7ZPaK8cWYzEK4svAr1rdA0ZjUK
 2dUw==
X-Gm-Message-State: AOAM531FqU4ZZ7Wmg4QVSl+AMvjOZdM1P7iU1JZ5u8tATfW/np4c/XSK
 weuzt1xvC3hIGlTeWPI+I75U/30UVKfIcOpkqjDiJg==
X-Google-Smtp-Source: ABdhPJwGeRMKgK8U7ZuytNidA3/KyINi9cWh02MBpXGtC116DNXS0M56spwkbCWMSQ/vsW8q4O1tg09VHS3Vsmjk4KY=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr39517424edz.44.1624967490910; 
 Tue, 29 Jun 2021 04:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210629082713.31396-1-hnick@vmware.com>
 <CAFEAcA-vSoriA2iCwyvBWofj1UvtMuRbEnqNuCsoG_hz1Yth_g@mail.gmail.com>
 <35FFA736-504A-482B-B78C-17F7381C7D70@vmware.com>
In-Reply-To: <35FFA736-504A-482B-B78C-17F7381C7D70@vmware.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 12:50:53 +0100
Message-ID: <CAFEAcA-AvYq5ujspY1bxqjzX=1EYP4zY0ortFdNhJwPU+pDJGA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
To: Nick Hudson <hnick@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Jun 2021 at 11:41, Nick Hudson <hnick@vmware.com> wrote:
>
>
>
> > On 29 Jun 2021, at 10:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 29 Jun 2021 at 09:27, <hnick@vmware.com> wrote:
> >>
> >> Signed-off-by: Nick Hudson <hnick@vmware.com>
> >> ---
> >> target/arm/helper.c | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >> index a66c1f0b9e..7267af7924 100644
> >> --- a/target/arm/helper.c
> >> +++ b/target/arm/helper.c
> >> @@ -6330,7 +6330,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
> >>      * We don't implement the configurable EL0 access.
> >>      */
> >>     { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
> >> -      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> >> +      .cp = 14, .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
> >>       .type = ARM_CP_ALIAS,
> >>       .access = PL1_R, .accessfn = access_tda,
> >>       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
> >
> > This fixes the encoding for AArch64, but breaks it for AArch32,
> > where it is cp=14 opc1=0 crn=0 crm=1 opc2=0. Because this is one of
> > those system registers where the AArch64 and AArch32 encodings
> > don't match up, to fix the AArch64 encoding we need to replace
> > this ARM_CP_STATE_BOTH reginfo with separate reginfo for
> > ARM_CP_STATE_AA32 and ARM_CP_STATE_AA64, something like this:
> >
> >    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
> >      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
> >      .type = ARM_CP_ALIAS,
> >      .access = PL1_R, .accessfn = access_tda,
> >      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
> >    { .name = "DBGDSCRint", .state = ARM_CP_STATE_AA32,
> >      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> >      .type = ARM_CP_ALIAS,
> >      .access = PL1_R, .accessfn = access_tda,
> >      .fieldoffset = offsetoflow32(CPUARMState, cp15.mdscr_el1), },
> >
>
> Ah, yes.
>
> As MDCCSR_EL0[30:29] only maps to DBGDSCRint[30:29] maybe it should be all RAZ?

Well, you can't make it all RAZ, because those 2 bits do still
need to be mapped, but I guess in theory yes we should define
read and write accessor functions for AArch64 MDCCSR_EL0 that
mask out everything except [30:29].

thanks
-- PMM

