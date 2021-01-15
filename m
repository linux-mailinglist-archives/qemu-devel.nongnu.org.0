Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3422F87D9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 22:47:13 +0100 (CET)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Ww4-0004vY-JD
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 16:47:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0Wsq-0002BM-VH
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:43:57 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:44438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0Wso-0000rT-SL
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 16:43:52 -0500
Received: by mail-io1-xd2b.google.com with SMTP id z5so20932288iob.11
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 13:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rnJbU/X18EUOxrFwUuNfimJvn+1JV63cGGCVmGBGCZw=;
 b=kTp6bqm3SglaPWKCweMjH0O+kerU7xsv1xXRr4TqDWW/10QvV1PPIdm+O3pn+C5H8X
 fCwcKyptrpg8f9kwJk79LtMMT//w7qXC14Gs5lVEPs8N/UgMCeVmAI8RdeE+fS8e7AfE
 nromq5EDACgctjBGa0ksYPBDTjt+jhAAN7MhEoGhhK0L60UQXZC9DpaiZeumdQRgeTt+
 Eioql1Bs3G6yUvnWukV9jN3v4wWq5i9DlqzfDoJJCQd9zCJS0fwvTVtKQHodOU+3OPeF
 uNy6BvuEOx5A2GSzS6R8OeB+ZQMqCRwk13iKRdw/TO+bcILA32Nntt9EhESTyKSlNfmO
 Hcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rnJbU/X18EUOxrFwUuNfimJvn+1JV63cGGCVmGBGCZw=;
 b=k+SSmrdObqNTg++stybu6OgN80vF0w0LkHlycDvQOs1Cxyqy498sQf7dfU/X46HIpM
 2nGERW2ktA3RVuhIv+lsUz2DMcbPL6B9mbjl1uf9cyYH3A0D/5mvJ52IJiADA+GEweU/
 6Q/u0ohCTiDKJTC9p1YVBbFQRl124HIiXdr7DuKl6SEHZ8TNZJ14jqOEHzZ23dunnm1y
 a+GG/Nh0UzrNTSxDeAjjowGjJzfN5cYWYW+aDb6HNUkChVZMHFthOqL0WuIiEMUU4rMB
 SYxjK6p4dEDNXPwRayWzy0G/J9kN13mwGgYd9mm7kHniTEBhfkDnjnrsrzjh7K+fjMvy
 lBqg==
X-Gm-Message-State: AOAM533QYkd9uKSw/9xFDGogvZ/A5Se45amVSvAkw/d+murGY7A9m8oN
 cHx1uLrr8OJwhsszYrZ1h/TsPVO4ee5utbFzLNc=
X-Google-Smtp-Source: ABdhPJwEURg+bfdpCGlPS2SvYAaPiCUxtvYe1Y39MeQxiSlCADkYWdluDrD4oKBgkmmwau6hLUtUPs2gxXECr1OfT9s=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr12776695ild.267.1610747029871; 
 Fri, 15 Jan 2021 13:43:49 -0800 (PST)
MIME-Version: 1.0
References: <20201104092900.21214-1-green.wan@sifive.com>
 <CAFEAcA_EykbnmTQuz4RT3qGMt-Atf=EAdaHd-QqBvJCPvwemqA@mail.gmail.com>
 <CAEUhbmULDEgfs0zkt6k1DWo+AD4T701xDp5TCyjQHFypmr037g@mail.gmail.com>
 <CAFEAcA9QrTA6bEiK608HfB9vfN66SGBPJw6pEDDk2YH3v4M8SQ@mail.gmail.com>
 <CAEUhbmX4GtWfU1Z+cbSb435MCgBo+OaLbSg0qP_mRgPxSJRLnQ@mail.gmail.com>
In-Reply-To: <CAEUhbmX4GtWfU1Z+cbSb435MCgBo+OaLbSg0qP_mRgPxSJRLnQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 13:43:23 -0800
Message-ID: <CAKmqyKP=URfpTZXsax=Xmvn9-cz0GY7C6eih+bdycZhRASH2Fw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/sifive_u_otp: handling the fails of blk_pread and
 blk_pwrite
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Green Wan <green.wan@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 6:09 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jan 15, 2021 at 9:55 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 15 Jan 2021 at 13:33, Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Fri, Jan 15, 2021 at 7:50 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > >
> > > > Ping! This patch was trying to fix a Coverity issue (CID 1435959,
> > > > 1435960, 1435961) -- is anybody planning to review it?
> > > >
> > > > (I'm not entirely sure 'guest error' is the right warning category,
> > > > but I don't know the specifics of this device.)
> > > >
> > >
> > > I think we should just use 'printf' instead of log a "guest error"
> > > because the guest does nothing wrong.
> >
> > printf is definitely the wrong thing... you need to either report
> > the error back to the guest if the interface the guest is using
> > has a facility for reporting read/write failures, or log or report
> > it to the user using one of our APIs for that.
>
> It seems the hardware does not have a mechanism to report to the
> software when hardware cannot fulfill the task requested by software.
>
> I checked all existence of block_pwrite() callers. It looks like this
> is not handled consistently. Some indeed call printf(), some call
> error_setg_errno(), some call fprintf(stderr), some call qemu_log()
> ...

Logging a guest error seems like the best bet, I'm not really sure
what else we would do.

Alistair

>
> Regards,
> Bin

