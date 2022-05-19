Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B329952DEED
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 23:03:43 +0200 (CEST)
Received: from localhost ([::1]:45540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrnJ8-000742-Bo
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 17:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linus.walleij@linaro.org>)
 id 1nrnHU-0006Lx-FB
 for qemu-devel@nongnu.org; Thu, 19 May 2022 17:02:00 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:34460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <linus.walleij@linaro.org>)
 id 1nrnHS-00048Q-L0
 for qemu-devel@nongnu.org; Thu, 19 May 2022 17:02:00 -0400
Received: by mail-yb1-xb35.google.com with SMTP id o80so11139313ybg.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 14:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nvfi/FkkRcQOxttlT1W4tUjOf5gCrt+pDxGf3qnwTek=;
 b=vqMlLof0fuiWzd248UraP76doOdIz5iCAKkORAsgESDI3ML/Yh+wuv4bh22lKGaWte
 VJFD8xu1QY90x8A2JxAEAor2S50Z8OIHycFD/5MIm9ijiVcMy/gn9zlO3hA2bkHfdD/o
 3UEx1e3vIVFEyHqMJEJoewgdkOmewkYmX+OwXt+6B+/6VoaEfEMQwaXFoGN6Oa1xOgz3
 344DT/L6UHbLY5AzfrKJUtUOr9RU6zjIDb5n6HwHv1f8V5loo6sPSBm8bSeO3ioUxA3s
 o9+lXNGnjYBNyZWEhxcAjfxsZbuR+EE4ukIs9OR7RPpRCUv1JkM/pB+p5aW2hctxX0ph
 zqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nvfi/FkkRcQOxttlT1W4tUjOf5gCrt+pDxGf3qnwTek=;
 b=qeQgEehUq8GodBo7GSbyHvTy91C12auHWnMui3sTVLDqfwJML5LGrMh2PE5Me0JY/U
 ZhaIetWDaZfDtDfAXfgLSsVIqbcNSK4evZk/vAa4TkqFCVggApqtYF/83F3NnS7CHV5s
 lIdo4YnaE0Eb3FDAlks4OliPUSYz9FXkgWAK/fTTaGGHm4Q5/XovUO8LKccOf+3PWxJv
 ZhLCTJwGDBoh3OqzC9W3ZeEyVcTmkgPySByw7pBStW1uFchWtN53n1qisKnSuhR2DSyT
 3T4RpV149Q71C6V0XwTXs3YNh8D/oGQYGaHbyCZC3Q+UxwAeic6IhF1r4/KuESPHhiAf
 ZDQg==
X-Gm-Message-State: AOAM532Ip7P+zXQpG660R1F1+LiZQs8AoHrobKcOK4nldj0m5ENJxGZV
 zFjEYfmGDNAeI9/M1nPv/b+mYYPrCn+N7w+ZVyyy1A==
X-Google-Smtp-Source: ABdhPJzNR4Wrf4wpzc22TgZlDNFOvKX8B13v65Sh0nJdkJ3ys3ADKjrd+O0tl1MT1zi4j+gQah1jkYknq+wLogmQE2A=
X-Received: by 2002:a5b:302:0:b0:64b:a20a:fcd9 with SMTP id
 j2-20020a5b0302000000b0064ba20afcd9mr6226804ybp.492.1652994116812; Thu, 19
 May 2022 14:01:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201117233928.255671-1-linus.walleij@linaro.org>
 <b63c04ff68340d367ad4138f3496d217df9b5151.camel@icenowy.me>
In-Reply-To: <b63c04ff68340d367ad4138f3496d217df9b5151.camel@icenowy.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 19 May 2022 23:01:45 +0200
Message-ID: <CACRpkdar8MeG4vYx+xJ5fh9U3+6LfKdMrNzNzYmC-7YUK=pQYA@mail.gmail.com>
Subject: Re: [PATCH v4] fcntl: Add 32bit filesystem mode
To: Icenowy Zheng <uwu@icenowy.me>, Chris Mason <clm@fb.clm>,
 "Theodore Ts'o" <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
 qemu-devel@nongnu.org, Florian Weimer <fw@deneb.enyo.de>, 
 Peter Maydell <peter.maydell@linaro.org>, Andy Lutomirski <luto@kernel.org>, 
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?B?572X5YuH5Yia?= <luoyonggang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=linus.walleij@linaro.org; helo=mail-yb1-xb35.google.com
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

On Thu, May 19, 2022 at 4:23 PM Icenowy Zheng <uwu@icenowy.me> wrote:
> =E5=9C=A8 2020-11-18=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 00:39 +0100=EF=
=BC=8CLinus Walleij=E5=86=99=E9=81=93=EF=BC=9A

> > It was brought to my attention that this bug from 2018 was
> > still unresolved: 32 bit emulators like QEMU were given
> > 64 bit hashes when running 32 bit emulation on 64 bit systems.
>
> Sorry for replying such an old mail, but I found that using 32-bit file
> syscalls in 32-bit QEMU user on 64-bit hosts are still broken today,
> and google sent me here.

Yeah the bug was 2 years old when I started patching it and now it
is 4 years old...

> This mail does not get any reply according to linux-ext4 patchwork, so
> could I ping it?

I suppose, I think the patch is authored according to the maintainer
requirements, but I'm happy to revise and resend it if it no longer
applies.

Arnd and others suggested to maybe use F_SETFL instead:
https://lore.kernel.org/linux-fsdevel/CAK8P3a2SN2zeK=3Ddj01Br-m86rJmK8mOyH=
=3DgHAidwSPgKAEthVw@mail.gmail.com/

I am happy to do it either way by need to have some input from the
maintainer (Ted). Maybe someone else on the fsdevel list want to
chime in? Maybe any FS maintainer can actually apply this?

Yours,
Linus Walleij

