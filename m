Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CDB607023
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 08:38:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollfN-0006oN-Cb
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:38:01 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ollee-0005nx-Ii
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 02:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1olle7-0005BP-Qo
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:36:51 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1olle4-0000Wl-JU
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 02:36:42 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id F01F65C00D0;
 Fri, 21 Oct 2022 02:36:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Oct 2022 02:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1666334199; x=1666420599; bh=EZ
 8L+0y3EjQz83l9UvHj/pJCiZx0XiiJfDo4l+Tn2ao=; b=CdIVn4/0umnrGh0jje
 t/FMKbT/9Tg5CtlOLD2V05Z/qfoZ/jYI0b0ReRRM3GURc8Vn+DNL6ffllsD1n411
 oC5VWsrim/ILGgJiwPF3Qj4P9AEcD6WcsZy/57TeGsWbQKPRHs8c862afGaZml5U
 qIMMjmOW7BvnN3Ca7lBHld/ZSPp5XEfAn8fVY2Uhg+XSXu7G0VWwq6iLc+ltGSC6
 z+E0rbREgNXsGh4K/xsYf0s+v+E2l6KHyJKaQV7wQxVU4DOdBpzYQjLriV9ORQn2
 LWBgHVwtkkLbcGHsfl/R0HAh4qaYJGFY7T1GkiRERtdQaGh3cB1tMd55RV52wO4p
 J4mQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666334199; x=1666420599; bh=EZ8L+0y3EjQz83l9UvHj/pJCiZx0
 XiiJfDo4l+Tn2ao=; b=atvSMLQbJyEfFtZno+397ITbB52Isj4kHF0lZa0aS3it
 BFRU6eagHP9NqDBMUCKMC8c4n+yutd+OR0Q+anFwzt7X6ZrwhirVXLIHakr1s8jF
 nmii5jQtC81jYU0gkWpJ9TyRi5SVNpdK0Q9FY/xkz2H5R3mEa1NswC2trAf5DnGk
 TEN53OYWqYstCztZn4sF/9S/2OnZXN40byl8PYHDOi9+guHCnUAw/2It71/b2EbB
 5rWSKpj1215WDBkX32t0Z7Iwh9TUJmoUqTwCntCN4u0nnG2raxtDPAHNVxGGiAnn
 CHDUOZNa6bBFgdnSU5mW9oZrJLJKZhWZJdCLt+xxhg==
X-ME-Sender: <xms:9z1SY6TrV4q-HX0Z2x76Tu_K6jHVcyA1Y7LSIU96bPzdARhUlqeSAA>
 <xme:9z1SY_zISqDDIwoWIRnt8b6VA8rIaeOwISiCUVBczQq8G4lXvrTBCHXjXosXo9TMP
 dRkdTwMRDflbbvgpXU>
X-ME-Received: <xmr:9z1SY31TGjgE_w00AvA2FKbi2W67jn4Ikqq5WCNuIhLH0y5HKe66WnTSqLOqBaN1wX99>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeljedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:9z1SY2BGVyw4JtYh7i6G0veNPY6bTkZJ_vbsWzmFBUWp8hPI3Aftdw>
 <xmx:9z1SYzj7Jqe0lVORlCBQip0d4L4mZLqHtYULFe8LpagQZ2k4vKXRCQ>
 <xmx:9z1SYyrj09lFhg_MolteH0UEoOK5XhwN3hr7hiLzGKCcEODLC9rEmA>
 <xmx:9z1SYzf6OZSm3LeJGX_PqPUtAvxXpknxogQPaBdtg2Vl2wfqMdvpoQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 02:36:38 -0400 (EDT)
Date: Fri, 21 Oct 2022 08:36:36 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: clay.mayers@kioxia.com
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Fam Zheng <fam@euphon.net>,
 Phlippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/4] hw/block/nvme: add ZONE_FINISH_RECOMMENDED
 functionality
Message-ID: <Y1I99OtVUfBPLaF6@cormorant.local>
References: <20221021001835.942642-1-clay.mayers@kioxia.com>
 <20221021001835.942642-2-clay.mayers@kioxia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gslNF128weE14mSQ"
Content-Disposition: inline
In-Reply-To: <20221021001835.942642-2-clay.mayers@kioxia.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gslNF128weE14mSQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 20 17:18, clay.mayers@kioxia.com wrote:
> From: Clay Mayers <clay.mayers@kioxia.com>
>=20
> Adds ns.param.zoned.finish_time, which sets the number of
> seconds a zone can remain active before the zone attribute
> ZONE_FINISH_RECOMMENDED is set.
>=20
> This requires scanning the exp open, imp open and closed lists
> of zones whenever a zone is marked as requiring finishing.  The
> expectation is these lists will be short (10s of items) allowing a
> simpler implementation than keeping the lists sorted.  It also
> keeps the overhead during the exception of a timeout instead of
> when zones change state between open and closed. For use cases
> where this isn't true, finish_time should be 0 to disable this
> feature (the default).
>=20
> Signed-off-by: Clay Mayers <clay.mayers@kioxia.com>
> ---
>  docs/system/devices/nvme.rst |  5 +++++
>  hw/nvme/ctrl.c               | 35 +++++++++++++++++++++++++++++++++++
>  hw/nvme/ns.c                 |  8 ++++++++
>  hw/nvme/nvme.h               | 18 ++++++++++++++----
>  4 files changed, 62 insertions(+), 4 deletions(-)
>=20

Single timer? Check.

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--gslNF128weE14mSQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNSPfQACgkQTeGvMW1P
Den+pQf8CbAQ5rfdpPbdqz6qHC5r+46hCtH/vL5vhWNhS53XpO8tBBkWupRP66jK
4FnS4Z4/mt8uvsDYW9MBasTIUC+Oa0MCmaYJY8YUw3436x36ZdansFdpscXuc9iP
BRE8/UneWEbD8iZdQx0l5f9x2JdnBzsBS6CIRazA9bLevCRT3onTrJWJk2X2oAh8
+FtYa7F5/cDgxGymQSs2DjHaXBioFgZYJLQGXhFrjydoKyMqYwonWobs3NcZZ22A
OafVx02CKuwsc1H7WvrGjjP0fYGzPwawUnXceZZFRWQu7Uq2wI5irR25w78GDdUZ
phB7lRn54wmBZHdNl6zaq7KolbmbvA==
=vxof
-----END PGP SIGNATURE-----

--gslNF128weE14mSQ--

