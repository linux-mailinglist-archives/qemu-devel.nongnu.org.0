Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B932FB5A9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 12:24:35 +0100 (CET)
Received: from localhost ([::1]:49858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1p7h-0000GJ-Uh
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 06:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1p2V-0006sd-9i; Tue, 19 Jan 2021 06:19:11 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:54115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1p2S-00064R-L1; Tue, 19 Jan 2021 06:19:10 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 02181EAD;
 Tue, 19 Jan 2021 06:19:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 06:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=UHy+OHmxleQcgTG/aTekkHf0SN7
 qIEnY/flIO1fdEgU=; b=usFJ6DmnZdFNVLR0qeSnK3KkORFAJgNMjwczi5uW97G
 6owK4++qU1rVItqPiS8fC6E5dgTODULw4R3k0KQy1CzIjoGbYom24XWNJ4rDE8Op
 Oe0PwO3usopS/YflSrEIG1Ddk26YJrVVjN1ZNMkCtyTV4WyUuaWkJETVCfx4HQWk
 mf4K7F2K1jwG6BcftosFMKA7LnuFUHPW/VxRPB4eWuhusjf4ZTplEc2M0dgribHC
 b+eivFf66eWpWvxbMWifwXpdhyJBwRIUoOC2zHYeTstuAer5drmUBHh9H/e2QVHF
 eDMRATEfufGKJxw6YqB8ziIIF/SJR3pU/UAjzsxyTgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UHy+OH
 mxleQcgTG/aTekkHf0SN7qIEnY/flIO1fdEgU=; b=lyn2l0/T5jOLSq2QwQ9mX4
 U3vq4oZ9BS+w3BzIQ1dc84Am3ip7iroMfQwXUhUmLlZTiOIQJXe+G40ofUHPY/5c
 bmgxR66uk9uRUvCjTkw1KAC2dIFS8MXZAGg//zhTbqiHb2HnpvExFLgibzJwhjRx
 R2cONtpxgJUeprytuOQ+xoHcL7k8qAPv1TNdZWQTnkfzwCFviYDGHyWPr2OHLZ5N
 0JJcQjDdyR80WSjsAEBeEOiQoHg75Q5rauiZq6EqVgOx4bffei99/rYqGfaLIn1a
 9xmuzK2wk8e6DcRmmnr+yPKwO2Xp7rAdgqPhNK4pF/5H6mhdOSLUsIXsP2/RH/zQ
 ==
X-ME-Sender: <xms:J8AGYMFaTgKW9Qx3dx4R9u0kbm7e6kylp8Eg3WHIyqhpm8nDm_igSg>
 <xme:J8AGYFUmyLD_B3Xxf_nKIvA7SQmSxLBqK-x2axc5pXDDOCjVX6jMQH9sul3yMaPWJ
 yRkDIB1e1FeoeNTG6E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:J8AGYGIIZRsHdimEVfH8Fw-kX2WIda5xlkow322eWDOvjPZ9bAG0pg>
 <xmx:J8AGYOEJyGoqYAhOWm7EIhe-A39rtvbYYFxT_HOqY0WL-b44wgDJhQ>
 <xmx:J8AGYCUfvKVeb_3dl7xqKc99u_u0WeRYCYEWH1CJufP8LDgjsBVQqw>
 <xmx:KMAGYAyqmHIEkl0EyOVtgwG2x4VqsXcJsvjr3prerZWFxH7w1kXXFQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id DECD81080059;
 Tue, 19 Jan 2021 06:19:02 -0500 (EST)
Date: Tue, 19 Jan 2021 12:19:01 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Subject: Re: NVMe ZNS zone append past zone size?
Message-ID: <YAbAJTV7VgL+1rVE@apples.localdomain>
References: <20210119103848.GA92347@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="W8gco6q6FtUNAz3m"
Content-Disposition: inline
In-Reply-To: <20210119103848.GA92347@localhost.localdomain>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--W8gco6q6FtUNAz3m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 19 10:38, Niklas Cassel wrote:
> Hello all,
>=20
>=20
> When testing with the ZNS code that is in nvme-next,
> I can zone append, targeting the first zone by specifying zslba 0,
> and then just put that call it in a while loop, it will
> manage to fill up not just zone0, but the whole drive.
>=20
> Since zslba is defined as:
> "Zone Start Logical Block Address (ZSLBA): This field indicates the 64-bit
> address of the lowest logical block of the zone in which the data and
> metadata, if applicable, associated with this command is to be stored."
>=20
> Should an append that specifies zslba 0 (=3D=3D zone 0), be allowed
> to write into zone 1 (and beyond).
>=20
> According to 2.3.1.1 "Writing in Sequential Write Required Zones",
> we should get either a "Zone Boundary Error" or "Zone Is Full" error,
> depending on zone 0 write pointer, combined with how many LBAs we try
> to append.
>=20
>=20
> Looking at the code, I think that this has to be handled in
> either nvme_check_zone_write() or nvme_advance_zone_wp().
>=20
> Considering that Dmitry and Klaus were discussing when to advance
> the write pointer, etc, for several of the patch series revisions,
> I think it is better to leave a potential fix to you guys.
>=20

Right.

The reason we're not getting a zone boundary error is because the
boundary condition is checked before assigning an LBA, so we always
check against ZSLBA.

I can see that in my old branch I'm checking the write *after* assigning
the SLBA, so it didn't exhibity that behavior. I'll draw up a fix based
on that.

Thanks Niklas!

--W8gco6q6FtUNAz3m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAGwCMACgkQTeGvMW1P
DelEcQf/cpupQt+nAbq/3BCAlmmX9P1QWKb0sq6dit+2IWnxP48Vxy7qAcGyzRfw
Tn2aWnrMum+R357AP1rBskKGInzj0zfsK6AjvPaHKuFdvGI14cRnNaj+M/Lp7Jrn
LExkGn8oderrPGf+aa+mIEdrmO/gIhoHIOlAmNabxRuxgeJNneM457xfawwpydg0
Rt+xJtOOJCtNA4hD7TyfacWRA3Acdxev/yHwTL4Ua4RSkJI7X7zza9YpvC4II5Ei
GOAKuDGaHVE3LdSzs6N7d787V3Fggl3MFy/RzCLvDdl1uCUTJCTjcdlxD1jC+X0X
vaULm2WDoeBowMrds0fGEkIESe+CYg==
=TYym
-----END PGP SIGNATURE-----

--W8gco6q6FtUNAz3m--

