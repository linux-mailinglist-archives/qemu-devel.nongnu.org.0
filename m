Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F138C3313E9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 17:56:36 +0100 (CET)
Received: from localhost ([::1]:51928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJBL-0002gP-Ow
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 11:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJIym-0002Vk-8C
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:43:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lJIyc-00035c-39
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:43:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615221800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DFrG1ztoxprnRzZh7CDeEayBQ28Ggyu9obFeDRMQkls=;
 b=TZxYNVI+JkQZMPMbUJoLRsaIZbJQ5MWSbZ0rMpXyXErmbs4ix9bx+txaLtTZVlL8tVcTp+
 Vgde85rTXpPpOqnBQ5+OlHLq1e9Ut+HulvNjcsS4RezSTnzybSKo01XiHvUVWOOZsTwC28
 1uyiKYF6RaiDlv9r40925lOajTdhM6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-jRPiCzXgPUeL0kgE7yN53A-1; Mon, 08 Mar 2021 11:43:17 -0500
X-MC-Unique: jRPiCzXgPUeL0kgE7yN53A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24E4383DD22;
 Mon,  8 Mar 2021 16:43:15 +0000 (UTC)
Received: from localhost (ovpn-114-104.ams2.redhat.com [10.36.114.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A78565D6D7;
 Mon,  8 Mar 2021 16:42:54 +0000 (UTC)
Date: Mon, 8 Mar 2021 16:42:49 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 00/14] deprecations: remove many old deprecations
Message-ID: <YEZUCUUEDDpWmjvJ@stefanha-x1.localdomain>
References: <20210224131142.1952027-1-berrange@redhat.com>
 <CAFEAcA-Dvdg3L8rZT=yxjct-EkYcUzWAu2AZY67dKO6cRcvXzA@mail.gmail.com>
 <0beb85a8-500e-4c12-2f94-5bdb85edf984@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0beb85a8-500e-4c12-2f94-5bdb85edf984@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TboGIHx0SJZA7d87"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--TboGIHx0SJZA7d87
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 04:21:13PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/24/21 3:38 PM, Peter Maydell wrote:
> > On Wed, 24 Feb 2021 at 13:21, Daniel P. Berrang=E9 <berrange@redhat.com=
> wrote:
> >>
> >> The following features have been deprecated for well over the 2
> >> release cycle we promise
> >>
> >>   ``-usbdevice`` (since 2.10.0)
> >>   ``-drive file=3D3Djson:{...{'driver':'file'}}`` (since 3.0)
> >>   ``-vnc acl`` (since 4.0.0)
> >>   ``-mon ...,control=3D3Dreadline,pretty=3D3Don|off`` (since 4.1)
> >=20
> > Are the literal '=3D3D' here intended ?
>=20
> No, this is a git-publish bug:
> https://github.com/stefanha/git-publish/issues/88
>=20
> Apparently the fix is not yet backported to Fedora.

Thanks for reminding me. I'll roll a new git-publish release and package
it in Fedora.

Stefan

--TboGIHx0SJZA7d87
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBGVAkACgkQnKSrs4Gr
c8gNLwf9GnswLOgmZsxxl4cUzetK7h737mkjvKB4pt6JyQaztyPWy8y+XwS34l2/
6EABcRdiyEXdFquzBZEQG9dgydh+vrwHf8WQC/oCYI4xfToqg4tr4H8VvI6WUvSQ
kx7Pc5A8zKihT8oJn9CxGOHm5DZPsi4Fge9YpkdyKqFvRVOHdH2EIdBgGmXPJIjN
ekoa1eF4+tF1WKseoINqRmwfvPudJJ1kR3i0fO5T1bV3vH0G+zaRP7jpqwuzFMte
xz2aVjRWEw1J5cNF5oZIjFCtrzlwLtKfvdW2Atyy42Ks/tffej5M38KU3W74i3Hu
wWrl2ebcESYBFhydut4ECO5qd7alwA==
=hSpS
-----END PGP SIGNATURE-----

--TboGIHx0SJZA7d87--


