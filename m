Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA192F999E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 07:02:47 +0100 (CET)
Received: from localhost ([::1]:46200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Ncj-00028x-Bg
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 01:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1NXo-0001GT-Bb; Mon, 18 Jan 2021 00:57:40 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1NXk-00053P-8p; Mon, 18 Jan 2021 00:57:40 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 06F641610;
 Mon, 18 Jan 2021 00:57:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 00:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Xazb7MAPOtxC7P7Ke/hmJLhBdvQ
 JzXzwPZ0dMI4RJAI=; b=w61toCvguQtcLZ1isekySSZc4DX9g2Xasg5XAdg+cg7
 /00ynr9Gb6TUYsSX4xTCqujqR/M0Dr4X+8d5VDzCVq0AKySBpDG0jGB/iXQrgqCP
 rJttjELDwp3wJdQ4AtIE1+j0+rRvULPioE/jVMw1P/2B3HjrGwXbHti4g8ZP/18H
 dnR4tvJmW+i0LEN/d9+IPlJHoosbF9GaNb+jzEbbEjirxuXYFQPpG6ZBSmm3ZNKc
 QkCTvy6cSDUUMxkyv2HuDbKSy16f7oNE8GjJc5S5V1l0MXzuQ0IEPqN9DSUAYiza
 aUBwujnqXUziLa22zWBUkQ6ed0rhOSjt5/Aq3Xm7E1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Xazb7M
 APOtxC7P7Ke/hmJLhBdvQJzXzwPZ0dMI4RJAI=; b=TkcOVU/cTR5xa3oK4Etj7S
 a1sPaGL2SQVWlQWx7BPNF2mylqkexelkc2JQ69PKN9l4A2vTWtNmJAhio0m3Njsc
 v906jphAqO2NhHZzqOLPPG2Pqx6mmu0xxhB5gqGmxvg+IPyWA4itjBqczWyX6R5m
 Pj1MgoicF+SxK3o9WSu4tAt/6jbpvy4l0AAFu2EgdU0QqA/BToX1DWOSLmHMUvEX
 dskSeLuzS7QJHTTZR0pTlQQWg3K/+JTyMK/eJVTwC+tuPH9y7hfGGYWvXmnm8hB+
 SBMVXXRmQFriPuz0hmW4KHXugOgRSxg/iODhy+I/ACwcIHDfoGYUj1LsrODdd1pQ
 ==
X-ME-Sender: <xms:SiMFYND-3-3GdTy2RUklLrOvG3MX-Jrkzo7GGqpHtNRulukwhf225w>
 <xme:SiMFYLh6BBdItWXokrEPAi_wZ8W70ZItqDH3efWX2EcUi54lpyA7d7K4EdXO6HyQK
 5nQwY78gIXKm5jPqqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:SiMFYInoKXwV6dmjG0GRtddij--WOfqhHpAGCBTcivaeZzzlq7ly1Q>
 <xmx:SiMFYHyE8vXG2IcY1DDsMXUftvwwk04rnJcap0BhEYGAOVEguvdyag>
 <xmx:SiMFYCSV3YHMwIS8TbrEnNHIirU1igm7fSqblYSZWimvseICSfkziQ>
 <xmx:SyMFYPQi4m4gHYp_qqZ0V8W2ymitGjIQLTfymqssHwwR69ZIeQMEPA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F3A0240057;
 Mon, 18 Jan 2021 00:57:29 -0500 (EST)
Date: Mon, 18 Jan 2021 06:57:27 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH] hw/block/nvme: Correct error status for unaligned ZA
Message-ID: <YAUjR1PWY8YiLLC0@apples.localdomain>
References: <20210118033917.5576-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MdAagQ6N27I3P1pp"
Content-Disposition: inline
In-Reply-To: <20210118033917.5576-1-dmitry.fomichev@wdc.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MdAagQ6N27I3P1pp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 12:39, Dmitry Fomichev wrote:
> TP 4053 says (in section 2.3.1.1) -
> ... if a Zone Append command specifies a ZSLBA that is not the lowest
> logical block address in that zone, then the controller shall abort
> that command with a status code of Invalid Field In Command.
>=20
> In the code, Zone Invalid Write is returned instead, fix this.
>=20
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> ---
>  hw/block/nvme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index a8dc13553d..f64676a930 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1150,7 +1150,7 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, =
NvmeNamespace *ns,
>          if (append) {
>              if (unlikely(slba !=3D zone->d.zslba)) {
>                  trace_pci_nvme_err_append_not_at_start(slba, zone->d.zsl=
ba);
> -                status =3D NVME_ZONE_INVALID_WRITE;
> +                status =3D NVME_INVALID_FIELD;
>              }
>              if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
>                  trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
> --=20
> 2.28.0
>=20

Thanks, applying!

--MdAagQ6N27I3P1pp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAFI0MACgkQTeGvMW1P
DekeQQgAvcG24umAXbrU0Q629iLiCqng2szZ9v3zz+0CpDRHFffWjM+7sfrmZj+5
bcAJi7BmFi69Iril27Te3K8eufX0Nugdi14gkteclOhpdImHt/mjQWgUhbxVWW1y
LlpshfJ5LRknSwZ7hwhy/pZvOHVQgQlYaMoWu6ILLd5vpkS4ZiVrmfvm3IL26f+v
0h0dS6K0t1/Yarq9ZsG2dZKuDIVv3AsQBOUISKme4qpuk8UziPT90remoyHbV9Gs
NYypETbMUgRPniBfr874yFgSsLlLuBRZHMD2Ic5dhmyajCIyRxJYD4BJHKpO3W+q
OAn/ERj7Q7e+2FemJmoNizMaQ6mFgg==
=3vVA
-----END PGP SIGNATURE-----

--MdAagQ6N27I3P1pp--

