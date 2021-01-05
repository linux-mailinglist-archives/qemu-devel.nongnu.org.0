Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47FB2EB4B7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 22:12:39 +0100 (CET)
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwtd8-0004gj-6Q
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 16:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwtbl-00048O-6D
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 16:11:13 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kwtbj-0005Pm-Gu
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 16:11:12 -0500
Received: by mail-ej1-x62c.google.com with SMTP id ga15so2408809ejb.4
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 13:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5FDRc64gS4Z/qmb6HEXGmEPLYosVqTsAov7RGKQL4I=;
 b=Oj6E3u9O3Jrt7LKPLG6Nq8/J+shdNd6V+xZ7v2hHYmNqU+a6+yrn8dKqJ1KI/7b/ee
 e0ZiBdBNNSNKOABV2VMicEKtefSHcvd0yl/ylpVsLkz1ckyjmc7nZRUluQ1AindEXSFd
 YpKYUOhcmoNE/FG6EZaXIP8oEn9PFCf7cK60xuhMbDA3iflP6bgnAt6S+CcZ5ijPwkyX
 LkIQfRAD5n1V+FjQTVj4Wan1d5sU29cRXdrocDyUV1rfrG0rJj7A4Z38mcyldiEFVzf3
 RavfAdjFn+TeIFSdXyANMaky8XnKSRBw/aI2IcoGqXtKwtLhC92M80gMY1EZIDHl5TGJ
 H4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5FDRc64gS4Z/qmb6HEXGmEPLYosVqTsAov7RGKQL4I=;
 b=NAzpSP9NIYEvy6riHgfKte2RZ5MVlYA6WooRKyp884gGvNU5t74kfVrwJYXIy4jAAJ
 6BM/yOd/kOjaNoICTedcecnc4qNmMeJPd6NztESeIn7TK0PuJiCW5ALVjvhE5iYy9hCk
 iRhmAJakXyEvRB6apv5qXzFPa9Yi0QBMmp9D4hvbxouazdkM0fQntawUJr4twCajQOfN
 iIDx0YSHkyMjmJXjyqYenlKQzPLCsqVayDnhis2e6VmpGyAFvAM8uHa5KaA9qjhDJq82
 kBAtk7A/iVDr/cPYZQR1otkc4ilfITy3dn2XUCIJdkB3Lni1W45P9tDHedc96yD0QX2C
 wiYg==
X-Gm-Message-State: AOAM5306SYnjO43/nKCu+J+bYkuU8kKiVE9pRMWgI7vBG2L6BcYfE/wT
 flNdhlWZRx2yv8PplaRi5HGQQeRAzgFWQ70fyBEyq8d88dU=
X-Google-Smtp-Source: ABdhPJylU9HTgLd+oOTuohzTfMilSVXXRhhEzVgxd7WT9T/+qXEnD63ENVhcb/Zh54fn7ngrB6uojFBGBpbCWHhvCC4=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr808600ejf.407.1609881070185; 
 Tue, 05 Jan 2021 13:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20201202144523.24526-1-bmeng.cn@gmail.com>
 <CAEUhbmUtCvXCKoQGU9b6+UX1juChVfHkugODjo2psBnRw+7NTw@mail.gmail.com>
 <CAKmqyKPy-V77t-COOb2Vp5DasfduC49Uy51EcCfSRos+M-JkKw@mail.gmail.com>
In-Reply-To: <CAKmqyKPy-V77t-COOb2Vp5DasfduC49Uy51EcCfSRos+M-JkKw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jan 2021 21:10:59 +0000
Message-ID: <CAFEAcA-6NqgwKQKBFVg-VYgwdOReddyHm=sUO6o0nLQXaoB_Fg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Jan 2021 at 21:09, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Dec 16, 2020 at 2:25 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > Hi Alistair, Peter,
> >
> > On Wed, Dec 2, 2020 at 10:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Avoid using a magic number (4) everywhere for the number of chip
> > > selects supported.
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  hw/ssi/imx_spi.c         | 4 ++--
> > >  include/hw/ssi/imx_spi.h | 5 ++++-
> > >  2 files changed, 6 insertions(+), 3 deletions(-)
> > >
> >
> > Ping, not sure who is going to pick up this series?
>
> It should be reviewed by Jean-Christophe and then probably go via the ARM tree.

It doesn't seem to have been sent with a cover letter. Multi-patch
patchsets without a cover letter tend to get missed because when
I scan through my email looking for patches I should review or
pick up I'm looking for either (a) single patches or (b) the 00/nn
cover letter email...

thanks
-- PMM

