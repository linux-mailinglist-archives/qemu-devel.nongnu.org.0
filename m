Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9438D2B8DBA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 09:40:57 +0100 (CET)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kffUu-0003yX-83
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 03:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kffTF-0003Pe-Lc
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:39:13 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kffT8-00008I-IM
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:39:13 -0500
Received: by mail-ej1-x629.google.com with SMTP id a16so6741839ejj.5
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 00:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dlLZzA6K9QTuMfGNpdOXP+aZ77ceZwT+wdu0FDc4SMA=;
 b=F2nKAWq6LGim6G1TjM7iC7e1ChfhwWr3B6mK1oGDh+ZEXTPrjb3HR65PGu2Jnt+VVV
 FEo8z+hRYwkeovTbo0TVlN/iJmQVkcG6gCAsBMTrnK+ZNKYg+VOy7oR4GEqlAjwlJa3j
 /PslAP1mRLOtNnSC102FXUmVDAgva0aOfIuYCwy0oa8WjolfP5LXKyXHEh9uReNYKqHq
 czo5XIraQKG7NikM/UhSUfrDrOQPXnWe0OH3Qied2UABAafXoAFiynG4smTxwhO5wBfb
 nnfjgTm1+rLxIg1ZUPRDKx6zdvh0ibOgF9a4Gx178WRHmA55Bw6fl0pyPR6N4Efff4eX
 6xPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dlLZzA6K9QTuMfGNpdOXP+aZ77ceZwT+wdu0FDc4SMA=;
 b=DTQoywwrH93nlCLR+YCigBk/jF9JaIahjbmYg1dkiMR1fhlWqPhZJLikBe8s/nXBxv
 GyVqoitvIAsS81Lq54zW2zKMNaLrrd8ZVp+5p5eyjMxBReQ/EipaBOOU7wGMycLfd3Vl
 +hqfK9x7+qUTbUgCydxwUZg+a6kjOAIlcVUms4vXDXJMQYRcNfp5w/7TGObgw6sEA5zr
 gz/mII22Z0IPC3pKWBSE7mPIjX05QEOQYU3hD4TQNble6bZUExHbpz/RAoQm8V9nVqog
 8wuZ2+AXS5bBdjivPlKMYKVDv8oSGMtdBnf3UMySr0WabhTWoZExsO90XLjowLetoDjB
 KVKw==
X-Gm-Message-State: AOAM530CQtMwxSvMVagRsoyJpqNmJndvQkmR1uAh/TteMg4kiaZTWcTS
 O9IKq3vwqXxg5EACD3Rti4fJX2PiH3R8WL74vxOdkA==
X-Google-Smtp-Source: ABdhPJwr5Y1200sPvl4PzNXFJKIgWa5yzUIL7BU1zorhk7OmNG+evGwvLb/qzHiNvTmqwmYOZAGWVeVQ6XnMActtNKo=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr17184449ejd.382.1605775144864; 
 Thu, 19 Nov 2020 00:39:04 -0800 (PST)
MIME-Version: 1.0
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
 <CAFEAcA81CeW=RdrABuAZx2pL6L-nE_AaQ2vbryqm7amUbRjM-g@mail.gmail.com>
 <7412CDE03601674DA8197E2EBD8937E83BA86327@dggemm531-mbx.china.huawei.com>
In-Reply-To: <7412CDE03601674DA8197E2EBD8937E83BA86327@dggemm531-mbx.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 08:38:53 +0000
Message-ID: <CAFEAcA9nwqj-7bDa5oPo9z8h9uaeHAC0dX-KdeZ6hkgZJQDqZA@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by g_autofree
 need to be initialized
To: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>, Hao Wu <wuhaotsh@google.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 at 08:35, Chenqun (kuhn) <kuhn.chenqun@huawei.com> wrot=
e:
>
> > -----Original Message-----
> > >  static void tim_add_test(const char *name, const TestData *td,
> > > GTestDataFunc fn)  {
> > > -    g_autofree char *full_name;
> > > -
> > > -    full_name =3D g_strdup_printf("npcm7xx_timer/tim[%d]/timer[%d]/%=
s",
> > > -                                tim_index(td->tim),
> > timer_index(td->timer),
> > > -                                name);
> > > +    g_autofree char *full_name =3D g_strdup_printf(
> > > +        "npcm7xx_timer/tim[%d]/timer[%d]/%s", tim_index(td->tim),
> > > +        timer_index(td->timer), name);
> >
> > Which compiler is so unintelligent that it cannot see that a declaratio=
n
> > immediately followed by an assignment must always initialize the variab=
le ???
> >
> Hi Peter,
>   Glib requires that all g_auto* macros must be initialized.
>   https://developer.gnome.org/glib/stable/glib-Miscellaneous-Macros.html#=
g-autofree

Yes, and we initialize it with the "full_name =3D ..." line.
The g_autofree documentation says "this macro has similar constraints
as g_autoptr()", and the g_autoptr() documentation says
"You must initialise the variable in some way =E2=80=94 either by use of an
initialiser or by ensuring that it is assigned to unconditionally
before it goes out of scope."

In this case the test code is doing the second of those two things.

thanks
-- PMM

