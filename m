Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035796296E4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:12:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outrE-0000BA-9c; Tue, 15 Nov 2022 06:12:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1outrB-0000AH-Oz; Tue, 15 Nov 2022 06:11:57 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1outrA-0001g0-AQ; Tue, 15 Nov 2022 06:11:57 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 34600320024A;
 Tue, 15 Nov 2022 06:11:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 15 Nov 2022 06:11:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668510713; x=1668597113; bh=k/
 XQJlyHvSiz6rjDfeImmS/m63zGIXV4JdXFIkEkIX8=; b=eqDKuLn1O95fKxBR3t
 lrsXJb1chreUyDMzPSDTZc56CIyvUUsexBWknQowfaRsRFLCBi1fVyOY8G9m1VF0
 1ldWkTTyihx0jwIrgmidVamk3hgFYzUiuUJ1yGwM18qvTqEw2USI+f1t6eQQESSp
 8aa1UZ1aNnMy6IFDHqTNYeflR8n8k1fgkAVGfknSTpK3f4NQYHRyfrFj/ljUv73a
 GCr+0WI+V7NrQEFjUB1Yp9NcHqhw1RPHVGk3AWGei0tEgMvjLHMXQo9e/FLnCLfD
 EVTEbGJpZvFaPnfe6tZ4tx8+HVL3SCDylzISCEPrPfrUjF/7RfJKycDAE15mw474
 d0ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668510713; x=1668597113; bh=k/XQJlyHvSiz6rjDfeImmS/m63zG
 IXV4JdXFIkEkIX8=; b=sX/QIHwC26ayB2X7o14uf/WsKAqRNgWaBT8IfySUn9Sx
 u8cIkIPgbIbZxojcMmWSMgOWFWySYCM7VZDUkGMWtY0WdVb9MjEWHPv6GhcrEUyV
 nUspp9wkDh8koWnCkwfcaMwRKtI9LwHMmFTNw9iDbTpgdpqhsdbczVwcm60ZGmGz
 qS+kFJnOZftTwjS44ou7FX63EHeFWm+mCY1hUqXghCn1u+/oLPSWbcCjA0FILOtn
 i+zf39fogX24masimnVb59KEfUDwenHmZgRGRjQc8WcL4ZQar214L18IWIdSNp/g
 ZBNw2mHGpby/YctJDp0WvAcRsqAspgONPEdVrjoHng==
X-ME-Sender: <xms:-XNzY0-48tmfdD8LNt_Lf54PMhIJonlGywjiKVdhkjhCJuQhjnAbEw>
 <xme:-XNzY8uPuZD-lFAUhmxoQkEINkzfzefoVy7pnfVhlE55OiGJHFgbcpRe8m2YUO7Sh
 UupnOIlHI7xgtKy1kc>
X-ME-Received: <xmr:-XNzY6DztuaCSJ5OOcIxARTDLbVEu11rhWhofrwD41JWwomfGaS3x1LGHBtLlQ8AP_nUQ4a075-WfqlxHeZctd7X7M_ykQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:-XNzY0fnKjfaxRRt5JGvTZR0N5qhrrACQUBSHi6zD1tjH-nk6wCvKw>
 <xmx:-XNzY5MHxgycLlKvB-qkmAchs9VlLM-548EfJnYYNNhUPGODdsj1fQ>
 <xmx:-XNzY-nniVGjJFYGTjsyw_484rL-fg6kobTsWP4ZQThw9UdC8TcWQA>
 <xmx:-XNzY6oBJkvsdK0SaB_wywrXJl498U9C6vdwxqGcseofUo8BOA1N0w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 06:11:52 -0500 (EST)
Date: Tue, 15 Nov 2022 12:11:50 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Joel Granados <j.granados@samsung.com>
Cc: k.jensen@samsung.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v2 2/3] nvme: Add ocp to the subsys
Message-ID: <Y3Nz9ieSaj0mHvRy@cormorant.local>
References: <20221114135043.2958100-1-j.granados@samsung.com>
 <CGME20221114135428eucas1p194fe5bc5c35783e4340ea89ebf4325fb@eucas1p1.samsung.com>
 <20221114135043.2958100-3-j.granados@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LaUMJcCT2j3Lt8Mo"
Content-Disposition: inline
In-Reply-To: <20221114135043.2958100-3-j.granados@samsung.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


--LaUMJcCT2j3Lt8Mo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 14 14:50, Joel Granados wrote:
> The Open Compute Project defines a Datacenter NVMe SSD Spec that sits on
> top of the NVMe spec. Additional commands and NVMe behaviors specific for
> the Datacenter. This is a preparation patch that introduces an argument to
> activate OCP in nvme.
>=20
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  hw/nvme/nvme.h   | 1 +
>  hw/nvme/subsys.c | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 79f5c281c2..aa99c0c57c 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -56,6 +56,7 @@ typedef struct NvmeSubsystem {
> =20
>      struct {
>          char *nqn;
> +        bool ocp;
>      } params;
>  } NvmeSubsystem;
> =20
> diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
> index 9d2643678b..ecca28449c 100644
> --- a/hw/nvme/subsys.c
> +++ b/hw/nvme/subsys.c
> @@ -129,8 +129,8 @@ static void nvme_subsys_realize(DeviceState *dev, Err=
or **errp)
> =20
>  static Property nvme_subsystem_props[] =3D {
>      DEFINE_PROP_STRING("nqn", NvmeSubsystem, params.nqn),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> +    DEFINE_PROP_BOOL("ocp", NvmeSubsystem, params.ocp, false),

It is the controller that implements the OCP specification, not the
namespace or the subsystem. The parameter should be on the controller
device.

We discussed that the Get Log Page was subsystem scoped and not
namespace scoped, but that is unrelated to this.

> +    DEFINE_PROP_END_OF_LIST(), };
> =20
>  static void nvme_subsys_class_init(ObjectClass *oc, void *data)
>  {
> --=20
> 2.30.2
>=20
>=20

--LaUMJcCT2j3Lt8Mo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNzc/YACgkQTeGvMW1P
Den/6Af/YMz5/TDEJ0VryFSb4q6VcQQHGU4ln7KBtX9odN39FWTR7wTAY0fZD6Ih
K6QmWzjBbY/4P0mUtBnlfgOTTkMtTNa7U0+3mU6gMD0GlhCBTOgocTzQX2/sZ43G
iscS30L0nwfHhix2o3k62gxXJNT9QmnC71PnxTK79zbE7yB5/FkOznYQpWPQ0CIO
ruUPfwtNHjbPWBQD8WK1JgyStsbxgYpYQ2LULyKG8lzC73msM/mbgDJgrA+uzp66
U3ehk/OQnNRtABYhQjCXBQcWnldCKAF8CNaMu88HBLLLUK2eaKJgVb3pfUYHyeHh
PipgoSmZG+8mKCLuKvnbFsNHUc5l4w==
=tu8R
-----END PGP SIGNATURE-----

--LaUMJcCT2j3Lt8Mo--

