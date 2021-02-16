Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A98831C59B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:39:59 +0100 (CET)
Received: from localhost ([::1]:52560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqHO-00066f-K6
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:39:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBqDL-0001Tn-DK
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:35:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBqDJ-0001ok-JP
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613442944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lX95MMvEp0xKfkJu4sxNRYrGyjCUNR8iHySqPQNcvBs=;
 b=Kx64a+pQW4JED3IpsiYMWDL0sucdCgUVyjPhAN/pZ3aekmRFIWMNzqPJWncMG6lToSNZ8n
 zAN15PnUPy3rh5MMc6RjHGaKzNcIXVKu4l/F0GXYpbxldMx/j2+LBdLf4a+KUqzdJTDxEm
 lPu6ECElF0rLBKcQHmBOy1QB7Dl18RE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-Vlsj7abzO_GGCl-s4d3Mxw-1; Mon, 15 Feb 2021 21:35:42 -0500
X-MC-Unique: Vlsj7abzO_GGCl-s4d3Mxw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87D358030C1;
 Tue, 16 Feb 2021 02:35:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-2-24.rdu2.redhat.com [10.22.2.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D4C65D9CC;
 Tue, 16 Feb 2021 02:35:35 +0000 (UTC)
Date: Mon, 15 Feb 2021 21:35:34 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/6] Python: close the log file kept by QEMUMachine
 before reading it
Message-ID: <YCsvdvjXvTe9Cvk1@localhost.localdomain>
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-2-crosa@redhat.com>
 <a6356c56-8652-e810-0f04-b0658912e8f6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a6356c56-8652-e810-0f04-b0658912e8f6@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8I6luAKdPr4uu9L9"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8I6luAKdPr4uu9L9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 05:04:24PM -0500, John Snow wrote:
> On 2/11/21 5:01 PM, Cleber Rosa wrote:
> > Closing a file that is open for writing, and then reading from it
> > sounds like a better idea than the opposite, given that the content
> > will be flushed.
> >=20
> > Reference: https://docs.python.org/3/library/io.html#io.IOBase.close
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   python/qemu/machine.py | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> > index 7a40f4604b..6e44bda337 100644
> > --- a/python/qemu/machine.py
> > +++ b/python/qemu/machine.py
> > @@ -337,12 +337,12 @@ class QEMUMachine:
>=20
> Is there a way to improve context for python functions? What method is th=
is
> in? etc.
>=20
> >               self._qmp.close()
> >               self._qmp_connection =3D None
> > -        self._load_io_log()
> > -
> >           if self._qemu_log_file is not None:
> >               self._qemu_log_file.close()
> >               self._qemu_log_file =3D None
> > +        self._load_io_log()
> > +
> >           self._qemu_log_path =3D None
> >           if self._temp_dir is not None:
> >=20
>=20
> Yeh, seems fine, though as wainer points out the interdependencies betwee=
n
> _load_io_log, _qemu_log_file and _qemu_log_path are not all strictly clea=
r,
> so it seems fragile.
>

Yep, agreed.  This was a first, conservative change.  Expect more later.

> But, this is more correct than it was, so:
>=20
> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks,
- Cleber

--8I6luAKdPr4uu9L9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmArL3UACgkQZX6NM6Xy
CfNFxBAA04K4E4LIyBMSZu3vLPNsquHFRyOPuF9xo8aCVNR1XIblUvUvRnAYLl0I
B7s3aSySat6k9WUpVfqb6L1rwGqCMuc6BOX3vwh3CYUHFf3hf1B0RgwNJdKzxcKD
6EeWkiQPrHiaMZ+7CN4AQQDmcdxLqoY83/6yurEvBpmFZyJxxt9gklg7qR2HbqXL
rVtDBdEzXL9vfGw959+8qleewICRcIn9LO62OZ7H+qbwBHwDPe6DOLQTsf3Fhe4b
3BHLW1Wl+wNriudG66SIHe0g7D0xeWawYuT/zsGrc9cxerHFrF48ARaNzCXvxVWc
yMil29nkxfJIMDIw8n44PN1LPRkGfYecZE8H3IzVHP+C3LKzwGpEpJQO+94AVmqI
zEUt7D5sYChTm9xgviWKrmLPEIS/lmC0HlX+HGtcv5+Ol5hgppbjvIvv4onS7182
8Fnp4xXcx1BkpK1DBJngJszawsiS8tIKDQ7VE7ZDuoi1ThH1dNB9uf7iOPQQBZTw
cfWk750k2tJHBaSQgsHdDDcnsHbPsQG7hFQ9+kpZO6ttqL5VBebrLDP7ISFurF+Q
iQ9qh7C52QWOxjw4ydTIxvt8exGKJEbBjc/GUR/7Xg6JDkpI3KfFmZT+Cpgk21xq
DNi9oOZtrxY+dGCn4NbMhnF42OPxKG3M8TrXBpoKixOZF587Gvo=
=zVMS
-----END PGP SIGNATURE-----

--8I6luAKdPr4uu9L9--


