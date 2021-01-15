Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0C2F884E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:19:49 +0100 (CET)
Received: from localhost ([::1]:49942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0XRc-0007IG-Bn
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0XPQ-0006Iv-5s
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:17:32 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0XPO-0003Bo-3O
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:17:31 -0500
Received: by mail-ej1-x635.google.com with SMTP id w1so15417591ejf.11
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ykcTianyGcyQn369AWid2CSSNFpbeBi1VKZPRC0fes=;
 b=WKBNvyPj72CF2dt7llRS6aFeR+LRLnNKSUzwoRe6Djt7O3PjlO0geOcKdQAc/VDuKF
 vvAiXD15fd2IL6UTixS1sYzJjfDt72jcvq4EMyjqN/Y8h1aqUVqlQUxkMcKwG4XiBSVj
 dFQDxmyT7bLIorHVZYx7JEnrZJMLZekhXP9Zz7JDT1VqZzcFGVCDb+Oh56MC9DhC7gGZ
 jiaRP42AbVwTzsV2Pge2O9Hgv8XYxA1iLmQKub7BHbGlI4CFZ6HNKoUL0xigrE5CSJw5
 Qx5lJZPu7v2DfoU53PrIDb9wXN3t74R9UC7gQhjvnZvlkSlIGei81TPS5q17Hs4v04yJ
 FkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ykcTianyGcyQn369AWid2CSSNFpbeBi1VKZPRC0fes=;
 b=oCO41UW2jQDBI7qko5cuON/vFtKYLKOEocPBkBTezdR2MOrhS2E4WC2lKxW5RRStA2
 H3VFkF+lZ0qWjaT2RnixCdrupMYSNK3JTxOjn8yG9ydQowwwGRWpzwO6sLZ5pbr+M8jp
 lYYST18g+/2mEJ/we3ym6A7gfXOBfvrchUP/qUjTkrIlQNQEL+VtbEUIZCdEl2da/fgX
 omYkNpft0eOkjfbqo5gGeTHEIgnt/6cgikCAPaBY0gGGoDPv612IxxXoLcQfV6Zu6ykS
 OJrYlzAQW6rQ6XvPtXqBb3RppZfOfAN1fuanz/0M0Ytd+XANIJaWn7QZIk12ln/x+h1+
 Hrbg==
X-Gm-Message-State: AOAM5317DyOSwOZBYlb9dv5IL/mI5l+8fl0mnJPFoXP8J5hf5XHI2epI
 UkxRqM5RmLOWhOeDRGu2yeumPaAD8O571oo+VSMNaA==
X-Google-Smtp-Source: ABdhPJyBivQyTl0Bklv93kNTrunyucJ8lRcdUeDQgE/l/49S+MVUYHYmVeHJ/t57Yb+w1U2STEvlJ+35ZagxUmmqqTc=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr7155200ejt.56.1610749048042; 
 Fri, 15 Jan 2021 14:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20201104092900.21214-1-green.wan@sifive.com>
 <CAFEAcA_EykbnmTQuz4RT3qGMt-Atf=EAdaHd-QqBvJCPvwemqA@mail.gmail.com>
 <CAEUhbmULDEgfs0zkt6k1DWo+AD4T701xDp5TCyjQHFypmr037g@mail.gmail.com>
 <CAFEAcA9QrTA6bEiK608HfB9vfN66SGBPJw6pEDDk2YH3v4M8SQ@mail.gmail.com>
 <CAEUhbmX4GtWfU1Z+cbSb435MCgBo+OaLbSg0qP_mRgPxSJRLnQ@mail.gmail.com>
 <CAKmqyKP=URfpTZXsax=Xmvn9-cz0GY7C6eih+bdycZhRASH2Fw@mail.gmail.com>
In-Reply-To: <CAKmqyKP=URfpTZXsax=Xmvn9-cz0GY7C6eih+bdycZhRASH2Fw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 22:17:16 +0000
Message-ID: <CAFEAcA9m=y+V_euSE_gWcyeKBY=meTaroRcMdH9_CWtkUjVKWw@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/sifive_u_otp: handling the fails of blk_pread and
 blk_pwrite
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Green Wan <green.wan@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:43, Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, Jan 15, 2021 at 6:09 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Fri, Jan 15, 2021 at 9:55 PM Peter Maydell <peter.maydell@linaro.org> wrote
> > > printf is definitely the wrong thing... you need to either report
> > > the error back to the guest if the interface the guest is using
> > > has a facility for reporting read/write failures, or log or report
> > > it to the user using one of our APIs for that.
> >
> > It seems the hardware does not have a mechanism to report to the
> > software when hardware cannot fulfill the task requested by software.
> >
> > I checked all existence of block_pwrite() callers. It looks like this
> > is not handled consistently. Some indeed call printf(), some call
> > error_setg_errno(), some call fprintf(stderr), some call qemu_log()
> > ...
>
> Logging a guest error seems like the best bet, I'm not really sure
> what else we would do.

Looking at the other options, I think error_report() of some kind is
probably the best bet here.

thanks
-- PMM

