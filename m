Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B428E3254FC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 18:57:37 +0100 (CET)
Received: from localhost ([::1]:32980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFKtM-000762-Ol
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 12:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lFKrf-0006B9-HF
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 12:55:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lFKrc-000637-BD
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 12:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614275746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gWFfCj3UotMHjBCM+T9L9RYfsLDNNltjShQ/OSrNNuc=;
 b=SB3x6uhNrIx38zID8X6hScEHihoMNtsupMnCXy3isf78fQV2uM8uKShBtXHSED6bxSxp+z
 pLjBe+vXB3h/5vIk4RvRRqsoKaYJ9xTYnL+UEfWJQcRTAkjt7SqRcppY1JsYyBoBIx5frz
 KeaQQqGVc5348sh9wjO2e+pxuuzxpQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-NsHMHVprOfqAAwNcIXLgGQ-1; Thu, 25 Feb 2021 12:55:42 -0500
X-MC-Unique: NsHMHVprOfqAAwNcIXLgGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5214C289;
 Thu, 25 Feb 2021 17:55:41 +0000 (UTC)
Received: from localhost (ovpn-112-60.ams2.redhat.com [10.36.112.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B2DF60BE5;
 Thu, 25 Feb 2021 17:55:41 +0000 (UTC)
Date: Thu, 25 Feb 2021 17:55:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: link to User documentation of
 https://wiki.qemu.org/Features/Tracing is broken currently
Message-ID: <YDfknAhXGblSiIzx@stefanha-x1.localdomain>
References: <0a40bb78-76ba-ea37-911d-c511ac785ec8@suse.de>
 <YDZ1WtyHEyP9iher@stefanha-x1.localdomain>
 <87ft1lbbfv.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87ft1lbbfv.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TO8cuPWTGwtrpgUJ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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
Cc: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--TO8cuPWTGwtrpgUJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 05:51:16PM +0000, Alex Benn=E9e wrote:
>=20
> Stefan Hajnoczi <stefanha@redhat.com> writes:
>=20
> > On Fri, Feb 19, 2021 at 07:31:21PM +0100, Claudio Fontana wrote:
> >> the link to User documentation of https://wiki.qemu.org/Features/Traci=
ng is broken currently:
> >>=20
> >> it points to:
> >>=20
> >> http://git.qemu-project.org/?p=3Dqemu.git;a=3Dblob_plain;f=3Ddocs/deve=
l/tracing.txt;hb=3DHEAD
>=20
> I should not I recently fixed the {{{src}}} macro to point at our new
> hosting location (although the breakage was due to the rst change).
> Perhaps we could add a {{{doc}}} macro to the wiki for this?

tracing.txt no longer exists. I converted the file to rST. I think
that's why it wasn't working for Claudio.

The {{{doc}}} macro sounds useful. Feel free to add it. I don't know
much about MediaWiki :P.

Stefan

--TO8cuPWTGwtrpgUJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA35JsACgkQnKSrs4Gr
c8jSawf/TTR152H3i9S/G7yNtYzlhlA5OmPI8zJjw6cHZCfnbjZXvDH6wVmTOxOC
pGIU1lcE+rRv64GV2zjewiZxr1Iox8qMhpIqefBoj+yayNn+8m5RBCurSVZONNmm
LX/WDpqqIIdons+BjHPO0aMcF5yQ64FgVXdKNxKXh1+4/JDBGh9Sw1OzurAJFUMQ
D2IXh9XsX01TD5Uk7aHvFQ7CigF1GKPI61+jVqVUsUNRUv/qbbt5DCg9uA7vv7UH
1gSpDrejyGB+W0lAaCJ2N58by7EoO3VzXC0yT59D8w93LRhXcBFhxfCfx62aB22D
75MRphJrMWrTRHzWf966e4AjUt/y/g==
=ONcN
-----END PGP SIGNATURE-----

--TO8cuPWTGwtrpgUJ--


