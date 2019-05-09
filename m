Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264EB18805
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 11:54:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOflJ-0001jc-AP
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 05:54:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hOfkM-0001SE-Qj
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:53:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1hOfkL-00008a-NE
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:53:50 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46520)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1hOfkL-00007W-H8
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:53:49 -0400
Received: by mail-wr1-x441.google.com with SMTP id r7so1480716wrr.13
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DbIWUWqxAGumWDioI6RV55KDvhwhEz3fNUeYs21fZwQ=;
	b=BHSUTE0pr31Fh1KBmjHyCWTsHsUqDyUrEVWBtr/zCRRyvsUsZ3Apaffdv7FC6XMjFH
	IJu7/JK8A/V4kWXLjJZ9RNI5d/zreXEOrLjBaxgZBwYLBAGTlZjYJHD/5+dxouKAAcBl
	dRdDIEa1E6ydFmIucPXc3JhISID7N+wJxpdNM6xry1024Ryl7WIVBqzSIvsw+arGWK12
	Ghay7XM2y6LZ9du6xpHsyoOICvEKovgoLG+dgl7gAKlY5oO3ShqVdk93OxL3jf/auEmZ
	wuBrsW1rgRUELdi3c47yj6sK+Z652AKGafAEoS7rm6rDfP3dK7RDwIKy4tNSfSq2foHB
	ejIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DbIWUWqxAGumWDioI6RV55KDvhwhEz3fNUeYs21fZwQ=;
	b=iuT6GdHT9ZnLjd4joqeCmQoexh6sou27Noyuejs/64o4bAr2YnC+zDySxEm+Gw82Lp
	IN+f32U8+/A9LIlgEoiF+CeyrqQKDf4eR9Ld8FOoid0DAI3p3lo43M405bdC+Qb0lx8E
	eHylpyjiMq4WCUO/JJESwO0iXYBNRZtIR4mbLiRGOvWlau/YWEDLk6jkPi/kdhd2oawP
	9fGv46wsMRZPFUE8Un+7SY3ajLTBMM2JRvSvi/XCg46bckuT4MUbzPIYVMCDTRSCPOgN
	Hg+kyR+B3t4kWZsl+C/D9Miff3/C1+fNGHnOYwCNVk3Z1OARAe8STZ3bwEpr3v4rsgYQ
	8c4Q==
X-Gm-Message-State: APjAAAWakUFEu/fUAm6hkzhJhQhYZx+imdRJfNY8zXaftj50Cr9In3HE
	Fm1+XBtiMR+4fMR7zv51H27eFiIHm9XOejAGmXg=
X-Google-Smtp-Source: APXvYqwdkNabY1pIuztsOe25bmg0jraTw9GqqkiV/4k9rqbEPSGAZfNJEK6ixbja+ghQBYcv7WBI1lg/QaJ2QD8dlyw=
X-Received: by 2002:adf:cc8d:: with SMTP id p13mr2240135wrj.114.1557395627765; 
	Thu, 09 May 2019 02:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190503130034.24916-1-marcandre.lureau@redhat.com>
	<20190503130034.24916-5-marcandre.lureau@redhat.com>
	<20190509063220.cfahgzlujtcv5etr@sirius.home.kraxel.org>
	<CAMxuvaw9kOt3yoRk4sWPeRyUmRLWboCCyrO00W0Se+W-OOrGRw@mail.gmail.com>
	<20190509092418.65ftbkyy4qzki7jk@sirius.home.kraxel.org>
In-Reply-To: <20190509092418.65ftbkyy4qzki7jk@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 9 May 2019 11:53:36 +0200
Message-ID: <CAJ+F1C+CLuoHUNA-hhsEQhYDd1pjJ5EKN8WpBdO-RxS70gCLXw@mail.gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v2 4/6] Add vhost-user-input-pci
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, May 9, 2019 at 11:25 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, May 09, 2019 at 10:37:20AM +0200, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Thu, May 9, 2019 at 8:32 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > >   Hi,
> > >
> > > > +static const VirtioPCIDeviceTypeInfo vhost_user_input_pci_info =3D=
 {
> > > > +    .base_name =3D TYPE_VHOST_USER_INPUT_PCI,
> > > > +    .generic_name =3D "vhost-user-input-pci",
> > > > +    .transitional_name =3D "vhost-user-input-pci-transitional",
> > > > +    .non_transitional_name =3D "vhost-user-input-pci-non-transitio=
nal",
> > >
> > > virtio-input is virtio 1.0 only, so we don't need these variants.
> > > Incremental fix below, if you ack that I can squash it for the pull r=
eq.
> > > Or you send a v3 (in case you have other changes pending).
> > >
> > > cheers,
> > >   Gerd
> >
> > ack, thanks
>
> Spoke too soon, patch failed tests.
> New version (with some virtio-input-host fixes on top) pushed to:
>
>         https://git.kraxel.org/cgit/qemu/log/?h=3Dtesting/vhost-input
>
> Can you please verify?

Looks good, tested successfully.
thanks


--=20
Marc-Andr=C3=A9 Lureau

