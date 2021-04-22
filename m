Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E809368238
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:11:53 +0200 (CEST)
Received: from localhost ([::1]:34262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZa3c-0002ix-7S
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZZzS-0000vX-E5; Thu, 22 Apr 2021 10:07:34 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:60743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZZzP-0004NE-SH; Thu, 22 Apr 2021 10:07:34 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4FAAD1355;
 Thu, 22 Apr 2021 10:07:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 22 Apr 2021 10:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=HR2r1T/ev2Y/WvO9C7mfm3RosO4
 EJT/JjgaXLem7i54=; b=usBAAdNvxQ0lCSsYhflksOH0iDA1tOeX7mN/wPs1lNG
 NauHF+ZHkIk5hwUe9afSgEEsNkit6zC4SuUhxtD111+DLW+zgwOrufRzplkNVU2P
 70T/JZhwviQORBv5PJciTNpmgRKltu7zrW72gfOXQPe06zB9Ds6T/vdWAjMPuSZk
 4JjPxsVVHCFanul9RNplY5io44cy3Koe1c21WIeaoxzEHcs/cumLQ31GZwpqoHCs
 R6ZyN1a34+M1eAWllerBa8AD7A65vQ6Zc5mVt/JI3aZ3H41fB72yakiekFxQW/jC
 ufBIV7Yt+Irdv9KdQUL0E4XBB/jsp4AZRdXmYx3b8sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HR2r1T
 /ev2Y/WvO9C7mfm3RosO4EJT/JjgaXLem7i54=; b=CV1ATaRsd2TPl4L4p3yeeO
 znvKw9Y1+kMbcV5hOI0wXQUUb25ufjqw9ULdf3Zmn16bZIV6NEj0grXRYpt+8cuh
 nvJDRKNFM+XaCL6h+aTnkS8baB0s0k66Me3OjuoFjL9++yM87nVdX4fAo1HQkcfW
 yIgM4gQ+rxtMp7p9x1sU56R8f8NV2+edymX6C5H0YyNwUzUZCfLAIZzsfe5IUkGX
 yafLD3+my/EF9qZ1NGTqQpVsRaWZbTEDly8v1+d3DrBXrOFrGjXUciwhlsaR8Xqh
 q5PMm/3oqZJSeCPbY5fsTB+g8AAn3/+uGHH7Rkxh8S9aHmIJAFdFYpomadEPEBFg
 ==
X-ME-Sender: <xms:HoOBYCAwi2do-A0kjLlak6UN1II_hUiy-EbtrHOW0N1hK1mrgTMVSg>
 <xme:HoOBYHFL6q4vHVPhnox2vlb_sesxYXMSb1fvs-IevkfGCxxsfLKWFA1-yfcTI0gJR
 mga3FL2BmXrlHD2puU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddutddgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:HoOBYCKz1VzOgjN3fpX4QAUru4aleirgDLHNPdsHwuqjL4iMVXYVjw>
 <xmx:HoOBYDkHh9JswBfLZ7Fj1cF6QdgQlKY-e_26r5S5XKqJ4qj3MCZ06w>
 <xmx:HoOBYCSXHVl-QBLvQnlGq0oQCs2UM-7ox0lH6L_3MLtwwN67HKYuVw>
 <xmx:IIOBYM8xYbVBL_6_0zJTHYtfdJd-zYmZ5kiefTl2uO0iTFfLg-9DZw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9960B240066;
 Thu, 22 Apr 2021 10:07:25 -0400 (EDT)
Date: Thu, 22 Apr 2021 16:07:23 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.0? 0/1] hw/block/nvme: fix msix uninit
Message-ID: <YIGDG5qKcZwVj88t@apples.localdomain>
References: <20210422135834.406688-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HSpmlZ1Lbh15iFM8"
Content-Disposition: inline
In-Reply-To: <20210422135834.406688-1-its@irrelevant.dk>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HSpmlZ1Lbh15iFM8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 22 15:58, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Hi Peter,
>
>The commit message on the patch describes the issue. This is a QEMU
>crashing bug in -rc4 that I introduced early in the cycle and never
>found in time. Lack of testing device hotplugging is the cause for that.
>
>I'm not sure what to say other than I'm terribly sorry for introducing
>this and if this means an -rc5 needs to be rolled, then I'm even more
>sorry.
>
>I think an acceptance test could have caught this, and I am already
>working on an acceptance test suite for the nvme device, so I'll add
>something that test this as well. But, well, it doesn't help now.
>
>Klaus Jensen (1):
>  hw/block/nvme: fix invalid msix exclusive uninit
>
> hw/block/nvme.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>--=20
>2.31.1
>
>

As far as I can tell, to cause this crash, monitor access is required,=20
so I am not sure if we can get away with a note on this in the release=20
notes and fix this in a potential stable release or next.

--HSpmlZ1Lbh15iFM8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCBgxgACgkQTeGvMW1P
DenbIAf/UBbdlrQ8wV5HgrymjXcSemeNBZbd+uL1gkYECOoVMViILpkbwqPkXwhO
0Y868F5/KbiLr51xVqMJq08rZOqJoU0yOvRPdio9cegdWlwuuis4x+DWT8E7NZDX
bJJzNcl5KRvG7Tpoq/p+SWHE1yXjEb8JwT8jOZ4UlyQxnwppHdpmGFV/fhM58aiU
wIndoHgKdZVnutbU+hMkpXktf7IDYo86gCwegdG/Qe3QxQC31cSZXwPoQ/82yuL9
LcWB7DaGpBb3hx0WBI0J5KHozwUJ3AP+kdMzbujCAbp0ToLveYvugiSlAnJsqqc3
VCmFyZJLpZO3IV3Ri4kWs2zdRqYKwQ==
=BB/A
-----END PGP SIGNATURE-----

--HSpmlZ1Lbh15iFM8--

