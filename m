Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694B6155AE6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 16:42:28 +0100 (CET)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j05lz-0003OT-6p
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 10:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44435)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j05kh-0002Rb-Fd
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 10:41:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j05kf-0007sm-Py
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 10:41:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28134
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j05kf-0007sD-Fn
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 10:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581090064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hHe7QT3WrtJG97is6xZUp0KanV9szXG/v5Vl8vPKjqw=;
 b=ijSsA/S6+Rb6S9EQ/H0mj6dw0i//70utTcbDNl8YTL0pT3dkyN4N+/Wd/Qhd1Ci1fItlZP
 qpjSjd2BR9jBW74YvK1p49omtAnfA9CmfXTjABsPq5wksx5WEUZAKe9jIbatpTt6B1nMW5
 Ig7F4NyuMEOICV3cL4UpYRDx4lGzSTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-k3nKEWM6OfuKkR3QD4t-9g-1; Fri, 07 Feb 2020 10:41:00 -0500
X-MC-Unique: k3nKEWM6OfuKkR3QD4t-9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEE2A8010D6;
 Fri,  7 Feb 2020 15:40:58 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-156.ams2.redhat.com [10.36.116.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A3D889F01;
 Fri,  7 Feb 2020 15:40:52 +0000 (UTC)
Date: Fri, 7 Feb 2020 16:40:50 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 08/29] qapi: Use ':' after @argument in doc comments
Message-ID: <20200207154050.GG6031@linux.fritz.box>
References: <20200206173040.17337-1-peter.maydell@linaro.org>
 <20200206173040.17337-9-peter.maydell@linaro.org>
 <87pnequ4og.fsf@dusky.pond.sub.org>
 <20200207102433.GC6031@linux.fritz.box>
 <CAFEAcA9a8G=RQASBxQGLMBU32w+G7un-xQwOHv4y56W1TQftPQ@mail.gmail.com>
 <87zhdupiem.fsf@dusky.pond.sub.org>
 <8779a304-7e47-6d2a-cfdb-787f42f27b8b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8779a304-7e47-6d2a-cfdb-787f42f27b8b@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 07.02.2020 um 16:01 hat Max Reitz geschrieben:
> On 07.02.20 15:43, Markus Armbruster wrote:
>=20
> [...]
>=20
> >     # @file:
> >     # Node to create the image format on
> >     #
> >     # @size:
> >     # Size of the virtual disk in bytes
> >     #
> >     # @log-size:
> >     # Log size in bytes, must be a multiple of 1 MB (default: 1 MB)
> >     #
> >     # @block-size:
> >     # Block size in bytes, must be a multiple of 1 MB and not larger
> >     # than 256 MB (default: automatically choose a block size depending
> >     # on the image size)
> >     #
> >     # @subformat:
> >     # vhdx subformat (default: dynamic)
> >     #
> >     # @block-state-zero:
> >     # Force use of payload blocks of type 'ZERO'.  Non-standard, but
> >     # default.  Do not set to 'off' when using 'qemu-img convert' with
> >     # subformat=3Ddynamic.
>=20
> FWIW, I like this one.

Looks like a workable compromise to me, too.

Kevin

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJePYUCAAoJEH8JsnLIjy/WZvMQAIgVCXydcTzrMFajghMnQS7J
9zIcxWNm1oJ2UJ+uyPxx6WSKwzp6916lBaN8lnEfjhqTJN1JdRX8lIxMeTlpzpK3
J9L1etspl8vStANbuGKtR3sVqKyOKTD2EhCLXOeJtFVls/fFT1KNnmGLCvuiKK8a
82dny2zgZ9v7bImOorvA6VubhlbMwLVFugPH30Fl3Nab9YSKpU87WfTFn5seHx3x
rAghLldzDd19rCo/hkWS9NTKQKtQz2R/lN4ZRf8uw39+Z1x4oNV9F6fSndT8C4i8
9Gvv5XK8v7EoDYcW7SsO8FLqEQXFzkj+2lnjGs8RYd4MUJVj7Pp1BX5XBjnDVhui
Zdqp/35s86nkC9PO0vvJAbgZehshsDumo+vHtsfKa/6PGv2vnLKUgJQxP/UMgoCo
gaxbb09rSgeL2JBHW3gOl1K+sVVEUUUtIJBAQtuX4/G5zU7eM/xuOPmVA39BWoZ/
RNj52rjdD1Lj4dzwYnJAH/kdfDke+rhHwHoWXjyr9vEB40PvMijCB9w44S2Jz2Mf
JmRCQjC0kbPM9bRFHZ1T6tR5H9OTv0luTAI0vWGByP1Vge28axdix5mzkCAkZxQa
wmehnUaJbbhcphZd+WVDqzEpuIi/TvWsLYKQCjgJCZLji4eUDE3/6kRgR52zuRzp
nYrukRBSXMToylYqU+ji
=M63U
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--


