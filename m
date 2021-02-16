Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945C131C5A9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:48:13 +0100 (CET)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBqPM-0006vM-Lc
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBqCA-000856-EI
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:34:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lBqC1-0001Gk-Qp
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613442864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oWpchTdeMVgqXxuLe/Ehsvk21x+alfRqumsm6s77yzo=;
 b=H79k4x/XirDrRyf/+CLwZO/ND1FSEML/WCEL2fJPerpqKdm+5+eRfY3zovu2wT+ToK2L7A
 iNRcrqeq4oarjEYb/PW5JfNEEYykIl+nK5E7PcaD+5tSg8QfWDPGFFdZ3ITr1K3hmXIlV9
 TczctNv6pQsxmTXwCcSBJN+9IgcSPy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-_LyuAtzXMZWzhoeB5Fl4Hw-1; Mon, 15 Feb 2021 21:34:22 -0500
X-MC-Unique: _LyuAtzXMZWzhoeB5Fl4Hw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9C1C801962;
 Tue, 16 Feb 2021 02:34:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-2-24.rdu2.redhat.com [10.22.2.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FDF719719;
 Tue, 16 Feb 2021 02:34:15 +0000 (UTC)
Date: Mon, 15 Feb 2021 21:34:14 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 1/6] Python: close the log file kept by QEMUMachine
 before reading it
Message-ID: <YCsvJmgQbWywPUj1@localhost.localdomain>
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-2-crosa@redhat.com>
 <965f7460-bbaa-bde4-ef93-e8f968f06907@redhat.com>
MIME-Version: 1.0
In-Reply-To: <965f7460-bbaa-bde4-ef93-e8f968f06907@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qK0OXOWl370V8J32"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, John Snow <jsnow@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qK0OXOWl370V8J32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 03:30:16PM -0300, Wainer dos Santos Moschetta wrote=
:
> Hi,
>=20
> On 2/11/21 7:01 PM, Cleber Rosa wrote:
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
> >               self._qmp.close()
> >               self._qmp_connection =3D None
> > -        self._load_io_log()
> > -
> >           if self._qemu_log_file is not None:
> >               self._qemu_log_file.close()
> >               self._qemu_log_file =3D None
> > +        self._load_io_log()
> > +
>=20
>=20
> IMO it's a too fragile fix. It needs the `self._qemu_log_file.close()` be=
ing
> called before `self._load_io_log()` but a future change can make this
> condition unmet again. Maybe you could document that in the code. Or chan=
ge
> the `_load_io_log()` to close the log file if it is open (also document i=
t
> in code).
>=20
> - Wainer
>

I'm glad you see this is needed... and then something else.  I'll investiga=
te
making this more robust as time allows it.

Question is: do you ack/nack this change?

Cheers,
- Cleber.

--qK0OXOWl370V8J32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmArLyMACgkQZX6NM6Xy
CfNGeg/+PeEsKhdBxv7MFQ840JeN5U0v1Hn8NA/H1XNJlNiEEvPdYmzJjjVk6bWv
dS814xCiVFOl+2RX7kCCZ+8ZvLs7GUDFsYQSHnLe6VhU2jV71BAMwl04IuobJRBt
2xIKEnUAooX/8cHeAunpmrPNevpyWbeDwmiEVBEFb6HdiDP37QegICquMH0DOWKl
/IN1v9hG7Sd+g2mBjCxoZM2wbbYh5qKsvYL+jjbcTct191sV0d9klG64AIPTijNO
KBrxX6+kcXd3vIlUs5Ug6mRd3Ym4yv7/LL9CW8N2S5KppoEVRh7RXtw4kkCrXkpj
3nMSrzOnp9cOwuViE0VCA3arvmQ6vL4DBCKzE+/DgnSvInxI9E/O0aqe21FXMiO0
6ST8P47dGnJc6Lz1VKWdnoqlSoqWHrUZUzyodR/XJBogw5OjNxwlm8MJ0HtV6u/O
rccVlTAERjuvnNxn++k+T2f1e9IVDgvrdrVlkZHjrFCN+FSXjmhDxMt9mt5/3d2E
I7xLPBpg7MSTgBU+Zyn96fUDNlmcHVm9qGQpEUqwjtEf5Ocet0oxiK3s+xZzDV5I
y+8d7ueSrQnhnwBXHxUH5M7d+mPK/MtzQDgzG2hpPZxXJsIh6B77XXJhQ+XZAdzK
RmiMtOd3QGQMv8k+p8YBXa2zzt4oR8pkn+YLsxK99YQIDHZ9mxU=
=vWTW
-----END PGP SIGNATURE-----

--qK0OXOWl370V8J32--


