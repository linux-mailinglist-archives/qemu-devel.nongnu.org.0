Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2986FC921
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:35:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwORF-0002f6-N7; Tue, 09 May 2023 10:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwORE-0002ct-4D
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:35:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pwORC-0007dF-FS
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:35:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683642933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DVPzI4iGy5o7O9qYL6QWMwTtoZf0XiRqNW+IhMfYJFA=;
 b=ercBfQ99ODgl8vZgF+vFPjPZxj+LxVi522/2mokO6NYqUS8jqQ/TQmQI6Lz5NlaLClsP4H
 fpXgX1y/xA32g3dazG2H2qj780joQkMxZe/XS87NtNrMf6QUGH5F818pv0YBQpr8D5KMOp
 DpXSu7fv8PM7N5dotSzuKBAp2DceWgc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-KQtPEFODO1uCFD7o1SGe6Q-1; Tue, 09 May 2023 10:35:21 -0400
X-MC-Unique: KQtPEFODO1uCFD7o1SGe6Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA98E1857F1D;
 Tue,  9 May 2023 14:34:56 +0000 (UTC)
Received: from localhost (unknown [10.39.195.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FC5E492B00;
 Tue,  9 May 2023 14:34:55 +0000 (UTC)
Date: Tue, 9 May 2023 10:34:54 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: Re: [PATCH v2 02/12] simpletrace: Annotate magic constants from QEMU
 code
Message-ID: <20230509143454.GE1008478@fedora>
References: <20230502092339.27341-1-mads@ynddal.dk>
 <20230502092339.27341-3-mads@ynddal.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/WH/OIJ1mVRYsktf"
Content-Disposition: inline
In-Reply-To: <20230502092339.27341-3-mads@ynddal.dk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--/WH/OIJ1mVRYsktf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 11:23:29AM +0200, Mads Ynddal wrote:
> From: Mads Ynddal <m.ynddal@samsung.com>
>=20
> It wasn't clear where the constants and structs came from, so I added
> comments to help.
>=20
> Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
> ---
>  scripts/simpletrace.py | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
> index 9211caaec1..7ba805443d 100755
> --- a/scripts/simpletrace.py
> +++ b/scripts/simpletrace.py
> @@ -15,15 +15,15 @@
>  from tracetool import read_events, Event
>  from tracetool.backend.simple import is_string
> =20
> -header_event_id =3D 0xffffffffffffffff
> -header_magic    =3D 0xf2b177cb0aa429b4
> -dropped_event_id =3D 0xfffffffffffffffe
> +header_event_id =3D 0xffffffffffffffff # trace/simple.c::HEADER_EVENT_ID
> +header_magic    =3D 0xf2b177cb0aa429b4 # trace/simple.c::HEADER_MAGIC
> +dropped_event_id =3D 0xfffffffffffffffe # trace/simple.c::DROPPED_EVENT_=
ID
> =20
> -record_type_mapping =3D 0
> -record_type_event =3D 1
> +record_type_mapping =3D 0 # trace/simple.c::TRACE_RECORD_TYPE_MAPPING
> +record_type_event =3D 1 # trace/simple.c::TRACE_RECORD_TYPE_EVENT
> =20
> -log_header_fmt =3D '=3DQQQ'
> -rec_header_fmt =3D '=3DQQII'
> +log_header_fmt =3D '=3DQQQ' # trace/simple.c::TraceLogHeader
> +rec_header_fmt =3D '=3DQQII' # trace/simple.c::TraceRecord

=46rom my reply to v1 of this patch series:

This is fragile since this information will be outdated if the C source
code changes (e.g. renaming files or variables).

Instead I would add the following comment:

  # This is the binary format that the QEMU "simple" trace backend
  # emits. There is no specification documentation because the format is
  # not guaranteed to be stable. Trace files must be parsed with the
  # same trace-events-all file and the same simpletrace.py file that
  # QEMU was built with.

I hope that clarifies the scope of the binary format and someone wishing
to look into the format would then know to look at the "simple" trace
backend.

Stefan

--/WH/OIJ1mVRYsktf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRaWg4ACgkQnKSrs4Gr
c8izpAf/eK7qyeuw181erbZX/lFJdnLNFMigGUFxGX/hg6n4VSzcxpl+axJPVo5+
UyzJaqvxVx5CgoWBncPiv7w+M4m2h62huAdc831EQDZfZ9lq49BeV7WigYQLGAmG
8P6piQoO453aPzCDUfjsFdeyEqMFTyf3ZPKiiKw70Oi0ecK+GBKh/2p8MyUj9UKq
5LS++YIjSNf7OpOqZeGM/YMqOrZvWLvR/fSaKwg9DzkHMd1YY+38omZ4iwYjolFW
1IONlLH+8UVy3QRprfkohQHR1UEW+Nnw+gtrDhqweA0MB6nP2R88fGM6bunqW0tK
BmuO/9hgjipKLWYP3TwL6cBPGrHiwQ==
=6HP9
-----END PGP SIGNATURE-----

--/WH/OIJ1mVRYsktf--


