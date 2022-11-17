Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAA762D389
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 07:38:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovYVf-0000e4-Fw; Thu, 17 Nov 2022 01:36:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovYVc-0000dk-Tl; Thu, 17 Nov 2022 01:36:25 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovYVb-0003CM-1q; Thu, 17 Nov 2022 01:36:24 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 673705C0681;
 Thu, 17 Nov 2022 01:36:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 17 Nov 2022 01:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668666979; x=1668753379; bh=BR
 lBdnHIoDP/wWG77JXXXitfnEQ03WVPsolQxONueQg=; b=CriCx65wjgHnKQfjRZ
 wA3Q9iQSti7UPMEH89ZqrpOVa359EOFlQOsyLZ2IKbmIqS97XxqGr+wavEIRwXii
 fMd2O8fBp60GUd7qZlejor6vqSw99YSfIKDcX6rlHmPNgvJpx8S7YyJMjYBBQlmh
 44fSpxCGUM4NCrylNee6KfIHQmTCIJWKsafcuNMa0wZtcL4SaRK40NCnaRSaD0hY
 bC6f1cyWulhWjaZQ0Diq/v+aqO+dhPk6MKeSxzL9yXuggmkzj8wrPEoXWNZaXpKe
 fdj2/JWMbIiwGkIOxS2+QPxJzHkYDwI2bVDr5netnOpDoDrZUlfXJCv/u+0ut9mT
 H7Hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668666979; x=1668753379; bh=BRlBdnHIoDP/wWG77JXXXitfnEQ0
 3WVPsolQxONueQg=; b=lXdRqvHa7YOlD85yNIdwgi3Mi/EVuqUqlp+JL6aGrIW6
 v8NjLYCySHgymdiVt5Duj3Rpht70XJdEE0pDUZafOpBkhPvUDwKl1scoaWgd1MFg
 q155LR29mEEyBs5S/euztkdpnnOKLjpj3hTXqJZU8qhH5P3VV+uYm0xu+V9/T9vo
 d2tsLDDHKeHq8tkvVY9iL4k2gBNOz9GDDy7Nr7JUY2hQz9XRgjiIi6YvpbebGDog
 XfAiqmOulsMOslbH3hGc1o76duAuFWzctQdH63hMNIAy454rhA+dbisf9fFwa4aJ
 ENdPYKPQhJ0075sL2gGjIclb2fB8DNsznnfRE/y6Sw==
X-ME-Sender: <xms:YtZ1Y7inscvjAsOpHmU3iIzEZc9G7qULbRecFqz-D2eeYgBwJZHUaw>
 <xme:YtZ1Y4DV6cxGOrmbE1Wx9Lhjat6wodZ4Pu_EaoDlgPm6MQkgl0V3Ec8bcZx3CiaEU
 5Jzn9hfHtDss0IfgvQ>
X-ME-Received: <xmr:YtZ1Y7E_wR5e9GjnWkGgQc2x5D_FqVMjQ5V0GRPk210xMSk4OlzkvN7DUBPxvsJxOcOyQlQGqmcRPuFV42E71L2yJB-tEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:YtZ1Y4SQkDFMykFRi6AKdw4ni1yRJig9kLSFb1PeHztosUA5ikjmBQ>
 <xmx:YtZ1Y4zkV-ojtjktOIMg_wHCgcCKyi4I3Xeae4n1n9sPRQbaXj3-OQ>
 <xmx:YtZ1Y-6zuFi1tjn0sHqu2Ux1tqk6Hjjrzq-7QWQt_IbPFGtfhfF1Zw>
 <xmx:Y9Z1Y09pnuAwDiQvZHR2ae6oC8_gmNuVZtSGPubJilIY--R8aGQiuw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Nov 2022 01:36:17 -0500 (EST)
Date: Thu, 17 Nov 2022 07:36:15 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Joel Granados <j.granados@samsung.com>
Cc: k.jensen@samsung.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v2 3/3] nvme: Add physical writes/reads from OCP log
Message-ID: <Y3XWX0Xx//40pidS@cormorant.local>
References: <20221114135043.2958100-1-j.granados@samsung.com>
 <CGME20221114135429eucas1p26370f7dd286e514105ae1173bfcc066f@eucas1p2.samsung.com>
 <20221114135043.2958100-4-j.granados@samsung.com>
 <Y3N3WTpB02g/uxdH@cormorant.local>
 <20221116161921.2bym6wtu6xmkanzo@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7XIJanhpuPvBEgyf"
Content-Disposition: inline
In-Reply-To: <20221116161921.2bym6wtu6xmkanzo@localhost>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--7XIJanhpuPvBEgyf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 16 17:19, Joel Granados wrote:
> On Tue, Nov 15, 2022 at 12:26:17PM +0100, Klaus Jensen wrote:
> > On Nov 14 14:50, Joel Granados wrote:
> > > =20
> > > +static uint16_t nvme_vendor_specific_log(uint8_t lid, NvmeCtrl *n, u=
int8_t rae,
> > > +                                         uint32_t buf_len, uint64_t =
off,
> > > +                                         NvmeRequest *req)
> >=20
> > `NvmeCtrl *n` must be first parameter.
> Any reason why this is the case? I'll change it in my code, but would be
> nice to understand the reason.
>=20

No other reason than consistency with existing code.

--7XIJanhpuPvBEgyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmN11l8ACgkQTeGvMW1P
Dem8swf7BSSbQgKgPRwlaOTxIC4CTtROwcgywR1LhBMfjURG5AWY+dqz7RMLBO1M
SQ//ravHK7E68jXZixsf7LtkSmVRm+tVs01d/7cL7qgHnN5TUUQiqcneXfp73SAV
Vu2ei+2cjEI4rQPzbwVdQA7XnwKQQr9dwOwOufX95bje3jRgKB6Hn4b6wCVxM5iJ
ZEjoL1sa/vtqEMMIzvsnePdK7Ps8Jy8/uUiQe9o23NJngoWir+2H1gpHptz3Jkzt
/GoFX86QkRet4Uz9HjKMzZ0A/KrhXHRj2vQ/cWru+LM1cEnRg2E3IHxNVEWHm4Ii
9LXGMfKZZFd4s5ovpQVZZlQ+DtFYig==
=8Bmn
-----END PGP SIGNATURE-----

--7XIJanhpuPvBEgyf--

