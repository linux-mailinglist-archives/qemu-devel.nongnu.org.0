Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DCD6A18C5
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 10:33:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVURw-0004AS-BG; Fri, 24 Feb 2023 04:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pVURs-0004A0-LQ; Fri, 24 Feb 2023 04:33:04 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pVURq-0005Mx-Cs; Fri, 24 Feb 2023 04:33:04 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id B51055C00E9;
 Fri, 24 Feb 2023 04:32:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 24 Feb 2023 04:32:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1677231178; x=1677317578; bh=+0
 KcElcpdlTehsqlJ9XRGxUfyzbckQLCdk8AhUFBbws=; b=PouKBdWLgrJYOIiWkM
 2KPGC832NgGwZ3GMqJ46Zuh2e/MXubLORTrvQU//bC2+LFuj2CIPTb156Cb8VYHe
 FuKAeH5zNMq37P/io28Yq8aqmRq1E6qghDt3QlTLnb5TOWg36U15mx70QxYP+sjc
 tYigNmRN4OdIBAcTA3VN9gAOfE+VijHSYK5FLua+SaRdVnHY+/YvVRNtPYvjnvW3
 sUk9o8aqZG3zX+x2lEZYKjyRJ9aFk9VZRQoKYRdEwCLZN7/MykAKnhAk1zCfpMN7
 Q3q5tpRrz6/65gboipGfVwGYwrV+lSxlJLIIc0Bf+NLQwXbzxG577Z8f78RBwFG1
 tMLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677231178; x=1677317578; bh=+0KcElcpdlTehsqlJ9XRGxUfyzbc
 kQLCdk8AhUFBbws=; b=mJyAYMIRRZqsM2+ivXnrglMkuDYECdIiEB6Kelbf9AvD
 khiQKfhvfnCkAqeXHdVG4EnOd/Ym5igYEDraN/WC5uxsLspOm9793iXkpHk6n6aB
 fNnrkEok5luTiL+WyQkcGs9nVNhH7llQEdEYY1IHpyXNU4fxgFBUxQDoohEnp6Gf
 UWUgIUzDhVgC5MNAdgkuuOBiw0R6h4eaU9GBN4SeEGo4/T15kmiF+c3FDOQUKaac
 CM+hdXzQRTarWh8zkEkWGBVRXbp7CAhD/eRYAyro0Xm5hD6wQNND+3RhulpbBnxu
 B+deDppTP0ItkZJy/xU/udbusKwlUPzcrsGm1eC/dQ==
X-ME-Sender: <xms:SYT4Y1GSlofcwmkayXsecCzpFvtCgKNhKxAstAICXAle1P2O_qRtaw>
 <xme:SYT4Y6UuM2vVpO-eYFmlHsHjTHigxhnvf1OjzPbLML6qWavVdea0UdHdqnCFOIAKE
 Mn6etS0-h_aBpfr-Ng>
X-ME-Received: <xmr:SYT4Y3JyL67STQdgU9CdTGNQR0dfxQBedGKjMj3XSSC5kauKk_m15tCT9n-BEwt93zx_jUdhAVr6XCny_g8RHN74YW6xLkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekfecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffejveen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SYT4Y7GSAW32yNNE03w2Jz6KdrfDGbo5n-kjetlSft4KCSpZvquvuQ>
 <xmx:SYT4Y7U_5sjmvs_NI9rVeCGQoPebdl9DfJtsOHMGxRGaQ_ncnWxDcA>
 <xmx:SYT4Y2NaCJkUzd4GWSbRbS8_33ljQa1XF6RuUfc5RZwavkvp0_bTQA>
 <xmx:SoT4Y0MpYB2iys5lUCFZXj3YpIbR72RoY4Hezo4vsQ8mChajOVJzQg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Feb 2023 04:32:55 -0500 (EST)
Date: Fri, 24 Feb 2023 10:32:53 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Joel Granados <j.granados@samsung.com>
Cc: Jesper Devantier <jwd@defmacro.it>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v3 3/5] hw/nvme: add basic endurance group support
Message-ID: <Y/iEReCiStNlNmSz@cormorant.local>
References: <20230220115926.54623-1-jwd@defmacro.it>
 <20230220115926.54623-4-jwd@defmacro.it>
 <CGME20230224085102eucas1p1d57ca7e6909c74db00799be1cff4d9d6@eucas1p1.samsung.com>
 <20230224085100.734khgmgqi5gfguz@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YNWFSdJ1Fm/TRV57"
Content-Disposition: inline
In-Reply-To: <20230224085100.734khgmgqi5gfguz@localhost>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--YNWFSdJ1Fm/TRV57
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 24 09:51, Joel Granados wrote:
> On Mon, Feb 20, 2023 at 12:59:24PM +0100, Jesper Devantier wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add the mandatory Endurance Group identify data structures and log
> > pages.
> >=20
> > For now, all namespaces in a subsystem belongs to a single Endurance
> > Group.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/nvme/ctrl.c       | 48 +++++++++++++++++++++++++++++++++++++++++++-
> >  hw/nvme/ns.c         |  3 +++
> >  hw/nvme/nvme.h       |  4 ++++
> >  include/block/nvme.h | 42 +++++++++++++++++++++++++++++++-------
> >  4 files changed, 89 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 99b92ff20b..729ed9adc5 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -4454,6 +4454,44 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uin=
t8_t rae, uint32_t buf_len,
> >      return nvme_c2h(n, (uint8_t *) &smart + off, trans_len, req);
> >  }
> > =20
> > +static uint16_t nvme_endgrp_info(NvmeCtrl *n,  uint8_t rae, uint32_t b=
uf_len,
> > +                                 uint64_t off, NvmeRequest *req)
> > +{
> > +    uint32_t dw11 =3D le32_to_cpu(req->cmd.cdw11);
> > +    uint16_t endgrpid =3D (dw11 >> 16) & 0xffff;
> > +    struct nvme_stats stats =3D {};
> > +    NvmeEndGrpLog info =3D {};
> > +    int i;
> > +
> > +    if (!n->subsys || endgrpid !=3D 0x1) {
> > +        return NVME_INVALID_FIELD | NVME_DNR;
> > +    }
> > +
> > +    if (off >=3D sizeof(info)) {
> > +        return NVME_INVALID_FIELD | NVME_DNR;
> > +    }
> > +
> > +    for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
> > +        NvmeNamespace *ns =3D nvme_subsys_ns(n->subsys, i);
> > +        if (!ns) {
> > +            continue;
> > +        }
> > +
> > +        nvme_set_blk_stats(ns, &stats);
> > +    }
> > +
> > +    info.data_units_read[0] =3D cpu_to_le64(stats.units_read / 1000000=
000);
> > +    info.data_units_written[0] =3D cpu_to_le64(stats.units_written / 1=
000000000);
> > +    info.media_units_written[0] =3D cpu_to_le64(stats.units_written / =
1000000000);
>=20
> This division is a bit strange for me. Maybe I'm missing something:
>=20
> NVMe spec states this about Data Units {Written,Read}: "... Contains the
> number of 512 byte data units the host has .... This value is reported
> in thousands (i.e., a value of 1 corresponds to 1,000 units of 512 bytes
> read) and is rounded up (e.g., one indicates that the number of 512 byte
> data units {read,written} is from 1 to 1,000..."
>=20
> 1. The way I understand this text from the spec is that if 512 were
>    written, then the data_units_written should contain 1; but as I see
>    it now, it will contain 0. Am I missing something?
>=20
> 2. And where is the 512 units represented? I was expecting a bit shift by
>    9.
>=20
> 3. And where is it rounding up to thousands?
>=20
> Shouldn't it be like this:
>=20
>  +    info.data_units_read[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.units_re=
ad >> BDRV_SECTOR_BITS, 1000));
>  +    info.data_units_written[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.units=
_written >> BDRV_SECTOR_BITS, 1000));
>  +    info.media_units_written[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.unit=
s_written >> BDRV_SECTOR_BITS, 1000));
>=20

Yes and no ;)

First, No, because you are quoting the spec about the SMART log page.
This is the Endurance Group Information log page, where Data Units Read
are total number of bytes, reported in billions.

Secondly, Yes, it is missing the DIV_ROUND_UP().

--YNWFSdJ1Fm/TRV57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmP4hEQACgkQTeGvMW1P
Dek5dAgApBIQsDMhIJ6f2cxY9AcXWQn56BrJ/PZhf+Uic6Z2j8lxJcroXfLTNlKc
TWs/asrItkz35neOum6cu8CeU3owTUnVuQ+c/t+qEVacHTtJsznpJVxcJGEcvcyo
b9I8vzO6VGPXS+Jt7IFY3ze9Hor5J8wCIh2oAwUrfz0/hkDC33eUCoPiEn4z+ZvV
aSPCFEt6vWJhm0vrEuzIr065hF1BCAaefIl6/AYgWR0guFwYtKOSV0KlNqemVii4
Kf9b0z9Y6V/xIcG0xyCH7EkIkQkRsJA52TnDbNIOcjo8IJ5PEA4Jw9FKOfUcgOL9
rsZXeTcIMEUYBZzVKyHz80VfXDl4nA==
=difg
-----END PGP SIGNATURE-----

--YNWFSdJ1Fm/TRV57--

