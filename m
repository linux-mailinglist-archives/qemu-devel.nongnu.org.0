Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0468C31974F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 01:14:22 +0100 (CET)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAM6G-00027S-Hz
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 19:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAM3n-0001Uo-8T
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:11:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAM3l-0003Y6-H8
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613088704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wbbVWf7nCUs7cOfVSH/AI4l58+3C6CAhX+j9VMirDFU=;
 b=e7WJD8KvNXMXECPCZTlVn3FakVUMdoHZl5KuL5rHfQSenwN+pmBLa6mpXqmRryilel6x8p
 smvcxoIsfjUOifHE5ENZAdlOvzOb0m+/7RpCtO7qJMP4uII7kWUD2+tMJDIU7ft4GvfCB8
 6IWrKDSmknCNbfvjPs4fgOlqYm9c/qU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-TAvbsacANAuRsIiUqf8vcA-1; Thu, 11 Feb 2021 19:11:40 -0500
X-MC-Unique: TAvbsacANAuRsIiUqf8vcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 815A38030B7;
 Fri, 12 Feb 2021 00:11:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-2-18.rdu2.redhat.com [10.22.2.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98D1018A50;
 Fri, 12 Feb 2021 00:11:34 +0000 (UTC)
Date: Thu, 11 Feb 2021 19:11:32 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/6] Python: expose QEMUMachine's temporary directory
Message-ID: <YCXHtBH9a14uihn0@localhost.localdomain>
References: <20210211220146.2525771-1-crosa@redhat.com>
 <20210211220146.2525771-3-crosa@redhat.com>
 <678e8133-afba-533d-9678-ff22604e499a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <678e8133-afba-533d-9678-ff22604e499a@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IJb2pcnx2nr5pKla"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IJb2pcnx2nr5pKla
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 12, 2021 at 12:35:26AM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/11/21 11:01 PM, Cleber Rosa wrote:
> > Each instance of qemu.machine.QEMUMachine currently has a "test
> > directory", which may not have any relation to a "test", and it's
> > really a temporary directory.
> >=20
> > Users instantiating the QEMUMachine class will be able to set the
> > location of the directory that will *contain* the QEMUMachine unique
> > temporary directory, so that parameter name has been changed from
> > test_dir to base_temp_dir.
> >=20
> > A property has been added to allow users to access it without using
> > private attributes, and with that, the directory is created on first
> > use of the property.
> >=20
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  python/qemu/machine.py         | 24 ++++++++++++++++--------
> >  python/qemu/qtest.py           |  6 +++---
> >  tests/acceptance/virtio-gpu.py |  2 +-
> >  tests/qemu-iotests/iotests.py  |  2 +-
> >  4 files changed, 21 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> > index 6e44bda337..b379fcbe72 100644
> > --- a/python/qemu/machine.py
> > +++ b/python/qemu/machine.py
> > @@ -84,7 +84,7 @@ class QEMUMachine:
> >                   args: Sequence[str] =3D (),
> >                   wrapper: Sequence[str] =3D (),
> >                   name: Optional[str] =3D None,
> > -                 test_dir: str =3D "/var/tmp",
> > +                 base_temp_dir: str =3D "/var/tmp",
>=20
> Not this patch fault, but I see we use /var/tmp since commit
> 66613974468 ("scripts: refactor the VM class in iotests for reuse").
> Can we use an OS agnostic method to get temp storage directory instead?
>=20

Sounds like a reasonable thing to do.  I do remember a few issues with
Python's tempfile.gettempdir() returning '/tmp' on most Linux/Unix,
dur to the fact that '/tmp' is a tmpfs filesystem on most modern Linux
systems.

Anyway, I agree that hardcoding '/var/tmp' needs to be reconsidered.

Cheers,
- Cleber.

--IJb2pcnx2nr5pKla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAlx7AACgkQZX6NM6Xy
CfOOSRAAsx/YSWbFYvYLth3/LQY2lu/HBHeSq8KeBjQDFYFYCf4QdwvVpEiaLofi
fjnlrmX+vBUrRtnnYbJdJNfGltGBth3ST9V2/+o7joKi7HTB6fAqGo/nGPgDwLK/
B4frSJnN18RMVFnIJOQw5fpxs2qXxh5uFE8KEJlelm11cLo2XrCKAgadE1huvIUW
rFtS6xPTWCZoXeVWsU2PT5wX4ocafbF9lx4b0TDOC64vTZ3uRpBa4ViwwUe/mhLa
uplApQ3PPp1iUsn94FolAXoHoT4+yQ0cKl6VsWUIsY6Ru6TFZSxRR6OtE7wLQx5m
zF3nEU00xOpx/cAP020N8ZM4LDUeV9Ko7+88nc3uywpyXgSAswKXcmAPiQIz4xkR
HR0MdWvIpSFSnxxu/jdRI1osxhrs/4q3KosNIzH0N5QKCaJiMyH6cAf79GF+NBhw
/mOh1GVN1ALLWxWE0P3Y/AbQ84X8BD/TYaSucTWZqTuqM7JYAda8HHM0f8zPBavn
oIYDyliwZu53MicEqaB1tmBWx2tat4m4ZcH4SrjBxI/N8+tF6pQr7YOuA/aF+nm9
O7jwZfXx47qo5gmrmRLCmuP1lEZoNZT2MfIZXXGsnSArxLS29dMUn1DhGF2P0iB9
PzvHVyLJ3ZwuG/b75jcfcN9O0iZB166Zir3z8Gc58CwMnHH0ZGM=
=O1rd
-----END PGP SIGNATURE-----

--IJb2pcnx2nr5pKla--


