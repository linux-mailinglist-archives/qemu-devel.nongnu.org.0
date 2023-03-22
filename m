Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D096C4BB2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:29:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peyVC-0007mi-H6; Wed, 22 Mar 2023 09:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1peyV1-0007m3-FD
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:27:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1peyUx-0007J6-UJ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679491642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XkHvhE/T0A9ITKExEBw4Qym5d4l/WUn3s/AdG1AJwQw=;
 b=e2PnVb4EV4YXPNU8TirmfK1PfNnCd0cidKy/fnGQH1lYm+W0VQPz+9C7+QPUmbGmoeR45Z
 Ug7szw9q5xkOWfiuZ5vE/eD4FMuXYa1K3PhUFSMEjAfEORGmgEnlxlB+u8YcXjzc5rabjz
 QEloBIXgzLKC8HFmEdNpICB6uP+xH3w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-03IMqW_hPC6PFesRy9B8Fg-1; Wed, 22 Mar 2023 09:27:18 -0400
X-MC-Unique: 03IMqW_hPC6PFesRy9B8Fg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60D53801206;
 Wed, 22 Mar 2023 13:27:18 +0000 (UTC)
Received: from localhost (unknown [10.2.16.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 338241121315;
 Wed, 22 Mar 2023 13:27:18 +0000 (UTC)
Date: Wed, 22 Mar 2023 09:27:17 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH for-8.0 v2 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Message-ID: <20230322132717.GA1191181@fedora>
References: <20230321161609.716474-1-clg@kaod.org>
 <20230321161609.716474-2-clg@kaod.org>
 <14e4785e-6d3c-0891-1d59-3be4cbd700cd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EL1xIV2Dgqp66Hit"
Content-Disposition: inline
In-Reply-To: <14e4785e-6d3c-0891-1d59-3be4cbd700cd@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


--EL1xIV2Dgqp66Hit
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 08:11:37AM +0100, Thomas Huth wrote:
> On 21/03/2023 17.16, C=C3=A9dric Le Goater wrote:
> > From: C=C3=A9dric Le Goater <clg@redhat.com>
> >=20
> > GCC13 reports an error :
> >=20
> > ../util/async.c: In function =E2=80=98aio_bh_poll=E2=80=99:
> > include/qemu/queue.h:303:22: error: storing the address of local variab=
le =E2=80=98slice=E2=80=99 in =E2=80=98*ctx.bh_slice_list.sqh_last=E2=80=99=
 [-Werror=3Ddangling-pointer=3D]
> >    303 |     (head)->sqh_last =3D &(elm)->field.sqe_next;              =
            \
> >        |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> > ../util/async.c:169:5: note: in expansion of macro =E2=80=98QSIMPLEQ_IN=
SERT_TAIL=E2=80=99
> >    169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> >        |     ^~~~~~~~~~~~~~~~~~~~
> > ../util/async.c:161:17: note: =E2=80=98slice=E2=80=99 declared here
> >    161 |     BHListSlice slice;
> >        |                 ^~~~~
> > ../util/async.c:161:17: note: =E2=80=98ctx=E2=80=99 declared here
> >=20
> > But the local variable 'slice' is removed from the global context list
> > in following loop of the same routine. Add a pragma to silent GCC.
> >=20
> > Cc: Stefan Hajnoczi <stefanha@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> > ---
> >   util/async.c | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >=20
> > diff --git a/util/async.c b/util/async.c
> > index 21016a1ac7..de9b431236 100644
> > --- a/util/async.c
> > +++ b/util/async.c
> > @@ -164,7 +164,20 @@ int aio_bh_poll(AioContext *ctx)
> >       /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue(=
).  */
> >       QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> > +
> > +    /*
> > +     * GCC13 [-Werror=3Ddangling-pointer=3D] complains that the local =
variable
> > +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but =
the
> > +     * list is emptied before this function returns.
> > +     */
> > +#if !defined(__clang__)
> > +#pragma GCC diagnostic push
> > +#pragma GCC diagnostic ignored "-Wdangling-pointer=3D"
>=20
> That warning parameter looks like a new one in GCC 13 ?
> ... so you have to check whether it's available before disabling
> it, otherwise this will fail with older versions of GCC. I just
> gave it a try with my GCC 8.5 and got this:
>=20
> ../../devel/qemu/util/async.c: In function =E2=80=98aio_bh_poll=E2=80=99:
> ../../devel/qemu/util/async.c:175:32: error: unknown option after =E2=80=
=98#pragma GCC diagnostic=E2=80=99 kind [-Werror=3Dpragmas]
>  #pragma GCC diagnostic ignored "-Wdangling-pointer=3D"
>                                 ^~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>=20
>  Thomas
>=20
> What about reworking the code like this:
>=20
> diff --git a/util/async.c b/util/async.c
> index 21016a1ac7..b236bdfbd8 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -156,15 +156,14 @@ void aio_bh_call(QEMUBH *bh)
>  }
>  /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
> -int aio_bh_poll(AioContext *ctx)
> +static int aio_bh_poll_slice(AioContext *ctx, BHListSlice *slice)
>  {
> -    BHListSlice slice;
>      BHListSlice *s;
>      int ret =3D 0;
>      /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue(). =
 */
> -    QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> -    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> +    QSLIST_MOVE_ATOMIC(&slice->bh_list, &ctx->bh_list);
> +    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, slice, next);
>      while ((s =3D QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
>          QEMUBH *bh;
> @@ -191,6 +190,13 @@ int aio_bh_poll(AioContext *ctx)
>      return ret;
>  }
> +int aio_bh_poll(AioContext *ctx)
> +{
> +    BHListSlice slice;
> +
> +    return aio_bh_poll_slice(ctx, &slice);
> +}
> +
>  void qemu_bh_schedule_idle(QEMUBH *bh)
>  {
>      aio_bh_enqueue(bh, BH_SCHEDULED | BH_IDLE);
>=20
> Would that work with GCC 13 and be acceptable?

Fine by me. Please add a comment into aio_bh_poll() explaining that this
wrapper function exists to silence the gcc dangling-pointer warning.
Otherwise someone may be tempted to remove the function.

Stefan

--EL1xIV2Dgqp66Hit
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQbAjUACgkQnKSrs4Gr
c8hojAgAkyWpN7ZJYH/vyoLqJtYNW7TUNm1/R/HgM2uqZMT1Ub3aSa2EBIO3a/ne
2e24HB5KUyf57CCGPuYtKyPzD4eeE0Q8wC1e8yMekgPqAO46AYnmM/E13bfAx8Xq
st4S0LXyJtW/FquT9xkzcVr3ZozBnpyhaU9iGNnBjVjUdB7gImHcFQecWbptfDoa
1XkpuRTDX+oSUqxTBdDNo1UGSHMvPNWwEz00xTvqJM5xsaIEPp7omF9mFnrEHRis
xl0MNG7qB69N0ato9yR9mA6dVd8QzskNg5eOHTF8fWSG60btgRTxTZLB00RyfeBs
/vGeJ5M3N2/Fp7ekEERD1nzclqxW5g==
=aa7y
-----END PGP SIGNATURE-----

--EL1xIV2Dgqp66Hit--


