Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FEA4CAA85
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:38:47 +0100 (CET)
Received: from localhost ([::1]:55752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPRzx-0008In-Gj
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:38:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPRym-0007SO-Jd
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:37:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPRyj-0001yz-60
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646239047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h2bqMC0I9awJaaATn6NSAqVXYmFlWuAeAjjLCrf89VM=;
 b=Ocwatcm4v1JjCyRrtOFz6wLnVdJIHa/Ipc7tNT9k/g28O3nX+gsuaPIY+KJXFn7g7PA6/f
 G0IyuUOHxG1Uu8i54+H+CWsCz+ZvQaVecYnsrZ709egsXMquAP5buDqqDECaBUcFDQ8d43
 bim2EsZ3/GdRFnATKydz4gS3WJBfwfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-swng6tLZMuSRDGvZf6m-4w-1; Wed, 02 Mar 2022 11:37:22 -0500
X-MC-Unique: swng6tLZMuSRDGvZf6m-4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A3C6805EE5;
 Wed,  2 Mar 2022 16:37:21 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 879C7841C8;
 Wed,  2 Mar 2022 16:37:20 +0000 (UTC)
Date: Wed, 2 Mar 2022 16:37:18 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [RFC PATCH 4/5] child_job_drained_poll: override polling
 condition only when in home thread
Message-ID: <Yh+dPsbc+zWsbv+k@stefanha-x1.localdomain>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <20220301142113.163174-5-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VOc4Gul4LZ14pZ4J"
Content-Disposition: inline
In-Reply-To: <20220301142113.163174-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VOc4Gul4LZ14pZ4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 09:21:12AM -0500, Emanuele Giuseppe Esposito wrote:
> drv->drained_poll() is only implemented in mirror, and allows
> it to drain from the coroutine. The mirror implementation uses
> in_drain flag to recognize when it is draining from coroutine,
> and consequently avoid deadlocking (wait the poll condition in
> child_job_drained_poll to wait for itself).
>=20
> The problem is that this flag is dangerous, because it breaks
> bdrv_drained_begin() invariants: once drained_begin ends, all
> jobs, in_flight requests, and anything running in the iothread
> are blocked.
>=20
> This can be broken in such way:
> iothread(mirror): s->in_drain =3D true; // mirror.c:1112
> main loop: bdrv_drained_begin(mirror_bs);
> /*
>  * drained_begin wait for bdrv_drain_poll_top_level() condition,
>  * that translates in child_job_drained_poll() for jobs, but
>  * mirror implements drv->drained_poll() so it returns
>  * !!in_flight_requests, which his 0 (assertion in mirror.c:1105).
>  */
> main loop: thinks iothread is stopped and is modifying the graph...
> iothread(mirror): *continues*, as nothing is stopping it
> iothread(mirror): bdrv_drained_begin(bs);
> /* draining reads the graph while it is modified!! */
> main loop: done modifying the graph...
>=20
> In order to fix this, we can simply allow drv->drained_poll()
> to be called only by the iothread, and not the main loop.
> We distinguish it by using in_aio_context_home_thread(), that
> returns false if @ctx is not the same as the thread that runs it.
>=20
> Co-Developed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  blockjob.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/blockjob.c b/blockjob.c
> index 10815a89fe..e132d9587e 100644
> --- a/blockjob.c
> +++ b/blockjob.c
> @@ -107,6 +107,7 @@ static bool child_job_drained_poll(BdrvChild *c)
>      BlockJob *bjob =3D c->opaque;
>      Job *job =3D &bjob->job;
>      const BlockJobDriver *drv =3D block_job_driver(bjob);
> +    AioContext *ctx =3D block_job_get_aio_context(bjob);
> =20
>      /* An inactive or completed job doesn't have any pending requests. J=
obs
>       * with !job->busy are either already paused or have a pause point a=
fter
> @@ -117,7 +118,7 @@ static bool child_job_drained_poll(BdrvChild *c)
> =20
>      /* Otherwise, assume that it isn't fully stopped yet, but allow the =
job to
>       * override this assumption. */
> -    if (drv->drained_poll) {
> +    if (in_aio_context_home_thread(ctx) && drv->drained_poll) {
>          return drv->drained_poll(bjob);

The purpose of in_aio_context_home_thread() is not obvious from the
code. Please add a comment explaining this case.

Thanks,
Stefan

--VOc4Gul4LZ14pZ4J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIfnT4ACgkQnKSrs4Gr
c8iOLAf/Uezs0D4m9msJXlJfFStM+Mrv8Fa5zEI8MQl38x4rO8Z/mctTVPxHoVL5
pwDxZHA7b3OZjCEVqD8xC6UnDGx85CTzzOZaUbmuJ/N6K3fU1yYvoaOGS4ce1uJM
H0tydP/7lWG/HN8b8/kLjlbhY/354jfoLtiT/t0gsYeoczWbbHLtysWeMwm7Hc4t
1YbWIO2oZufM4r9HLo7Dqy2AWG1m7C308O3yVFn2Pp1rMigQxbLsQ4Ju+vqesU3c
ps8QpcOYX/dC97pnyCkCsqNW79ADUwo3i92pA8vEA0eIf7LEg/JXw6s35WoLkTMh
3yqBX+7Ve7sl7nfkJwBU9C6L1Ksn+g==
=dzqY
-----END PGP SIGNATURE-----

--VOc4Gul4LZ14pZ4J--


