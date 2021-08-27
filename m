Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E63F9425
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 07:59:26 +0200 (CEST)
Received: from localhost ([::1]:48104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJUtc-0002ty-E0
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 01:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUn6-0006ku-3I; Fri, 27 Aug 2021 01:52:36 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:34785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mJUn4-0000O3-Ly; Fri, 27 Aug 2021 01:52:35 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 460F932009CF;
 Fri, 27 Aug 2021 01:52:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 27 Aug 2021 01:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=tWQ09YGSsUwy+TBfKDbUsDALb4D
 ly58mNnOKopaHB7I=; b=VwRmDk1/RDZ2LwR+KJvgr2t3PQdSZUxqDh7TzzCKm+m
 IZmsxeCvFtljYZKFbWis/kP6P/vqppYS+HtX14I+htYs4CGM0DipjeyHMzcC/mBI
 PuvIzY6e5tb2dG67NzlJkFqFNMvoioHApEy0Q+So4tDl34r5tUH1cj8JHsO32RXQ
 cj2M7wjXyK892aXXY6BgY6deei0PVD6mDVMjyLPL03pkcm5P3m5E3pyjnegE5GJl
 c01hZPy1zy6Qn4FHbqWFwRmsgAwLz/HTbr7q/4cPFzuAuGLoqzpomPy9khHyOVzl
 tRP2cF5hLR9FUbyCC0EdwLz78/IEFmeqzt0QgakrVDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tWQ09Y
 GSsUwy+TBfKDbUsDALb4Dly58mNnOKopaHB7I=; b=rToWlsxfcyS4l7i5f+p1bM
 CQVW+oaGXqen3ncaVQ/LSaho5/1juCkdWsJPrj9nGdOQ5vF7d4LOgPmlMD14UDAF
 79Z4GvKLOWLOnRptaEDbXlLdL50KjvjAcTzWue0aPbEOTaZzmHC4SyzS027qROrS
 Uo9D6R/JOTRrjvfBPFOn18KUtnTd1qXLhFnDQSV3a1Vt3+3pSaR/7VrQOyscxkMz
 KHov32sBfylSMwLJVeHJAKTKVevb1Yq3ZFFaNEfSnR37BaoUcoz1obtEwEz0Nzd6
 KogJDdm167qcLhp3SlRmMaWItIg2S/lLgtGZ8yzdEKDrpATn6YcPoKIoi5z9TNLA
 ==
X-ME-Sender: <xms:nX0oYevhFNnMdzv39Vrf0T9X9kkhurdXHQVzE1oyBXos2ln2KDNm0w>
 <xme:nX0oYTdvd4eXqzlaT4k-7RwZFhB3ZmkHjP4je1OkKIex3ZMi4YeFavc04VxoDZ8XV
 SWdHKQKOb_td5Ym8Fg>
X-ME-Received: <xmr:nX0oYZwc2isArfpbZWRjTiEXSHX6iKaYsrg0w3n40nSkvHIK4zeNMtgjBz1WA5uDTOWDZ_lFXm9CsBNvNALKrzYVCcjziqTMivdWMVXtABJyCx2I1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduvddguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:nX0oYZPCRY45o7vVODUxVbtKbWawdcIvDGYi0kbFDNIFGvCttA8_9w>
 <xmx:nX0oYe-uS1biDgikzGohAaXtU8tZVWMGRjnOYXRYZVDbGLlBbqrQAg>
 <xmx:nX0oYRXSnsQQSeCdAInIV2NddC13NRUOzNiU1Cjis4NtsfC0Wacw1A>
 <xmx:n30oYSRk-YQCtiQ70jHW36UCDT7_zwGJGwb1JRigAYDJQYgA9XVsBw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 01:52:28 -0400 (EDT)
Date: Fri, 27 Aug 2021 07:52:26 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 02/11] util/vfio-helpers: Let
 qemu_vfio_verify_mappings() use error_report()
Message-ID: <YSh9mkKCvvkotJis@apples.localdomain>
References: <20210826195014.2180369-1-philmd@redhat.com>
 <20210826195014.2180369-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+xHGyBHQGNRmrJeG"
Content-Disposition: inline
In-Reply-To: <20210826195014.2180369-3-philmd@redhat.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+xHGyBHQGNRmrJeG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 26 21:50, Philippe Mathieu-Daud=C3=A9 wrote:
> Instead of displaying the error on stderr, use error_report()
> which also report to the monitor.
>=20
> Reviewed-by: Fam Zheng <fam@euphon.net>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--+xHGyBHQGNRmrJeG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEofZgACgkQTeGvMW1P
Dek7twgAnVWIsxWTCSI48EyrLajyU/cdGsTaDLk0KFFas9hKyUHtRecvliGiM6FQ
p8OtFjRkcGJoJZ9IVWsUF/EfHLWyRCeRae/Vc757PcHA1jtiHMeG6t4hwifgUp70
9LB4Xch5qw5aIYSQnjmbnOphiOXu9oda9zvMNWAzpjm+JTsdfHZFqWDKCoY7odKr
w+Gf7az2O2sUN39oMs1kKpjwtS69Wfg4X2EJgRBSpN8+fS8E/6izHVXde2wgOb5S
yzESouxn6Vk6cgKkWnD/jDp9t+Fnm4fOspkJSISPyeIwS8ofmH0Bs93plWjaZfi5
4FXqa3yToMT0j9yS+MrKW7JXU91w3Q==
=1dNa
-----END PGP SIGNATURE-----

--+xHGyBHQGNRmrJeG--

