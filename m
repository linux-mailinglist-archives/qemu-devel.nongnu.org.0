Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74286356737
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 10:51:13 +0200 (CEST)
Received: from localhost ([::1]:60868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU3u4-0002a8-8L
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 04:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU3oK-0001dx-Ir; Wed, 07 Apr 2021 04:45:16 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:53511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU3oE-0005Ea-L6; Wed, 07 Apr 2021 04:45:16 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2EA9B5C0032;
 Wed,  7 Apr 2021 04:45:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 07 Apr 2021 04:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ZKcEZhIDitoMFe9ykSx9SLx8KZP
 kiWLos2Rb5Mdm5nw=; b=LimLYQaXKe9dd4KwaCljpsstAD8qhe9hn1I4J/wf0tg
 bR4b8xMk/3VcI/NXWvdhUsX7Q8SmgqSu65LtCXFNulMCcOp0M/G16X3PsreW+0tG
 n9I9hsEXFmt8AQyLnMg9p+Mp2t8SA786/keosZaCF9V7Jsd0BSwiVUf7/nbcpKrw
 tQDYB0Q/Ppjwi4ZvXvdE2n5e0/7DmvVf9nsLJcs7Ps0qaZ7ugS5XXL2/xACOAca4
 hPlr7/WQGQCAavsxMb6E5QsbTEKle4WmyjM3iMr3Va96N1AHD6R/8biS/sxIDYtl
 v3Dn110N8O5blkV+EmJrDK5SW5YbTWU04EjP4cCqaPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZKcEZh
 IDitoMFe9ykSx9SLx8KZPkiWLos2Rb5Mdm5nw=; b=fptU5CeRBdUWV6NITtTOkP
 O1u5nepksO9fcfEsEjhQ2d/BCA0EGbK1pGQePMcDQdM0673DvRIf+0TubfWtWPRB
 ZujsPHFUIv6p6Xd7mLEBxYIxF+xf2cAPnqSKTXghjiptDMRt7FS2Rw1w24TmC5FS
 Q2v7MQgIjz2f31hqazV/DTcKTges7bN9C+jecU0n3ihAFVLrcQkui3jLyWwmIOiF
 sLEhruMj4YYUppHNgF2jzQAi6Jz4G98cxfKcmztKQax9oPIDxaQPJ1ht8mcIDk5S
 p6i2Glo91YlxjIZIiSl48Qnu7oE4G1AudMRhlwY/o0VsS2vITWYUGxYA4grkV8eg
 ==
X-ME-Sender: <xms:E3FtYHgvJynd6ZHUcIy7B2vEwl2yFiwGJTeVT473rvP91g36c8KJ1w>
 <xme:E3FtYGBxFwmrZwJAsk3HdNN6dGNs6uwm-v8ldmGf1SfPvhfJDIc5CUH3cZPIUzGB0
 laDk8i3y_kBkRvAJUY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejjedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedutdehleelvdetvdefueehgeevhfejueeliefhudfhiefffffhuddtkeekieek
 feenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepkedtrdduieejrd
 elkedrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:E3FtYAcHzRuaobIl1hlxPIz2ZMIoppjTXlKlPA6kw6WZGSXEJw5Kbw>
 <xmx:E3FtYGc9NTj65xhR-atbR-Tr1UbwRDtNA6wuYIeX7OZqx4iRjAImIA>
 <xmx:E3FtYMibdHLlISTSFoWlxnCLWVbyIEg9ulZtbyoX75H41cW8svh08g>
 <xmx:FXFtYIUL5NsSjfS16tycNePGDBi9vS_AyAwnoTZ0g9qb4U4LUhB8hg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7210F1080063;
 Wed,  7 Apr 2021 04:45:06 -0400 (EDT)
Date: Wed, 7 Apr 2021 10:45:04 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL for-6.0 v2 00/10] emulated nvme fixes for -rc3
Message-ID: <YG1xEH2BWGAAxQuT@apples.localdomain>
References: <20210407054635.189440-1-its@irrelevant.dk>
 <CAFEAcA9HsqCJOUsL9HwNHqr5MEkRfCw4i6fc1T2hkN7t4QgpdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FLC2qia1ALz1p62k"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9HsqCJOUsL9HwNHqr5MEkRfCw4i6fc1T2hkN7t4QgpdQ@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--FLC2qia1ALz1p62k
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  7 08:03, Peter Maydell wrote:
>On Wed, 7 Apr 2021 at 06:51, Klaus Jensen <its@irrelevant.dk> wrote:
>>
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> Hi Peter,
>>
>> My apologies that these didn't make it for -rc2!
>>
>> I botched v1, so please pull this v2 instead.
>>
>>
>> The following changes since commit d0d3dd401b70168a353450e031727affee828=
527:
>>
>>   Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://git.infradead.org/qemu-nvme.git tags/nvme-fixes-2021-04-07-pull-=
request
>>
>> for you to fetch changes up to 5dd79300df47f07d0e9d6a7bda43b23ff26001dc:
>>
>>   hw/block/nvme: fix out-of-bounds read in nvme_subsys_ctrl (2021-04-07 =
07:27:09 +0200)
>>
>> ----------------------------------------------------------------
>> emulated nvme fixes for -rc3
>>
>> v2:
>>   - added missing patches
>>
>> ----------------------------------------------------------------
>
>Hi; this semes to generate a bunch of new warnings during 'make check'
>(not sure exactly which test is producing these, due to the usual
>interleaving when using -j8):
>
>qemu-system-i386: -device nvme,addr=3D04.0,drive=3Ddrv0,serial=3Dfoo:
>warning: drive property is deprecated; please use an nvme-ns device
>instead
>qemu-system-i386: -device
>nvme,addr=3D04.0,drive=3Ddrv0,serial=3Dfoo,cmb_size_mb=3D2: warning: drive
>property is deprecated; please use an nvme-ns device instead
>qemu-system-ppc64: -device nvme,addr=3D04.0,drive=3Ddrv0,serial=3Dfoo:
>warning: drive property is deprecated; please use an nvme-ns device
>instead
>qemu-system-ppc64: -device
>nvme,addr=3D04.0,drive=3Ddrv0,serial=3Dfoo,cmb_size_mb=3D2: warning: drive
>property is deprecated; please use an nvme-ns device instead
>qemu-system-x86_64: -device nvme,addr=3D04.0,drive=3Ddrv0,serial=3Dfoo:
>warning: drive property is deprecated; please use an nvme-ns device
>instead
>qemu-system-x86_64: -device
>nvme,addr=3D04.0,drive=3Ddrv0,serial=3Dfoo,cmb_size_mb=3D2: warning: drive
>property is deprecated; please use an nvme-ns device instead
>
>thanks
>-- PMM
>

Hi Peter,

tests/qtest/nvme-test.c is generating these warnings.

We didn't deprecate this formally, so I will remove the warning for now.=20
The device works just fine with both "legacy" and "new-style" nvme-ns=20
namespace definitions.

I'll do a v3.

--FLC2qia1ALz1p62k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBtcQ4ACgkQTeGvMW1P
DenYKgf/S8PBbcGvI5QJYFyk3VGHnGJ7xXB4EqHT4ljMuynzgtK0iURSyJ3PEGme
OFw3Z6nbG1ApQqRFhMBI+JVxmRMTVpK3bJ+EDK4WlCwqpy+yD3KHjJfvUpFSyLH6
C1KsjxjcfKt20g7h1NePwkhM5GnOAMTZmdv80D6H3D98nYd5G2sn/O35i5/0zY75
FdjW6wHWQJdjwUKdG8Cpmo2ytej0wr+P8qnTDNpC3RhgfcPiA479zHiJq7/bT++w
ejzSxqnG3mKNBJYV5mRVmlel6K1YG8o6F4CcyzTkJeucljpwudlj86ZAdtdpoW7K
B8v80DfvH7sQe9BP7HoEAjd+ll1XXA==
=fgnD
-----END PGP SIGNATURE-----

--FLC2qia1ALz1p62k--

