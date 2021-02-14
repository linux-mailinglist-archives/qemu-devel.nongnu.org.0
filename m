Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD0731B103
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 16:55:35 +0100 (CET)
Received: from localhost ([::1]:33702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBJkE-0004gi-9t
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 10:55:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBJiN-0003hk-L7; Sun, 14 Feb 2021 10:53:39 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:40129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBJiL-0002Ci-UT; Sun, 14 Feb 2021 10:53:39 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id i71so4743659ybg.7;
 Sun, 14 Feb 2021 07:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aqi3bumhGXFQWX0o4FpyWmH4QVV8SRYTfmg+5qORrGQ=;
 b=Q/sx6WdWmk3B3ASgOFyKZCrg5wwxvFY8i0yuC1BOKKc6cirY6fF5IC+yEdRmNDk9TA
 yRryh6jK/LKhv9GWIABM8mj2oZ78To6h07ZkFNjR+rWmF0NHIJGVtbQr+ih8Cx5RW7Rz
 XCIt7Xrj7a+NG3S8rgE+MSJoj251Ra9y2t+2qQhSwZwvQGLSyl/dYvxLoIUr6OU9h43C
 1bwEuNRr9jT6fwO3NFRQi87iFmZhFAHddJh8B76NTQOSgjdf7hoyA9vMPc2tUmr46Bur
 cmpIdyTCihEsiCObhfML93NoAW14kkzqzmnd4LHBy92TbAxxqOGOZzk0kYnssmaGHeOo
 Vr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aqi3bumhGXFQWX0o4FpyWmH4QVV8SRYTfmg+5qORrGQ=;
 b=JvxjEFJQPxDGhOOReS6lnD/cCWdFLFuaFCbs9ZtWw7qyNrKUyPs8lAvwKjRRv/Eslw
 RV3uNRrABpZ9Z0xaLkyRkLauOVmPulJ6Xr9lS6rNIULklecN4XioSLsjTxOfN8CBBg9I
 Bx7nA/EpblcZnc6XsibiV7vWV8PbQbOj/+8tJEV4hCTa0z9x07PHm+CBdbnJMHHV09H2
 qrOKiyTzTNXBKBmB7q7po81XzvMUn4gBV3u1ENpsCf10Fl88eA0Z9fBqLSxMBSszy4Fw
 KIHa5Q0ungeqtcvgF96hWkVC3z3+ubTe5BPSBf7ORFD9Sf4ytd0B8CA+euGim4tYyFxW
 cbuQ==
X-Gm-Message-State: AOAM530ztV9GXYrqulPmT8bvHqSdNelUtQV17hsz9SZ0+rcbLn8Gc3dU
 KbAaMyEIsOa+hBEL1cWatFeP4j481kTki/B+gJA=
X-Google-Smtp-Source: ABdhPJzseAn4CPC5zWZWbgR5+H645h7QJWc0vsCSdZxCAH717WsRdiqfFZ7+d/IpYQIR/NNjMBY3PtkHfiADm6XZBQE=
X-Received: by 2002:a25:c407:: with SMTP id u7mr18266918ybf.387.1613318016248; 
 Sun, 14 Feb 2021 07:53:36 -0800 (PST)
MIME-Version: 1.0
References: <1612868085-72809-1-git-send-email-bmeng.cn@gmail.com>
 <20210211165351.5rr2dpzlg4eqygdn@mozz.bu.edu>
 <20210211212434.oydbc7ucjbowtnrh@mozz.bu.edu>
 <CAEUhbmX_omO=F9qGVfX72uhyi8LXKV0EsueW-B27HwAtMNigZw@mail.gmail.com>
In-Reply-To: <CAEUhbmX_omO=F9qGVfX72uhyi8LXKV0EsueW-B27HwAtMNigZw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 14 Feb 2021 23:53:25 +0800
Message-ID: <CAEUhbmWeA7gc+ZNmpJAzPwfHvMwuQsyb716hHFM1nCrjw2KHBw@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: sdhci: Do not transfer any data when command fails
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org, Li Qiang <liq3ea@163.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 14, 2021 at 1:56 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Alexander,
>
> On Fri, Feb 12, 2021 at 5:25 AM Alexander Bulekov <alxndr@bu.edu> wrote:
> >
> > On 210211 1154, Alexander Bulekov wrote:
> > ...
> > > I applied this along with <20210208193450.2689517-1-f4bug@amsat.org>
> > > "hw/sd/sdhci: Do not modify BlockSizeRegister if transaction in progress"
> > >
> > > I ran through the entire OSS-Fuzz corpus, and could not reproduce the
> > > crash.
> > >
> > > Tested-by: Alexander Bulekov <alxndr@bu.edu>
> > >
> > Hi Bin,
> > Phil explained to me that this patch should fix the problem independent
> > of
> > "hw/sd/sdhci: Do not modify BlockSizeRegister if transaction in progress"
>
> Yes, that's what I expect too.
>
> >
> > With only this patch, there are still crashes. Here are three
> > reproducers:
> >
> > Some of these are quite long, so here are pastebins for convenience:
> > Repro 1: https://paste.debian.net/plain/1185137
> > Repro 2: https://paste.debian.net/plain/1185141
> > Repro 3: https://paste.debian.net/plain/1185136
>
> I will take a look.

I have figured out a fix and will send out for review and testing soon.

Regards,
Bin

