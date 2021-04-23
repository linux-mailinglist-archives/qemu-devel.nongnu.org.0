Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A2236932F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:30:01 +0200 (CEST)
Received: from localhost ([::1]:40350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvse-0001eE-SC
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZvo3-0007qX-T6; Fri, 23 Apr 2021 09:25:15 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:47497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZvo1-0005ul-CW; Fri, 23 Apr 2021 09:25:15 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5CBAE13A5;
 Fri, 23 Apr 2021 09:25:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 23 Apr 2021 09:25:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=iVQ1bkhmhrl1G5MVDFAk6pTK7+G
 rFGecrvsUPXB8p7U=; b=SdbVYgT6oi0691xQd+1lu+3JXiDll1LEishFcS3eWeT
 pipWGisNF+O4M71O+QiC5JH5zb+NtEgcEUu1UaN8ZG9ZzaKEMaIHPAH1x8kRdpVx
 6iTe5bf9myjXc7WYhD3oUfhfD/pnf+5KeKOLNeZEgnKXCS0kxCJ7MO3B7WTLIRQZ
 Z+0hLtjdK+jfW8Z+fMZx6DZZ5c1vASyHAzqDxbX3jErZDilcZQUmrZP0xVFSLi9y
 kKgGKw9pgTfwXw7+zPCZgM1fWBq36JbB6jGgezJ0QS5qk1rHJms/HUt2nNFHHvh2
 kTzK6l9TWk/hZmFKIh4DCLJ5h8A/h27qpyCOYWyflIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=iVQ1bk
 hmhrl1G5MVDFAk6pTK7+GrFGecrvsUPXB8p7U=; b=lRVS1rb9sV2lWr8kVK2OD8
 niftoZxycksJHpcwaUSKCzPI5PfXZdKKdkxBXKB9QJuLcdMaPzo72wNAxBLv3e/1
 RULxu4ngFhcoRBRzZnENZfO7o3OYJUfHCxxJqTc2Mv0b0chp6FifBZ31CrDTEvff
 +eRG+t7ZQLex+5Sh1+pPqEbqlNrG8D+ndBAMUJ5hcF+xW8kvu1qmGnDrNdD51XRY
 CG2eeKoysc/pggS2o909gErp5iBdFeHz96heaaBAgOMo5vMISUsU1RPKa/pim8MS
 xPQRLxN/W4oyL3o9SL/ZlJTv9gDdHyqONWiwmRHptOZMP/hCevo3WfXmVnRX3Frg
 ==
X-ME-Sender: <xms:tcqCYDVl8yup-Zf7zIzEpGAp_CCHCOn8KWhJAbLJhvqXyfXe4zosvQ>
 <xme:tcqCYLnRYe7dAiJb1ifci5vDPdApZnAzms0BxwJMLvOHMJ-OKcxNET7pHiXInT50F
 OFAJ_HFrjoydIne27k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduvddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:tcqCYPbZ_h2AMcjAA_uEtevF0hAaEx_wHvD6pW0CiwuZNHKFYX9SBw>
 <xmx:tcqCYOU9AUXD8DuDE1ExHTD7kXGcstFiYJRs0neeNs1y5Ur6V_aV_Q>
 <xmx:tcqCYNncgmDnTFLqEIgAdejSt90plAs2IoXCwdIJcSZdaDufpoiqtw>
 <xmx:tsqCYAtaNtOggYkJz036pUNCHFOF2CZPO9RL5kV63VI_bHwIO7N0UQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 09DB0108005F;
 Fri, 23 Apr 2021 09:25:07 -0400 (EDT)
Date: Fri, 23 Apr 2021 15:25:06 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.0 v2 2/2] hw/block/nvme: disable hotplugging for
 subsystem-linked controllers
Message-ID: <YILKsjz+WoXFiKUh@apples.localdomain>
References: <20210423052127.512489-1-its@irrelevant.dk>
 <20210423052127.512489-3-its@irrelevant.dk>
 <CAFEAcA8xS6Hoqd+Y96FxhrDabsotYURsHHvEeN9yDLDHzzVf+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NsBcxEmPfTjh2ftv"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8xS6Hoqd+Y96FxhrDabsotYURsHHvEeN9yDLDHzzVf+g@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Klaus Jensen <k.jensen@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NsBcxEmPfTjh2ftv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 23 14:21, Peter Maydell wrote:
>On Fri, 23 Apr 2021 at 06:21, Klaus Jensen <its@irrelevant.dk> wrote:
>>
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> If a controller is linked to a subsystem, do not allow it to be
>> hotplugged since this will mess up the (possibly shared) namespaces.
>>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>>  hw/block/nvme.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>> index 5fe082ec34c5..7606b58a39b9 100644
>> --- a/hw/block/nvme.c
>> +++ b/hw/block/nvme.c
>> @@ -6140,12 +6140,16 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevic=
e *pci_dev)
>>
>>  static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
>>  {
>> +    DeviceClass *dc;
>>      int cntlid;
>>
>>      if (!n->subsys) {
>>          return 0;
>>      }
>>
>> +    dc =3D DEVICE_GET_CLASS(n);
>> +    dc->hotpluggable =3D false;
>> +
>>      cntlid =3D nvme_subsys_register_ctrl(n, errp);
>>      if (cntlid < 0) {
>>          return -1;
>
>I'm not sure this is right -- the DeviceClass is the
>class struct, which there's only one of for every instance
>of the device in the system. So this is saying "if this instance
>is linked to a subsystem, don't let any *future* instances ever
>be hotpluggable". I'm not even sure if it will do the right
>thing for the current device, because this function is called
>from the device's realize method, and the device_set_realized()
>function does the "forbid if dc->hotpluggable is false" check
>before calling the realize method.
>
>Possibly what you want to do here is to call the
>device_get_hotplugged() function and just make the realize
>method fail with a suitable error if the device is both (a) being
>hotplugged and (b) has a subsystem link; but I'm not an expert on
>hotplug, so I might be wrong.
>

Thanks Peter, this sounds exactly like what I want. I'll respin!

I have a "full" fix that actually makes the device hotpluggable in the=20
context of subsystems, but it is definitely not an -rc thing.

--NsBcxEmPfTjh2ftv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCCyrAACgkQTeGvMW1P
DelLawf+PST80ECl01Q3pPs927bAIY5O6KQ/iX1ucUhqOorC1UTDNHf/94+8yFM5
HU6k5RMRBvfGMPQLTKEZGSdmbgMP5izIKQp6nvsmNJtdvNgsQG6+DGoT4+zxVrTS
Tip4GW/inU7AXNGtrvB1yagxWrTJcm/qTqYThw+ezG6y1vo3ydiXRxBoqrysn2WF
B8ycwMiORjjh1lxodFhaVbnUXhzW+tnUuxTxV+RTMgbbqSvp2HVT5KA8O98+OsTX
d52EUYMc1z77nYiqVA0xaZ2nLvC7LcN9lqJB9ANz3D/mRJ1d3bcIhznUGU9nr8dR
0PjsprkKSwuEqGWYFfBialTETeehnQ==
=zgRB
-----END PGP SIGNATURE-----

--NsBcxEmPfTjh2ftv--

