Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16CB36B0FE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:48:47 +0200 (CEST)
Received: from localhost ([::1]:37136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxr7-0006gt-Ry
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1laxhw-0002Ze-6p; Mon, 26 Apr 2021 05:39:12 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:38313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1laxht-0004dS-Tf; Mon, 26 Apr 2021 05:39:11 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 81BB718B5;
 Mon, 26 Apr 2021 05:39:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 26 Apr 2021 05:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=/6Fw41a77rds0fUGpbGvRL5elwH
 kVsGjJtAa3OegieI=; b=hlawC1j/eYli/cna3Ai4ldi27NDxBfIyoq2WbcOdnNg
 18ttNY+NqSN4kxnPgFjyyND+ut5ie/GzmspNCzIQcj6/GHwKZpZto81M0BJGUcmG
 yTYDiyt1x3AOhPPAxPaliqtRPAOilEgWaZaiJlsUy5VmH1auyi9lGfLLzirKi4JF
 YiubBO6IUFPW9VaUYyzvwY6xtHyXX6hrVCN+VrV4r+V+6RQ22Woreu1kO7PWg1WY
 oxK5T0+QcZqA++/b3i0Ona2dpJt6AL1AeeezoIhSlPR7QLLl3W6rtfpsWyZ4HZgw
 84ABY3eI1T2ufBTlaovfxsaAtQMtOnsNi41wnKQvBkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/6Fw41
 a77rds0fUGpbGvRL5elwHkVsGjJtAa3OegieI=; b=brFIJG+W1B6D+pjoKEc84H
 uUIA8vJjjde1NJx1BP/3PaahVQt3VSyjuzMqH1nfDiqMCtccY6uAe5HhRUYMGbdG
 MHZ8U6AoVo+17OdIVLH3Fgi2AW2FZnky/KZbQ+xPHfOX85n1ufwNRN0eJpTvU5Do
 SdNp2zU5M0R/Vq4jSv68w04+0kkuQ1vzilxkm09xFbHuTdfKDYcOjRKD/D3ZVZM5
 vAaoxuqVvq7wWXzZl10oW8KBiUYcIpitZCLwQCwXCPi+z8bnhYV/+l8LrgMnLLXz
 puUze35eIqb1GPMlEKgAq3C9rnXZgzVELT1Ql+8XsNX4UgSyjBYt2P8C1Mv4lGfQ
 ==
X-ME-Sender: <xms:OYqGYA-qvJkfSUMMQI3ivJSwuq4q5fBAlpyqBR3PPsKdumAEyEXwIQ>
 <xme:OYqGYIv-5wVJ0n8CL_fq5-h5IaHsf8UZ7oXpE3YwOlU5XgRazRPANc5RXTMOfQyme
 9i86w_0VPfPAgjGmn8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddukedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OYqGYGCb_BsVXiPX_sftjxmn-m4v_m-aY5iUuV7gbwNSd7Z9CZG-7g>
 <xmx:OYqGYAfUiZ8DZ4C2MO59YswK3ld1MM1tIufv-cNaOZS6JFVQkju8Lw>
 <xmx:OYqGYFNV5Yb1vn0rAG9WGGqIas98ZzPb9SrrTx8BIamnxgdY49pyJQ>
 <xmx:OoqGYOgbibPFqMo2svYnjN57hBVnid2jYYMeyIWehUYlztlQuiTyEQkG4gg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 26 Apr 2021 05:39:03 -0400 (EDT)
Date: Mon, 26 Apr 2021 11:39:02 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH for-6.0 v2 1/2] hw/block/nvme: fix invalid msix exclusive
 uninit
Message-ID: <YIaKNoQg692zIPov@apples.localdomain>
References: <20210423052127.512489-1-its@irrelevant.dk>
 <20210423052127.512489-2-its@irrelevant.dk>
 <YIZEPo8gD/puvP5T@apples.localdomain>
 <79c468bd-e600-7acd-2843-e9a77df91e79@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pdaHzBzoqC/EDviw"
Content-Disposition: inline
In-Reply-To: <79c468bd-e600-7acd-2843-e9a77df91e79@redhat.com>
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pdaHzBzoqC/EDviw
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 26 11:27, Philippe Mathieu-Daud=C3=A9 wrote:
>On 4/26/21 6:40 AM, Klaus Jensen wrote:
>> On Apr 23 07:21, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> Commit 1901b4967c3f changed the nvme device from using a bar exclusive
>>> for MSI-x to sharing it on bar0.
>>>
>>> Unfortunately, the msix_uninit_exclusive_bar() call remains in
>>> nvme_exit() which causes havoc when the device is removed with, say,
>>> device_del. Fix this.
>>>
>>> Additionally, a subregion is added but it is not removed on exit which
>>> causes a reference to linger and the drive to never be unlocked.
>>>
>>> Fixes: 1901b4967c3f ("hw/block/nvme: move msix table and pba to BAR 0")
>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>> ---
>>> hw/block/nvme.c | 3 ++-
>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>>> index 624a1431d072..5fe082ec34c5 100644
>>> --- a/hw/block/nvme.c
>>> +++ b/hw/block/nvme.c
>>> @@ -6235,7 +6235,8 @@ static void nvme_exit(PCIDevice *pci_dev)
>>> =C2=A0=C2=A0=C2=A0 if (n->pmr.dev) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 host_memory_backend_set_mapp=
ed(n->pmr.dev, false);
>>> =C2=A0=C2=A0=C2=A0 }
>>> -=C2=A0=C2=A0=C2=A0 msix_uninit_exclusive_bar(pci_dev);
>>> +=C2=A0=C2=A0=C2=A0 msix_uninit(pci_dev, &n->bar0, &n->bar0);
>>> +=C2=A0=C2=A0=C2=A0 memory_region_del_subregion(&n->bar0, &n->iomem);
>>> }
>>>
>>> static Property nvme_props[] =3D {
>>> --=C2=A0
>>> 2.31.1
>>>
>>
>> Ping for a review on this please :)
>
>You forgot to Cc the maintainers :/ (doing it now).
>
>$ ./scripts/get_maintainer.pl -f include/hw/pci/msix.h
>"Michael S. Tsirkin" <mst@redhat.com> (supporter:PCI)
>Marcel Apfelbaum <marcel.apfelbaum@gmail.com> (supporter:PCI)
>

I didnt consider CC'ing the PCI maintainers directly, but makes total=20
sense here, thanks!

--pdaHzBzoqC/EDviw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCGijIACgkQTeGvMW1P
DenIJAgAlRaQeReb+Y6TYADcGKIJfrF6gDd0qHTu9b+bMJSTl03Qb9VV/6WHrk8u
YzhINlFu+7IZk+2fq6WbJHLTWpKISqzd+yi7edAVvzzH8evGTyFQ/YyO3yKM0rAU
yXAROTvctrEmEMpJ9CNw1/H73QF/yXGksGv8xlrmZpUUfAgXt+RrUrWM6p9IhTnQ
xwSDlDMOO3lnbL4S6+dBL3qmn6lkYL0HE6Aut5Xy12ibSECmptmlZG7OGgCRsdX0
j+mvH9q++Qrrh8S/z3JcITzKWlPLXjqjEA5fJB8tp1u1/msuIF5c9AIWGsQoirJe
bQLImdDKH/DiCli6ZFn36ER/xrkPDw==
=wbvZ
-----END PGP SIGNATURE-----

--pdaHzBzoqC/EDviw--

