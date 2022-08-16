Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D675959F7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 13:26:22 +0200 (CEST)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNuiD-0006aw-GQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 07:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oNucQ-0008Oy-Pg; Tue, 16 Aug 2022 07:20:28 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:42143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oNucL-0000Gn-90; Tue, 16 Aug 2022 07:20:19 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 3A904320091D;
 Tue, 16 Aug 2022 07:20:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 16 Aug 2022 07:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1660648813; x=1660735213; bh=Bp
 iBjJD/mgy0xhGcff/bxJ+LKWwEGbhjChNnbwTMpSw=; b=SGtBqHIV+PO4tb23mR
 7Mz1/QlJGE5dZMGwHENU6Me1nPFdArLXypKs5D7nkf3PBU3dJsvwQTXMZTS3EBba
 4sc/CEfNho4zvEv5vVqmNZTG6FCW1kTzs0fzX04MTfJ8tFZuOHShzG9llbXOnPV5
 N/r9Wbkdp+0oLQ6o/XK1lnS8gKByXRjSG14JAUvq+AQpJ6GNK7lmvRjBcXknRqOC
 OAF/D2RgsqBQFbSYUatHntWFLXBqN72ExC8NZyuOw3Y8bcKnGmSoaV+rQAVT3l1o
 7bfvi2S5agza2HgUeUU4q7RYULM4GSjopt6gvKJXRYr+hNIUNmuRmyzHMFeJpz51
 fyKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660648813; x=1660735213; bh=BpiBjJD/mgy0xhGcff/bxJ+LKWwE
 GbhjChNnbwTMpSw=; b=au4OKhjRziVfYdxkd6fVgZ1gv83dNk3VOzXW6hc9eNDC
 9z0iTLAnDbhmaWbm+PwAfrTKBwegtQBILRX2/ZkjjUCvihmS3LXFukikPbNU0A+c
 0To+f8VpRBZZUzh55bLe3WVbozHDxulDzKZI8j1GetOjeRw6hUrBMOD9DXvh+q5k
 fKV9X6x9Nms8zP98nzfYarXtgCbRCgN1CM5qPRvWMQnejNYQ432RPlli44OjsZuU
 Q/1/+zCAixyVewla5Gk7e8p0+pHTS+aRf8UGihkL92Q554uB+TzNsTICy23IjG4J
 JpzEXdo4Vgc8Dz06FcubP91bhqG48S5CczydkOTK2A==
X-ME-Sender: <xms:bX37Ynm3AqHZRNr7MoIHDUk2_SfOb-JHr7WJ3NsN9Kp9TAJbksWXGw>
 <xme:bX37Yq3wgFhGZFxWo0mkk45HAGxFITWMmNX_gOxjrYI4yt7L5kE3wjs88jHbu2msw
 pZlUwE1tDwkyLZkTuE>
X-ME-Received: <xmr:bX37Yto__mOWM7MHipZf_B--6Uy_8pZGCdjcJWQfnnhapnp8KRPuNZepn-gV6aYD-NGZjhL8btw8Q41fSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:bX37Yvl3ei7HJoIIj02dIEQhM6UJwok9_QoAlYiUnCes786lBNdrSg>
 <xmx:bX37Yl2PvpXXiPD-dmwVYtjtr1T8OuoZjz7_fYr_GCNT2HGMqVrcTg>
 <xmx:bX37Yus0k0dCvsunbnlubA2FqsDpXLtSFobZTy-z9-M7oyXAQEgKUA>
 <xmx:bX37YgTIPTcyDeTT3NirabXySqdJxYlbhHppFSADia5PsdwwnZYCYg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:20:12 -0400 (EDT)
Date: Tue, 16 Aug 2022 13:20:10 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH 2/4] hw/nvme: add option to (de)assert irq with eventfd
Message-ID: <Yvt9aiRHrxA7GklC@apples>
References: <20220811153739.3079672-1-fanjinhao21s@ict.ac.cn>
 <20220811153739.3079672-3-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WSphPYwfm5O6Q9me"
Content-Disposition: inline
In-Reply-To: <20220811153739.3079672-3-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--WSphPYwfm5O6Q9me
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 11 23:37, Jinhao Fan wrote:
> When the new option 'irq-eventfd' is turned on, the IO emulation code
> signals an eventfd when it want to (de)assert an irq. The main loop
> eventfd handler does the actual irq (de)assertion.  This paves the way
> for iothread support since QEMU's interrupt emulation is not thread
> safe.
>=20
> Asserting and deasseting irq with eventfd has some performance
> implications. For small queue depth it increases request latency but
> for large queue depth it effectively coalesces irqs.
>=20
> Comparision (KIOPS):
>=20
> QD            1   4  16  64
> QEMU         38 123 210 329
> irq-eventfd  32 106 240 364
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 89 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  hw/nvme/nvme.h |  4 +++
>  2 files changed, 90 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index bd3350d7e0..8a1c5ce3e1 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -7675,6 +7757,7 @@ static Property nvme_props[] =3D {
>      DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, fals=
e),
>      DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
>      DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, false),
> +    DEFINE_PROP_BOOL("irq-eventfd", NvmeCtrl, params.irq_eventfd, false),

This option does not seem to change anything - the value is never used
;)

--WSphPYwfm5O6Q9me
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmL7fWgACgkQTeGvMW1P
DenlKQgAnzD3Dy0AheNLcrY+6dbh3ZsXEo3YuyrG3dnqWBdgd6cQs1WmNOJbZGNx
EYbcfs8EsVcbBpRIC9U/KdO5jNqRF4TGqB3ZlpiL2hdMOuwlACK7lD/mrKsundF3
mHu//0ZspDWZnaFUOL5N4VU+yzOHHS+qN6LFMtPn+4652hx6QDCIaIyde2eRqDGg
GxpbEXeD9Yw4hSoEz1UX1SLfAkUabyG6oB7dELLSjh2wm4rYzYCR3UhJ+dja8X/4
zurdJzdIS2b6lxLOKcwPrS+uQoo77uimAhDLcFQ81shhXyulWeiispTQkHE4V7zT
6iHNyHbCpr+2784Cn8cdTRiISYniGA==
=dnBL
-----END PGP SIGNATURE-----

--WSphPYwfm5O6Q9me--

