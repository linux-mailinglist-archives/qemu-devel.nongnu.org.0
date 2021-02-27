Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C56326B1B
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 03:02:40 +0100 (CET)
Received: from localhost ([::1]:41868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFowJ-000466-4a
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 21:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFouk-0003bS-6U
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 21:01:03 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:41040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lFouh-0000ga-SU
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 21:01:01 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id m9so10811344ybk.8
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 18:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gqoC5IgW4O7LBtnTqiL6OfFVZiTXu0ctXgAWeUkXCOc=;
 b=AYuH0K8G6ih9Qg7lMOVr7rd6Y9/7aecLKuYS4eqjDEGm5WcqnhN8gwqPPEQMJSgmGv
 /bzjQiVGka5RXFVBOT2BATFRoSrWEUwXpNLDCPpmst8BBwrVd5zsJ4zK/TMFIGht4Br6
 NnexVo8m4uujhK+7TGDYuVDaTBy+5lMb9c5U6IUYFZmwscuyT2D2NlrLNQ4n2wiBO05s
 3LMFvMHKpyDXdjtXNcmTULVpiEvdSbruUMvXqWwsrxPMLi0eV7RC0TvVOxD1CrvkMVuA
 1wz1Nlap1/MSdBCqzhMt1+aXMmeYKhU5Y1C/7oRQ7bf4mr6LCVLl0rtqDNrhubK+O4bV
 GW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gqoC5IgW4O7LBtnTqiL6OfFVZiTXu0ctXgAWeUkXCOc=;
 b=VagOKYVX+DmjNxQGn/rXH41zggJ3VGXbgLCAln9FAdbwCuDQRMJs1OL9yNIZx5dT40
 lojXh9PSrWAwGkvXGQ+jEdYw1ayc7dkS8HriyQHPyW3yyasS1fmW5S0+tJajtsYV11Vn
 CXvxjoLRomuhBI4pSUaBxDp5pOuQi6dd0IzZHMK0xjQ1QPqO9aoTiOIfNmSgtz+jraQq
 4RjPU6tEhxwO1OOJWIs4bvgUOEkDebNK3VduN9hB3dzyChS6W1lQELnvdVTEuhMArUXE
 buzk32nZJRfiZoIprPWQd6zmTrnxUOZO3wUuZsO6KFfRzFc4oNQuxoTTuNTqeWcQQQhB
 xBNg==
X-Gm-Message-State: AOAM530HMqHU2W7Lw2TCiBIV3tAiuBKbO2eyRWFmVltXMxM4fQtcPSKU
 xvFHWsWkBKFXVrdjKgHnTovZGdMC63Zz/vQiq38=
X-Google-Smtp-Source: ABdhPJxhEnhyWyVxHLgYHW+nD1oTBlOxiD/+taE8s9h0NfWDq8287v3B0YYhHkVYjeWNqJCwHj24wJEk0GuAhrW4LD0=
X-Received: by 2002:a25:d28b:: with SMTP id j133mr8094658ybg.517.1614391258799; 
 Fri, 26 Feb 2021 18:00:58 -0800 (PST)
MIME-Version: 1.0
References: <1614333786-74258-1-git-send-email-bmeng.cn@gmail.com>
 <1614333786-74258-2-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA_XV=xkZriO61zwb8OCDbKfUQ=oQFCoKyCJyPh0rt0dUQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_XV=xkZriO61zwb8OCDbKfUQ=oQFCoKyCJyPh0rt0dUQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 27 Feb 2021 10:00:48 +0800
Message-ID: <CAEUhbmWpzu8BeWBSQsL=picgnTqt9E_arOYRzBGfi-qRCd3-Pw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] net: Pad short frames to minimum size (60 bytes)
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 27, 2021 at 2:57 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 26 Feb 2021 at 10:03, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > The minimum Ethernet frame length is 60 bytes, and we should pad
> > frames whose length is smaller to the minimum size.
> >
> > This commit fixes the issue as seen with various ethernet models,
> > that ARP requests get dropped, preventing the guest from becoming
> > visible on the network.
> >
> > The following 2 commits that attempted to workaround this issue
> > in e1000 and vmxenet3 before, should be reverted.
> >
> >   commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
> >   commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
>
> Is it better to do this here, or in the places which create
> network packets?

After looking at the eTSEC manual further, I think we should put these
codes in the send path.

> Doing it centrally has the advantage of
> being just one place to change which then means senders
> and receivers don't need to think about it. On the other
> hand it means we don't have any equivalent of really actually
> sending a short frame and having the modelled ethernet device
> implement the handling of the short frame.

Maybe the best choice would be each ethernet model duplicates the
codes in their send path?

I have not checked e1000 and vmxnet3 manual, but it seems workaround
this issue in the receive path is wrong.

Regards,
Bin

