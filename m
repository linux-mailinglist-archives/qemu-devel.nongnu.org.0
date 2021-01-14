Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7042F5C5F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 09:28:34 +0100 (CET)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzxzc-0004B6-PL
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 03:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzxv4-00031f-Fp; Thu, 14 Jan 2021 03:23:50 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:51049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzxv1-00057a-Fl; Thu, 14 Jan 2021 03:23:50 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 16E38146D;
 Thu, 14 Jan 2021 03:23:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 14 Jan 2021 03:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=PVgMn7DcfK6eS7wORdUcfzfUXTA
 pK+CRPB/DzzomdBo=; b=lsjTIdUR9Na4+P+/dfdaLL4wIeLKh1W3J9QBN3B8ANn
 8PBOo8llXB9yzen2rWlbDvVQ61bDSjqVcHlwB5p2nORa2zXnRAvedFsJRDhtUOU4
 14R6K8FdKuNUszKN6JyUvcm7A9EvZTtmajnQv9bE6baWZCASn0aNnLO13ffmQFi7
 pAW26gVGudafZeSsVI2XK0uHtHO4YC+/Q16Dcu9tPgRcNDIuB+VKcAj+sNk73jlo
 dxPvdqid1ijM8pYYOn+nnCHJgi8WAhF8t7cJtcqGUCUsbV9woiDk+moTsrci078c
 tboai/SZ3c+jjTocKmY39Ff4aSxC99zXoQ1L8SlVnVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PVgMn7
 DcfK6eS7wORdUcfzfUXTApK+CRPB/DzzomdBo=; b=DbOnUZu/FLou1xJWA215HV
 HkLT+VTYkJgZ9JdIvZSF7rj0t5pTXvtlldSM88swgkBJ3DPu77lNrl9v54oqWHB8
 gSE8K8bMktkNfh7rbqlWk5rWkp21GghMgu/3c2hY9HHsEqD6Rte4tg00TjlEJg4H
 ivE8EOd3AjBw5x6WsQnCNCmxhFjseG8zkibTpITvAgNmowNcOyEO287kKeX3TJ+V
 6e75Wl4p9eWI8KL+f59aj/U0V8fbjjVnCjxIraJwRTndTYTRB8WoEKKPRJlASu+a
 kmlv2pNzhOep8oto2gGDAXb7wgKmPaUbKjWDaJ1dPxpEOFv5tJRIuetCppn1C2FA
 ==
X-ME-Sender: <xms:jP__X3MI8AXGCKaepKUkjGG-URIpq-5t9IySmv_L522q0nzFy3NcKQ>
 <xme:jP__Xx8Hxfo9JaykUQgmlL7oaaBjkvXTii3BzWye2xqoHC4m0NAZx_DSDkALzB-TU
 y9H5hxE05NF_dKEHvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:jP__X2Q6PjTf3j0YgybAcVm1M8_ySyl5dhIGjYcPSfvdXfrh8t85RQ>
 <xmx:jP__X7sgCPg8ACLHWSU77oY8OZWPNIz9y1Cxk-GN7vMmyfYwucdmQA>
 <xmx:jP__X_e1hXs0_xqro4_U4Q2Bjx3cmGPT_sQIMXEg1TroT3TAWD4fkA>
 <xmx:jv__XwGlpR7IhT2umcXgk2MfVUhJWstqzT1_XPe6J7PA5-4GTOxuAg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D4E041080066;
 Thu, 14 Jan 2021 03:23:39 -0500 (EST)
Date: Thu, 14 Jan 2021 09:23:38 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v3 4/4] hw/blocl/nvme: trigger async event during
 injecting smart warning
Message-ID: <X///ilbA0MgGVa7/@apples.localdomain>
References: <20210114072251.334304-1-pizhenwei@bytedance.com>
 <20210114072251.334304-5-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J3wc4XQqwH5QWAa8"
Content-Disposition: inline
In-Reply-To: <20210114072251.334304-5-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--J3wc4XQqwH5QWAa8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 14 15:22, zhenwei pi wrote:
> During smart critical warning injection by setting property from QMP
> command, also try to trigger asynchronous event.
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  hw/block/nvme.c | 47 ++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 40 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index ce9a9c9023..1feb603471 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -847,6 +847,36 @@ static void nvme_enqueue_event(NvmeCtrl *n, uint8_t =
event_type,
>      nvme_process_aers(n);
>  }
> =20
> +static void nvme_enqueue_smart_event(NvmeCtrl *n, uint8_t event)

Maybe rename to just nvme_smart_event, since it is conditional if it
enqueues anything.

> +{
> +    uint8_t aer_info;
> +
> +    if (!(NVME_AEC_SMART(n->features.async_config) & event)) {
> +        return;
> +    }
> +
> +    /* Ref SPEC <Asynchronous Event Information ??? SMART / Health Statu=
s> */
> +    switch (event) {
> +    case NVME_SMART_SPARE:
> +        aer_info =3D NVME_AER_INFO_SMART_SPARE_THRESH;
> +        break;
> +    case NVME_SMART_TEMPERATURE:
> +        aer_info =3D NVME_AER_INFO_SMART_TEMP_THRESH;
> +        break;
> +    case NVME_SMART_RELIABILITY:
> +    case NVME_SMART_MEDIA_READ_ONLY:
> +    case NVME_SMART_FAILED_VOLATILE_MEDIA:
> +        aer_info =3D NVME_AER_INFO_SMART_RELIABILITY;
> +        break;
> +    case NVME_SMART_PMR_UNRELIABLE:
> +        /* TODO if NVME_SMART_PMR_UNRELIABLE is defined in future */

Doesn't NVME_SMART_PMR_UNRELIABLE fall under the
NVME_AER_INFO_SMART_RELIABILITY SMART/Health information group? The spec
says that the PMR becoming unreliable can cause an AEN, so I think that
is the only group that is usable.

> +    default:
> +        return;
> +    }
> +
> +    nvme_enqueue_event(n, NVME_AER_TYPE_SMART, aer_info, NVME_LOG_SMART_=
INFO);
> +}
> +
>  static void nvme_clear_events(NvmeCtrl *n, uint8_t event_type)
>  {
>      n->aer_mask &=3D ~(1 << event_type);
> @@ -1824,12 +1854,9 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, Nvme=
Request *req)
>              return NVME_INVALID_FIELD | NVME_DNR;
>          }
> =20
> -        if (((n->temperature >=3D n->features.temp_thresh_hi) ||
> -             (n->temperature <=3D n->features.temp_thresh_low)) &&
> -            NVME_AEC_SMART(n->features.async_config) & NVME_SMART_TEMPER=
ATURE) {
> -            nvme_enqueue_event(n, NVME_AER_TYPE_SMART,
> -                               NVME_AER_INFO_SMART_TEMP_THRESH,
> -                               NVME_LOG_SMART_INFO);
> +        if ((n->temperature >=3D n->features.temp_thresh_hi) ||
> +             (n->temperature <=3D n->features.temp_thresh_low)) {
> +            nvme_enqueue_smart_event(n, NVME_AER_INFO_SMART_TEMP_THRESH);
>          }
> =20
>          break;
> @@ -2841,7 +2868,7 @@ static void nvme_set_smart_warning(Object *obj, Vis=
itor *v, const char *name,
>                                     void *opaque, Error **errp)
>  {
>      NvmeCtrl *s =3D NVME(obj);
> -    uint8_t value, cap =3D 0;
> +    uint8_t value, cap =3D 0, event;
>      uint64_t pmr_cap =3D CAP_PMR_MASK;
> =20
>      if (!visit_type_uint8(v, name, &value, errp)) {
> @@ -2860,6 +2887,12 @@ static void nvme_set_smart_warning(Object *obj, Vi=
sitor *v, const char *name,
>      }
> =20
>      s->smart_critical_warning =3D value;
> +
> +    /* test each bit of uint8_t for smart.critical_warning */
> +    for (event =3D 0; event < 8; event++) {
> +        if (value & (1 << event))
> +            nvme_enqueue_smart_event(s, 1 << event);
> +    }

I suggest you add a NVME_SMART_WARN_MAX to the NvmeSmartWarn enum with
value '6' and use that instead of the literal '8'.

>  }
> =20
>  static const VMStateDescription nvme_vmstate =3D {
> --=20
> 2.25.1
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--J3wc4XQqwH5QWAa8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl///4YACgkQTeGvMW1P
DelTOQf+PqbpupLNvkcWjDlZTsDTYxPWLpIqn7L84Pgu8Y+0HGSy7c9C9aQIrann
gopdGXmYJf79QIAR0SwMWd7AMtjAT8llTMvWruACbdVSCRq91cs9acIYE7tDj3fy
1iuQCl0L8ezDcdMuOlxk6IXtmy7Y4vQHluXVG9ODzwHiRswTQtxUisjoLWhjf3JG
KDAq38eyj0i4GP63FoPlNu5TPehBmDMJKR5LK1fv4xQPVY81x+D9shknmKsQJZ3u
H0TSeJcI5BaDXo8tyZTOMrhxCoiCpx18WZXDeWexbfEs0TtcVEAYBsqwKn468F/F
11YvCv67qMgx90oxEob41vfJ2cLc2g==
=b9Iy
-----END PGP SIGNATURE-----

--J3wc4XQqwH5QWAa8--

