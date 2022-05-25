Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3705C534184
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 18:31:00 +0200 (CEST)
Received: from localhost ([::1]:57026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nttuV-0004Ag-BR
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 12:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntteW-0006EF-Oc
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:14:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntteR-0006J4-5E
 for qemu-devel@nongnu.org; Wed, 25 May 2022 12:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653495261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sgp8YRwr9s6adMbhb3VvpPr8MbK/TpDvLH7WSB01yeM=;
 b=Ox3rdjFTb9jURkOBRo5uGkux2Nfd8crp12hczasZcyJNK+LzfWYig6UE51gplKwUJJHUpJ
 H1ImNEiDhIQAhzK+eEHwT9kED1wnRKQX3+bJ7VojN8uHiXLhGeUe08mMJ+nWRc+zccqtWG
 4Xgc32WQ6vluY2U7/WZTW2P7Xqrsceg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-yZV6cPYkMaiNSii_qMwtbw-1; Wed, 25 May 2022 12:14:18 -0400
X-MC-Unique: yZV6cPYkMaiNSii_qMwtbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD95B811E76;
 Wed, 25 May 2022 16:14:17 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A60140C128B;
 Wed, 25 May 2022 16:14:17 +0000 (UTC)
Date: Wed, 25 May 2022 17:14:15 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org
Subject: Re: [PATCH  v2 00/15] virtio-gpio and various virtio cleanups
Message-ID: <Yo5V19zE82hWFuSJ@stefanha-x1.localdomain>
References: <20220524154056.2896913-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q4MHPw8Eiv937kGL"
Content-Disposition: inline
In-Reply-To: <20220524154056.2896913-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Q4MHPw8Eiv937kGL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 04:40:41PM +0100, Alex Benn=E9e wrote:
> Hi,
>=20
> This series ostensibly adds virtio-user-gpio stubs to the build for
> use with an external vhost-user daemon. We've been testing it with our
> rust daemons from:
>=20
>   https://github.com/rust-vmm/vhost-device
>=20
> Getting the test enabled took some doing most likely because the need
> for CONFIG support exercised additional paths in the code that were
> not used for the simpler virtio-net tests. As a result the series has
> a number of cleanup and documentation patches.
>=20
> The final thing that needed fixing was the ensuring that
> VHOST_USER_F_PROTOCOL_FEATURES didn't get squashed in the negotiation
> process. This was the hardest thing to track down as we store the
> feature bits in several places variously as:
>=20
>   in VirtIODevice as:
>     uint64_t guest_features;
>     uint64_t host_features;
>     uint64_t backend_features;

None of these know about VHOST_USER_F_PROTOCOL_FEATURES and vhost-user's
unfiltered feature bits should never be passed to VirtIODevice.

>=20
>  in vhost_dev as:
>     uint64_t features;
>     uint64_t acked_features;
>     uint64_t backend_features;

I don't think these should know about VHOST_USER_F_PROTOCOL_FEATURES
either. AFAIK vhost_dev deals with VIRTIO feature bits, not raw
vhost-user GET_FEATURES.

Stefan

--Q4MHPw8Eiv937kGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKOVdcACgkQnKSrs4Gr
c8jhqwgAladbmK4CNQlxIwC+PNqfc4bvllW6V+4B2k47jkIsbWakbRUkG4H+ZX0o
/sbDSlHcFAc6cciPO0910eqhHAQZ++JGapLF1LjwKPfA2KRp86/gGLUOSfCXpYXa
19iyeUyJ5xKAgz3+t66+gCYyw6XDBlks8dhDbwaPUZVbZUUMq26t9H1TS5JaTI44
zv+z8JA6YCze53EnCU9o+8ObSJ2SNfnAe1KylwhjkonP9iHCRQZN6EZLKmU+0LRP
dLOglIFPSI32GsedW9V2p9j1xq+ANNIZ6hsC2WP60yxh1+AE/P85kT7bMZZ2SSuC
wV2Sq9cfTABPgg4pzqWdCNkyxAmjjQ==
=gQII
-----END PGP SIGNATURE-----

--Q4MHPw8Eiv937kGL--


