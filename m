Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4F8587E37
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:37:16 +0200 (CEST)
Received: from localhost ([::1]:60716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIt1H-0007v8-1I
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIsxw-0003uW-Rd
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:33:48 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:34582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIsxv-0006WG-1K
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:33:48 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31f443e276fso142778827b3.1
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 07:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=4QQMUXVWW4Z/zmgcsWR2hm2Pl4tg9T7AWSYMRnCsUVY=;
 b=ChxgUajbaF1Z7dFTOstqVpk7JRjIsX3VAiEzRE/Abc/yo6jaAC2Y4csh1jULMYy3X/
 l+FNPJMCeXkgnDE/FLB+gjLbnOAaCtCqd2ix3K4/MtKRCVRBDBnMIb4QUextBzoARza7
 YIfZLuRTl8dOqFc8y+qB022qD+Mgr+m7EzgLXjYvr1eq3j0/3Bm+WymK6l7rxMjj3kBv
 6mE+fqiFnY45fBJm+cV4Illdu4LANaQMlrULNkjoATSwJhHFZvndVqHM+fN0cpriD/h+
 PwgjSP6Wj28LzdLH0Z2M7PqcCytnj2r/N+GOVuHZHmpjWl8ftVU9qgflE1x03Nor7Rmu
 yv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=4QQMUXVWW4Z/zmgcsWR2hm2Pl4tg9T7AWSYMRnCsUVY=;
 b=K9NN2xUe4c9FhaeFkeI5KP60k39DFZhpKhACQ7BfhLRVutY9/0U0b874TNH1ZWqxbs
 9lWEfjFViMZSj+kx2IRDqgUbapDHhpBkjvOru4xqblmP74xFutupx0evNP/4mkfW70oj
 qu7ZAs7abBFK4/9zAGvis4oP5MNlKT6ipBnmvr4r+M2BLjunv+BggtMz9TtlhUx3yu6/
 9IgCRgNh1zAH+yot9Lv7Ylq/+Gzd7pfKFHaefkBIqg9dbH/YAPznN2Cgi9GYFDWADRA0
 Oh8YwiX+YLANLGq99i7Fzgl8bc4y9rJ6YW2tYoEsuOVdm1T66wZMUU505g0uuYFM8Bi/
 tekg==
X-Gm-Message-State: ACgBeo1EhMwH731SxU+yj1osIraKROSKnsGtx1H4B7r1uvMKzPpcIiv7
 ePCNkhlsUBEodA6dSmGIJQsupUkk0/hP8QJaVUScKA==
X-Google-Smtp-Source: AA6agR5c4syrF+FTiBov/HavQtc314Ka1WvP047JDy4Fvz1iWx4A0+1SQTl68abyvQ5uzt2jI+Mq1f82AEJioBIqWwQ=
X-Received: by 2002:a0d:d2c3:0:b0:31e:62ea:3303 with SMTP id
 u186-20020a0dd2c3000000b0031e62ea3303mr18822130ywd.64.1659450825906; Tue, 02
 Aug 2022 07:33:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220802131925.3380923-1-peter.maydell@linaro.org>
 <BN7PR12MB280161C3A847924FA5C3AF1BE69D9@BN7PR12MB2801.namprd12.prod.outlook.com>
In-Reply-To: <BN7PR12MB280161C3A847924FA5C3AF1BE69D9@BN7PR12MB2801.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Aug 2022 15:33:34 +0100
Message-ID: <CAFEAcA-fMUrwnpu90Qf1LWGsQ36M-PmX2uC1+kenT__otLxjTg@mail.gmail.com>
Subject: Re: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit
 accesses
To: "Konrad, Frederic" <Frederic.Konrad@amd.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>, "f4bug@amsat.org" <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 2 Aug 2022 at 15:20, Konrad, Frederic <Frederic.Konrad@amd.com> wrote:
>
> Hi Peter,
>
> CC'ing Philippe.
>
> > -----Original Message-----
> > From: Qemu-devel <qemu-devel-
> > bounces+fkonrad=amd.com@nongnu.org> On Behalf Of Peter Maydell
> > Sent: 02 August 2022 14:19
> > To: qemu-devel@nongnu.org
> > Cc: Fabien Chouteau <chouteau@adacore.com>; Frederic Konrad
> > <konrad.frederic@yahoo.fr>
> > Subject: [PATCH for-7.1] hw/misc/grlib_ahb_apb_pnp: Support 8 and 16 bit
> > accesses
> >
> > In real hardware, the APB and AHB PNP data tables can be accessed
> > with byte and halfword reads as well as word reads.  Our
> > implementation currently only handles word reads.  Add support for
> > the 8 and 16 bit accesses.  Note that we only need to handle aligned
> > accesses -- unaligned accesses should continue to trap, as happens on
> > hardware.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1132
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > It would be nice if we could just set the .valid.min_access_size in
> > the MemoryRegionOps to 1 and have the memory system core synthesize
> > the 1 and 2 byte accesses from a 4 byte read, but currently that
> > doesn't work (see various past mailing list threads).
>
> That looks good to me but I thought this was fixed by 1a5a5570 and 0fbe394a
> because RTEMS do bytes accesses?
>
> Did that break at some point?

I definitely tried letting the .impl vs .valid settings handle this,
but the access_with_adjusted_size() code doesn't do the right thing.
(In particular, the test case ELF in the bug report works with
this patch, and doesn't work without it...)

I'm pretty sure the problem with access_with_adjusted_size() is a
long-standing bug -- I found a couple of mailing list threads about
it. We really ought to fix that properly, but that's definitely not
for-7.1 material.

-- PMM

