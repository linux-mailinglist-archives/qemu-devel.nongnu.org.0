Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B3F46BCC3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 14:41:53 +0100 (CET)
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muaj9-0001ix-SP
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 08:41:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muacT-0004UR-BL
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:34:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muacR-0000Gw-Kw
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 08:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638884088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7qI+9KD3U0JDQStM9xX0fFvYF2PykXs4CcDCt3l+oms=;
 b=bGu+E2Snqkkdz6RDzoEohhIJBGvAEcknXrOG0HwKzzgP5sn6s28KlMwCwnO8P6pR/wkLY2
 nKbDT9ve9uq47HNMP757IWZ0zxdBrm1jQPBzkQWkGzJIc9cNqE9dqwpneu0sN+Ewk0vqBV
 /LfgxNTKqRns6DfiLG1Tq9OVKxDK16s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-MOYDfWMiNtOVUOZ5ZS97lA-1; Tue, 07 Dec 2021 08:34:45 -0500
X-MC-Unique: MOYDfWMiNtOVUOZ5ZS97lA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46DF569754;
 Tue,  7 Dec 2021 13:34:44 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7D2560BF1;
 Tue,  7 Dec 2021 13:34:43 +0000 (UTC)
Date: Tue, 7 Dec 2021 13:34:42 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC v3 0/4] tls: add macros for coroutine-safe TLS variables
Message-ID: <Ya9i8iGLa1uoU62P@stefanha-x1.localdomain>
References: <20211206142632.116925-1-stefanha@redhat.com>
 <CAFEAcA9=T-2AxzN1fhrtnu5U_5k7D8TPVjFXOLS_MeOCvR8FNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=T-2AxzN1fhrtnu5U_5k7D8TPVjFXOLS_MeOCvR8FNA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iI7fqlE7vjGwMb2/"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--iI7fqlE7vjGwMb2/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 02:34:45PM +0000, Peter Maydell wrote:
> On Mon, 6 Dec 2021 at 14:33, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > v3:
> > - Added __attribute__((weak)) to get_ptr_*() [Florian]
>=20
> Do we really need it *only* on get_ptr_*() ? If we need to
> noinline the other two we probably also should use the same
> attribute weak to force no optimizations at all.

I don't know but it does seem safer to use weak in all cases.

Florian and others?

Stefan

--iI7fqlE7vjGwMb2/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGvYvIACgkQnKSrs4Gr
c8iPDggAooP7pY4K0gys1ldxaIcmwBTyl87nxj23LROQzkoiHWF41ikugqCVEho/
aiUEn+KHj6+F9lN0z8jmFaQ+FMHh2CoH75d1QTxQMPXWsDziQ4zkf/JDavbEKvld
arqqp2TEdzLSfjnzFhuxk6MmDQaliJk8tL+LGRDtvsCaj5aF1z2rKDglbHOA7HRQ
aWSfsh/DTa/eY++634NUL2mXt0e2ocX4fUtQFr9+ZTtQI0VHmhGU3Kh9k5lxoMkX
xPsJQK/2OfkTNwdTsri98SxymddUuqEQdpPZ2ix3ktNp/l/69Vhqrxisve/JPmQj
kWaY+3EewyZviob5/fzmPTNGu/n2Hw==
=yWXS
-----END PGP SIGNATURE-----

--iI7fqlE7vjGwMb2/--


