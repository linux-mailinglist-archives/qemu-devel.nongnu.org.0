Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88225BB0F0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 18:14:48 +0200 (CEST)
Received: from localhost ([::1]:56006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZDzL-00007h-Qt
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 12:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oZDly-0006Wm-2X
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 12:01:02 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oZDlv-000825-N3
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 12:00:57 -0400
Received: by mail-ej1-x636.google.com with SMTP id bj12so50333049ejb.13
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 09:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=N/nTy0mEtMEwkaawgGubu5sqZfsNHAyql9EdIMhrZPI=;
 b=Fs+BkSlUB1WlB0dNbXxhU31u1p8NBdcjmv7xg96q7EX6HIC9AgF4YClDI0W/LplkG7
 1J/9WNs+JH9VpWqDBVeQ1XOqWUEb+10W7jpHFTUwTGb9z/F8d151LoWfuQlWJWS5U/Ud
 WDx5RbacCsQWoeoAIDCxXzqM/d30qcrgjj8f/V/tnZDQLcYWIPI0LrTzBZC6KNXKPjGr
 B6p4s6ZcU4Niw/2R3vh/hWGgA2PUlOUPl5iCnfeXdq05yg0YVzYFeYeqToom/Me/xiEq
 Oe/qV95qbpLHWJHDKGUROxetLwPYoyFRxHI2Oa4ps7ntxFc7oi1AVzHlsYsKu7WSQ8Bs
 XfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N/nTy0mEtMEwkaawgGubu5sqZfsNHAyql9EdIMhrZPI=;
 b=rBshXzt0JPFH2lSCj2s4wsZjeYTe0yeFhQBG+MqgdZh/7gAAzOSvNJq+4toBYzs7M7
 wGfZHRcpzJYYTYE1V+xzOY2FM6apjSYirbiwSq8b5NI9OA/QgP5kqun/R78dpQ8UVrFs
 peP13HAnGpSPUK9xCnbh9nmay5j8z7g0P8c0G4ENEXt601uiUlckTmSTkMIAUQ3jHaS9
 Qq6y9inU8+2MaEGd9FU8pXZH0Vx5lZGzGbQlbbG5DlhgkP9/nF95uMCd8iSMunyK6m7e
 vPk5h6iZaewKWcQaCdR0Us9RNeCdXT9leBpT5xvKtgHeHNIn8poENdEIE/eLUBSv9vFC
 7zXQ==
X-Gm-Message-State: ACrzQf30G0DgafJKUtCj5HPbOAnR/+BCV7icyXvVlbD9yzkrTOFYNtwg
 aeWHgCR+exduKeBR9IaIq82dgzR3Z2UibWm/1xdo6w==
X-Google-Smtp-Source: AMsMyM6qsH4fI/56JmIwUPHI/5W+Rs2+SBEK0XhwhTmTYQNrgijD0lWod+2ECw2lvGL6ieTP4P5LVSu9vVk7yRrTEEo=
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr4115353ejc.64.1663344053931; Fri, 16
 Sep 2022 09:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <20220714163611-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
 <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 16 Sep 2022 21:30:42 +0530
Message-ID: <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, berrange@redhat.com,
 imammedo@redhat.com, 
 jsnow@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org, 
 qemu-devel@nongnu.org, thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Jul 28, 2022 at 12:08 AM Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Mon, 25 Jul 2022, Ani Sinha wrote:
>
> >
> >
> > On Sat, 16 Jul 2022, Michael S. Tsirkin wrote:
> >
> > > On Sat, Jul 16, 2022 at 12:06:00PM +0530, Ani Sinha wrote:
> > > >
> > > >
> > > > On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin <mst@redhat.com> w=
rote:
> > > >
> > > >     On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha wrote:
> > > >     > > Instead of all this mess, can't we just spawn e.g. "git clo=
ne --depth
> > > >     1"?
> > > >     > > And if the directory exists I would fetch and checkout.
> > > >     >
> > > >     > There are two reasons I can think of why I do not like this i=
dea:
> > > >     >
> > > >     > (a) a git clone of a whole directory would download all versi=
ons of the
> > > >     > binary whereas we want only a specific version.
> > > >
> > > >     You mention shallow clone yourself, and I used --depth 1 above.
> > > >
> > > >     > Downloading a single file
> > > >     > by shallow cloning or creating a git archive is overkill IMHO=
 when a wget
> > > >     > style retrieval works just fine.
> > > >
> > > >     However, it does not provide for versioning, tagging etc so you=
 have
> > > >     to implement your own schema.
> > > >
> > > >
> > > > Hmm I=E2=80=99m not sure if we need all that. Bits has its own vers=
ioning mechanism and
> > > > I think all we need to do is maintain the same versioning logic and=
 maintain
> > > > binaries of different  versions. Do we really need the power of git=
/version
> > > > control here? Dunno.
> > >
> > > Well we need some schema. Given we are not using official bits releas=
es
> > > I don't think we can reuse theirs.
> >
> > OK fine. Lets figuire out how to push bits somewhere in git.qemu.org an=
d
> > the binaries in some other repo first. Everything else hinges on that. =
We
> > can fix the rest of the bits later incrementally.
>
> DanPB, any thoughts on putting bits on git.qemu.org or where and how to
> keep the binaries?

Can we please conclude on this?
Peter, can you please fork the repo? I have tried many times to reach
you on IRC but failed.

