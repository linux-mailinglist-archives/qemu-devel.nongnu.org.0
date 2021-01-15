Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7601C2F75D7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:51:32 +0100 (CET)
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LlQ-0006TG-6u
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0Lgp-0005Gf-BN; Fri, 15 Jan 2021 04:46:43 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:52207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0Lgl-0006rH-HA; Fri, 15 Jan 2021 04:46:43 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CFA3A5C0125;
 Fri, 15 Jan 2021 04:46:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 15 Jan 2021 04:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=UUjmA7U3laal1cFf+w5ThBuaKJI
 fWHK0XHHcVssOtvc=; b=xGAuS5+MO6529EOic4qlekR3etIuTzcbsOuxbvxDQfp
 mHja/ViGae1s45T/2p5Z/SJq7KvTmc2iW+1TeETznsEHZsSt/YPhQpR3o6vED3gK
 3mTaNxOrFN1DNrpici4TnQAsdr67uPTOBU91ZJ6NTCugPIiwt+lnz+oYpcwCEp35
 BVrFMY02yaR4ao5usjQcY7mDlJ+0J1et5LMU+4gSD9lNzBF37/bLgnJ9bFIADI9G
 13V1iRWl3KydlkGtSa8DPZFLXsCUPXBHyQ68vkAooGyNP/xWCJ2C1Efgxeygpb1j
 ZvjwCDxSscOigYhIFDcytlJMhmOYKNxDQXsUFA7UvMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UUjmA7
 U3laal1cFf+w5ThBuaKJIfWHK0XHHcVssOtvc=; b=BvntEMbtZncnVzeWcTCpWn
 CJy9F/KR5TAdd26UaxD7H73OtU844dojwqSN+3VVecKXbZkOliVhr47ifgZ4Ttij
 DmPFvGdeGxtAr4KKsFvl+GZ1X3hXEXz2X3tAVS+yfCyVbZxZfa75yTdYq0Ig6qOG
 8m7qnwDxKz3C3nZ0dG6QkrSutNreFLMapv45pa5o5NJJbiH0VhuNuJoTPJA+yrA2
 R98GTZUNhW+IyukugzjjjndJMxI7nOwL3JUVTgIJ0veRuVlHPxKLldxFTs+ktIKn
 KQUqn/xlc6T/DehcjcMtBcfbHuw03CGRKNTzyNZEpSkIXsehGF3IyrtNtXhBQKFA
 ==
X-ME-Sender: <xms:fGQBYGE4OMNzU21uYoDrF53ptGBmJZkAIeV3wk_2kAjrhuVHVR5W5w>
 <xme:fGQBYHVD-QAW41Z5IA0EyIXPQojPpl5XUP8184CQWznXALgLpE63SA-cNQnYXfn9h
 HuRY316Gzeq2XMI_vM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddugddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fGQBYAIv-fk05Hq4F23OTwZ_bXQENUUnf6cr-pkiQn9i6RZDe7crLw>
 <xmx:fGQBYAE8EKadYxCqBkCQuNKGpXH9_Y3BZ-e9mfDy_nJYIimmi3UDNA>
 <xmx:fGQBYMU2ArZ9CDVQuGAmYSrNQVlJ7bSqoys8HaYORJY0swhyTAxRYw>
 <xmx:fGQBYOJ3GJklvbcwXYbigLIz1F72g70RR7UJLvIzfequ8iTO1_LG0g>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0E1EA240062;
 Fri, 15 Jan 2021 04:46:34 -0500 (EST)
Date: Fri, 15 Jan 2021 10:46:33 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/block/nvme: fix for non-msix machines
Message-ID: <YAFkeSFGnSAG987g@apples.localdomain>
References: <20210112124714.220657-1-its@irrelevant.dk>
 <0d5fc44d-14cf-5fd9-e8e3-2aae48ebfa4a@redhat.com>
 <YAE/J08kcQ1WfjOQ@apples.localdomain>
 <5bcdfa4a-218d-a1f4-0ece-654e76403ee6@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K8lKLl/C4lSK1YhD"
Content-Disposition: inline
In-Reply-To: <5bcdfa4a-218d-a1f4-0ece-654e76403ee6@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--K8lKLl/C4lSK1YhD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 15 10:37, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/15/21 8:07 AM, Klaus Jensen wrote:
> > On Jan 12 14:20, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 1/12/21 1:47 PM, Klaus Jensen wrote:
> >>> From: Klaus Jensen <k.jensen@samsung.com>
> >>>
> >>> Commit 1c0c2163aa08 ("hw/block/nvme: verify msix_init_exclusive_bar()
> >>> return value") had the unintended effect of breaking support on
> >>> several platforms not supporting MSI-X.
> >>>
> >>> Still check for errors, but only report that MSI-X is unsupported
> >>> instead of bailing out.
> >>>
>=20
> BTW maybe worth adding:
>=20
> Cc: qemu-stable@nongnu.org
>=20
> So this patch get backported in the next stable release based on 5.2.
>=20

Thanks Philippe,

I messed up the bounce, but I sent it on to stable now.

--K8lKLl/C4lSK1YhD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmABZHYACgkQTeGvMW1P
Dek4fggAk6I5SvQcZUHFa7OGHu32b0hZsOS44ebqNyBLYkvTEtpBEVVKIhHRPcoK
7MXb0887eB+oOiZYgG1uQndv3OhjEeXL9uzxTv7SJMkOuMlqm8gRihwF3eM6V/RB
2IdCy4JuCWEGVt44l2SVwcTkk0C4nDacPNF1wLggUCSajpidgTL5UFjY/6Mj0Dnc
5+UvDJZuZ15mRGKaaoSf1A81ukvDwJsmoyokEtMFXuKd2Et5YxhxUwZ10WFn82Na
3YpdexXWdT8C07gdSE3hGWUGDPpPaLQpfd5ZnN33ErY3hRofdg38HWj1NHhfwsxs
7BkDt81fjD2sCmkxjk6ScFJfOupQcw==
=GoQD
-----END PGP SIGNATURE-----

--K8lKLl/C4lSK1YhD--

