Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F9E3FE9F4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:26:15 +0200 (CEST)
Received: from localhost ([::1]:38432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLh70-00052B-RX
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mLgwa-0006Xl-DT; Thu, 02 Sep 2021 03:15:30 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:36123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mLgwY-0003D8-P7; Thu, 02 Sep 2021 03:15:28 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 033183200A68;
 Thu,  2 Sep 2021 03:15:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 02 Sep 2021 03:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=NUXG1PlB3xDCET3gQ3DLVgIJJJB
 pzShBQJIvHObUIh0=; b=g0i8uxGG1bsUeg9gwS3hBSH3TLcpqp06e6Km48Setrm
 2d+vTbbpwKSGYCr+sICGdT3bgG30YJLZax62Q7Kjti5or/LgunI3S9mo5jBF1b+u
 EN+RL/4W9SxMusF1DzuumZW+kVibMsm1rMTqsiPQMTDIhYkPwCTRRg4P3NYa3K4m
 t3fF1tIv9K/wVHhGRVhF14Z2/uTDS7GddEVNANFaxlC3V0MExl0m41kWtegrhO28
 YnHLVTAiN/+5lLtMTw82hgJAZ0wn+n9cdFNKoAq6ZWCXYSzEViEbXVoA5jAw+Vg/
 TTsxoLRU+CyBPSG4IiCBXcyL0zPHmZ1rw+YoH+ijnOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NUXG1P
 lB3xDCET3gQ3DLVgIJJJBpzShBQJIvHObUIh0=; b=hzaNmrpnhQHDafyWvAyShS
 4Wp8pO/o832QaS3mHKJysOEZMjQ5eEeKjdHLMVzmdVAeUS5X26FSXlITrly/9K2G
 1/Pv3BE66nTBaxtl4Sjx24mFaNbfFs3SHE66uL0pGXBDChJZsIjV1pA7d7Ep1tJ2
 OAUUOUCs7i4Or1eJI0QzI6FFdP5iNQbuCK6qZdCHsDUDaT7q+H0ImLTDQYXTIgxC
 Ck7v6JEOec1nYmGy9mpJVpwax7uBKoxwIGWpnLwVn1m33vLs8zl6yxelpl8s0aVR
 K+soWFI6HrzayLaEpy790up4/Vz0ftfdA6pJBI8nm/i/IxHxInUOfST1xDQewLTA
 ==
X-ME-Sender: <xms:CXowYRLlKMX2spGPL4t1OxacY0kMTxs-GpJrDLqkgqO7Odrx1p0lxw>
 <xme:CXowYdLQxcB1Gcusq71_s5YyiU8HSNgeChZtX6aCk2oJNvdG3jLzohNd600FPMWlc
 -g0w3xONJ3tfW5g-hk>
X-ME-Received: <xmr:CXowYZvtzmKTAWqCdIy8N16fbcop8Ns01neGupIhb_ndzT1sJViuf5toMY3NB3Cb8BbZSgL8qER0f3JTjf4pu9o6DMIieMnJ97sOtUZU1AVSh6zJwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvgedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:CXowYSbZW7XnkgHeCMu8zqkPL0q5vyuqIGFZoFjKVmLIa9Sc7iA1jg>
 <xmx:CXowYYZdfxwbI_782vShe0FVK4tsPOiSaEbbX0qJhIAIMgQQ9N-XUg>
 <xmx:CXowYWDSr3yqOVxgKH21VS33ndYtVNzvYtSrt-18itFMAmuh1_wI2A>
 <xmx:CnowYeNyULY5wMY9GqdeJirSmh7sBC9k23tInMlJ7MFle-8cGbRmNA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Sep 2021 03:15:19 -0400 (EDT)
Date: Thu, 2 Sep 2021 09:15:17 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 08/11] util/vfio-helpers: Use error_setg in
 qemu_vfio_find_[fixed/temp]_iova
Message-ID: <YTB6Bbav1n6qYDvQ@apples.localdomain>
References: <20210902070025.197072-1-philmd@redhat.com>
 <20210902070025.197072-9-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g5DjkQfM2JlL7Rb9"
Content-Disposition: inline
In-Reply-To: <20210902070025.197072-9-philmd@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--g5DjkQfM2JlL7Rb9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep  2 09:00, Philippe Mathieu-Daud=C3=A9 wrote:
> Both qemu_vfio_find_fixed_iova() and qemu_vfio_find_temp_iova()
> return an errno which is unused (or overwritten). Have them propagate
> eventual errors to callers, returning a boolean (which is what the
> Error API recommends, see commit e3fe3988d78 "error: Document Error
> API usage rules" for rationale).
>=20
> Suggested-by: Klaus Jensen <k.jensen@samsung.com>
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The switch to bool LGTM.

Reviewed and Acked :)

--g5DjkQfM2JlL7Rb9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEwegMACgkQTeGvMW1P
Demqewf+I+uPSfNziY1+04pVGK2s8HZMBOABWdazfyUtYPnOvEV2qOdJ9B5ZMWzD
q7hIwHHEAVK1QHbjhHmm0JOE4rFxKbg6h8dps5SJ7sWZWtAAaPGrRGddX1Z5SkFJ
1hJ5YuWME+JAhuDrtmYlZ8h6oFeJn+SRxMv08R/mBxGYm83w9AvTS1Nr7SAhHsoV
cc1Ki3eiB6WG5WaqoUGV7JCiX5nD2/HgfsCkl3kdrsgZsk2Rfz7Qct215+F7j7Fz
IEY6SpdDrkaeH0Xpzw/LRrDhxsU9FzQnpgfRdyedcbXfvVKJXWPS48sauodW1hhK
k1hAXUYMpH6FMgKqN3rXd0euKkzpTg==
=e9je
-----END PGP SIGNATURE-----

--g5DjkQfM2JlL7Rb9--

