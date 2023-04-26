Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8B26EEEF9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 09:12:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prZJR-0008DD-7U; Wed, 26 Apr 2023 03:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1prZJN-0008C3-Sm; Wed, 26 Apr 2023 03:11:33 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1prZJI-0007lc-Ll; Wed, 26 Apr 2023 03:11:33 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0B3BD32000E5;
 Wed, 26 Apr 2023 03:11:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 26 Apr 2023 03:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1682493082; x=
 1682579482; bh=wxzA0EtHQGc00M9ZoloAEiUdZhzJkzL3h8woY/ESkd0=; b=m
 qF5pXGyLWky83QE4eCKO1G+RWj8N1nuYriqVPzZOr66L6n6qAZi9KeYjHlik1oDS
 C6GGzy8SE/je10n0iut9k+808yGqNZZDVm+I5SuPIO+mRDGB7KXGpfIvl3+uqPQt
 o2+qTFBEylj8puOUVWudUmoma4p02fo5WMUCk6HrVb5g2ydRjH9R6MGlTqCIANO8
 /XXbFJ+GFj5mcOE3QG3UTzg47s/zZx1MNDKBZid9Of1ljhWtikTKML3tJvKp7B4Z
 5WuuFrXfDJ481lSyb/IfefNkgmSTA3UGEYY/Kai3LD5VvQAjX5wLH53E5v0N8hbl
 IYd2SCkkm8tGjPIA8Huhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1682493082; x=1682579482; bh=wxzA0EtHQGc00
 M9ZoloAEiUdZhzJkzL3h8woY/ESkd0=; b=jlyoe98iZaQisOxnGPvmQnRabB31V
 baTAkuxBq1M8z6GYHxrWzdBRvjf6m+Pdqndvi3fATLB0aQ+5CjpFwfiQhdgGbsc5
 KcwFomVhgLL+D5Pj+r/44ONW8oiQsSjkci9rk/McaSs6ZZ8Ggaprzg6bNWO/h8tg
 PKDppm4Ik2IUlznAWyiyYUkkjXTnn3rPQIVn4qu7d+Ur81lp4y+tlhvrYBBbLvAg
 sR79VNZOSN+5clBnAc7z+1bFmEX58ZEKvQzVcLYGL7hZszsiI+9MbIjKi36CwfFt
 YiGvvn0MOLZi88I9hHG1HKdSPsN922R4rhOMVkXxR0dSWWnnAo+cC4+Xg==
X-ME-Sender: <xms:mM5IZP4HU1WNjCJcFAEVr1ZVjSPm9MO-ANkb2QAGxbzeQ9UgM-1nbg>
 <xme:mM5IZE63ptf_gmXrX6TI-7GAyWuyAzmJi_UAv9eZBMlw38-vUYESvbh2m_B4JKvsE
 5X1yR_QWcHP1YVicio>
X-ME-Received: <xmr:mM5IZGd49DG_DM0QhSV5gRyXBG1MANHc7qiK2sqrvDhc8WZ_AssZalhUbwkOYMlYd5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedufedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:mM5IZAI6G3_T8DpGfsl1NR7t7IJcI6k-W_y0wixfKUP1vTLghBzYig>
 <xmx:mM5IZDJD0QbuYovBJgUvEmNgCkoso3D-y-TFl0VNJ0m5us7L14jgbg>
 <xmx:mM5IZJwkd7hu3XfC7IMAnzzLbvyhnbtoBlOtvTmIT3NPMmFxabwolw>
 <xmx:ms5IZFgJlPm9hbkxy1zdN22LW44KU2JM2GsezHQR9tG1OZzvv70Rog>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Apr 2023 03:11:18 -0400 (EDT)
Date: Wed, 26 Apr 2023 09:11:16 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Corey Minyard <minyard@acm.org>
Cc: qemu-devel@nongnu.org, Corey Minyard <cminyard@mvista.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, qemu-arm@nongnu.org,
 Peter Delevoryas <peter@pjd.dev>, Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Lior Weintraub <liorw@pliops.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH v2 1/3] hw/i2c: add mctp core
Message-ID: <ZEjOlBlEH3KH8f6d@cormorant.local>
References: <20230425063540.46143-1-its@irrelevant.dk>
 <20230425063540.46143-2-its@irrelevant.dk>
 <ZEfvkWCbJoKGIOnT@minyard.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="46cnwWfVfQjzDEoV"
Content-Disposition: inline
In-Reply-To: <ZEfvkWCbJoKGIOnT@minyard.net>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--46cnwWfVfQjzDEoV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 25 10:19, Corey Minyard wrote:
> On Tue, Apr 25, 2023 at 08:35:38AM +0200, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add an abstract MCTP over I2C endpoint model. This implements MCTP
> > control message handling as well as handling the actual I2C transport
> > (packetization).
> >=20
> > Devices are intended to derive from this and implement the class
> > methods.
> >=20
> > Parts of this implementation is inspired by code[1] previously posted by
> > Jonathan Cameron.
>=20
> All in all this looks good.  Two comments:
>=20
> I would like to see the buffer handling consolidated into one function
> and the length checked, even for (especially for) the outside users of
> this code, like the nvme code.  Best to avoid future issues with buffer
> overruns.  This will require reworking the get_message_types function,
> unfortunately.
>=20

Right now the implementations (i.e. hw/nvme/nmi-i2c.c) writes directly
into the mctp core buffer for get_message_bytes(). The contract is that
it must not write more than the `maxlen` parameter. Is that bad? Would
it be better that get_message_bytes() returned a pointer to its own
buffer that hw/mctp can then copy from?

> You have one trace function on a bad receive message check, but lots of
> other bad receive message checks with no trace.  Just a suggestion, but
> it might be nice for tracking down issues to trace all the reasons a
> message is dropped.
>=20

Sounds reasonable! :)

Thanks for the review!

--46cnwWfVfQjzDEoV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmRIzpMACgkQTeGvMW1P
Del18Af9F4RM0JlSGycUA0e6zT/Lcniah7UMyC6i9XSvxnPatG0JvJB9EQkPI9bR
IuoxdPZGsuf66HP54p6jD0/INz1O8TdelOx7pNt87LewXYQ5hguc3NFN5ZnWpgxR
qYddGTCX9P79gpbZYO9fydIUeLcROmyByASIiCaMOIJ/xL41149W8BUTMzZE4PNZ
RQI+LJcLVGWWryOlIfs3Ofa+oM/geeln+AGB0GtOrDaLANDPIPXQCquLiS8NDn1s
8MccjRfkYZrCZh1Pm8GoWlL/I0UbUXI196GA2QEtLmIwh12yrbHu7ZoO+XRDJqXW
kbFIWpB5LGpBxDyDnmZwdJgDA5IcKQ==
=yTZF
-----END PGP SIGNATURE-----

--46cnwWfVfQjzDEoV--

