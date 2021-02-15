Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E71E31B82B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 12:41:08 +0100 (CET)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcFX-0006R7-JC
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 06:41:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBcE7-0005Zh-Dp
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:39:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBcE4-0006Mo-Ft
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 06:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613389175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W0kngZD/FWy1eNonOhtIdPeG6zl7r+JHceRKBcx6yLs=;
 b=QlWHyBp0p2vGt5OW90gi6dsaszkelk0f16XT3S+IAIK9UHE5tl9fT5SrHvwxfprgT3Ddd0
 LoAF5ASK5vMd8yBREMUnXjG4kvEwhbIdYHfGNrQAFcLGiqXNqrdsUsCrdFMz4Yn9M/heEP
 qiAIgux3jmP5dN+2HddFtZUPZ2ZF3j8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-Z5hWqi_mOBGPJNp6LvTy7A-1; Mon, 15 Feb 2021 06:39:33 -0500
X-MC-Unique: Z5hWqi_mOBGPJNp6LvTy7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 372D2192CC40;
 Mon, 15 Feb 2021 11:39:32 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD6A910016FA;
 Mon, 15 Feb 2021 11:39:26 +0000 (UTC)
Date: Mon, 15 Feb 2021 12:39:25 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
Message-ID: <20210215113925.GI7226@merkur.fritz.box>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
 <afd6945e-2666-1b80-70c8-27564cf5ac5@eik.bme.hu>
 <20210113141517.GB255928@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210113141517.GB255928@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 13.01.2021 um 15:15 hat Stefan Hajnoczi geschrieben:
> On Wed, Jan 13, 2021 at 01:51:17PM +0100, BALATON Zoltan wrote:
> > On Wed, 13 Jan 2021, Stefan Hajnoczi wrote:
> > > On Tue, Jan 12, 2021 at 09:44:03PM +0100, BALATON Zoltan wrote:
> > > > On Tue, 12 Jan 2021, Stefan Hajnoczi wrote:
> > > > > It is possible to repeat the --trace option to specify multiple
> > > > > patterns. This may be preferrable to users who do not want to cre=
ate a
> > > > > file with a list of patterns.
> > > > >=20
> > > > > Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> > > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > ---
> > > > > docs/devel/tracing.rst | 9 +++++++--
> > > > > 1 file changed, 7 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
> > > > > index 4ebf8e38ea..8777c19d14 100644
> > > > > --- a/docs/devel/tracing.rst
> > > > > +++ b/docs/devel/tracing.rst
> > > > > @@ -22,10 +22,15 @@ events::
> > > > > This output comes from the "log" trace backend that is enabled by=
 default when
> > > > > ``./configure --enable-trace-backends=3DBACKENDS`` was not explic=
itly specified.
> > > > >=20
> > > > > -More than one trace event pattern can be specified by providing =
a file
> > > > > -instead::
> > > > > +Multiple patterns can be specified by repeating the ``--trace`` =
option::
> > > > > +
> > > > > +    $ qemu --trace "kvm_*" --trace "virtio_*" ...
> > > >=20
> > > > QEMU options are single dash with double dash accepted for compatib=
ility but
> > > > help and other docs have single dash so these (and below) should be=
 -trace.
> > > > (Also a bit less typing for otherwise already way too long command =
lines.)
> > >=20
> > > Is this documented somewhere?
> >=20
> > Maybe qemu-system-* -help ?
>=20
> I mean developer documentation like CODING_STYLE.rst so we can point to
> that when someone submits a patch that does not use the preferred
> syntax.
>=20
> > > I was under the impression that '-' is legacy syntax and '--' is the
> > > preferred syntax. There are examples of '--' on the QEMU man page.
> >=20
> > -- is also accepted but they are the same as single dash options. Some =
tools
> > may have -- syntax preferred but not QEMU itself. If so that may be an
> > inconsistency.
> >=20
> > > Let's reach agreement, document it, and then make the documentation
> > > consistent.
> >=20
> > Since we don't have long and short arguments for the same options (like
> > -m,--memory) I think -- does not make much sense. Also single dash is l=
ess
> > typing and there are other programs using the same convention (e.g. who=
le X
> > Window System) so I think the current one dash options are fine and sho=
uld
> > be kept consistent. As long as we can agree on this I can agree with th=
at.
> > :-)
>=20
> I'm fine with either (or even using both interchangeably) but want to
> make sure it's agreed for all of QEMU so we can really follow it and
> don't need to spend time on it in the future.
>=20
> Kevin: You used '--' in qemu-storage-daemon --help. Does this mean you
> want QEMU to stop using '-'?

qemu-storage-daemon just follows the example of the other tools which
use getopt() instead of a hand-written parser, which means that in all
of the tools, long options require '--'.

I don't have a strong opinion about '-' in the system emulator, though
if I tried out dropping it, I guess I'd find my muscle memory does have
one.

Kevin

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmAqXW0ACgkQfwmycsiP
L9ZFoA//TM9+d0nF/6bbajRdJ0C2FUzKk5hE0oBxITCYYyMfMmT1eGghh2r62sLS
/mr9mVEAWB9Yf4ldUYztYVYkAx8FLuiIPmJ4BgUMnf0R3EYn5aDYOyt4ptnSuOlo
kN0vhdrFB96z+kmopY73Gv/Y/W39l2SCNQRifiKa/X9RxKm46ZdwgmLY5iNo3mHp
wDpC+7u2EyMBygMRnoLj24xIdUoQ93uSGITt670lAVguRlmyjNY4pBXHBMozpPUB
6vBXnGM4pB/OcWbvJpJJDbUeZhlPDEsytjekLQ4LVpCh7cPYeY++LrnI7cw4ft7M
z+pdmurjjN2+92kU4C1U6s016eGrkWN+IcwD6X9RCLvTlEZCLs1CkuB0NlmJUlOe
uivi3eac3X2/MqFbx+j6WbVvxTL8tCUhgRuJC9kIsnU0+zzQl0NrdvbQtrD5Rz+W
Iq74jypYr/7JxXAMHEepisYUPZT3Tqhl2N9bNIwAGOOACMTJsVyN6dQnJuSYKyyy
y3enNM1WPeB56/Jfex6Bfe8CFnUguazcJNI+qsPoub8f43MgVP4PnR3oZNWsYaU7
XYSj8ph6yDBMqKs5j5RMggu20QFtDIhBemm6PHms2grgd4Yn2G+ZLJWYO7yf9m9/
JudRlgdCUnlIULdDvXgQCak1J7p07bpnfTAUqrHkThDD5gs4SgU=
=n3fc
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--


