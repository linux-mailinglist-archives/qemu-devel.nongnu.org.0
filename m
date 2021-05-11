Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF837A821
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:49:58 +0200 (CEST)
Received: from localhost ([::1]:59920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSlp-00039e-9D
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lgSZs-0001bd-UV; Tue, 11 May 2021 09:37:36 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:50251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lgSZq-0006lD-RB; Tue, 11 May 2021 09:37:36 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DE6185C00E3;
 Tue, 11 May 2021 09:37:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 11 May 2021 09:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=D64w9FnlxXhtWem+ImuimTCfFI7
 ze3zMoYRYnD5bCqI=; b=brunsZlmXyLXZJ63/zjuHOgYTZtkLLB5dXFTHRVbVWW
 fX5Qwuyhqv/Q4sWFxYuZWEBqNeGg0QPv171j1ymoSrdNFzfyMqgNJuvM5Y8TQef9
 2R+IX8nFXvTPLGwImHPUXGicWgf6hj2+6x+nhBTheMCuqmlcmXth4hjyLBeHU355
 cn3HGCypCrCKM9qTxA1DSoYdimc3OacVKX+h7yZOB6HXnnehzB9Gp09x1NuSfU0m
 y5HzndHa/10uec23ymIHNYlQCEJlPUGBwnfOMG+hIcWEHZJvbl/GJ6QYZ5xLeVoh
 d6HsTE13afu7B0EPEBz/iHdRDfm2Dq0axuQyPkrOvrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=D64w9F
 nlxXhtWem+ImuimTCfFI7ze3zMoYRYnD5bCqI=; b=q3iOkvDJ+K9Wnn00GJaWlk
 VLomNIFczGUkNtB48i5g4m4yw06TBjk5VmikJQFI4qVPqsoNvWU9UV6cWZjdviuX
 y6ftZpye/vzafavDIQDs5NMjkNvj+OuiNy5qRbVAcFkQmWQOxhFmdj7dhVLTO7Ei
 LIXZp2mN+bnb/erbCuO6KWlmjETLyFAgGjR0PPx6Ly/h5cjQ/vTaPnlC61kSQJvi
 OqFFaY6b9hi0cQr+XR4Z5nt3asCCRmf6c7E71qgE535ilNK9QWLG8gfQiIL5ZTfM
 Ne5au2hUfsC58VI06kkVIdtuK2JVDiCDOSYQU9Jb4BzzjZI2gtPhpAayJ9yFzdSA
 ==
X-ME-Sender: <xms:nIiaYMTPUK4BCG_GgFyiGhZ3_QrWde-77EB5fvpklMz54fE888wkyw>
 <xme:nIiaYJyquJvD14O9UY4f0m5a_ym1QdjhROwJX_TavRcqveDssBVzLu8wTJtY8X7Dm
 jZfQIxeY0vmVeW0E_I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:nIiaYJ0kGb5B9ecOGI-CzjZBayz9kXDWQZs_B8m0gsJspxaVN1SZ-Q>
 <xmx:nIiaYAARObMbtIUUvSGhgd_iOF58mJIu5Hpc7DwTJGtra9BjeJns4w>
 <xmx:nIiaYFgB1ny-A2tbufMC-TpAdMLRRGVgLD2eVeXoctUdNXAVO7HOJA>
 <xmx:nYiaYKvze0GfRJL6NbeDeM7ec1dVNXtgovC_Sm2xsx4qYsWvO9c-fA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 09:37:31 -0400 (EDT)
Date: Tue, 11 May 2021 15:37:30 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Message-ID: <YJqImppDvOKSbgh2@apples.localdomain>
References: <20210511073511.32511-1-hare@suse.de>
 <YJp2/AeqfgQ46ZyV@apples.localdomain>
 <5fe71d92-842b-2b86-1d5e-c7a106753d2a@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t//O19GeymRbIzJh"
Content-Disposition: inline
In-Reply-To: <5fe71d92-842b-2b86-1d5e-c7a106753d2a@suse.de>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <keith.busch@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--t//O19GeymRbIzJh
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 11 15:12, Hannes Reinecke wrote:
>On 5/11/21 2:22 PM, Klaus Jensen wrote:
>> On May 11 09:35, Hannes Reinecke wrote:
>>> Ever since commit e570768566 ("hw/block/nvme: support for shared
>>> namespace in subsystem") NVMe PCI hotplug is broken, as the PCI
>>> hotplug infrastructure will only work for the nvme devices (which
>>> are PCI devices), but not for any attached namespaces.
>>> So when re-adding the NVMe PCI device via 'device_add' the NVMe
>>> controller is added, but all namespaces are missing.
>>> This patch adds device hotplug hooks for NVMe namespaces, such that one
>>> can call 'device_add nvme-ns' to (re-)attach the namespaces after
>>> the PCI NVMe device 'device_add nvme' hotplug call.
>>>
>>
>> Hi Hannes,
>>
>> Thanks for this.
>>
>> The real fix here is that namespaces are properly detached from other
>> controllers that it may be shared on.
>>
>> But is this really the behavior we want? That nvme-ns devices always
>> "belongs to" (in QEMU qdev terms) an nvme device is an artifact of the
>> Bus/Device architecture and not really how an NVM subsystem should
>> behave. Removing a controller should not cause shared namespaces to
>> disappear from other controllers.
>>
>> I have a WIP that instead adds an NvmeBus to the nvme-subsys device and
>> reparents the nvme-ns devices to that if the parent controller is linked
>> to a sybsystem. This way, nvme-ns devices wont be unrealized under the
>> feet of other controllers.
>>
>That would be the other direction I thought of; _technically_ NVMe
>namespaces are objects of the subsystem, and 'controllers' are just
>temporary objects providing access to the namespaces presented by the
>subsystem.
>So if you are going to rework it I'd rather make the namespaces children
>objects of the subsystem, and have nsid maps per controller detailing
>which nsids are accessible from the individual controllers.
>That would probably a simple memcpy() to start with, but it would allow
>us to modify that map via NVMe-MI and stuff.
>
>However, if you do that you'll find that subsystems can't be hotplugged,
>too; but I'm sure you'll be able to fix it up :-)
>
>> The hotplug fix looks good - I'll post a series that tries to integrate
>> both.
>>
>Ta.
>
>The more I think about it, the more I think we should be looking into
>reparenting the namespaces to the subsystem.
>That would have the _immediate_ benefit that 'device_del' and
>'device_add' becomes symmetric (ie one doesn't have to do a separate
>'device_add nvme-ns'), as the nvme namespace is not affected by the
>hotplug event.
>

I have that working, but I'm struggling with a QEMU API technicality in=20
that I apparently cannot simply move the NvmeBus creation to the=20
nvme-subsys device. For some reason the bus is not available for the=20
nvme-ns devices. That is, if one does something like this:

   -device nvme-subsys,...
   -device nvme-ns,...

Then I get an error that "no 'nvme-bus' bus found for device 'nvme'ns".=20
This is probably just me not grok'ing the qdev well enough, so I'll keep=20
trying to fix that. What works now is to have the regular setup:

   -device nvme-subsys,...
   -device nvme,...
   -device nvme-ns,...

And the nvme-ns device will then reparent to the NvmeBus on nvme-subsys=20
(which magically now IS available when nvme-ns is realized). This has=20
the same end result, but I really would like that the namespaces could=20
be specified as children of the subsys directly.

Any help from qdev experts would be appreciated! :)

>This really was a quick hack to demonstrate a shortcoming in the linux
>NVMe stack (cf 'nvme-mpath: delete disk after last connection' if you
>are interested in details), so I'm sure there is room for improvement.
>

I follow linux-nvme, so I saw the patch ;)

>And the prime reason for sending it out was to gauge interest by
>qemu-devel; I have a somewhat mixed experience when sending patches to
>the qemu ML ...
>

Your contribution is very much appreciated :)

--t//O19GeymRbIzJh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCaiJgACgkQTeGvMW1P
DekAMwf/U+DpSZs3Jt7F/D2oJsHqXpvaQ/h9NuqlpUhAJhF2klrihlbSJ/J1NfD7
oQ8v9xrP/VVcl63Cpgdb96P2p0SQwZA9m7SID0dQilRls91fPBiWplLAJJMwEZ0q
dYgI0zisKcbVFL+6r52YemknHTpwB+N5QSGu5JdQcDrQ7gyeisMRUuuEp6+4/BpE
zlqgTnvrIiBIOvD6vJpK0JTSmgorXo4FxCkRnOk8dnHUs5/wck7gp2tbqEBpRq6Q
q8aUBPC9lTxUxvHpjO6P7J28KOVSyEpi32272Ljm1t9f8YkFWuKkATqpIGW+e346
6MzZN+fvWBbg1rFv0gfCBLYx5fzqkQ==
=71Vo
-----END PGP SIGNATURE-----

--t//O19GeymRbIzJh--

