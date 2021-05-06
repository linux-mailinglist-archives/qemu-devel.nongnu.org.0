Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23763374D78
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 04:22:33 +0200 (CEST)
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leTeq-0003Fs-68
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 22:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leTas-0005oJ-TG; Wed, 05 May 2021 22:18:27 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:44165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1leTaq-0004cY-DI; Wed, 05 May 2021 22:18:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FbHLH6pyrz9sVv; Thu,  6 May 2021 12:18:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620267495;
 bh=e8NjlE+H0Au34smJhJqAC+RWoJZvdLovErLQJHHcx0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gz89q1e4iiAKmE8hyOu5bMCOh1jKnYPn//5Q+BDXmEBvqXT6zCImrFP8A6WiY4hag
 lAS46k7bIIPZuzva9VHPUbX5wJKPln2c0Am2I15Rq168bQ//2aKaHv1NSW+a+HQUNH
 QviJWntm039FlTqdKHXJtlZYa8szWbULlHoInwh0=
Date: Thu, 6 May 2021 12:15:41 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 15/23] net: Avoid dynamic stack allocation
Message-ID: <YJNRTQh9xvs4/mAQ@yekko>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-16-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aYHT79HgvKuD0/re"
Content-Disposition: inline
In-Reply-To: <20210505211047.1496765-16-philmd@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jiri Pirko <jiri@resnulli.us>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--aYHT79HgvKuD0/re
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 05, 2021 at 11:10:39PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Use autofree heap allocation instead of variable-length
> array on the stack.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

fsl_etsec parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>


> ---
>  hw/net/fsl_etsec/rings.c      | 9 ++++-----
>  hw/net/rocker/rocker_of_dpa.c | 2 +-
>  net/dump.c                    | 2 +-
>  net/tap.c                     | 2 +-
>  4 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
> index 8f084464155..1abdcb5a29c 100644
> --- a/hw/net/fsl_etsec/rings.c
> +++ b/hw/net/fsl_etsec/rings.c
> @@ -381,8 +381,6 @@ static void fill_rx_bd(eTSEC          *etsec,
>      uint16_t to_write;
>      hwaddr   bufptr =3D bd->bufptr +
>          ((hwaddr)(etsec->regs[TBDBPH].value & 0xF) << 32);
> -    uint8_t  padd[etsec->rx_padding];
> -    uint8_t  rem;
> =20
>      RING_DEBUG("eTSEC fill Rx buffer @ 0x%016" HWADDR_PRIx
>                 " size:%zu(padding + crc:%u) + fcb:%u\n",
> @@ -423,11 +421,12 @@ static void fill_rx_bd(eTSEC          *etsec,
>          /* The remaining bytes are only for padding which is not actually
>           * allocated in the data buffer.
>           */
> -
> -        rem =3D MIN(etsec->regs[MRBLR].value - bd->length, etsec->rx_pad=
ding);
> +        uint8_t  rem =3D MIN(etsec->regs[MRBLR].value - bd->length,
> +                           etsec->rx_padding);
> =20
>          if (rem > 0) {
> -            memset(padd, 0x0, sizeof(padd));
> +            g_autofree uint8_t *padd =3D g_malloc0(etsec->rx_padding);
> +
>              etsec->rx_padding -=3D rem;
>              *size             -=3D rem;
>              bd->length        +=3D rem;
> diff --git a/hw/net/rocker/rocker_of_dpa.c b/hw/net/rocker/rocker_of_dpa.c
> index b3b8c5bb6d4..3e400ceaef7 100644
> --- a/hw/net/rocker/rocker_of_dpa.c
> +++ b/hw/net/rocker/rocker_of_dpa.c
> @@ -1043,7 +1043,7 @@ static void of_dpa_flow_ig_tbl(OfDpaFlowContext *fc=
, uint32_t tbl_id)
>  static ssize_t of_dpa_ig(World *world, uint32_t pport,
>                           const struct iovec *iov, int iovcnt)
>  {
> -    struct iovec iov_copy[iovcnt + 2];
> +    g_autofree struct iovec *iov_copy =3D g_new(struct iovec, iovcnt + 2=
);
>      OfDpaFlowContext fc =3D {
>          .of_dpa =3D world_private(world),
>          .in_pport =3D pport,
> diff --git a/net/dump.c b/net/dump.c
> index 4d538d82a69..b830302e27d 100644
> --- a/net/dump.c
> +++ b/net/dump.c
> @@ -68,7 +68,7 @@ static ssize_t dump_receive_iov(DumpState *s, const str=
uct iovec *iov, int cnt)
>      int64_t ts;
>      int caplen;
>      size_t size =3D iov_size(iov, cnt);
> -    struct iovec dumpiov[cnt + 1];
> +    g_autofree struct iovec *dumpiov =3D g_new(struct iovec, cnt + 1);
> =20
>      /* Early return in case of previous error. */
>      if (s->fd < 0) {
> diff --git a/net/tap.c b/net/tap.c
> index bae895e2874..2b9ed8a2cd8 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -120,7 +120,7 @@ static ssize_t tap_receive_iov(NetClientState *nc, co=
nst struct iovec *iov,
>  {
>      TAPState *s =3D DO_UPCAST(TAPState, nc, nc);
>      const struct iovec *iovp =3D iov;
> -    struct iovec iov_copy[iovcnt + 1];
> +    g_autofree struct iovec *iov_copy =3D g_new(struct iovec, iovcnt + 1=
);
>      struct virtio_net_hdr_mrg_rxbuf hdr =3D { };
> =20
>      if (s->host_vnet_hdr_len && !s->using_vnet_hdr) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aYHT79HgvKuD0/re
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCTUU0ACgkQbDjKyiDZ
s5L/WQ/+LVjB1+P65wUSPgvF4Qh/cbNOUlJ7dip2q2kVtMRiAd3vNBJGxZmT39lV
Dyz5CHGcmOjSMYkXca5Uf6kaH+4GrIkWKfBDHIlnSBjOugeAAIXgfJyGFFqWVH7S
Z6wO8M6ZKxnuYL3JTIX4yZ3bRLzStagOtqrbpIbgdGFugYubVf3oD0pMXsOO402/
3nKmq1dknBVNLZvF3JxaMUNC4vxaBJLI/XCsHXO0+NDa0GEOeTkWkbIB5NQ1SbgB
ndnn25I3fc/TcGLMvzoLnfyU5u5fYRs2uy9s0rLnmRmc3iU6ZdZSqZYdel702jrQ
97xRdLaztRJ30VdfNeTBt0oAhcmrruLJxh1l8C4QpJ2B7xcX8dV18eAway5RtvMM
tqfhzJSK7bU3lMYvKii9+4VnRisYl3K8oeDnoBQ+79kOLSIdlXgq3et1YzfCK7xX
Z8zHV6aNMw5vQBgLGr51HXCGqiCr/zCw1FRRIdXhdes9cc1YVSeSGpAgwopH/QUp
dDG/NOojlm9inteo8jP9w//x+aAyNHJ80ojrDMbg4AH0QUV4QmsaGsnqXxfl1Lpe
APp5D75orf1EWcvN2ZcfDZC3uO4WArw8w1nQpMc7wC74Uicw1XkSoG+T3yTM/LY6
L3WBTQntsLm6ipMVaCxzvLyaPohEv3+UYtHEtD5lPKTw2Mk9xZ8=
=C6d7
-----END PGP SIGNATURE-----

--aYHT79HgvKuD0/re--

