Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369A10B4C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 18:27:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLs4n-0006m2-9n
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 12:27:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hLs3d-0006M4-Si
	for qemu-devel@nongnu.org; Wed, 01 May 2019 12:26:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hLs3Y-0001cx-3t
	for qemu-devel@nongnu.org; Wed, 01 May 2019 12:26:08 -0400
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142]:36427)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1hLs3W-00014V-KP; Wed, 01 May 2019 12:26:03 -0400
Received: by mail-it1-x142.google.com with SMTP id v143so10615638itc.1;
	Wed, 01 May 2019 09:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7y7T5IhOFv7uW/nPm1YBGwfS4GWdswk4MeV+DNzF0y4=;
	b=Q24KwylrvZJBZWneHzfgD72TIgfWL7+m3r5rSuLMYd1+yI6QZ49YhhSiHgjBXD6t+c
	CCGqeYeY/jx8yUz8RYlGYruBgnHOzGAje9pKeSpMsu5sHiQ3oA8SJO6F4xU86Y8vlZDd
	9xfQFCj8ecRRxn1sEr5d5fyy+azQTKtjQr3a/5wDBUVfzf/WWEVvIVqlUCY7kIYtYn8R
	j4ZhyPFNJuDJbc2xWshOxHI4wR84egslpRqmbRvpfeKG0klGUjplylalpaP76jaTqBqP
	RSSJZDNL4Aq1FNcir3vz3HZnes99hDPLWGpGIEfKGckeIAhO95UPClGO6AUE8grcCFWC
	Z01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7y7T5IhOFv7uW/nPm1YBGwfS4GWdswk4MeV+DNzF0y4=;
	b=B39YFasNbeDHqoeIhBKRC+RTogbCRiPUUTKTY5icXwjbqcTkSj5m/dz6ZwcplqUhz4
	V3AZLEhJFqzaCChiQNUtHRFN4GUqF3xu6IcRetaXWaCNHENmKES0uwuYRKSXCIfhAmJG
	cTIm2TmIvrjr7tkw8kc69Ou3h7hb8zMp7URC1jAGZlCeoot4IK5Az9pxknqsFIpcBsS2
	LVP9MxwteMLC5LfAxLS3xHDWkd/lzyL0hhZZKNbBiThevNxXPmFz4Z8hKjOxgCXVI3el
	Dn29XNn/A7pY61NQvmiRwu4rE6KjarYnT8ZNbd5e6vUWk1RdHoq4Kwb6QXQXrb+2/wtE
	65oA==
X-Gm-Message-State: APjAAAWMG8JEHtnNNj2w+uxJct6C1URsXNEXfgX7zad1dtv2Pz03J+fT
	EPkLpeKBKt6BhgsKq0XVuKY=
X-Google-Smtp-Source: APXvYqxq/NkEUQGk2G852nhgWiUKVYBBNR49BNJTFybzzQqN5o/7xe1Nj3Ho8pafl+FrIoS3BYyuVw==
X-Received: by 2002:a24:c685:: with SMTP id j127mr9364720itg.21.1556727953812; 
	Wed, 01 May 2019 09:25:53 -0700 (PDT)
Received: from localhost
	(CPE64777d5479c3-CM64777d5479c0.cpe.net.cable.rogers.com.
	[99.228.64.175]) by smtp.gmail.com with ESMTPSA id
	n184sm3324333itc.28.2019.05.01.09.25.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 09:25:52 -0700 (PDT)
Date: Wed, 1 May 2019 12:25:51 -0400
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190501162551.GE21155@stefanha-x1.localdomain>
References: <20190103144124.18917-1-stefanha@redhat.com>
	<CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
	<62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com>
	<20190426091702.GA2071@stefanha-x1.localdomain>
	<CAFEAcA8OVKO087uiNvwDGObiaxHAPYHwoXLEN1t5Y4v9B43r9A@mail.gmail.com>
	<20190429122819.GB7587@stefanha-x1.localdomain>
	<CAFEAcA9_=a72BAmyb0eJhLF_nYLhRb_O7e=__MPazQ0nLC9Tmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9_=a72BAmyb0eJhLF_nYLhRb_O7e=__MPazQ0nLC9Tmw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::142
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel
 argument"
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
Cc: Jim Mussared <jim@groklearning.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Julia Suvorova <jusual@mail.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 01:58:46PM +0100, Peter Maydell wrote:
> On Mon, 29 Apr 2019 at 13:28, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > On Fri, Apr 26, 2019 at 12:45:37PM +0100, Peter Maydell wrote:
> > I was going to add a function to check kernel_filename and the presence
> > of -device loader.  Then each machine type init function would call the
> > function with flags indicating which modes are allowed:
> >
> >   /* Allow both -kernel and -device loader */
> >   check_kernel_loaded(KERNEL_CMDLINE | KERNEL_LOADER);
> >
> >   /* Allow only -kernel */
> >   check_kernel_loaded(KERNEL_CMDLINE);
> >
> >   /* Allow only -device loader */
> >   check_kernel_loaded(KERNEL_LOADER);
>=20
> Every machine should permit -device loader: the point
> of it is that it is entirely generic and works the same
> way on every machine.

It seems every person has a slightly different preference :).  Can we
reach a consensus?

1. Should QEMU print a readable error message when launched without a
   kernel?

If yes:

2. What checks are sensible?

Stefan

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzJyI8ACgkQnKSrs4Gr
c8hBDQgAtG/Dxap2gsiS1yWR1zi3RCHdY8hzRGJ1Sp/514jLWc/nWTfBRM+nIkd0
Um+NzuJwoX+M0eeECmfMJOrhmimHIHS1P3fZChGWzucj7eQb0RDV741Ahs+olxJk
ri+N0mNQMtHn3RUURRDDSeHrJedLPYvLZSYsUpIeVxywyWv1wmnRn+yE7GrBKi3L
WprN/VWQZiduVLlm7/eMjsbcJ5AIalTowuNJoCtXRc0YxjHwcOlAfrtDL9vkE0Ln
mdHCxbHy+oRBerkH4ziudOj7galnyjRLZJ8jVqgwN/FVGuMv3WJlKWtMsGqUlWrh
Zcy4zMSeom55p74grZ+MDxZmjUceeA==
=q6kg
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--

