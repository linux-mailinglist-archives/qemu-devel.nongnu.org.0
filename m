Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A0B62135E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 14:49:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osOxP-0007jH-FK; Tue, 08 Nov 2022 08:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osOxN-0007j9-PF
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:48:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osOxL-00026F-Uz
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 08:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667915278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=65hNAPzHXJkJHn9En6O4Jtrn9QoHcM26VwxVZRjfjoo=;
 b=H6diNbGGJfR98aBAftKcSFP2LwTOrX02QZ5PgZqb0qfy6coTJjg+SVCnc2yfKHmL1E0Wbb
 4VsqzuUy1Pzbi9ixJpyWLkUAQkqR5DKpy730qL4e981AsnJDIA05R+QQG/Dm3NXUwtvPJa
 yOXbqQ8wXGHQEn4tJezWW+l9PEX+1qs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-WyUquWd7MHuZSVM9xE02mQ-1; Tue, 08 Nov 2022 08:47:55 -0500
X-MC-Unique: WyUquWd7MHuZSVM9xE02mQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDF853814590;
 Tue,  8 Nov 2022 13:47:54 +0000 (UTC)
Received: from localhost (unknown [10.39.195.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CD2DC1E1B1;
 Tue,  8 Nov 2022 13:47:54 +0000 (UTC)
Date: Tue, 8 Nov 2022 08:47:52 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v4 00/83] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <Y2peCPLeSN0u7rSe@fedora>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221108012224-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q6YQwG4rHHhghQVL"
Content-Disposition: inline
In-Reply-To: <20221108012224-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--q6YQwG4rHHhghQVL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2022 at 01:23:16AM -0500, Michael S. Tsirkin wrote:
> On Mon, Nov 07, 2022 at 05:47:16PM -0500, Michael S. Tsirkin wrote:
> > Changes from v3:
> >     Applied and squashed fix by Ani for modular build breakage
> >     Reordered Julia's patches to avoid bisect breakage
> >     Checkpatch fixes for Jason's patches
> >     Added Alex's patch to partially address virtio is_started mess
> >     There is a bigger issue found by Christian A. Ehrhardt, that
> >     still needs work
> >     checkpatch change to avoid breaking on Jason's patches (to make ci =
pass)
> >=20
> > Changes from v2:
> >     Fixed a bug in error handling in vhost: Change the sequence of devi=
ce start.
> >         Contributor placed on watchlist ;)
> >     Dropped virtio: re-order vm_running and use_started checks
> >         Due to failures detected by gitlab.
> >         We'll have to fix it differently.
> >     Updated expected files for core-count test to fix bisect.
> >=20
> > Changes from v1
> >     Applied and squashed fixes by Igor, Lei He, Hesham Almatary for
> >     bugs that tripped up the pipeline.
> >     Updated expected files for core-count test.
> >=20
> >=20
> >=20
> > The following changes since commit a11f65ec1b8adcb012b89c92819cbda4dc25=
aaf1:
> >=20
> >   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu in=
to staging (2022-11-01 13:49:33 -0400)
> >=20
> > are available in the Git repository at:
> >=20
> >   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >=20
> > for you to fetch changes up to 1ef47f40dce3d5b176ddf76d57b5bfa2efb0b3c6:
>=20
>  5e75ffd664258d3d2fd3d27e92e2748024f53bca now - I found and fixed a typo =
in a comment in checkpatch and re-pushed

This didn't make it in, sorry. Please send the typo fix in the next pull
request.

Thanks,
Stefan

--q6YQwG4rHHhghQVL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNqXggACgkQnKSrs4Gr
c8gjCgf/Tuwc1lmZDPhQPK/SYFu+1n4Y/Se+QE8klNfsXeh6pO1AmJJvwPJ3CDam
wpXiCGFnneJcIE27MRRiFRJy4hH//+N7AkmVwmWGd1mPIcAHOWXX1JJFC7pE9lhK
rq6AdYBF55iuoapOLhFVQ7LUeCRq0K6OuM0VcAXd5dia/8P5WCXMHMAkzemWJ/pv
aYDYezzWYo2vZRWo393aoPnieMzDHk4rBsNgqk/iW1puyH0CCBd0KIpz3uUJnyiL
0UOB0DKqpS4eXD1cFMUPdx77B8Nx7U7MfWvcXG3tL5ujntm9zfnjyla+dyF0sDzA
BmRIZQwOEO0nJrj+PqvBWgfog2zOaQ==
=fQfG
-----END PGP SIGNATURE-----

--q6YQwG4rHHhghQVL--


