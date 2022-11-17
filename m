Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD6262D421
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 08:32:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovZMX-0005zL-8r; Thu, 17 Nov 2022 02:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovZML-0005y4-Ny; Thu, 17 Nov 2022 02:30:53 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovZMJ-0006Zz-Dc; Thu, 17 Nov 2022 02:30:53 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EF7455C0045;
 Thu, 17 Nov 2022 02:30:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Nov 2022 02:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668670249; x=1668756649; bh=qt
 saj5Vl84LygA67Dgou+dD/dfpePaIpq6gWYqq2Kgs=; b=AQUtVDVfbTm6qYjLVU
 THzC6DSnZlOMtGemXbnnLGBkWI0+SG3t0EtOBJcvYz0JqUKbChJdqlIv/afRkL0V
 GeoedqseLnHyoN8GVARC5BoiOs2hs2FXh4w4k4FitjqqaeXyHAVFUryVmaBai6fY
 R0WyJSX/vRmv2bcpTCmuScxJgk3UWBB+4L5/yrm/X6TcrXzKF3p6J+EdFF6xWW90
 voa8YmJnDP8gNiN75uSlv46AS6axxrNRja8bF8kJU0oRpxk0S/9y/kY/OAt+iWmB
 /i3WZtFf6Feu7/ePn51zbNCI8z6T8MgsbETKUXwbhEgobTVnGLYKOO7/T4tjO5SK
 svaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668670249; x=1668756649; bh=qtsaj5Vl84LygA67Dgou+dD/dfpe
 PaIpq6gWYqq2Kgs=; b=WzaceZJhYcNxYl2rdjWNO0g8fe6Yy0H55UhcjWedythx
 6htOdhYQJxwDYTr6T8egUOWgT2Rwm2ORvpb9n1rAChhnklhzKpDwf1bp/wmcpXoi
 zUXCKqfhmgI3+xWae9Wa+UxozZCn7WYYZ2YOfLjv/v7RR7toXfCrrlxPL7J6BVz9
 YGBGkjHihXfRKm8ExXWrKRNWEAoBy5AkzGhysTY0/8wrFzcjiYQler3yfTPKROJ/
 rE9McKuBcPOyT0A+AUema/uW8/H0k9nYcO+tZXQty4FuZiSsGWmgoFLqIzIfkg7M
 Q1O0+D+GVP4r1gGWtVFY6QCahoGqXrXMZ5bg4pvJmg==
X-ME-Sender: <xms:KeN1Y15NOpAshUhv_KEq6qPSd0wfXciSO7jOhU-mARYmjCG4KAUr5Q>
 <xme:KeN1Yy6B8-g1eVAYjXpw-Y9__CuLUYxxkizkph0QjIPGMGMUMR-3pvZztM0UJDmA3
 c4ajZymI1FlSxbTe2A>
X-ME-Received: <xmr:KeN1Y8eshefK6bOT5msWW-ozTDX47BuIJc76-JLVL30W9pQVDa--6djY99yDXAJJGvh_LkQ4YI6t5UMZWPu3okips1VY7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:KeN1Y-LGfMseaM_7gcZm5y82l8D7LLeizpwPBGkcDZePfaCxiekCkA>
 <xmx:KeN1Y5J-a0--GeKjeQOQqhqTUrKQNpmbpEE8dM3NIKjiP6LTDmyhUA>
 <xmx:KeN1Y3ys-i8th6mmqPbzR19muq50uDcfvBmx1t6I1OH01TEoyg_FlQ>
 <xmx:KeN1Y52lBbjFmr_IG-npUdOCoNfGivWaq6y0Wt0WaSRvytCFePD1HQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 02:30:48 -0500 (EST)
Date: Thu, 17 Nov 2022 08:30:46 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Joel Granados <j.granados@samsung.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, k.jensen@samsung.com
Subject: Re: [PATCH v3 2/2] nvme: Add physical writes/reads from OCP log
Message-ID: <Y3XjJiE87sp1hy7f@cormorant.local>
References: <20221116171455.3401086-1-j.granados@samsung.com>
 <CGME20221116171836eucas1p1dfaeb8826ca901f20ede7567ec2623e3@eucas1p1.samsung.com>
 <20221116171455.3401086-3-j.granados@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CtJlmsF9ZnjKfs8T"
Content-Disposition: inline
In-Reply-To: <20221116171455.3401086-3-j.granados@samsung.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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


--CtJlmsF9ZnjKfs8T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 16 18:14, Joel Granados wrote:
> In order to evaluate write amplification factor (WAF) within the storage
> stack it is important to know the number of bytes written to the
> controller. The existing SMART log value of Data Units Written is too
> coarse (given in units of 500 Kb) and so we add the SMART health
> information extended from the OCP specification (given in units of bytes)
>=20
> We add a controller argument (ocp) that toggles on/off the SMART log
> extended structure.  To accommodate different vendor specific specificati=
ons
> like OCP, we add a multiplexing function (nvme_vendor_specific_log) which
> will route to the different log functions based on arguments and log ids.
> We only return the OCP extended SMART log when the command is 0xC0 and ocp
> has been turned on in the args.
>=20
> Though we add the whole nvme SMART log extended structure, we only popula=
te
> the physical_media_units_{read,written}, log_page_version and
> log_page_uuid.
>=20
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  docs/system/devices/nvme.rst |  7 +++++
>  hw/nvme/ctrl.c               | 55 ++++++++++++++++++++++++++++++++++++
>  hw/nvme/nvme.h               |  1 +
>  include/block/nvme.h         | 36 +++++++++++++++++++++++
>  4 files changed, 99 insertions(+)
>=20
> diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
> index 30f841ef62..1cc5e52c00 100644
> --- a/docs/system/devices/nvme.rst
> +++ b/docs/system/devices/nvme.rst
> @@ -53,6 +53,13 @@ parameters.
>    Vendor ID. Set this to ``on`` to revert to the unallocated Intel ID
>    previously used.
> =20
> +``ocp`` (default: ``off``)
> +  The Open Compute Project defines the Datacenter NVMe SSD Specification=
 that
> +  sits on top of NVMe. It describes additional commands and NVMe behavio=
rs
> +  specific for the Datacenter. When this option is ``on`` OCP features s=
uch as
> +  the SMART / Health information extended log become available in the
> +  controller.
> +
>  Additional Namespaces
>  ---------------------
> =20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index bf291f7ffe..c7215a4ed1 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4455,6 +4455,41 @@ static void nvme_set_blk_stats(NvmeNamespace *ns, =
struct nvme_stats *stats)
>      stats->write_commands +=3D s->nr_ops[BLOCK_ACCT_WRITE];
>  }
> =20
> +static uint16_t nvme_ocp_extended_smart_info(NvmeCtrl *n, uint8_t rae,
> +                                             uint32_t buf_len, uint64_t =
off,
> +                                             NvmeRequest *req)
> +{
> +    NvmeNamespace *ns =3D NULL;
> +    NvmeSmartLogExtended smart_l =3D { 0 };
> +    struct nvme_stats stats =3D { 0 };
> +    uint32_t trans_len;
> +
> +    if (off >=3D sizeof(smart_l)) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    /* accumulate all stats from all namespaces */
> +    for (int i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
> +        ns =3D nvme_ns(n, i);
> +        if (ns) {
> +            nvme_set_blk_stats(ns, &stats);
> +        }
> +    }
> +
> +    smart_l.physical_media_units_written[0] =3D cpu_to_le32(stats.units_=
written);
> +    smart_l.physical_media_units_read[0] =3D cpu_to_le32(stats.units_rea=
d);

These are uint64s, so should be cpu_to_le64().

> +    smart_l.log_page_version =3D 0x0003;
> +    smart_l.log_page_uuid[0] =3D 0xA4F2BFEA2810AFC5;
> +    smart_l.log_page_uuid[1] =3D 0xAFD514C97C6F4F9C;

Technically the field is called the "Log Page GUID", not the UUID.
Perhaps this is a bit of Microsoft leaking in, or it is to differentiate
it from the UUID Index functionality, who knows.

It looks like you byte swapped the two 64 bit parts, but not the
individual bytes. It's super confusing when the spec just says "shall be
set to VALUE". Is that VALUE already in little endian? Sigh.

Anyway, I think it is fair to assume that, so just make
log_page_uuid/guid a uint8_t 16-array and do something like:

	static const uint8_t uuid[16] =3D {
		0xAF, 0xD5, 0x14, 0xC9, 0x7C, 0x6F, 0x4F, 0x9C,
		0xA4, 0xF2, 0xBF, 0xEA, 0x28, 0x10, 0xAF, 0xC5,
	};

	memcpy(smart_l.log_page_guid, uuid, sizeof(smart_l.log_page_guid));

--CtJlmsF9ZnjKfs8T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmN14yUACgkQTeGvMW1P
DelsXggApFq5oXbrtfKHrqIwWnblYwkFhGJJD3vVic9X/WGFrJH+wRVWN8nTIaMX
QEHO6JmVzWvVr2EFaFNB41I4ZZtHS857Pg13JDVL9R10R1WgTPhnkt51xcXuAW9z
wfaVEECaR/V4DNgroBq+ai5k11OYFsXVwm0t9EIA6g1PBOL0vNV5YB0rzfT+h/SL
5Ij+h5HQCGgXGw5kdb8uy0l1ablskfyXvX9GqzQVKrB1oqH34Od8KZ1iIoxLvbz8
3RAO+wvz4Y95n8+sGV0CvrpZSoRJjKY9w0tyL9eFThtcVFHh7GcOb3u9veu5D0e9
4T2gl5aqiQBG5jwCx+rAlNWBAYvQFg==
=5xYb
-----END PGP SIGNATURE-----

--CtJlmsF9ZnjKfs8T--

