Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FBD50FB80
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:54:22 +0200 (CEST)
Received: from localhost ([::1]:53884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIpp-0000Yo-Bp
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njI2y-0003Sj-3v
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:03:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1njI2u-0002pz-HG
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 06:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650967427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G349xE4gLp9GEInT6ZdbyTDJH94QpSVxgnCgetkxCzE=;
 b=V/p/+f9UXl50AnDGK8HD7OjZNNIvGv1STsYGb1qj75tSVTl3wqjGm8eFymC7bDVm0O/buj
 rDfQUAsz5CdwOawqBYjZsLS1fCF8cQ3IlR4GziOJTcRPawnue6RO7BSflzH05dVjYHOJme
 TFJaAm6MIYfWFW5uZsE2mJC7rTs6Gdo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-0yvzfen8MC-4LJtpYe9jqw-1; Tue, 26 Apr 2022 06:03:44 -0400
X-MC-Unique: 0yvzfen8MC-4LJtpYe9jqw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A655811E75;
 Tue, 26 Apr 2022 10:03:38 +0000 (UTC)
Received: from localhost (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACAA0463E1C;
 Tue, 26 Apr 2022 10:03:34 +0000 (UTC)
Date: Tue, 26 Apr 2022 11:03:31 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH v6 0/3] util/thread-pool: Expose minimun and maximum size
Message-ID: <YmfDc/dc/bRrO2r1@stefanha-x1.localdomain>
References: <20220425075723.20019-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PzNE479XKk6bVRrd"
Content-Disposition: inline
In-Reply-To: <20220425075723.20019-1-nsaenzju@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com,
 qemu-block@nongnu.org, michael.roth@amd.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, eduardo@habkost.net,
 hreitz@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PzNE479XKk6bVRrd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 09:57:20AM +0200, Nicolas Saenz Julienne wrote:
> As discussed on the previous RFC[1] the thread-pool's dynamic thread
> management doesn't play well with real-time and latency sensitive
> systems. This series introduces a set of controls that'll permit
> achieving more deterministic behaviours, for example by fixing the
> pool's size.
>=20
> We first introduce a new common interface to event loop configuration by
> moving iothread's already available properties into an abstract class
> called 'EventLooopBackend' and have both 'IOThread' and the newly
> created 'MainLoop' inherit the properties from that class.
>=20
> With this new configuration interface in place it's relatively simple to
> introduce new options to fix the even loop's thread pool sizes. The
> resulting QAPI looks like this:
>=20
>     -object main-loop,id=3Dmain-loop,thread-pool-min=3D1,thread-pool-max=
=3D1
>=20
> Note that all patches are bisect friendly and pass all the tests.
>=20
> [1] https://patchwork.ozlabs.org/project/qemu-devel/patch/20220202175234.=
656711-1-nsaenzju@redhat.com/
> ---
>=20
> Changes since v5:
>  - Add 'Since' versioning to MainLoopProperties
>=20
> Changes since v4:
>  - Address Markus' comments WRT qom.json
>=20
> Changes since v3:
>  - Avoid duplication in qom.json by creating EventLoopBaseProperties.
>  - Fix failures on first compilation due to race between
>    event-loop-base.o and qapi header generation.
>=20
> Changes since v2:
>  - Get rid of wrong locking/waiting
>  - Fix qapi versioning
>  - Better commit messages
>=20
> Changes since v1:
>  - Address all Stefan's comments
>  - Introduce new fix
>=20
> Nicolas Saenz Julienne (3):
>   Introduce event-loop-base abstract class
>   util/main-loop: Introduce the main loop into QOM
>   util/event-loop-base: Introduce options to set the thread pool size
>=20
>  event-loop-base.c                | 140 +++++++++++++++++++++++++++++++
>  include/block/aio.h              |  10 +++
>  include/block/thread-pool.h      |   3 +
>  include/qemu/main-loop.h         |  10 +++
>  include/sysemu/event-loop-base.h |  41 +++++++++
>  include/sysemu/iothread.h        |   6 +-
>  iothread.c                       |  68 +++++----------
>  meson.build                      |  26 +++---
>  qapi/qom.json                    |  43 ++++++++--
>  util/aio-posix.c                 |   1 +
>  util/async.c                     |  20 +++++
>  util/main-loop.c                 |  65 ++++++++++++++
>  util/thread-pool.c               |  55 +++++++++++-
>  13 files changed, 419 insertions(+), 69 deletions(-)
>  create mode 100644 event-loop-base.c
>  create mode 100644 include/sysemu/event-loop-base.h
>=20
> --=20
> 2.35.1
>=20

Thanks, applied to my block-next tree! If there are more comments I can
drop it again.

https://gitlab.com/stefanha/qemu/commits/block-next

Stefan

--PzNE479XKk6bVRrd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJnw3MACgkQnKSrs4Gr
c8jzbQf9E0qZm02RFJypZNpKGaRJPZtIJlCp6oeYpen3nobbFlkQ+gxydGqGJleu
JWyKo2e3hfNI9b4dlnrsXH2IbXFBDRz6am2H8MEg+igoj/DDScI9TaziUUeNiTTt
41QZczx8hL4MwPZbmTtNZm9hfEBPHSa82kECPBHR1p6jFGLnP2D95Bmhz1UvVWvN
EEDkCc9bJjqrBQAdafpZUJ5Z52GFJ9kHa/FR42YzXjHS0e43zwHzdRRl52mD4LjN
a4ptcxv2oupcvfBuJ3yUF3/wWHfdmnGQbzNCT6jpMRjdpyDtfD8Vz0D9b84T7GX7
JqXO58B5W1uX77u/cH4DRRyz95L09w==
=So0o
-----END PGP SIGNATURE-----

--PzNE479XKk6bVRrd--


