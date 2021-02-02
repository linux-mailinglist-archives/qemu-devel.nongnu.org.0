Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD1F30C728
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:13:25 +0100 (CET)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zEy-0000nK-KI
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6yqK-0004De-MY
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:47:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l6yqC-0000Cd-TP
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612284466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jMnppbsyPeOjyaN7+KUVdwtuaSB6z3KgX+qwL6GlO8U=;
 b=f4e9noltlQ0Ubtge3o8Dib5uTz+j9SfIR0XUkdTpkzaAxKwsntBgW3Qow+wKogxVwZ9e1v
 mDUJjMKoH+d98iwkaQxyJ0dJRNz6IItcnL6dVcA5+BvGP8JZ2Go2wSCSSqe279GrmfkG8O
 MhSTLTBC3PhOoarb2rGWq5q4nb/h8OI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-WeHtSeYMMlaDYfx6GpQS0Q-1; Tue, 02 Feb 2021 11:47:42 -0500
X-MC-Unique: WeHtSeYMMlaDYfx6GpQS0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CADD11572B;
 Tue,  2 Feb 2021 16:47:40 +0000 (UTC)
Received: from localhost (ovpn-115-185.ams2.redhat.com [10.36.115.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54A4D5D9DE;
 Tue,  2 Feb 2021 16:47:40 +0000 (UTC)
Date: Tue, 2 Feb 2021 16:47:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PULL 10/11] trace: document how to specify multiple --trace
 patterns
Message-ID: <20210202164739.GA43647@stefanha-x1.localdomain>
References: <20210201154703.180022-1-stefanha@redhat.com>
 <20210201154703.180022-11-stefanha@redhat.com>
 <d5e9b59a-f7df-5a7b-55bb-cc6066b18a70@eik.bme.hu>
 <20210201161352.GH13157@merkur.fritz.box>
 <cbab5846-b5d-d256-89d7-b2bf9f7c69f@eik.bme.hu>
 <20210201165445.GI13157@merkur.fritz.box>
 <32b015e1-f182-8557-72d1-6827e4f0a09b@redhat.com>
 <20210201174622.GQ4131462@redhat.com>
 <283170d9-b1cd-de6c-ba47-dfa2babfa0a9@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <283170d9-b1cd-de6c-ba47-dfa2babfa0a9@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2021 at 07:13:27PM +0100, BALATON Zoltan wrote:
> On Mon, 1 Feb 2021, Daniel P. Berrang=E9 wrote:
> > On Mon, Feb 01, 2021 at 06:25:33PM +0100, Paolo Bonzini wrote:
> > > On 01/02/21 17:54, Kevin Wolf wrote:
> > > > > How does this option parsing work? Would then multiple patterns s=
eparated by
> > > > > comma as in -trace pattern1,pattern2 also work?
> > > > This would be interpreted as an implied "enable" option with a valu=
e of
> > > > "pattern1,pattern2". I don't think anything splits that string at t=
he
> > > > comma, so it would look for a trace event matching that string.
> > >=20
> > > Even worse, it would be interpreted as "-trace enable=3Dpattern1,patt=
ern2=3Don"
> > > (and raise a warning since recently).
> >=20
> > Maybe we're trying to solve the problem at the wrong level.
>=20
> There's no problem to solve, just trying to understand better what are th=
e
> valid options. It's already possible to enable multiple patterns with eit=
her
> events=3Dfile or repeating -trace options (with or without enable=3D) so =
that's
> already sufficient, I was just curious what other options are there and i=
f
> there's a simpler way that we could document. If not, using the current w=
ays
> that are now documented is OK I think.

The enable=3DPATTERN syntax is very limited. Repeating the --trace option
is currently the only way to enter multiple patterns on the
command-line.

Stefan

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAZgisACgkQnKSrs4Gr
c8hFiAf+MU9dlIGcPsml9C+wVZv0UknzdinJjTW6HCM9qDHtsvCnaB2usEqANMTu
9nDzKcySrWQ6WQnVW2RMYzn6iIRKql3NbfwbAa45/xJ6UIoSHXACyYWipsojlpKv
3n4U/vINDNaGSjzA5GbZj8MclfQFRdnILL8eDWHd/9nopQYls/gc9cM3CK/f8I2Q
scdHS6H5HVQBBPlztOYyd2HjT/Ggc/4ikK/YW011if6yJwQcRMM2JjxptRv20S6V
15/L49Irg6X/MgWSdxhecnxfHoUPAB2SmKXKm3EeOoJWnjKuyFyZ0gZhvqOusTxg
aTo1pAMveEUuqleYo/CUNkbhcIRSyw==
=TdZm
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--


