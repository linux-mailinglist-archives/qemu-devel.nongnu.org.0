Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56823531508
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 18:43:18 +0200 (CEST)
Received: from localhost ([::1]:36066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntB9I-0005fo-Uo
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 12:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>)
 id 1ntB74-0004BE-26; Mon, 23 May 2022 12:40:58 -0400
Received: from sender4-op-o18.zoho.com ([136.143.188.18]:17886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>)
 id 1ntB72-0007Zn-0k; Mon, 23 May 2022 12:40:57 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1653324043; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PuiyuF0gMrnHd1B9Ro7m/XlPwk3wtlPoXhsNNgKEO+p3BZc68NyPkb2xLlEkmfdLtO6/WkhUT05fORXovZ2fxUr/pAxUiTiFoS4lgp7P8kQQ0pjzHJ2ZQ2VFK4tFIxF7ZPxRY6hp35XloltPdgwq8ihEQ08gCFrl4RmRMLxmMN4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1653324043;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=HSDqLNIbiAlIIj112gAv+SfiMnROsQCmP+UefJmb0TM=; 
 b=mWsXDKJgo8PYo9ezpXkHWCK46kthQYqHDXfBJYdm+J8KB/n+FUoVhTUJ7N+Tlf7dvXMwLXpiZjpghKeU5FYaTRkrv3baNqz8DO5dqAqvLinuTei/BDsub4OBu2lszbsbLiKeMGGBW11xgNK63fsQWWIxn1ZKRX3HOI4qTe+mNUk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653324043; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=HSDqLNIbiAlIIj112gAv+SfiMnROsQCmP+UefJmb0TM=;
 b=G9PnyKMTJeAnoIIKUt8wnnFBkdxsMD+wsIplzUK6h2q4yEUh3qpbcZcEkoOmvCeg
 ZXKufRgwCXIcohFIVsy+pN2U0FcT/MXa6i9hQIC2Z5shT6zeOGt1kGYfjcwI58FWpjQ
 4Tni+lif2vFR0i73F2T7gIVB6QKtsOCJw9Xv4r/0=
Received: from edelgard.icenowy.me (59.41.161.142 [59.41.161.142]) by
 mx.zohomail.com with SMTPS id 165332404077472.6018843189238;
 Mon, 23 May 2022 09:40:40 -0700 (PDT)
Message-ID: <a7bdef698925136964b2215b94bcd53e1f153048.camel@icenowy.me>
Subject: Re: [PATCH] hw/sd/allwinner-sdhost: report FIFO water level as 1
 when data ready
From: Icenowy Zheng <uwu@icenowy.me>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>, Niek Linnenbank
 <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 24 May 2022 00:40:36 +0800
In-Reply-To: <CAFEAcA-5CxTPdzbwubjRvw-KwOAnW1vPP3O+acvURPD0kwXfMg@mail.gmail.com>
References: <20220520124200.2112699-1-uwu@icenowy.me>
 <CAFEAcA-5CxTPdzbwubjRvw-KwOAnW1vPP3O+acvURPD0kwXfMg@mail.gmail.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.18; envelope-from=uwu@icenowy.me;
 helo=sender4-op-o18.zoho.com
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

=E5=9C=A8 2022-05-23=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 15:14 +0100=EF=BC=
=8CPeter Maydell=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, 20 May 2022 at 13:42, Icenowy Zheng <uwu@icenowy.me> wrote:
> >=20
> > U-Boot queries the FIFO water level to reduce checking status
> > register
> > when doing PIO SD card operation.
> >=20
> > Report a FIFO water level of 1 when data is ready, to prevent the
> > code
> > from trying to read 0 words from the FIFO each time.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
> > =C2=A0hw/sd/allwinner-sdhost.c | 7 +++++++
> > =C2=A01 file changed, 7 insertions(+)
> >=20
> > diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
> > index 041e45c680..b66fd9bce7 100644
> > --- a/hw/sd/allwinner-sdhost.c
> > +++ b/hw/sd/allwinner-sdhost.c
> > @@ -114,7 +114,9 @@ enum {
> > =C2=A0};
> >=20
> > =C2=A0enum {
> > +=C2=A0=C2=A0=C2=A0 SD_STAR_FIFO_EMPTY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D (1 << 2),
> > =C2=A0=C2=A0=C2=A0=C2=A0 SD_STAR_CARD_PRESENT=C2=A0=C2=A0=C2=A0 =3D (1 =
<< 8),
> > +=C2=A0=C2=A0=C2=A0 SD_STAR_FIFO_LEVEL_1=C2=A0=C2=A0=C2=A0 =3D (1 << 17=
),
> > =C2=A0};
>=20
> Is there documentation on this hardware available somewhere?
> The Linux kernel driver for it doesn't seem to have a #define
> for this bit 17.

For the specific version on H3,
https://linux-sunxi.org/File:Allwinner_H3_Datasheet_V1.2.pdf .

>=20
> In an ideal world we'd actually emulate the FIFO itself
> (our pl181 and bcm2835_sdhost models do this, for example).

Interesting, I will check it.

> -- PMM



