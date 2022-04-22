Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BC650AE4D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 05:01:48 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhjYJ-0004fK-GH
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 23:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhjX7-0003it-D6
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 23:00:33 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nhjX5-0007tD-Oz
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 23:00:33 -0400
Received: by mail-ed1-x536.google.com with SMTP id f17so8824356edt.4
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 20:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=77qW8MIpZflC6l5XWOQlQEKVM5Sr3HxN6VAocp6/TKo=;
 b=Ca+2TyinGNDieeJxTSGW4hYWJaHJE+2JlOpMSrvNneKBd6Am/AvKmjf5rQDm6gKury
 /gBtUpelpb86vigkkRuxt8ksYMQ415/myWGdj3JIokp6rocySY2cn3ROYTnl2q+xm8BD
 5/az2v96XC+RHzhAgbx5XILn2lOwbDlxBHjp0yAggziADrOMQigowepUJMNA2olZSOdU
 ZRuZ2oLWMxAPTD0mVSFTLIb9NVdnYig/40GlbsfGLxR2wJOyieswPio+rXi8vt85+ltR
 jN2gwm9viwFuxBGJlqrGXx30OavpRZKV4GjWmVt702c6YYEwDJVzCc1VogNLNGT1Vm3s
 aUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=77qW8MIpZflC6l5XWOQlQEKVM5Sr3HxN6VAocp6/TKo=;
 b=XoEI726zKRuywd9pirxkj/fPdTwG7DZ32cmxGL/K0ZhY410D3lx1Z8uMxkWa84U566
 4+xP1OHEz8LhLO/7taiGTrBKDfj7Gp0JW4Zkb0T4Lp4i6I+3prlhMYrV/YrKXdAX3a6t
 +Y/SrJ2xMzJvQquf4BAtSvMduLcIUVte8Q4iKKLlrqetgzxJfyavv5+FzvepWmaVsBgN
 XrIxXW4SdytqaEJ359jJwiHtjXoJ8caO7x471OwWjF4hUvmyORgkpThq8MC+5HgoqXwi
 /voXQPgM9WyO+plDDbn+xPYBpT2XPHQSVQg+JsGa++DAPnurxfeFE9FZ1MH44brofuIL
 4Qcw==
X-Gm-Message-State: AOAM533Lnlzm8/jpqPzr1BdHq4Mku/a4qV2Fei+rpaSMo4s5Hg67g79k
 +Rh4mMPvLgPSW+0mqiH4wnAwfqSnWl26tytHnE0=
X-Google-Smtp-Source: ABdhPJwiVr9NM3SyqAMB2+KSN+uVdiMfSQ6DC0X4j7StlCTBtU+UzWSqbLSCMo4wWX92wZj17t0qfkc+4rCIZRYf0Bw=
X-Received: by 2002:a05:6402:32a3:b0:425:b87d:34a6 with SMTP id
 f35-20020a05640232a300b00425b87d34a6mr1638994eda.38.1650596430276; Thu, 21
 Apr 2022 20:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220324134812.541274-1-bmeng.cn@gmail.com>
 <CAEUhbmVUqSghy+HE9p2qg1bJXYHBjy83jowesA_Zx383JrO7CQ@mail.gmail.com>
 <CAEUhbmVrvzvvNeKJvT5saPbXDoEnHdZcZyuNTmt4R=YzOs1R2A@mail.gmail.com>
In-Reply-To: <CAEUhbmVrvzvvNeKJvT5saPbXDoEnHdZcZyuNTmt4R=YzOs1R2A@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Apr 2022 11:00:18 +0800
Message-ID: <CAEUhbmUDqwtXiEioBuSOi6ZyVNKnJgjYZAPTubGx+McbMFwZKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw/core: Sync uboot_image.h from U-Boot v2022.01
To: Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Richard

On Wed, Apr 20, 2022 at 4:16 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Apr 12, 2022 at 9:11 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Thu, Mar 24, 2022 at 9:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Sync uboot_image.h from upstream U-Boot v2022.01 release [1].
> > >
> > > [1] https://source.denx.de/u-boot/u-boot/-/blob/v2022.01/include/image.h
> > >
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > ---
> > >
> > > (no changes since v1)
> > >
> > >  hw/core/uboot_image.h | 213 ++++++++++++++++++++++++++++--------------
> > >  1 file changed, 142 insertions(+), 71 deletions(-)
> > >
> >
> > Ping?
>
> Ping?

Richard, is that you to pick up this series?

Regards,
Bin

