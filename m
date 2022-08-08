Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3B58CFE5
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 23:48:07 +0200 (CEST)
Received: from localhost ([::1]:40658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLAbW-0001pE-Gc
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 17:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLAZx-0008Vu-1Z
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:46:29 -0400
Received: from mail-vk1-f172.google.com ([209.85.221.172]:40517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oLAZv-0003Fm-9g
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:46:28 -0400
Received: by mail-vk1-f172.google.com with SMTP id c22so5021388vko.7
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 14:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=O0thZH1i2p6+9Qjpac3zAaQEbO0EjkAVP6BieH11HCI=;
 b=tVuPJPY21eOnpC9aYeGfE7K4D3YUUV30zCX1qjya1QiEwQRWRuakw4T3PmP2br1kiY
 hbfuIAVD/eZrpNd8RiwyMbZvv+t3DXN+xQftrN5ZfbdfzFpdG+7cl/ICmd7oCQhZlQ6J
 w1YedT4mKg4zKpUcCw8CoVmBSmwVLnulho7GMsioGDrhiP19K0PF5gHls3DLX1LB10Ux
 UtiIN+qyDEIqiF0y7FxG/bQLQtB+ttZ0Ed4639/MrHUtu4AH5KgvIQBS9LuzhGiycjIG
 lbYv4WYGN76DXwhQ0KJgbXxTUDcJ2OZwqWE/e5cWBfK+O7hCjul27jdj6wQtAMp93VZH
 TogA==
X-Gm-Message-State: ACgBeo1xPafzgEvnkAVEZJPE0kRM7m0fOQ3D+Nzf636+Mfhq/OZAffN1
 2YJOiYmluXCR2+t9B0ZcqjZC4qRMmCkyCgBulvE=
X-Google-Smtp-Source: AA6agR7pzMtBtrDn7VnGFcvtDChmX6kyJWSLRPOvBfrU74pZqLd9zheQJ0Pg9a4FuFFWn2Fgrkdh0dM/whwV8LKb2Pc=
X-Received: by 2002:ac5:c54a:0:b0:377:dd43:6e39 with SMTP id
 d10-20020ac5c54a000000b00377dd436e39mr8605669vkl.12.1659995186037; Mon, 08
 Aug 2022 14:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220802131925.3380923-1-peter.maydell@linaro.org>
 <BN7PR12MB280161C3A847924FA5C3AF1BE69D9@BN7PR12MB2801.namprd12.prod.outlook.com>
 <CAFEAcA-fMUrwnpu90Qf1LWGsQ36M-PmX2uC1+kenT__otLxjTg@mail.gmail.com>
 <BN7PR12MB28019A8C06458A552225525AE6639@BN7PR12MB2801.namprd12.prod.outlook.com>
In-Reply-To: <BN7PR12MB28019A8C06458A552225525AE6639@BN7PR12MB2801.namprd12.prod.outlook.com>
Date: Mon, 8 Aug 2022 23:46:14 +0200
Message-ID: <CAAdtpL47DmgaDZ_b7Hc+vT03PsFmobrqE3mfR46CvTvX=5sxcw@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit
 accesses
To: "Konrad, Frederic" <Frederic.Konrad@amd.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.221.172;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vk1-f172.google.com
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

On Mon, Aug 8, 2022 at 11:15 AM Konrad, Frederic
<Frederic.Konrad@amd.com> wrote:
> > -----Original Message-----
> > From: Peter Maydell <peter.maydell@linaro.org>
> > Sent: 02 August 2022 15:34
> > To: Konrad, Frederic <Frederic.Konrad@amd.com>
> > Cc: qemu-devel@nongnu.org; Fabien Chouteau <chouteau@adacore.com>;
> > Frederic Konrad <konrad.frederic@yahoo.fr>; f4bug@amsat.org
> > Subject: Re: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16
> > bit accesses
> >
> > On Tue, 2 Aug 2022 at 15:20, Konrad, Frederic <Frederic.Konrad@amd.com>
> > wrote:
> > >
> > > Hi Peter,
> > >
> > > CC'ing Philippe.
> > >
> > > > -----Original Message-----
> > > > From: Qemu-devel <qemu-devel-
> > > > bounces+fkonrad=amd.com@nongnu.org> On Behalf Of Peter Maydell
> > > > Sent: 02 August 2022 14:19
> > > > To: qemu-devel@nongnu.org
> > > > Cc: Fabien Chouteau <chouteau@adacore.com>; Frederic Konrad
> > > > <konrad.frederic@yahoo.fr>
> > > > Subject: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16
> > bit
> > > > accesses
> > > >
> > > > In real hardware, the APB and AHB PNP data tables can be accessed
> > > > with byte and halfword reads as well as word reads.  Our
> > > > implementation currently only handles word reads.  Add support for
> > > > the 8 and 16 bit accesses.  Note that we only need to handle aligned
> > > > accesses -- unaligned accesses should continue to trap, as happens on
> > > > hardware.
> > > >
> > > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1132
> > > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > > ---
> > > > It would be nice if we could just set the .valid.min_access_size in
> > > > the MemoryRegionOps to 1 and have the memory system core
> > synthesize
> > > > the 1 and 2 byte accesses from a 4 byte read, but currently that
> > > > doesn't work (see various past mailing list threads).
> > >
> > > That looks good to me but I thought this was fixed by 1a5a5570 and
> > 0fbe394a
> > > because RTEMS do bytes accesses?
> > >
> > > Did that break at some point?
> >
> > I definitely tried letting the .impl vs .valid settings handle this,
> > but the access_with_adjusted_size() code doesn't do the right thing.
> > (In particular, the test case ELF in the bug report works with
> > this patch, and doesn't work without it...)
> >
> > I'm pretty sure the problem with access_with_adjusted_size() is a
> > long-standing bug -- I found a couple of mailing list threads about
> > it. We really ought to fix that properly, but that's definitely not
> > for-7.1 material.
>
> Ok got it, thanks.
>
> Reviewed-by: Frederic Konrad <fkonrad@amd.com>

Thanks Frederic.

Mark, Peter, since I'm preparing a pull request for MIPS, I'll queue
this single SPARC patch.

Per https://gitlab.com/qemu-project/qemu/-/issues/1132#note_1048558340
I'll also add:
Tested-by: Tomasz Martyniak <gitlab.com/tom4r>

Regards,

Phil.

