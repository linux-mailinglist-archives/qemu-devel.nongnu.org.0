Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B213F1BB8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:38:16 +0200 (CEST)
Received: from localhost ([::1]:39322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGjBO-0008Bl-Vk
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mGj6R-0003JL-8d; Thu, 19 Aug 2021 10:33:07 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:54615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mGj6O-00080t-Fb; Thu, 19 Aug 2021 10:33:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 553C8580A24;
 Thu, 19 Aug 2021 10:33:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 19 Aug 2021 10:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=TFpBk3d70DReYz8r6I46rFbHUZF
 XUKYL87UuOG/gfR8=; b=LOGcQW9sdPtZr6FkBZs0237Zek2erMmPAgrPLpRImLC
 THaYqxW5sKGKSLyrwWXx5ZQeVcPkABDk/KZcS1UhB4NQxZBNHBD0NgPyloAz40Bk
 bfiZGuuxRsQjR40QzlTzZnGnu6747SnuQhLQO2X85GbT7DljvpFF59l/RGxOnr1q
 S0XDrDxAoocSMGC2NCAALWrdi7kscYs4yPbzGNPi6yAC5Psg7ngs0Tu5JUQB/uAX
 MeBvsy9pe6bxEwaN+q0V8KVfax9hOk8LikGpkk4yeM6oFdqKR5LwkLYufjs/UalC
 zPVsmZinRFlV6HORQj/eI9ACt5iX6zQuvce7Zvc+a9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TFpBk3
 d70DReYz8r6I46rFbHUZFXUKYL87UuOG/gfR8=; b=BzqIEVsdTW+GLPpMRcc6F9
 Qiabz4669M/ZF3KDa+oVL2mIndEHAdoRehva2y4mvNiYv12rBbMdh2ZC1ZBskG/q
 /caIvvuZ35JVouvP4kXn4ss06NkdFcBheMCjuCDHFL7EoqG2OksvZDFyzho+/Ajh
 M/1vrwUORx1VgL/mTEEawIKI4uO7ZUnLDtOnx8rNy0BSydA8ij/UtSOKazVw9MDG
 fG8BX8D1hIgsDLPtsy8jBQnZQvafmwfjqRXkYL8cLzaPJUTn21STjMn7mV9zTkqh
 Wo60Od32E7AONFIr6+rbnYv4lBiJKfS64kv6cvh0r0Tbkhl44jUKYpd+efVmcVxw
 ==
X-ME-Sender: <xms:mWseYcoBfj10nFZq8PxwT8y-CfxNKqsybz_f-2D0LnznQGkZU8MFmg>
 <xme:mWseYSpbcH4WodktpTo09dfneAIumTaWfMLnGo8B3QVBCnRL6zUnX724pnL5ipglM
 5EKtTdKqkeykEOU19E>
X-ME-Received: <xmr:mWseYRPl1jVxX6pD4odOa3-03giqtKDEDGpTRxCE0lCTOgfOoRLXpgfO7iJSmAm4GCljwbQubWP_x7w4479__U514FpLAUVUWsBzi-IjTTbst5XZvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mWseYT4Htupkxfd0a4d7pKn7qbqD9Pq-a_U1fnR4b3QYvvA7ZoYeSw>
 <xmx:mWseYb6NbieljA7WhRZHIGTOkTB74qNnN0VZOJo1puObOxeCCijqbw>
 <xmx:mWseYTiqeQ2dlwnQEvEeJhzi_dvlGzxVMLqNAzUktwhnoVN915OUxA>
 <xmx:nGseYfoyGtxfBqaj9rSXS1uqndEY4tneyV1i9FMdX8rfpVspNgbDpg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 10:32:55 -0400 (EDT)
Date: Thu, 19 Aug 2021 16:32:52 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Naveen Nagar <naveen.n1@samsung.com>
Subject: Re: [RFC PATCH v2] hw/nvme:Adding Support for namespace management
Message-ID: <YR5rlHYZNRLa5Sxl@apples.localdomain>
References: <CGME20210819135248epcas5p1fcc9f399f16a5336e6af004170a0eea4@epcas5p1.samsung.com>
 <1629378597-30480-1-git-send-email-naveen.n1@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4CwuXjTjluigJgOL"
Content-Disposition: inline
In-Reply-To: <1629378597-30480-1-git-send-email-naveen.n1@samsung.com>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
 linux-nvme@lists.infradead.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org, prakash.v@samsung.com, raphel.david@samsung.com,
 jg123.choi@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4CwuXjTjluigJgOL
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

Woops.

Looks like you sent it to the wrong mailing list - I'd be happy to
comment on this on qemu-{block,devel} instead :)

--4CwuXjTjluigJgOL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEea5EACgkQTeGvMW1P
Del6vwf9Ge4UvU3bKf3BL7Ffk2sA9rrzQ8X9bUp7/72q6a0oph5h3cyFSKiMIqvm
TscMd06/stsNhi7o6/+UyTVRo/hlK7UG9c9847Aonow7xL0wsd2+zBwQCl2DogBk
61h8cEdUfSQ+UTJBUCWrTcxVu8EzqSubJhhNdrV69QvytuFxMXHPTssGkh59TFyY
A4o8Y2xoR9Tkfhr+TsNVR5x1Qciyn1AQJgJjgTmXziP/6qXr2IuHMmHVEHZfMVGJ
1yew5kJOJ2zgRmPlW70CEURcbRrH88lFCZISMQTtHp/IQnAZoL7FjYXgBU0apxsG
lwFnw5hriqP+D7T3Ow0Qdc/jeqsW+Q==
=7GE0
-----END PGP SIGNATURE-----

--4CwuXjTjluigJgOL--

