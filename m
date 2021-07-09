Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3DC3C1FCD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:01:32 +0200 (CEST)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kVv-0006gf-Nq
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1kQj-0003GV-Uy; Fri, 09 Jul 2021 02:56:10 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1kQf-0006Sc-Gc; Fri, 09 Jul 2021 02:56:09 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id BCAA4320084E;
 Fri,  9 Jul 2021 02:56:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 09 Jul 2021 02:56:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=uOxVrS5VZ+Dd8nHIlrhLSd8pVHz
 gsBPxTWi3n2PmC4g=; b=lvL2glccVApByj5Wyp3QV0/NcFLdgiIiA1PRETJYnHs
 L8XyBNH5yw5kCG+V6Wxzdn3kabYvruuFjOFw6J1AUfnKJr9/Mexjeb5ogb12hZWS
 ODpAHVxRnhdp1RXYz8/DrvLxRILURI2HBuZj4QQtQxtSLj0uI1y1gQ3XpGO5T1eb
 Ob3k0WgWhJgUSrl+nrJIlhB6Y8pMTZ4q7C/qExyvidBimm10awMHme+7t9gQNQi9
 A7f7dDOtVMn+RMMVqSQjaU7NwPbDOjNYVBZswdXHk90CD0YvyAtGkSj3PLu2S5sI
 FbKSHVOgroqHiHmQYRP7PPWsi9x1VtSsU9KRU+uPIlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uOxVrS
 5VZ+Dd8nHIlrhLSd8pVHzgsBPxTWi3n2PmC4g=; b=pjPih7jSPFFYYQdg4RK4Py
 Ghf662WKrlJmTJwzsSW/8c4KBgbZ26zdj15lL3x+8Q60n2UmY06glikEANNtTLoA
 TRnU2yuK+qcjAI+c+X/pRCNEgbNJJGpdrZn3GWJu3GODoTV1QSnxEefj3e8KizmH
 OsWU/gAvbbwFURPoMJ+xERuvCn/q/imtEgEgErXmMUhIVLC4DcE8xe29VAwqnlRZ
 7jcMwNs4HhbIgYGcr1OGvkIVWGpCqbmD6jjoewfFxrZHRytznVVboUL5qlvWlDp2
 7dP9sRZ6w2AgZYbEdegnqekeH8yiAsFGoXe83Ls7R9XFuP+v2LaL0MLYYgtURneQ
 ==
X-ME-Sender: <xms:AfPnYPOvnuRpeGAp19Gu_UXtHeVinhEzXUnQ9jjlPia5wN-r3Fs7mA>
 <xme:AfPnYJ9Ynx8HXDZfy0leEiyMJ7d_u0Si8oWP_WpylGvh9N5fmCqIvspIqmHQbVJhT
 1ogeei_puhONzHZJdA>
X-ME-Received: <xmr:AfPnYOTtayx-HK74qlcYIMIq8_rHhJ4JYLoId_Nlr2RFkS8IwVwgCsiAXh5dSWf_S5ddM6w4G0zdWu3_sjrDvBpyXnVRrFnhU9FvBxuYVuB-UkD3iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdehgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:AfPnYDuOwiwH5NCqEdKXuI-HSqOKjW8y1w-w5rJOB8-8BShwkREXIg>
 <xmx:AfPnYHdVR18PLoFzQSmtrU_JplSL9h4xMp9RUGsD8hoATRH5Pd5qtA>
 <xmx:AfPnYP3pwiTH9UXQ-KtReDgsPX7DeyoRtswFy4khYg3HIHU0itU-Vg>
 <xmx:AvPnYO431PM_vkD17IFnQxRTJwYq1Kg0VuM4rvaBwpmMYe59IWXCeg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 02:56:00 -0400 (EDT)
Date: Fri, 9 Jul 2021 08:55:58 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v2 0/4] hw/nvme: fix controller hotplugging
Message-ID: <YOfy/tt/5jgi48uU@apples.localdomain>
References: <20210707154936.200166-1-its@irrelevant.dk>
 <YOfnDBwya58drDZk@apples.localdomain>
 <4366b9c6-8b8a-a682-9213-740c3088f1b1@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sxrfUxo2ucsoTmDu"
Content-Disposition: inline
In-Reply-To: <4366b9c6-8b8a-a682-9213-740c3088f1b1@suse.de>
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


--sxrfUxo2ucsoTmDu
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  9 08:16, Hannes Reinecke wrote:
>On 7/9/21 8:05 AM, Klaus Jensen wrote:
>>On Jul=C2=A0 7 17:49, Klaus Jensen wrote:
>>>From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>>Back in May, Hannes posted a fix[1] to re-enable NVMe PCI hotplug. We
>>>discussed a bit back and fourth and I mentioned that the core issue was
>>>an artifact of the parent/child relationship stemming from the qdev
>>>setup we have with namespaces attaching to controller through a qdev
>>>bus.
>>>
>>>The gist of this series is the fourth patch "hw/nvme: fix controller hot
>>>unplugging" which basically causes namespaces to be reassigned to a bus
>>>owned by the subsystem if the parent controller is linked to one. This
>>>fixes `device_del/add nvme` in such settings.
>>>
>>>Note, that in the case that there is no subsystem involved, nvme devices
>>>can be removed from the system with `device_del`, but this *will* cause
>>>the namespaces to be removed as well since there is no place (i.e. no
>>>subsystem) for them to "linger". And since this series does not add
>>>support for hotplugging nvme-ns devices, while an nvme device can be
>>>readded, no namespaces can. Support for hotplugging nvme-ns devices is
>>>present in [1], but I'd rather not add that since I think '-device
>>>nvme-ns' is already a bad design choice.
>>>
>>>Now, I do realize that it is not "pretty" to explicitly change the
>>>parent bus, so I do have a an RFC patch in queue that replaces the
>>>subsystem and namespace devices with objects, but keeps -device shims
>>>available for backwards compatibility. This approach will solve the
>>>problems properly and should be a better model. However, I don't believe
>>>it will make it for 6.1 and I'd really like to at least fix the
>>>unplugging for 6.1 and this gets the job done.
>>>
>>>=C2=A0[1]: 20210511073511.32511-1-hare@suse.de
>>>
>>>v2:
>>>- added R-b's by Hannes for patches 1 through 3
>>>- simplified "hw/nvme: fix controller hot unplugging"
>>>
>>>Klaus Jensen (4):
>>>=C2=A0hw/nvme: remove NvmeCtrl parameter from ns setup/check functions
>>>=C2=A0hw/nvme: mark nvme-subsys non-hotpluggable
>>>=C2=A0hw/nvme: unregister controller with subsystem at exit
>>>=C2=A0hw/nvme: fix controller hot unplugging
>>>
>>>hw/nvme/nvme.h=C2=A0=C2=A0 | 18 +++++++++-------
>>>hw/nvme/ctrl.c=C2=A0=C2=A0 | 14 ++++++------
>>>hw/nvme/ns.c=C2=A0=C2=A0=C2=A0=C2=A0 | 55 ++++++++++++++++++++++++++++++=
+-----------------
>>>hw/nvme/subsys.c |=C2=A0 9 ++++++++
>>>4 files changed, 63 insertions(+), 33 deletions(-)
>>>
>>>--=20
>>>2.32.0
>>>
>>
>>Applied patches 1 through 3 to nvme-next.
>
>So, how do we go about with patch 4?
>Without it this whole exercise is a bit pointless, seeing that it=20
>doesn't fix anything.
>

Patch 1-3 are fixes we need anyway, so I thought I might as well apply=20
them :)

>Shall we go with that patch as an interim solution?
>Will you replace it with your 'object' patch?
>What is the plan?
>

Yes, if acceptable, I would like to use patch 4 as an interim solution.=20
We have a bug we need to fix for 6.1, and I belive this does the job.

I considered changing the existing nvme-bus to be on the main system=20
bus, but then we break the existing behavior that the namespaces attach=20
to the most recently defined controller in the absence of the shared=20
parameter or an explicit bus parameter.

Wrt. "the plan", right now, I see two solutions going forward:

1. Introduce new -object's for nvme-nvm-subsystem and nvme-ns
    This is the approach that I am taking right now and it works well. It=
=20
    allows many-to-many relationships and separates the life times of=20
    subsystems, namespaces and controllers like you mentioned.

    Conceptually, I also really like that the subsystem and namespace are=
=20
    not "devices". One could argue that the namespace is comparable to a=20
    SCSI LUN (-device scsi-hd, right?), but where the SCSI LUN actually=20
    "shows up" in the host, the nvme namespace does not.

    My series handles backwards compatibility by keeping -device "shims"=20
    around that just wraps the new objects but behaves like it used to.=20
    The plan would be to deprecate these devices.

    The downside to this approach is that it moves the subsystem and=20
    namespaces out of the "qdev tree (info qtree)" and into the pure QOM=20
    "/objects" tree. Instead of qtree, we can have QMP and HMP commands=20
    for introspection.

2. Make the subsystem a "system bus device"
    This way we add an "nvme-nvm-subsystems" bus as a direct child of the=
=20
    main system bus, and we can possibly get rid of the explicit -device=20
    nvme-subsys as well. We change the namespace device to plug into that=
=20
    instead. The nvme controller device still needs to plug into the PCI=20
    bus, so it cannot be a child of the subsystems bus, but can keep=20
    using a link parameter to hook into the subsystem and attach to any=20
    namespaces it would like.

    I'm unsure if we can do this without deprecating the existing=20
    namespace device, just like option 1.

    I have not implemented this, so I need to look more into it. It seems=
=20
    like the main thing that this gives us compared to 1) is `info qtree`=
=20
    support and we still end up just "wiring" namespace attachment with=20
    backlinks anyway.

I'm not sure what I would prefer, but I've found that implemting it as=20
-object's is a breath of fresh air and as I mentioned, conceptually, I=20
like option 1 because namespaces are -objects and not -devices.

And, by the way, thanks for chipping in on this Hannes, I had sort of=20
crossed off option 2 before you showed up and threw some ideas in the=20
air ;)

--sxrfUxo2ucsoTmDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDn8v0ACgkQTeGvMW1P
DeluAQf/Q7Hy2L/q+/WlI5BZmR0Kn8MZXlHRC5cdtmB1xZu1YBt568cDT8h2aRBc
8CC0Yc5QyQb0VxEADYu3ts4XFjFy0fq0Dg2MlXmJCsUrZcbyQMHproGJwP5rsFYV
DXZeMm0dZnihXPoWdrCse0fXQTwmUwqfsa+M//Mua2QQEQ3rUwC6UwzK4vDmN1CF
yrhZsEjZPMVwSJstb3MnYm2Zb643oTj7Ms4swC2e14LzN2ieoOuV1LyhvrK6F7qE
pF6e7FC7FIk8TBBbIe/MhQGaBlXHz381c19U4qlEHZoELiya4Vnv/Znrr+mOz2At
QXZjUcykXj3ifXV+GsBZfhJ8mx9hbA==
=hjiJ
-----END PGP SIGNATURE-----

--sxrfUxo2ucsoTmDu--

