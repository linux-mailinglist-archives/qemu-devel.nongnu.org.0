Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893AC508582
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 12:09:07 +0200 (CEST)
Received: from localhost ([::1]:35616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh7Gk-0004Fp-7L
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 06:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh7CS-0000UI-1h; Wed, 20 Apr 2022 06:04:40 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:39789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh7CP-00020y-Nu; Wed, 20 Apr 2022 06:04:39 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7DE4132004ED;
 Wed, 20 Apr 2022 06:04:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 20 Apr 2022 06:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650449073; x=1650535473; bh=bn
 F8l9YWO5eAsEKLsdyGGsYQc0W/4Fp2yKI6uxVRRR4=; b=J34FSayqd+0oGzW5jj
 HuE4vR/2KhBf4aw5aeBgBMbuvgc2u9g4DcHow9l/p0dXhwlwnixM1uPXbL31x/9q
 xCJ92Ih6lFJL1uqJ5Nu+wutgBAony0GRettgd0gewdyak09XgpIzNLGKnH0iJj+X
 +IJDfpgwVAsjZ0+5NyUYRkLB9XxSLYDsyHrIIfhRyN5sPqjBs+78gMdFyi/48OOd
 2pVrN9+dUQ64aQvqb5vCowsh/CHh/3v7/XmKsMwfwyDjlFIiFh9RIUj/iYyn2q4J
 l18/rllfchis9GJzTeOPaBIvU4dHZQXfrc2DnRnvBzrDaACoPLSQQUsKav8okiQ3
 Mzjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650449073; x=
 1650535473; bh=bnF8l9YWO5eAsEKLsdyGGsYQc0W/4Fp2yKI6uxVRRR4=; b=N
 KDZZyzhVWuqAApvMeqx2QuS2i4eYRSrUbO6gcVzaCxtlcImFtmTufJMSq1ql3+wW
 HNCzsthIXtv9o5eAfu/spXDckcqsTEuZHbDtDxElFHfy3OFqT+do3PevPh33teq0
 co8TZ33/C42O+oubXppOuVn0/CNF9tOtAT4RA3RgMLiddqjT4YQPpKfNddfcQlzm
 zMZXMPrU3G3z7e5uS9PTW25N+WXegZUkFIZD4TCM046+ayPrg5/FO9FuX+C82U9O
 t0wLkZsbHmCqBlZh1xtmiy8XDbfYV/MpA8IV2tLMf92xZLKvguHw3Px5vJn9PfTj
 9B52TLQPtD2z4aLuyj9Cg==
X-ME-Sender: <xms:sdpfYkaNd8GhWI4RLRPMBuUi3rLGu6LDsQ9ldaL8_RoOYzheTOePRw>
 <xme:sdpfYvYmUgE6Jo6uzDETYRy6a1NyglaKu1okeWNtbOeYR5eltBwo20jFWa_9teRa1
 s3xmCNz1eFyPHYeVFk>
X-ME-Received: <xmr:sdpfYu_yI5VuJbk6jBEpWYeH8YoUaJPydIsOp-CPFKPzBCED27c2rhl20QmaQNNjNBnq2dDgIXRd3v20IlA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddthedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeegudffueeiteekieelkedvueelte
 evjeduieeludfffeejgeffhfduvdduffeknecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:sdpfYuqVyEeI8BBA3vLMdFhJktePcdqwkOcx5_LB_x0VwtCXEO3ckw>
 <xmx:sdpfYvrUEyNgKQ2lF_9rh2sZHpGys8_uHv_wjrUKDTAklYFu3-T8Rg>
 <xmx:sdpfYsTmKGT8yJt6RN926h9HvimWzzc9lmuMFZvMb-C8opfPGvzBHA>
 <xmx:sdpfYgBD-quwXqSsyOJDYrU887Qv-2kaPcgP98s0pODSghmow0-d3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 06:04:32 -0400 (EDT)
Date: Wed, 20 Apr 2022 12:04:30 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Subject: Re: [PATCH 2/2] hw/nvme: fix copy cmd for pi enabled namespaces
Message-ID: <Yl/ari5v/o8vuveT@apples>
References: <20220420090336.10124-1-d.tihov@yadro.com>
 <20220420090336.10124-3-d.tihov@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qBspD6yCBRxWsIZC"
Content-Disposition: inline
In-Reply-To: <20220420090336.10124-3-d.tihov@yadro.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kbusch@kernel.org, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--qBspD6yCBRxWsIZC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 12:03, Dmitry Tikhov wrote:
> Current implementation have two problems:
> First in the read part of copy command. Because there is no metadata
> mangling before nvme_dif_check invocation, reftag error is thrown for
> blocks of namespace that have not been previously written to.

Yes, this is definitely a bug and the fix is good, thanks!

> Second in the write part. Reftag in the protection information section
> of the source metadata should not be copied as is to the destination.

Hmm, says who?

> Source range start lba and destination range start lba could differ so
> recalculation of reftag is always needed.
>=20

If PRACT is 0, we really should not touch the protection information. My
interpretation of the Copy command is that it is simply just screwed if
used with PRACT 0 and Type 1. PRACT bit is specifically to allow the
controller to generate appropriate PI in this case.

On the other hand, I can totally see your interpretation as valid as
well. Let me ask some spec people about this, and I will get back to
you.

--qBspD6yCBRxWsIZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJf2qwACgkQTeGvMW1P
Den7lwgAjlSnBtw9CHU4r/813XVMzduAUPcJVo3bJ4ok1WFxJr7iZDB1bf53HW/Z
NwLVrFlVCOt6/msEHnyx1fkNLtxLj973pZA3UHPBhIuQGO8Dv0Rkxmm+JCTqyxHh
ZwD6rD2fJ/swtyi0H8RNIySY1Hg+eA7kQ03F2WtDg0g6eVAn768ZvExaJlQQdbrU
4DBYhjpmwDWVh9knBfoCxTLmMXS8LwTeRqBeJpJN5qxDu4RrIcZ6eMe3NxkAfzQ0
HKj6mr6RY040qsiNvoH2JEbke6njdyjQVwh89UofSEcqgnPmGJh0rns5hDxnpjja
4oO8oCkLDQ9fboxQ8ZLz/X75kIXFjQ==
=cozT
-----END PGP SIGNATURE-----

--qBspD6yCBRxWsIZC--

