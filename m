Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E9E4166CC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:39:53 +0200 (CEST)
Received: from localhost ([::1]:38934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTVVY-0004kj-9U
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTVPM-0008BO-78; Thu, 23 Sep 2021 16:33:28 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:41581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTVPJ-0001rn-9t; Thu, 23 Sep 2021 16:33:27 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0DDCE580C02;
 Thu, 23 Sep 2021 16:33:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 23 Sep 2021 16:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=29dI/lk/L+v2mMuoW/kv9SWIOb7
 opfJ7b/6zwRYUi3A=; b=RQO88l+hjD47zu0ZD27pKT0KfvsuanJjG+VfkbE//XN
 0kiembxCS0LG9LQONPSc1QiF7RyLChv6Jg/ZhH/kaYssf8v862qSFVvrUP7hxJ5t
 N5y2wjJ16dQJD/KX5AseA6I01fjKLHqvkP2A5G++S/Sf1M+FlI6fJ17l5chGxx/4
 61APhAS+f/5fOkqL5swEICupnIjz7OCl9+0b7fm+JbQAT4bdP3hrpLahmr3qx2XY
 A0kTjEklyZbSjDSoYlc5qsZ0+HEJInSbJUbLYhQkK0ousSqFoZUgz5WBZ0uXb0Gt
 owSCKC5yZZrnqfmhrVhYDDvHaAjHnO9fv3SPot6GokA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=29dI/l
 k/L+v2mMuoW/kv9SWIOb7opfJ7b/6zwRYUi3A=; b=jLZC5DJypd3NAgVfunwlCS
 NxKkRuLp/EXugf3oR4KHa4N1T7wl87aqGQ3I8sc7nWOxC1fBCGTLeBNiPf9NVg+H
 L/A+cOkYR7otuEf4Wj63YsBJIKc2XXi8m9qVkWHlGI4ttpfD0TKgLtzNypJlFDno
 UKT6Dno3RNMWwvtE6csPItOtIbW5RJIX/vq88rignkEbfXb4bzYhG9c3vlcM/xQQ
 YZEzBJplaHBcqIhieFJI0aYOujo5P7vVzWq9fpwtc+x5xEDKpTYITcFrgUUFpSJr
 NBy578eQFCld1zFLKUw7xU9RcijaUz5gm5kTS+kLwlUxzZcBTusXxWaRo+XuPV9A
 ==
X-ME-Sender: <xms:kuRMYRJ8blKoA_FbNIBlH2iZrkG04ybQKQzSFZrSm0ifTEEZ6-5hFg>
 <xme:kuRMYdIbEaEWvjeC-P4qkHlQA8bbzQYRg4CW4AHBGsiJoLcN4PlyYp8O-SrQsW7nG
 bVwNjH3g2rmvNKpp0U>
X-ME-Received: <xmr:kuRMYZvcP6wbQWAABUVKjk2Nu3JhgvQFOSZPdPaN_ocpw8582LFSbR2Gvllpqdk37j7QOQkCofc7kkMJGI9F862dwiWhslIm1KRBH0cfaYLWI306WQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiledgudeglecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueeuffeihffggfetheejieevleduhfetfffhheeigfehteejieetvddtgedv
 hedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:kuRMYSacK8VWcDxBxrUam9uuQQWc3zpEc498nnG4gcpu6Bgv0TJTKA>
 <xmx:kuRMYYZkJ0XyfF7fJVo66XGFDMwG340gnNJiF_Him-1chT9uCFLfxg>
 <xmx:kuRMYWDNhDZBWL5fN0EFQsm3hfR7BNKmK_672U70Gd5iWnDuABYHaQ>
 <xmx:k-RMYVJOh-OFts9mGPfKWlis4JoRn0QtrU0GEz4SuxTyv1z94-yQlg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 16:33:19 -0400 (EDT)
Date: Thu, 23 Sep 2021 22:33:18 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Naveen Nagar <naveen.n1@samsung.com>
Subject: Re: [RFC PATCH v2] hw/nvme:Adding Support for namespace management
Message-ID: <YUzkjsOkMHZhgtPZ@apples.localdomain>
References: <CGME20210819135248epcas5p1fcc9f399f16a5336e6af004170a0eea4@epcas5p1.samsung.com>
 <1629378597-30480-1-git-send-email-naveen.n1@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nS+euLU5fMH1UYw2"
Content-Disposition: inline
In-Reply-To: <1629378597-30480-1-git-send-email-naveen.n1@samsung.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
Cc: fam@euphon.net, kwolf@redhat.com, anuj.singh@samsung.com,
 p.kalghatgi@samsung.com, qemu-block@nongnu.org, k.jensen@samsung.com,
 anaidu.gollu@samsung.com, d.palani@samsung.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, kbusch@kernel.org,
 prakash.v@samsung.com, raphel.david@samsung.com, jg123.choi@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nS+euLU5fMH1UYw2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 19 18:39, Naveen Nagar wrote:
> From: Naveen <naveen.n1@samsung.com>
>=20
> This patch supports namespace management : create and delete operations.
>=20
> Since v1:
> - Modified and moved nvme_ns_identify_common in ns.c file=20
> - Added check for CSI field in NS management
> - Indentation fix in namespace create
>=20
> This patch has been tested with the following command and size of image
> file for unallocated namespaces is taken as 0GB. ns_create will look into
> the list of unallocated namespaces and it will initialize the same and=20
> return the nsid of the same. A new mandatory field has been added called
> tnvmcap and we have ensured that the total capacity of namespace created
> does not exceed tnvmcap
>=20
> -device nvme-subsys,id=3Dsubsys0,tnvmcap=3D8
> -device nvme,serial=3Dfoo,id=3Dnvme0,subsys=3Dsubsys0
> -device nvme,serial=3Dbar,id=3Dnvme1,subsys=3Dsubsys0
> -drive id=3Dns1,file=3Dns1.img,if=3Dnone
> -device nvme-ns,drive=3Dns1,bus=3Dnvme0,nsid=3D1,zoned=3Dfalse,shared=3Dt=
rue
> -drive id=3Dns2,file=3Dns2.img,if=3Dnone
> -device nvme-ns,drive=3Dns2,bus=3Dnvme0,nsid=3D2,zoned=3Dfalse,shared=3Dt=
rue
> -drive id=3Dns3,file=3Dns3.img,if=3Dnone
> -device nvme-ns,drive=3Dns3,bus=3Dnvme0,nsid=3D3,zoned=3Dfalse,shared=3Dt=
rue
> -drive id=3Dns4,file=3Dns4.img,if=3Dnone
> -device nvme-ns,drive=3Dns4,bus=3Dnvme0,nsid=3D4,zoned=3Dfalse,shared=3Dt=
rue
>=20
> Please review and suggest if any changes are required.
>=20
> Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
>  =20

So, I think this is a fine approach.

However, I think we should let it simmer until we know if my -object
refactoring will be accepted as a way forward. In that case, I'd like to
only add it there and likely as a new namespace "type" (i.e.
x-nvme-ns-unallocated) that will be replaced with a dynamically created
object depending on CSI.

--nS+euLU5fMH1UYw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFM5IwACgkQTeGvMW1P
DemMXAf9FTqB/NefkbE0aDgn49VCAe4Tte+DRqMlDe1CpFfOZaRfko4vjMJ41t18
Npp+2CihJ+6Hxf5Aaxujl5H7tF6FzgMU1MXwanxqw5mxL5nq3fb+qDY8EJGgHOT/
2/3upJHjzQXKr2KSwwhBZR5YlUeO4sgDHBTJZLQE02+XuNoZRuT6LmK5IQi0epJy
TKHHtsYDbji3RJvU1wXyMUQmKT8yb4RfOZ2l00eaa22tIRmwTdnP9n99ej0usaj0
H8rTjZRvT3e9w1iaQvmrI0nEqe/WvWPtqMfrXgNB6kbQBSi8NctibmRxni/nlEoi
jBoKAQRaV+3T625SLm/gomHvaABagA==
=cIp4
-----END PGP SIGNATURE-----

--nS+euLU5fMH1UYw2--

