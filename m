Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F604623614
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 22:50:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osswg-0003kd-Si; Wed, 09 Nov 2022 16:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osswf-0003kS-AX
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 16:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osswd-0006qJ-SV
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 16:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668030555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VpL+Wzx7TM88XtFF9JL9J0HhCorMq1GdbyU9eyA3l+g=;
 b=BQ6EX7dlgsNkhGvwgz1IeBnhHuKWgoy1QmJRHZV9RuftWlJYM1dlAWFfSHkDfswMvYkzcJ
 905LDhpM2/Yujw9h68KHv8jihEN5mN6376uxO2QTQ489DPWorhvv+ADBRCrwQ+ObrXPKGH
 cIt+sfRWhwaBEP9jDmaQRyuzlICtGK0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-kMsJeJYyOZG0HCe4Nvf3_Q-1; Wed, 09 Nov 2022 16:49:13 -0500
X-MC-Unique: kMsJeJYyOZG0HCe4Nvf3_Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B905A185A79C;
 Wed,  9 Nov 2022 21:49:12 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38F7D10197;
 Wed,  9 Nov 2022 21:49:11 +0000 (UTC)
Date: Wed, 9 Nov 2022 16:49:10 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, eesposit@redhat.com, hreitz@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 01/13] qed: Don't yield in bdrv_qed_co_drain_begin()
Message-ID: <Y2wgVjPNC/dDHO3n@fedora>
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-2-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qvAZ+4uu9lqm8OpO"
Content-Disposition: inline
In-Reply-To: <20221108123738.530873-2-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--qvAZ+4uu9lqm8OpO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2022 at 01:37:26PM +0100, Kevin Wolf wrote:
> @@ -310,9 +309,20 @@ static void coroutine_fn qed_need_check_timer_entry(=
void *opaque)
>      (void) ret;
>  }
> =20
> +static void coroutine_fn qed_need_check_timer_entry(void *opaque)
> +{
> +    BDRVQEDState *s =3D opaque;
> +
> +    qed_need_check_timer(opaque);
> +    bdrv_dec_in_flight(s->bs);
> +}
> +
>  static void qed_need_check_timer_cb(void *opaque)
>  {
> +    BDRVQEDState *s =3D opaque;
>      Coroutine *co =3D qemu_coroutine_create(qed_need_check_timer_entry, =
opaque);
> +
> +    bdrv_inc_in_flight(s->bs);
>      qemu_coroutine_enter(co);
>  }
> =20
> @@ -363,8 +373,12 @@ static void coroutine_fn bdrv_qed_co_drain_begin(Blo=
ckDriverState *bs)
>       * header is flushed.
>       */
>      if (s->need_check_timer && timer_pending(s->need_check_timer)) {
> +        Coroutine *co;
> +
>          qed_cancel_need_check_timer(s);
> -        qed_need_check_timer_entry(s);
> +        co =3D qemu_coroutine_create(qed_need_check_timer_entry, s);
> +        bdrv_inc_in_flight(bs);

Please include comments that indicate where inc/dec are paired. This is
like pairing memory barriers where it can be very hard to know after the
code has been written (and modified).

--qvAZ+4uu9lqm8OpO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNsIFYACgkQnKSrs4Gr
c8is5gf+Ox92mFis7Unns1KVpBkl0ZC6NtUL+HFLrhO8RkDw8XbNiSVjOm4cO3/w
UiZPRgUPV9nnHvyNyHM2a5iaV5SZCLG57WX3buZgHY5fumyUVUvXza6xt2ZrXjhH
5ohm9o7fmBwhhgEzRRkkp+fZCbIIYeL+SJbU+OxW8KrB17J9I0kVJqh33A1Tg4ry
8DytccThZmtxK0FLU1lcOVOCr+NwmnqfafXlDNZ5wOPZ6sWw/AJAqxPa4lX/uBoq
21P+PFFw5u6I7z9XHnDBvhZbqVnabJuxwLOG1Fr+845YQMCg1qb2tvVwyO2JErCE
9ERufestV7na6kFcrnQdAHw+ssv0Ug==
=gn4t
-----END PGP SIGNATURE-----

--qvAZ+4uu9lqm8OpO--


