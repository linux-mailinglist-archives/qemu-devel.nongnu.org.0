Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DD251F76B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 11:09:19 +0200 (CEST)
Received: from localhost ([::1]:50184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnzOH-0005aE-I3
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 05:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnzMS-0004tI-4E
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:07:24 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:45919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnzMQ-0006ln-Cp
 for qemu-devel@nongnu.org; Mon, 09 May 2022 05:07:23 -0400
Received: by mail-io1-xd2f.google.com with SMTP id h85so14581592iof.12
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QKzLJhaSnRMoBZ6M1u0G53flJGhUQmHTLiX4M2k3GFE=;
 b=j2SPDJUAzqovP0HadrhG5egQAcRqVDw3GPyIselPUTPG6KBnBgVGk9ckTxXng63F60
 ibBzm/Eb7hY525KxdfxJRQUE7QOk+XTlAFx9OvrKrnu9CD60wIAMPL7WDXPEsb8I2dmB
 PfdnsONvxcrd5h7sPBxPPK4rd/xGxaIyVvX6zloJB9RDUYe4m5s10JFV5TJh+liLvTWO
 ofsvjf3TgKfUixCxBFvcmVoML/nlLnlNmInWVVb2OB8lyXmGa7qhSRy9b3Ee/a+f69il
 MVNq0uLSLfVLMu+Jjgrw3AuHEmYelwsFf9rSus4ZBeDDSSvEV5UuC75Su21wNAXkcKhA
 k73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QKzLJhaSnRMoBZ6M1u0G53flJGhUQmHTLiX4M2k3GFE=;
 b=Sdzx1JUC3lAhjU069QgyYxOAKh4cUpEaExnWD+Ju0BkRluc4PAmiIOrn3fZArdVlj4
 8ylXSQ12F/N4n9mfFXJMy1SUuLTbuxTyOnyEqfFycwp5uuVHc10EZdY8lpgp53u/nIlF
 lCD6pvLJ7XyXUNlo/S9CYOYRubcG5mloShvMcbZ5GnYrEJ2/S2zWwFeb0Rmaa3v16IVq
 TC41cjwOg0uEAbyHWwNs1HXGRVaHZS3pRZhkiks2LxX/0c1y+ox0SqdqhkdwkhC8gSVd
 HfMvT1IdtVKsyXvKLyBL9k4ELqi/4SZG/0U2a+tZcTkoSsGvVpaDOfl9Q6XSl2iUonBS
 dcxA==
X-Gm-Message-State: AOAM532eqEir/mlV6NYCtEh6yhAPsQQb8nHM8AZHni5Rbc987QsBO/Xc
 GVEXLtKLt6oaZpFUZxE5b1fP/UxBx6gMgigOmb4=
X-Google-Smtp-Source: ABdhPJxiavXEjChD9rj23rkyDy7PW0RWkTC5A3ovjsska8axTn73teMpglM4/M49P1tBsUYNO/oD+P3Cem1lor2rcEY=
X-Received: by 2002:a05:6602:2c07:b0:657:8347:d7c0 with SMTP id
 w7-20020a0566022c0700b006578347d7c0mr6361086iov.93.1652087241298; Mon, 09 May
 2022 02:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134812.541274-1-bmeng.cn@gmail.com>
 <CAEUhbmVUqSghy+HE9p2qg1bJXYHBjy83jowesA_Zx383JrO7CQ@mail.gmail.com>
 <CAEUhbmVrvzvvNeKJvT5saPbXDoEnHdZcZyuNTmt4R=YzOs1R2A@mail.gmail.com>
 <CAEUhbmUDqwtXiEioBuSOi6ZyVNKnJgjYZAPTubGx+McbMFwZKA@mail.gmail.com>
 <CAEUhbmXuYt2KqKtrvMRoR2acFaweO3zVGa4+tyoxMnSc-kg11Q@mail.gmail.com>
 <CAEUhbmV2SH80i2vCato_2qRGeDCqeDqVp1m0Lc_SrJLGhZK-jw@mail.gmail.com>
 <CAEUhbmVxfbrkw3ZvzOb3gVm-c_5KU_B_UiT42m+bgVQdPPJtLQ@mail.gmail.com>
 <87v8ujt3lu.fsf@linaro.org>
In-Reply-To: <87v8ujt3lu.fsf@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 May 2022 11:06:54 +0200
Message-ID: <CAKmqyKN15A4dS64k7-s45LjTJprKHCNL4BRuu-XnuHo4FJppZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/core: Sync uboot_image.h from U-Boot v2022.01
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair@alistair23.me>, Nick Hudson <nick.hudson@gmx.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Fri, May 6, 2022 at 11:25 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > +more
> >
> > On Tue, May 3, 2022 at 11:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> On Thu, Apr 28, 2022 at 4:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >> >
> >> > On Fri, Apr 22, 2022 at 11:00 AM Bin Meng <bmeng.cn@gmail.com> wrote=
:
> >> > >
> >> > > +Richard
> >> > >
> >> > > On Wed, Apr 20, 2022 at 4:16 PM Bin Meng <bmeng.cn@gmail.com> wrot=
e:
> >> > > >
> >> > > > On Tue, Apr 12, 2022 at 9:11 AM Bin Meng <bmeng.cn@gmail.com> wr=
ote:
> >> > > > >
> >> > > > > On Thu, Mar 24, 2022 at 9:48 PM Bin Meng <bmeng.cn@gmail.com> =
wrote:
> >> > > > > >
> >> > > > > > From: Bin Meng <bin.meng@windriver.com>
> >> > > > > >
> >> > > > > > Sync uboot_image.h from upstream U-Boot v2022.01 release [1]=
.
> >> > > > > >
> >> > > > > > [1] https://source.denx.de/u-boot/u-boot/-/blob/v2022.01/inc=
lude/image.h
> >> > > > > >
> >> > > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> > > > > > ---
> >> > > > > >
> >> > > > > > (no changes since v1)
> >> > > > > >
> >> > > > > >  hw/core/uboot_image.h | 213 ++++++++++++++++++++++++++++---=
-----------
> >> > > > > >  1 file changed, 142 insertions(+), 71 deletions(-)
> >> > > > > >
> >> > > > >
> >> > > > > Ping?
> >> > > >
> >> > > > Ping?
> >> > >
> >> > > Richard, is that you to pick up this series?
> >> > >
> >> >
> >> > Ping?
> >>
> >> Ping? Can you please indicate who is the right person to pick up this
> >> series? Thanks.
> >>
> >
> > I pinged several times, but there's radio silence, sigh. Can you
> > please let me know who is supposed to pick up this series?
>
> The only file that includes this is hw/core/loader.c so I would assume
> that's in Alistair's domain. However it's not well matched by
> MAINTAINERS and has only seen periodic updates since it's inclusion in
> 2007.
>
> Alistair can you take this and update MAINTAINERS so it doesn't fall
> through the cracks again?

Thanks!

Applied to riscv-to-apply.next

I'll update MAINTAINERS as well

Alistair

>
>
> >
> > Regards,
> > Bin
>
>
> --
> Alex Benn=C3=A9e
>

