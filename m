Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A468B517C4C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 05:48:29 +0200 (CEST)
Received: from localhost ([::1]:52642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nljWW-0002tS-7F
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 23:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nljSh-0007eN-5Y
 for qemu-devel@nongnu.org; Mon, 02 May 2022 23:44:31 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:46332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nljSf-0008Fc-HC
 for qemu-devel@nongnu.org; Mon, 02 May 2022 23:44:30 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f7d19cac0bso167537227b3.13
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 20:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j3KXJY5/Sn7TCBfNI8nQ1kNbCP3fTQXzsmhMxpckOJI=;
 b=Q6E3FKe9FGqDvOziAVfI0tZ+oMGh6ytunugDm8kp295WXN5Vjxs7muVizOgTwGUi7L
 Qv/1338T/WhIir8NXyyGRaSgWv7qO72PsuHHa2COIxmnDTpyVNNV3BlSZ9yDi1lmbzIw
 g5qALULFt5GcurdZYzP5tKHWfyXjoSJcqDCPwGjcyKao0RH3MT9vWbHLSAhBwHAYl0g9
 D0uq4yeDsxjdUGcg6lda440jy37zC2yrg9OXBtXGW7YjylYpQdj9P9aQAqsfecAELP/s
 TFRioNKPYxYWar3gcbGDfd/cNFptJhaFx/xxawY9V6OJv8KAc/vZcDxLO5sA9j0z66Da
 SSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j3KXJY5/Sn7TCBfNI8nQ1kNbCP3fTQXzsmhMxpckOJI=;
 b=nOc2b6ZRdIsj9QNkXRW1jnSAyk1hNr4XPJ3Rrj5iDYGIVf+ASuwd/E08zJP2Fxz4Hc
 fZtQnPwIqzkHeytrbFDBHM3VygbNzK0h4k/XgBMLzKcp+aztT5kb7eFfrT8b8d20c4Da
 lyJ/HA+pMoKUtqLYjktr6mkL9eFMY9vDZOKGfjhzHdw+M3Jf0kOJmn+O/ux7m1MpSfIn
 4ns+YEyYbUIspS20Q6/p265riWoJ4UZB+Yn8TKlasSzxuiEZO1WlXSren7r968g062QJ
 vnRyxnQVhGnakXXh3jBkxg3fNpA7E4pnuFRlyuhqyBGG3ELMzUkl0tDidZABh6ybEDoB
 Fp+A==
X-Gm-Message-State: AOAM530ROslDEJtchFrMs1fKWbIzSGic8gI/jN7NEqOZmTDG/248xEcW
 C3EvF5+1Dnc228opGhHOyRjn6cjVS1UZRuMfxYc=
X-Google-Smtp-Source: ABdhPJyDBYDJtp69FV4tm9JnFI2vVJlM7Lr1Wm/aoB8LhC9kQSf6U668Gwat2nY+RhpNeCzeKFnBliDdnbvXyZRzD7s=
X-Received: by 2002:a81:ad7:0:b0:2e6:84de:3223 with SMTP id
 206-20020a810ad7000000b002e684de3223mr14318778ywk.209.1651549468695; Mon, 02
 May 2022 20:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134812.541274-1-bmeng.cn@gmail.com>
 <CAEUhbmVUqSghy+HE9p2qg1bJXYHBjy83jowesA_Zx383JrO7CQ@mail.gmail.com>
 <CAEUhbmVrvzvvNeKJvT5saPbXDoEnHdZcZyuNTmt4R=YzOs1R2A@mail.gmail.com>
 <CAEUhbmUDqwtXiEioBuSOi6ZyVNKnJgjYZAPTubGx+McbMFwZKA@mail.gmail.com>
 <CAEUhbmXuYt2KqKtrvMRoR2acFaweO3zVGa4+tyoxMnSc-kg11Q@mail.gmail.com>
In-Reply-To: <CAEUhbmXuYt2KqKtrvMRoR2acFaweO3zVGa4+tyoxMnSc-kg11Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 3 May 2022 11:44:18 +0800
Message-ID: <CAEUhbmV2SH80i2vCato_2qRGeDCqeDqVp1m0Lc_SrJLGhZK-jw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/core: Sync uboot_image.h from U-Boot v2022.01
To: Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Apr 28, 2022 at 4:43 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Apr 22, 2022 at 11:00 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > +Richard
> >
> > On Wed, Apr 20, 2022 at 4:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Tue, Apr 12, 2022 at 9:11 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > >
> > > > On Thu, Mar 24, 2022 at 9:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > > > >
> > > > > From: Bin Meng <bin.meng@windriver.com>
> > > > >
> > > > > Sync uboot_image.h from upstream U-Boot v2022.01 release [1].
> > > > >
> > > > > [1] https://source.denx.de/u-boot/u-boot/-/blob/v2022.01/include/image.h
> > > > >
> > > > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > > > ---
> > > > >
> > > > > (no changes since v1)
> > > > >
> > > > >  hw/core/uboot_image.h | 213 ++++++++++++++++++++++++++++--------------
> > > > >  1 file changed, 142 insertions(+), 71 deletions(-)
> > > > >
> > > >
> > > > Ping?
> > >
> > > Ping?
> >
> > Richard, is that you to pick up this series?
> >
>
> Ping?

Ping? Can you please indicate who is the right person to pick up this
series? Thanks.

Regards,
Bin

