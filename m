Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52677167B6A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 11:57:19 +0100 (CET)
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j55zi-0001Bu-CK
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 05:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1j55yr-0000kX-ED
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 05:56:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1j55yq-0004pQ-BI
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 05:56:25 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1j55yq-0004ov-4n
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 05:56:24 -0500
Received: by mail-wm1-x32c.google.com with SMTP id a9so1277181wmj.3
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 02:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bcRi750Lp2d08cvBZefYbVt8o+FJBZHBK546knWc/t8=;
 b=u1t5g7c127bq8XgHQwLpJArEpP6Zb6LfTu6Bw9/AH7CZ/URHwCJHPFoS0f5jbFeNln
 Ec7fY0TgUeSwyl9fKvfLTfFN2UrQfpzCkuag3R9HUWHpntlFyyxowvH1qZLexURYfUyj
 F/oNqwY6G1RIvZcvdTpE0yggfJ5zA/u43wQ7yoKcUOoFsXEeACzsqWohAr/U3REAj6lp
 r/mtmk08hBCKqNK++UqVSMaXjKZUBmeOKV9Ow7A9+J7r3qBgfVhE0pHpUUPl2tzPK++T
 0TESSVHoW6Gow2M3dgdBmjoKyqW5Yvn/jMwbYaIXCeX7gPOHqz2veyQvBxi9i2Prhpr3
 jNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bcRi750Lp2d08cvBZefYbVt8o+FJBZHBK546knWc/t8=;
 b=Z+KhJcJRRz9l86xPXExW+U9yA7nHRe6QyEWgurgPWnD8fmSe6oVzG494F94vyBb37K
 mM6k8BZLZJKdBejrc1osWGdhTMx0Yb4oLU8ERFWyMVrIpbvN1wJ7VVYV5szZN/BwWMoT
 t3jMveJW62GirToP3JJRa5UhrXNRoIX1W4JQjxaCLb11SRUL+1vwjfjHQimCS7JzHgg5
 XGXZBmmaSQ36l3oC9fwwevGIdNGaV4FLLnnLvqM1QwlnwfTpAg7cT+qt13NtBm5bT2uZ
 unNEJoae7HyWtLQT6DyECRywEOy9iEcIHkFQ85n6di2ceZDiQdkviayrYoYeXlCCDegs
 LLIA==
X-Gm-Message-State: APjAAAVKrJh24W692Jf2HZkjXtT3yU9nMMwmfVJMelwRzvA0DTuNKz7R
 agYpPoW3151WgeJZoBFHvonBxSkXsx84Aw==
X-Google-Smtp-Source: APXvYqxTVYY+HsWX2MXEm3S8Gp55EOUZzb0mDa+ncxEUDBmgTBasmsfxjt5JTyq9g99g9blN3wyVWA==
X-Received: by 2002:a05:600c:2c44:: with SMTP id
 r4mr3044573wmg.140.1582282583038; 
 Fri, 21 Feb 2020 02:56:23 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id z8sm3493006wrv.74.2020.02.21.02.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 02:56:22 -0800 (PST)
Date: Fri, 21 Feb 2020 10:56:20 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [GSoC/Outreachy] Arduino complete setup visualization and
 emulation
Message-ID: <20200221105620.GD1484511@stefanha-x1.localdomain>
References: <CAAdtpL524K2QFSU9ZK2zbW_EJyiDPJ=efhwRWVzCpsJUP6HioA@mail.gmail.com>
 <20200211105119.GA422372@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline
In-Reply-To: <20200211105119.GA422372@stefanha-x1.localdomain>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32c
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
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 10:51:19AM +0000, Stefan Hajnoczi wrote:
> On Mon, Feb 10, 2020 at 08:58:28PM +0100, Philippe Mathieu-Daud=E9 wrote:

Ping?

QEMU has been accepted as a mentoring organization.  Please post a final
version of this project idea on the wiki:

  https://wiki.qemu.org/Google_Summer_of_Code_2020

Thanks,
Stefan

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5Pt1QACgkQnKSrs4Gr
c8iLUQgAw/9F/BumsE/sU1RGhjYHWn+v8hCj+0lLaG/uhAOte8ksWhwCnd7nIWHT
9xL09MxYz0GIDONuF7EhwjReeJ+Sqxnn3SrJq+8o9mQ42JvS31X+/ZIh2VDYQtPc
BDRxWPIkZFsKdjtwnTzExObisiCg0jl5oOq7+y0CtDJm16w/5rGJ7tiKfOg+VVjH
TChzAGyx9IMLeybTwath8ZgJecDTSgq+FdvgT3TvtpbQeBffjnqBO6YDAh2nAfU0
i3h18Gnsuk72wqUhnNf7N/Id+KNQvXqNhDXqKSehWQOkYL+MBev2gkqaBxlg3u70
JA2TP2TCRm4v8OfnFkPztY+LqZ5Cbw==
=UaYM
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--

