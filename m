Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2612C589406
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 23:26:18 +0200 (CEST)
Received: from localhost ([::1]:40572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJLse-0001Gq-VL
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 17:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oJLqo-0008G5-4c
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 17:24:22 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:43618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oJLqm-0006L9-Cc
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 17:24:21 -0400
Received: by mail-ua1-f45.google.com with SMTP id s18so4923186uac.10
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 14:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=abAlXqg+HA480Gg3Yl47Y5v3J2s+81P8VNbfTzj+nE4=;
 b=EX8odqRWCdnTElHwRQHP6FfjuFy/XT9UOyBze4K2lZ93lZY0rdWIXVP5G3h4dbcbui
 AwPK44oOlD1+0UDZvyg3sWIrEjxZ/vxJwQMSQYPlfrQsB0/RnYHe5SG4euGQSoFf+8d2
 Rpe2/JICUFdhNE6eR36FgJdqJdvUi0zPk8g2Az846mBjFcLgsuUxRxqXLMcpT7Clbe5y
 YElCMexKrZfZrGj11/IQTrBhLKYXYSUXbW2V9WNRWkljBFkF6/83N4tAkzDPe3jIR+HK
 4pOjvtFyFPRsaITE/TClYMuD8tabQJjQnSm3dIVjMtAL73gXFgiwwxeXMwTSNuKm0wRu
 pxrA==
X-Gm-Message-State: ACgBeo2Y0X74eQA6lLUW7Ehg3QEGFeLe+9Lx4tZ7r/efu6dhP4L9TzxJ
 k0g9DdsZwTkmZaVU5Ss2kgZvlO0Jq8NGdAGBPt8=
X-Google-Smtp-Source: AA6agR6MdfxZiAaLXewcima3y5oGNxb8QPXgpwJYsGqx0J8mGR/1x3+nWbO6S6FrMx9ekf/AcMbb56QA1x73GuZjAds=
X-Received: by 2002:ab0:7c50:0:b0:384:e315:a358 with SMTP id
 d16-20020ab07c50000000b00384e315a358mr10878886uaw.118.1659561859009; Wed, 03
 Aug 2022 14:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220802131925.3380923-1-peter.maydell@linaro.org>
 <BN7PR12MB280161C3A847924FA5C3AF1BE69D9@BN7PR12MB2801.namprd12.prod.outlook.com>
 <CAFEAcA-fMUrwnpu90Qf1LWGsQ36M-PmX2uC1+kenT__otLxjTg@mail.gmail.com>
In-Reply-To: <CAFEAcA-fMUrwnpu90Qf1LWGsQ36M-PmX2uC1+kenT__otLxjTg@mail.gmail.com>
Date: Wed, 3 Aug 2022 23:24:07 +0200
Message-ID: <CAAdtpL5Gr1Kn+9pKRgSMi5kkV+OUg-7=HfS9Re04iNPkN3nnJA@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit
 accesses
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Konrad, Frederic" <Frederic.Konrad@amd.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, Andrew Jeffery <andrew@aj.id.au>, 
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.222.45;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ua1-f45.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Tue, Aug 2, 2022 at 4:33 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> On Tue, 2 Aug 2022 at 15:20, Konrad, Frederic <Frederic.Konrad@amd.com> w=
rote:
> >
> > Hi Peter,
> >
> > CC'ing Philippe.
> >
> > > -----Original Message-----
> > > From: Qemu-devel <qemu-devel-
> > > bounces+fkonrad=3Damd.com@nongnu.org> On Behalf Of Peter Maydell
> > > Sent: 02 August 2022 14:19
> > > To: qemu-devel@nongnu.org
> > > Cc: Fabien Chouteau <chouteau@adacore.com>; Frederic Konrad
> > > <konrad.frederic@yahoo.fr>
> > > Subject: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 =
bit
> > > accesses
> > >
> > > In real hardware, the APB and AHB PNP data tables can be accessed
> > > with byte and halfword reads as well as word reads.  Our
> > > implementation currently only handles word reads.  Add support for
> > > the 8 and 16 bit accesses.  Note that we only need to handle aligned
> > > accesses -- unaligned accesses should continue to trap, as happens on
> > > hardware.
> > >
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1132
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > > It would be nice if we could just set the .valid.min_access_size in
> > > the MemoryRegionOps to 1 and have the memory system core synthesize
> > > the 1 and 2 byte accesses from a 4 byte read, but currently that
> > > doesn't work (see various past mailing list threads).

Hmm sorry I missed the past threads, the one I remember is about
unaligned accesses
(https://lore.kernel.org/qemu-devel/20170630030058.28943-1-andrew@aj.id.au/=
).

> > That looks good to me but I thought this was fixed by 1a5a5570 and 0fbe=
394a
> > because RTEMS do bytes accesses?
> >
> > Did that break at some point?
>
> I definitely tried letting the .impl vs .valid settings handle this,
> but the access_with_adjusted_size() code doesn't do the right thing.
> (In particular, the test case ELF in the bug report works with
> this patch, and doesn't work without it...)
>
> I'm pretty sure the problem with access_with_adjusted_size() is a
> long-standing bug -- I found a couple of mailing list threads about
> it. We really ought to fix that properly, but that's definitely not
> for-7.1 material.

I agree this is sufficient for 7.1, so:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

But I'd rather keep simple implementations (.impl) and use .valid fields,
adjusting with access_with_adjusted_size().

(At least we now have an ELF reproducer.)

One problem I remember is when PCI is involved.
Here I could only get MMIO working, but not PCI:
https://lore.kernel.org/qemu-devel/20200817161853.593247-1-f4bug@amsat.org/

Commit 98f52cdbb5 ("memory: Fix access_with_adjusted_size(small size)
on big-endian memory regions") might be incomplete...

Regards,

Phil.

