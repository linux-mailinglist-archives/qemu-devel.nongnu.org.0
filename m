Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9321533C6C2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:24:44 +0100 (CET)
Received: from localhost ([::1]:47976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLspX-0008SW-EI
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLsQw-0000hO-7a; Mon, 15 Mar 2021 14:59:20 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:49411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lLsQr-0007Cs-Jw; Mon, 15 Mar 2021 14:59:16 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 718DC1C07;
 Mon, 15 Mar 2021 14:59:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 15 Mar 2021 14:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=HFnZfi4lbiylq70bd6irygOzTxK
 8t9wC2ENycQHD2xM=; b=aNn35haFhf8lYI3sTkX8Nuv2wCtjtrrgOH2lyLhhh+I
 v1ieLbn9B4OHhDxIetofT5F9gev17Z2C4zXi49iR52JcrHC0xQplHqKH0mtZ8X9u
 AQdPWz4lpCc2JIqSQEVY54XYD+tI3/teDtENz7bWVXj+gcX0nE49o9hCzI4oskBr
 lVTDggUJGVdbM1TZddrAv2/mJ6wyz/Q/OzWGejfuG4gI9a5UhdgU1SheTrpEJXJG
 OT20vMVYptIqA90BH/g/lyN9hrcImyoSSWVbwPkQqofc+omxOzSfoR6v9feUptFv
 iZSiUHKMo36HHtDfpYkRmn95+j9bGpkkHwW81BXpp+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HFnZfi
 4lbiylq70bd6irygOzTxK8t9wC2ENycQHD2xM=; b=BAHYm5QWaRnv8orqqmDaRL
 eRP7dioux/9p4Wa+YWenvd3wIpLiW1iWGCUXPLhuHngdpj7Dwf/sThBD508HjNNF
 k8313KVu1IN+bfmXzAfu8N2gB2v5bmsEwnllbeaJl13UJ2rCrzYJz/Kik32gCA98
 wdfWIksaE3pyDC4/sBXJbO8FnqcHr0rt2nLctV4/ettfIfT3Bg+hpgBAxt7GW64G
 tRk2muGoJujNQiVVToKS+9g7E/hTRiu3IEJEtd44uxIpdGJtAnRnZ8F6CWQ/pdP9
 mOLG4QpP/ds6oi0hslF/1XCimLXQrDUvJ5VnXKNbcSK0ho+2FVJlTmrkhu8znJ/g
 ==
X-ME-Sender: <xms:fK5PYDKSlz-RwFj8b6vXaJQUfRoKepf7Ih_UcWziV8lnuURq3DqDeQ>
 <xme:fK5PYHJH8KpRma1fibkMudbBoSkDxgKzUK057e8EpxUg47jr4vOxD6Pbm4rFLuX4S
 7zGmNmLes2M1pbfdKU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:fK5PYLsv91gI2T7z1m2WSJZb0qaiUvm7I_wr0epCxEzTnpbLDXP7HA>
 <xmx:fK5PYMbAaGXJqOpvPiKVhYuTOcLqFG7gHC3VZ0SB9Szo6GpkMjOQrw>
 <xmx:fK5PYKa8l_H79vP_QDs_5vbx9_H699LLHtyjrSdlvb_r6VGowipBQw>
 <xmx:fq5PYAN9jX0mI71fhr_Cd8U_0JHo9xOH90Ro4UykrhD9wPBOMNigCO2zNfs>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A88B1080063;
 Mon, 15 Mar 2021 14:59:06 -0400 (EDT)
Date: Mon, 15 Mar 2021 19:59:04 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [PATCH v5 01/13] hw/block/nvme: fix zone management receive
 reporting too many zones
Message-ID: <YE+ueJbVdy9RQMYW@apples.localdomain>
References: <20210310095347.682395-1-its@irrelevant.dk>
 <20210310095347.682395-2-its@irrelevant.dk>
 <MN2PR04MB59510F893FD416825A3B7E5FE16D9@MN2PR04MB5951.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+T+xMPJUlLIVzzT4"
Content-Disposition: inline
In-Reply-To: <MN2PR04MB59510F893FD416825A3B7E5FE16D9@MN2PR04MB5951.namprd04.prod.outlook.com>
Received-SPF: pass client-ip=64.147.123.18; envelope-from=its@irrelevant.dk;
 helo=wnew4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+T+xMPJUlLIVzzT4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 14 19:31, Dmitry Fomichev wrote:
> LGTM,
> Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
>=20

Thanks Dmitry!

If you could give [10/13], [11/13] and [12/13] a look-see as well that
would be awesome :)


-
k

--+T+xMPJUlLIVzzT4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBPrnYACgkQTeGvMW1P
DelVZwf/cQ4oLcpR+b3j2p80WVhh+On9N7PYZJDti6+8hJ4RAF2xAcYs0/Vzy5LZ
hmgpoMbrikPAJWG96z1syTJ0NaCJ/IiixJDc7HhoxzdkjyAorgC2IG26Vi4cxFsH
mBqDVzUDQmf5EAA9B97OvoMaHGJEINTNlTqVB79mH0BieSj7+dloTDsf7gurCzhf
AhBUgpAAo4elv3Ng174DS3uMFFw/UkDYjAE1BxdHFG5zG6TFC9ACs2rpMRBPbmdn
cIZrv/RIR99ejAVfd07Qq3ueEGJCmr/KMGTT8u+kEjMdc+sV4HOwOsPLcU8QyzSj
JX+F5BwhcqEJV9EzdPqE9mmoaTEQQA==
=SVQ9
-----END PGP SIGNATURE-----

--+T+xMPJUlLIVzzT4--

