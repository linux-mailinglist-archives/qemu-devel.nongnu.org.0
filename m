Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57D14AEED8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:04:07 +0100 (CET)
Received: from localhost ([::1]:34342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHjpW-0000aE-Bk
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nHjjX-0005mP-Qe
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:57:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nHjjV-0008BT-L9
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 04:57:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644400669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9NVLIMxaN+GDcfoHeBbHlQGtAFd/+MIxN8jerdO0Bj8=;
 b=S1DLIPprFCQkQ/ppEznAp14+6LrHAHZbVXeLPcMFsU1FYSIdfjiWbVaVM+wdtDOulCCIQs
 zAVvRX71WqSyTvOABnpb/6vXc0Nh/9UxOo6Xr62fmU0BtaNvbBJctPGYL6T7cG8TAtafjh
 UxUFMOTgI2N2L4rM8kGj+4aO2M4eE6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-uiEX_8MfN7WIIkVb5ld5NA-1; Wed, 09 Feb 2022 04:57:46 -0500
X-MC-Unique: uiEX_8MfN7WIIkVb5ld5NA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EC391091DA4;
 Wed,  9 Feb 2022 09:57:45 +0000 (UTC)
Received: from localhost (unknown [10.39.193.233])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B25FE108BF;
 Wed,  9 Feb 2022 09:57:44 +0000 (UTC)
Date: Wed, 9 Feb 2022 09:57:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
Message-ID: <YgOQF0W78MVVsDw6@stefanha-x1.localdomain>
References: <20220120113545.55820-1-ilg@livius.net>
 <8A1E1B8F-ADA0-4966-A4E9-C0A08EB0A327@livius.net>
 <D6833D18-344A-473E-AC4D-89A64F8AA0EC@livius.net>
 <CAFEAcA91q2t9sVvaW6h3BwFMExgyCdVsb3TozH52EM70aPJt4w@mail.gmail.com>
 <DEEEEB34-BF47-4AD3-99BC-EAB791508D27@livius.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IEeyOWd683MCozor"
Content-Disposition: inline
In-Reply-To: <DEEEEB34-BF47-4AD3-99BC-EAB791508D27@livius.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IEeyOWd683MCozor
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 08, 2022 at 10:39:18PM +0200, Liviu Ionescu wrote:
>=20
>=20
> > On 8 Feb 2022, at 21:58, Peter Maydell <peter.maydell@linaro.org> wrote:
> >=20
> > I've cc'd some people who might have an opinion on whether this
> > something we want to add upstream. (Patch/thread below for context.)
>=20
> Sure. For a better understanding of the reason why I found this useful: I=
 use QEMU extensively in CI tests, in various environments, and, to be sure=
 that the tests always run in a reproducible environment, I have binary pac=
kages with various tools; the tested packages have dependencies on explicit=
 versions of the tools, for example:
>=20
> - https://github.com/micro-os-plus/micro-test-plus-xpack/blob/9c23c7d7b8f=
dba849602bcf8ad4c9e64e7e2837a/package.json#L505
>=20
> Seeing the branded greeting in a console log is a visual confirmation tha=
t the test script used the desired version, and not another version picked =
up by mistake when using an incorrect PATH.
>=20
> I hope that other distributions may find this useful too.

Is the existing ./configure --with-pkgversion=3D option not enough?

Here is the system QEMU from Fedora 35:

  $ qemu-system-x86_64 --version
  QEMU emulator version 6.1.0 (qemu-6.1.0-10.fc35)
                                             ^^^^

Or on Debian:

  QEMU emulator version 5.2.0 (Debian 1:5.2+dfsg-11+deb11u1)
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Stefan

--IEeyOWd683MCozor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIDkBcACgkQnKSrs4Gr
c8jwLgf9FxRGzJBuBo+fe030abjnmX9rbWohslNfpF85cLkq9pCRUriQNBRVmln0
8RxQ7lqyKZJEgePCqAJleVkz72uk/UTM2io4jkF2g7YNETHQ0Vda7bcR7EP56kwt
Wi6u/ZAb4/dahUnZsTp9MfnChNAqka7rTpAZpvmhiUrOdPphHTutoiDBoGNSDVcL
9PiMzxlO14a+IJ48/JtNCrLgW+6EC/6kiNLsyQShYl3L74dOosadWYCWva2RLlml
EapgsYUcG9vG7jPPPxx0V9V3JLFIb5g2QpxcLZS1zFqP6nDmN5FHRosykGcF3z9T
MRH+164r7MN9r8HssFKaPuGZlp6O8w==
=/Eds
-----END PGP SIGNATURE-----

--IEeyOWd683MCozor--


