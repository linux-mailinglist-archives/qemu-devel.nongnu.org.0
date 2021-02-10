Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C1D3163C5
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:27:06 +0100 (CET)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9miA-0004sM-3t
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mg7-0003TZ-4B; Wed, 10 Feb 2021 05:24:59 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:37755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mg5-0000LD-NN; Wed, 10 Feb 2021 05:24:58 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id p193so1490425yba.4;
 Wed, 10 Feb 2021 02:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mdVja9I3JFGnwzbp3ZtpVSwmgy7Ptxs+ZUyBCTdxRYI=;
 b=pl6g9EwBbF1XxfskSC8AQDpkBhMs3E23lnTVQ/VDqTCkS/B8/layT051hNcs4cLdTT
 cvvz76aVCU97k21OlnD6pa/+2EzP2TtnwORAYAmIo8YVG6gz+xX3w/pVRggoiZp3ITqh
 b95c53fdOSVZnsCWHLMD1dJ73yEoA2HuQJ9Cxgw9jP5sP8LTXhSGz5pjyAO5FEz+ZdxA
 Jk4SiD3JoYhGEsLxsBy4ogC7n/gsom2u9GaGKq1o0nLcV/gDLb5kdge62pTuH07V/QWA
 qbSbBao500OrIjJ+FgYt+6LU1j7RzBzOqwm5ecgC/wowvMH79WpY/DvP5PYYowN0YXpG
 T6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mdVja9I3JFGnwzbp3ZtpVSwmgy7Ptxs+ZUyBCTdxRYI=;
 b=h50clAEZEUqk01iR1RAXh/Evn/aDQacMZwUN76MgjYYuvJ+vK1prNKwNxRrp/Ntw4f
 PnwuTaC/jm5kUzR8iv+TwSsSJTq4Cfvzx1tQ8htOUR7aVqj5FMvEH42EQTb14nH5bOVf
 UXp8UZTwKvaOmKfmVOh8BARFnmDMHDfz4fX4IwObrAIZg9Snb3blf0nVI9wiqM6m1IvO
 r4wVCZY71NCQga/4vNv1gEZMELqkZTMcugsHOIBA9NnEBuc5J7e4Zr7aUaWh/5AwMhDd
 AmBOWjqTSNuEalDi/0OfBkICutK5lU6jR4Jphkc/JpvGrA6QtyJo35pM5q/YRykkFJxT
 B/0Q==
X-Gm-Message-State: AOAM530iy0V3Yyrswu9FqRUzlJ1PlT6V4nAuPjvOyGLSg+e9hgKnaNIU
 Mv2tFKOArWhgl4Sl5Yp2RDZc7WO/qYoOgRFMkKk=
X-Google-Smtp-Source: ABdhPJzM8UNFg5pVvO3TIWl/YEt9JVITELnDVY1xuk9s19WgSuOjlEYcvGtqVsH32kjpqYOCaW2aFDNepBY6+Q8WiNU=
X-Received: by 2002:a25:7d01:: with SMTP id y1mr3483434ybc.152.1612952696487; 
 Wed, 10 Feb 2021 02:24:56 -0800 (PST)
MIME-Version: 1.0
References: <1612950879-49023-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmX5xjqTiOFzPMW0mpHxZHqaipGFb=0=Z1p5k7sEY-kSHg@mail.gmail.com>
 <YCO0Gy6ZKY5qGZgT@apples.localdomain>
In-Reply-To: <YCO0Gy6ZKY5qGZgT@apples.localdomain>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Feb 2021 18:24:45 +0800
Message-ID: <CAEUhbmWB2PCYbe2Dd2Ui8C-=dE_FDjEMApDf1GkXzJe2LBQkRQ@mail.gmail.com>
Subject: Re: [PATCH] hw/block: nvme: Fix a build error in nvme_process_sq()
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 6:23 PM Klaus Jensen <its@irrelevant.dk> wrote:
>
> On Feb 10 18:15, Bin Meng wrote:
> > On Wed, Feb 10, 2021 at 5:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Current QEMU HEAD nvme.c does not compile:
> > >
> > >   hw/block/nvme.c: In function =E2=80=98nvme_process_sq=E2=80=99:
> >
> > Not sure why compiler reports this error happens in nvme_process_sq()?
> >
>
> Yeah that is kinda wierd. Also, this went through the full CI suite.
> What compiler is this?
>

Yes it's quite strange.

I am using the default GCC 5.4 on a Ubuntu 16.04 host.

Regards,
Bin

