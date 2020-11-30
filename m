Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FBD2C84BB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 14:13:27 +0100 (CET)
Received: from localhost ([::1]:38832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjizc-0005GS-UP
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 08:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjimL-0005UF-4N; Mon, 30 Nov 2020 07:59:41 -0500
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:42986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kjimJ-0003vZ-Ar; Mon, 30 Nov 2020 07:59:40 -0500
Received: by mail-yb1-xb41.google.com with SMTP id 10so11264512ybx.9;
 Mon, 30 Nov 2020 04:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=D/mOHHgNKl4lazHcT4VZmAk/LWlImK4zi5pa42lJe0A=;
 b=IkG5+YJlJOLbGKOtG410MH85qDnDercbfFioJ4122eAXKLbTSW0meGLJb7pfHQrJsc
 DOfjUN60JMq2X8aaxqw6L6I0l3SVipku/dI/1niv6J7SzvuD861WSKP2q7p2A2gybGBQ
 rfsFT/qTQNPERrk8nAHAUpGpZZhvqR/9yDdjv/hdbAhPxXg/G2G+m0+VxNMdZgxaUP0B
 35iE5AuyrxQCkDpn0/urfjVR4i15V6rYp7cEJoWAEp8100W60TScJ+oJqbPPOF9j84pN
 qucaQA55tOQXWXG69QBrzCc7FzdfsCDVe1c/cvvrRtU3koJXLBgMKAtzeqarkM+3puXJ
 zaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D/mOHHgNKl4lazHcT4VZmAk/LWlImK4zi5pa42lJe0A=;
 b=Z90FN1gKQiE93si9XaOeSbjefdOlraLHSQSFc7xWvut8LXTW5XTwH3xUX+osdfd6cz
 H68JEiMUv1r7AOHKB1FU/LRV03fi7wN9daJqPMitPT65nWU7foaxyuQYbXCca4bUB1XR
 oXiFPHFUo7Ic6BYdcqr8ctot27aem8UilbEoJF2xVSO1ecQMDckOzgD6xLr+rpR/FE92
 xhzDDo0a8XRTOoRg711xWSOCF5dhw4cQTVdrJGGyF8f17syONO0sYoOtgSTUZy6XiYaG
 b1hvWvdCyiOxMCvY96pCBJCWJ3oLDX6wom0QNl9p732iS0SJztwU5Z/3QF5wSGxazlFB
 LpzQ==
X-Gm-Message-State: AOAM531OrSF9BkPQh55ANqhepQ1VrcYZfXRJkfpe/NlqwJNeEQE8McV2
 KiieRZ2+K4ZajHzW7t3tYGww4NfRHXicE3qHRBI=
X-Google-Smtp-Source: ABdhPJy9WgkEyfxDHFAPlLPD7o0+dNllutGDd4nV5hJs8/r7W17YWMcRFlTQSLhUYPG7Yo5ZFsuSM2ePUUaw8y15+Uw=
X-Received: by 2002:a25:db0e:: with SMTP id g14mr31022197ybf.314.1606741177846; 
 Mon, 30 Nov 2020 04:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20201117105219.1185736-1-f4bug@amsat.org>
 <20201117105219.1185736-2-f4bug@amsat.org>
 <CAEUhbmXRND_nb5oMEM4RdeAjnC2DKYzoYtyz5aJusCs2p8vo8w@mail.gmail.com>
 <CAFEAcA_CcWGjX-O+NGxE3zRv8s6fQ_vKuXWXy3Q-qQjrmBvKnw@mail.gmail.com>
In-Reply-To: <CAFEAcA_CcWGjX-O+NGxE3zRv8s6fQ_vKuXWXy3Q-qQjrmBvKnw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 30 Nov 2020 20:59:27 +0800
Message-ID: <CAEUhbmW-7LZGJ=GSr2A-rQCO42uKGuMQ-2_2r463G++dtKGWiA@mail.gmail.com>
Subject: Re: [PULL 1/1] hw/sd: Fix 2 GiB card CSD register values
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 8:55 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Mon, 30 Nov 2020 at 12:53, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > +Peter,
> >
> > On Tue, Nov 17, 2020 at 6:52 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> > >
> > > From: Bin Meng <bin.meng@windriver.com>
> > >
> > > Per the SD spec, to indicate a 2 GiB card, BLOCK_LEN shall be 1024
> > > bytes, hence the READ_BL_LEN field in the CSD register shall be 10
> > > instead of 9.
> > >
> > > This fixes the acceptance test error for the NetBSD 9.0 test of the
> > > Orange Pi PC that has an expanded SD card image of 2 GiB size.
> > >
> > > Fixes: 6d2d4069c47e ("hw/sd: Correct the maximum size of a Standard C=
apacity SD Memory Card")
> > > Reported-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > > Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > > Message-Id: <20201025152357.11865-1-bmeng.cn@gmail.com>
> > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > ---
> > >  hw/sd/sd.c | 15 +++++++++++----
> > >  1 file changed, 11 insertions(+), 4 deletions(-)
> > >
> >
> > Any chance to get this patch applied to 5.2 since it's a bug fix?
>
> It's already in -- commit 575094b786e999e5fbd0.

Oops, did a wrong rebase in my local tree :(

Glad it's already in. Sorry Peter!

Regards,
Bin

