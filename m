Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B483C1FDE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:13:40 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1khf-0000xS-AR
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1kUG-0006s7-OL; Fri, 09 Jul 2021 02:59:48 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:33609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1kUD-0000BP-Uc; Fri, 09 Jul 2021 02:59:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0C3543200906;
 Fri,  9 Jul 2021 02:59:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 09 Jul 2021 02:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=u6pnlLmSGwaCQxgKMkx71mazb0T
 bppCLQxpxZDUFd0w=; b=B+joBSwLkDbeJbEqgehlkyGcQH6JVsSSUUkq7xZNYXl
 hIW+MkkcWem+ZzC867zJ2iy/czP/sfC2GLHTxC0j3PFiGfI48BuK1MismSXX0Je8
 QckqPiKGSZF+TQ3iMFO7L5/EWVKjXC/DCQUI40DOTx4/ajUZ95PX3T4oZez3BHHj
 T6Pqx0B3Dn2bWJqgZ8M8KugRMZGOMv48m0/ScVgc4dTwLOAON+r5Jd/xadxe28pe
 NK5PplXH+Gdh2OF06rnodr4AV4yTFABCYz/9P/8poAP4ugLfMHbC3QkVndacA/9p
 hn9YLxGfxrBfvaL/mG6ZWJd29LYsda+pPFhkAjpKvCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=u6pnlL
 mSGwaCQxgKMkx71mazb0TbppCLQxpxZDUFd0w=; b=hdCi1HpGHOcxK3OWyu2far
 kwoVw/bQtgnkoor4y+ERTEDVO34jfarSSrrG1Ao7LGMwfPwuLvAdZrqzUrd4evHM
 ma90eLBaSni8rneFeTRSIhJS/xCdpyqKtpWvWO9nhZJJyGay8y6fS+UsCiUiSJsb
 FM41wzuALGGioO9BCq/2IE3d9P/HcMefqDHNXkHKrtS2vVHx74RdR27y0Qfu660Z
 8+HgLBPvTeClgIYiPO3X5NgQ4IcZN0zbfRJ0AK6V7tstPtqw1JkDiLY9IzQ8PF+i
 /1BxbEETP/g8y99SeZFKjsNF+JAP+0ztJ//SyfkfAaOauEKFApjTnHKJpgee86cA
 ==
X-ME-Sender: <xms:3_PnYL8GZDVzhDVsZ2muGbEaaNZzbfgKcN1kGAKzlLr4Rj7hGm2yzg>
 <xme:3_PnYHuVsLsX6_3-qdS2yf9F4o3b5aio9SmXKauYka8bMxQKIVR9zJZSyD5OYChZz
 cTkvAs-FCH2wxVPZjA>
X-ME-Received: <xmr:3_PnYJB_QP87G3BW6ELKwL-kSY9zZkEolIGFtnDDH71rVj2fgfFVqQ-P0tbzi38J3AvAQvDxoQ8AufqNYkmZj_JM7MhNFsXv_IhPOpqDo2NpL_tnfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdehgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:3_PnYHcctV7wjenmywRPuHPV1gHQJtq7tquRmrsO8zvnqd34Z2BevA>
 <xmx:3_PnYAPNp7aBp-R6_e33bHTwKlNlSbDGq4r1ZL3p9sY_aJJC-jJB4Q>
 <xmx:3_PnYJmYTaHqESe9MKKrzMiFQ7LvKkcdd0227-XXlYu82pp5yl2rSA>
 <xmx:3_PnYNrZf4KKzItysNScl5TdFE-N4znBI0gWEApnZyE1K0R3FokCIA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 02:59:42 -0400 (EDT)
Date: Fri, 9 Jul 2021 08:59:40 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v2 0/4] hw/nvme: fix controller hotplugging
Message-ID: <YOfz3LNrn+SngyTJ@apples.localdomain>
References: <20210707154936.200166-1-its@irrelevant.dk>
 <YOfnDBwya58drDZk@apples.localdomain>
 <4366b9c6-8b8a-a682-9213-740c3088f1b1@suse.de>
 <YOfy/tt/5jgi48uU@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sWlAutPDCnHg0On2"
Content-Disposition: inline
In-Reply-To: <YOfy/tt/5jgi48uU@apples.localdomain>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--sWlAutPDCnHg0On2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  9 08:55, Klaus Jensen wrote:
>On Jul  9 08:16, Hannes Reinecke wrote:
>>On 7/9/21 8:05 AM, Klaus Jensen wrote:
>>>On Jul=C2=A0 7 17:49, Klaus Jensen wrote:
>>>>From: Klaus Jensen <k.jensen@samsung.com>
>>>>
>>>>Back in May, Hannes posted a fix[1] to re-enable NVMe PCI hotplug. We
>>>>discussed a bit back and fourth and I mentioned that the core issue was
>>>>an artifact of the parent/child relationship stemming from the qdev
>>>>setup we have with namespaces attaching to controller through a qdev
>>>>bus.
>>>>
>>>>The gist of this series is the fourth patch "hw/nvme: fix controller hot
>>>>unplugging" which basically causes namespaces to be reassigned to a bus
>>>>owned by the subsystem if the parent controller is linked to one. This
>>>>fixes `device_del/add nvme` in such settings.
>>>>
>>>>Note, that in the case that there is no subsystem involved, nvme devices
>>>>can be removed from the system with `device_del`, but this *will* cause
>>>>the namespaces to be removed as well since there is no place (i.e. no
>>>>subsystem) for them to "linger". And since this series does not add
>>>>support for hotplugging nvme-ns devices, while an nvme device can be
>>>>readded, no namespaces can. Support for hotplugging nvme-ns devices is
>>>>present in [1], but I'd rather not add that since I think '-device
>>>>nvme-ns' is already a bad design choice.
>>>>
>>>>Now, I do realize that it is not "pretty" to explicitly change the
>>>>parent bus, so I do have a an RFC patch in queue that replaces the
>>>>subsystem and namespace devices with objects, but keeps -device shims
>>>>available for backwards compatibility. This approach will solve the
>>>>problems properly and should be a better model. However, I don't believe
>>>>it will make it for 6.1 and I'd really like to at least fix the
>>>>unplugging for 6.1 and this gets the job done.
>>>>
>>>>=C2=A0[1]: 20210511073511.32511-1-hare@suse.de
>>>>
>>>>v2:
>>>>- added R-b's by Hannes for patches 1 through 3
>>>>- simplified "hw/nvme: fix controller hot unplugging"
>>>>
>>>>Klaus Jensen (4):
>>>>=C2=A0hw/nvme: remove NvmeCtrl parameter from ns setup/check functions
>>>>=C2=A0hw/nvme: mark nvme-subsys non-hotpluggable
>>>>=C2=A0hw/nvme: unregister controller with subsystem at exit
>>>>=C2=A0hw/nvme: fix controller hot unplugging
>>>>
>>>>hw/nvme/nvme.h=C2=A0=C2=A0 | 18 +++++++++-------
>>>>hw/nvme/ctrl.c=C2=A0=C2=A0 | 14 ++++++------
>>>>hw/nvme/ns.c=C2=A0=C2=A0=C2=A0=C2=A0 | 55 +++++++++++++++++++++++++++++=
++-----------------
>>>>hw/nvme/subsys.c |=C2=A0 9 ++++++++
>>>>4 files changed, 63 insertions(+), 33 deletions(-)
>>>>
>>>>--=20
>>>>2.32.0
>>>>
>>>
>>>Applied patches 1 through 3 to nvme-next.
>>
>>So, how do we go about with patch 4?
>>Without it this whole exercise is a bit pointless, seeing that it=20
>>doesn't fix anything.
>>
>
>Patch 1-3 are fixes we need anyway, so I thought I might as well apply=20
>them :)
>
>>Shall we go with that patch as an interim solution?
>>Will you replace it with your 'object' patch?
>>What is the plan?
>>
>
>Yes, if acceptable, I would like to use patch 4 as an interim=20
>solution. We have a bug we need to fix for 6.1, and I belive this does=20
>the job.
>
>I considered changing the existing nvme-bus to be on the main system=20
>bus, but then we break the existing behavior that the namespaces=20
>attach to the most recently defined controller in the absence of the=20
>shared parameter or an explicit bus parameter.
>
>Wrt. "the plan", right now, I see two solutions going forward:
>
>1. Introduce new -object's for nvme-nvm-subsystem and nvme-ns
>   This is the approach that I am taking right now and it works well.=20
>It    allows many-to-many relationships and separates the life times=20
>of    subsystems, namespaces and controllers like you mentioned.
>
>   Conceptually, I also really like that the subsystem and namespace=20
>are    not "devices". One could argue that the namespace is comparable=20
>to a    SCSI LUN (-device scsi-hd, right?), but where the SCSI LUN=20
>actually    "shows up" in the host, the nvme namespace does not.
>
>   My series handles backwards compatibility by keeping -device=20
>"shims"    around that just wraps the new objects but behaves like it=20
>used to.    The plan would be to deprecate these devices.
>
>   The downside to this approach is that it moves the subsystem and   =20
>namespaces out of the "qdev tree (info qtree)" and into the pure QOM   =20
>"/objects" tree. Instead of qtree, we can have QMP and HMP commands   =20
>for introspection.
>
>2. Make the subsystem a "system bus device"
>   This way we add an "nvme-nvm-subsystems" bus as a direct child of=20
>the    main system bus, and we can possibly get rid of the explicit=20
>-device    nvme-subsys as well. We change the namespace device to plug=20
>into that    instead. The nvme controller device still needs to plug=20
>into the PCI    bus, so it cannot be a child of the subsystems bus,=20
>but can keep    using a link parameter to hook into the subsystem and=20
>attach to any    namespaces it would like.
>
>   I'm unsure if we can do this without deprecating the existing   =20
>namespace device, just like option 1.
>
>   I have not implemented this, so I need to look more into it. It=20
>seems    like the main thing that this gives us compared to 1) is=20
>`info qtree`    support and we still end up just "wiring" namespace=20
>attachment with    backlinks anyway.
>
>I'm not sure what I would prefer, but I've found that implemting it as=20
>-object's is a breath of fresh air and as I mentioned, conceptually, I=20
>like option 1 because namespaces are -objects and not -devices.
>
>And, by the way, thanks for chipping in on this Hannes, I had sort of=20
>crossed off option 2 before you showed up and threw some ideas in the=20
>air ;)

Wow, my mailer screwed up that formatting, sorry about that.

--sWlAutPDCnHg0On2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDn89sACgkQTeGvMW1P
DelENQgAk2Kk/8QXC4iEk8r6nBJmlXY7/Ak15Z7ze+YdbvJL5809uuriquL3A3/B
zFPzthz44n7DKs2UpSpiUBpGxMfIeUOOlhrOqvEveBzjZesmaK1yfph89wBtR0O8
iCXmy/Ugsh6XAfQqtWIlq+M8TLPwCvB7zW1Mn3UD+wJ7ypjLBFFSlG7OjD28W9lm
1UiuHQki/g9rke5xnTl5jYqYeeQVZkDr4frCmJbK9DT1FJk4mM8qvV96Ld2ahmtP
b1b+5vzLhnLiNLeoLqJR7nu7T0TX3eAudK6sbi9dJVnVD1cK7g1s8/Z9KuYMKg+O
6UvguKCtY9SvnDu8IDfdkoiRK58iQA==
=bgU9
-----END PGP SIGNATURE-----

--sWlAutPDCnHg0On2--

