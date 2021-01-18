Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9DC2FA731
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:14:42 +0100 (CET)
Received: from localhost ([::1]:35276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Y6z-0007yH-77
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l1XVY-0005RR-1W
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:36:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l1XVV-0002CT-U1
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610987756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SvTOao+WybnzDweKWjYDqv3bSiP35OnIrSByGm7NO3o=;
 b=QV8Pb3Xg2J60H6gZlJ94jE04glQKfIZ9vPKu+IIKXdzGPyXhoA85I074AssK/QLjloo7DN
 HZD5yo7QywYpT6teHZA/1WKJcnBfM0kANgrYR5vXl/dT7zezfVbOZlTpcLTy59X9RVjh6v
 hibNtRPbiuL+Y3t1zSjG8F8bAB0o3Xg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-McanboyuOeuOVVCqshzSOg-1; Mon, 18 Jan 2021 11:35:53 -0500
X-MC-Unique: McanboyuOeuOVVCqshzSOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70685800D62;
 Mon, 18 Jan 2021 16:35:51 +0000 (UTC)
Received: from localhost (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 426F860C67;
 Mon, 18 Jan 2021 16:35:42 +0000 (UTC)
Date: Mon, 18 Jan 2021 16:35:41 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v19 08/20] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Message-ID: <20210118163541.GC255498@stefanha-x1.localdomain>
References: <cover.1610638428.git.jag.raman@oracle.com>
 <02a82c80a35ab60b98028c85aa94f688a2843943.1610638428.git.jag.raman@oracle.com>
 <20210114162729.GB306329@stefanha-x1.localdomain>
 <CA0E47D0-F1F5-4825-ABB7-BE73AAD3E375@oracle.com>
 <20210114180035.GY1643043@redhat.com>
 <1DE4BD83-5AD6-4F70-8702-03DE1548DBED@oracle.com>
 <20210115092017.GA334489@stefanha-x1.localdomain>
 <C2D5772D-CA1A-4E06-9971-DCD589CF8CAD@oracle.com>
MIME-Version: 1.0
In-Reply-To: <C2D5772D-CA1A-4E06-9971-DCD589CF8CAD@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UFHRwCdBEJvubb2X"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, qemu-level <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, quintela@redhat.com, mst@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, felipe@nutanix.com,
 thuth@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com,
 =?iso-8859-1?Q?=22Daniel_P=2E_Berrang=E9=22?= <berrange@redhat.com>,
 mreitz@redhat.com, ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--UFHRwCdBEJvubb2X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 01:19:01PM -0500, Jag Raman wrote:
>=20
>=20
> > On Jan 15, 2021, at 4:20 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Thu, Jan 14, 2021 at 01:24:37PM -0500, Jag Raman wrote:
> >>=20
> >>=20
> >>> On Jan 14, 2021, at 1:00 PM, Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
> >>>=20
> >>> On Thu, Jan 14, 2021 at 12:55:58PM -0500, Jag Raman wrote:
> >>>>=20
> >>>>=20
> >>>>> On Jan 14, 2021, at 11:27 AM, Stefan Hajnoczi <stefanha@redhat.com>=
 wrote:
> >>>>>=20
> >>>>> On Thu, Jan 14, 2021 at 10:40:03AM -0500, Jagannathan Raman wrote:
> >>>>>> +int qio_channel_readv_full_all(QIOChannel *ioc,
> >>>>>> +                               const struct iovec *iov,
> >>>>>> +                               size_t niov,
> >>>>>> +                               int **fds, size_t *nfds,
> >>>>>> +                               Error **errp)
> >>>>>> {
> >>>>>> -    int ret =3D qio_channel_readv_all_eof(ioc, iov, niov, errp);
> >>>>>> +    int ret =3D qio_channel_readv_full_all_eof(ioc, iov, niov, fd=
s, nfds, errp);
> >>>>>>=20
> >>>>>>   if (ret =3D=3D 0) {
> >>>>>> -        ret =3D -1;
> >>>>>>       error_setg(errp,
> >>>>>>                  "Unexpected end-of-file before all bytes were rea=
d");
> >>>>>=20
> >>>>> qio_channel_readv_full_all_eof() can read file descriptors but no d=
ata
> >>>>> and return 0.
> >>>>>=20
> >>>>> Here that case is converted into an error and the file descriptors
> >>>>> aren't closed, freed, and fds/nfds isn't cleared.
> >>>>=20
> >>>> That=E2=80=99s a valid point. I=E2=80=99m wondering if the fix for t=
his case should be in
> >>>> qio_channel_readv_full_all_eof(), instead of here.
> >>>>=20
> >>>> qio_channel_readv_full_all_eof() should probably return error (-1) i=
f the
> >>>> amount of data read does not match iov_size(). If the caller is only=
 expecting
> >>>> to read fds, and not any data, it would indicate that by setting iov=
 to NULL
> >>>> and/or setting niov=3D0. If the caller is setting these parameters, =
it means it is
> >>>> expecting data.Does that sound good?
> >>>=20
> >>> The API spec for the existing _eof() methods says:
> >>>=20
> >>> * The function will wait for all requested data
> >>> * to be read, yielding from the current coroutine
> >>> * if required.
> >>> *
> >>> * If end-of-file occurs before any data is read,
> >>> * no error is reported; otherwise, if it occurs
> >>> * before all requested data has been read, an error
> >>> * will be reported.
> >>>=20
> >>>=20
> >>> IOW, return '0' is *only* valid if we've not read anything. I conside=
r
> >>> file descriptors to be something.
> >>>=20
> >>> IOW, qio_channel_readv_full_all_eof must only return 0, if it didn't
> >>> read any data and also didn't receive any file descriptors. So yeah,
> >>> we must return -1 in the scenario Stefan describes
> >>=20
> >> That makes sense to me. Reading =E2=80=9Cfds" is something, which is d=
ifferent
> >> from our previous understanding. I thought data only meant iov, and no=
t fds.
> >>=20
> >> So the return values for qio_channel_readv_full_all_eof() would be:
> >>  - =E2=80=980=E2=80=99 only if EOF is reached without reading any fds =
and data.
> >>  - =E2=80=981=E2=80=99 if all data that the caller expects are read (e=
ven if the caller reads
> >>    fds exclusively, without any iovs)
> >>  - =E2=80=98-1=E2=80=99 otherwise, considered as error
> >>=20
> >> qio_channel_readv_full_all() would return:
> >>  - =E2=80=980=E2=80=99 if all the data that caller expects are read
> >>  - =E2=80=98-1=E2=80=99 otherwise, considered as error
> >>=20
> >> Hey Stefan,
> >>=20
> >>    Does this sound good to you?
> >=20
> > The while (nlocal_iov > 0) loop only runs if the caller has requested t=
o
> > read at least some data, so the fds-only case doesn't work yet.
> >=20
> > This suggests that no current QEMU code relies on the fds-only case.
> > Therefore you could change the doc comment to clarify this instead of
> > adding support for this case to the code.
> >=20
> > But if you would to fully support the fds-only case that would be even
> > better.
> >=20
> > Stefan
>=20
> We are working on sending the next revision out. We could handle the
> fds-only case by altering the while loop condition to be:
> ((nlocal_iov > 0) || local_fds)
>=20
> For reference, we would need to handle the following cases:
> len < 0; !partial, !*nfds       =3D> ret =3D -1;
> len =3D 0; !partial, !*nfds       =3D> ret =3D 0;
> len < 0; partial, !*nfds        =3D> ret =3D -1; errmsg;
> len =3D 0; partial, !*nfds        =3D> ret =3D -1; errmsg;
> len < 0; partial, *nfds         =3D> ret =3D -1; errmsg, clearfds
> len < 0; !partial, *nfds        =3D> ret =3D -1; errmsg, clearfds
> len =3D 0; partial, *nfds         =3D> ret =3D -1; errmsg, clearfds
> len =3D 0; !partial, *nfds        =3D> ret =3D -1; errmsg, clearfds
> len =3D 0; !niov; (nfds && *nfds) =3D> ret =3D 1 /* fds-only */
> len > 0                         =3D> ret 1

Yes, I think that looks right.

Stefan

--UFHRwCdBEJvubb2X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAFuN0ACgkQnKSrs4Gr
c8jyPQf/fEe3XAzd2QSqE9QaYFssk+uyg67z+WY6fagWAFVTHAGTm4PGuaFlPnT+
OFapR8Rw78UV2voeNCE6933kSVjmJwihMXjlvpAmka3i/6RvFvSewcZqL8rNNFqN
fvmD1OT8sny1L5r3ItI6CFcfuzN+lbHC14PRS4qUjQduq6ZhBql0WCq+V9e1pJSx
8wpQPu1B3rq4c2bg2C7WwY+q6ejkGaQ8Bud02PwKVOVSv0RCOY0bJbtPya7OMMQi
yOzn76n0rFIC7x6KtaUKEfjyp3C14gcsNqX8A+s6cQTjXQxS9FRX/x5xdJ1IdXJc
G3ZhPcEPHV2DBPrwI21HtqVCnYcJJA==
=Nbto
-----END PGP SIGNATURE-----

--UFHRwCdBEJvubb2X--


