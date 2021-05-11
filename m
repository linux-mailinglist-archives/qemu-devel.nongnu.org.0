Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A4037ABB9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:19:59 +0200 (CEST)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgV70-00073n-2b
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lgUrc-0003QD-11; Tue, 11 May 2021 12:04:04 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:60789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lgUrZ-0005bl-3M; Tue, 11 May 2021 12:04:03 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A67855C0178;
 Tue, 11 May 2021 12:03:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 11 May 2021 12:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=fTvoulk/FXpHoLMB45RtG+UlTpz
 IS0WWt1jR6wSIEQo=; b=gAti6/blWw1oCM0IIqCz4Ezxu0cf4g/1yp3iyEwUSxo
 LAMVNAFQv3KjTuPU78zv95ByF1c9xRcSoAkUfE49lz/qhtF06asTc9qmeIdOyW6M
 hk76mG2QhrmYoGmYAMDue/pLLJkJVhZX7USq9eObYtjGoAo/pIXXdAyaYoULDSlx
 i1O1mosNkRe97RcifPEZt4/5RhTrYo/ciadB7bJQTKsCzISfQAMnmFIRLksEZm6u
 GPR38VTgJsV1pXs/nDWwUL7etD4noEwxToGskFnksESH8fWtbXNe1+T8tFGhqCm9
 x5vw4QfyoleH2ODwBlkH6u5ScLUhg6xGyEEhcZheSwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fTvoul
 k/FXpHoLMB45RtG+UlTpzIS0WWt1jR6wSIEQo=; b=Tr6Q+/THMQkfJJp2TqdMDX
 ghP/x/+zKHTMq+6tEzgsbnG/CRXCcCwKAcJgCsXC78AQIZzMuYVPydqC2i80s7tM
 MVy0VzrfWiaZiIuEN2LzrdxczxZbRnWyCE+90P/Ip2e5QahY5t0Pr9E7aSR3t9VQ
 sHHyPdn+HRgNxJ7qa776RbHnx3NVDYtBsEOn0iJ+09wtkLbgT60PLT9XXYFVbWBp
 rCAuzdm9zbCLeNAtApEff5arbazk1t+hxVYBrOLcClXNkL4HCFaL5WteVtZKsxGc
 qBXQAoKpTLN3nY6556TamfT7SR3iJXB1QIa832R1YPLN0MjyVNA3kcGNw7+6r3RQ
 ==
X-ME-Sender: <xms:7aqaYEWokOl8iAIqRH9VLAC3COdM1tHPxYiBaJ2EB_M3ku_Q2-fWWQ>
 <xme:7aqaYIm_V6dnKVPNURE0h_x7YDpBkWwT9DJLezVHE9Ut66K9UL3Jf0y6aIemLnjet
 20ec_jGXs1lYFyMWPk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:7aqaYIb7HW6h1fHq9QWVp8PwE8aJIjpduVP6OhJUjWTf-msEl7EqNg>
 <xmx:7aqaYDXoKSvjlkAoGzwxWu8EVXp_ZHpxoaGPeLNUzDDwSMdtZPXZqw>
 <xmx:7aqaYOlAl0qPZgooG-e96W71pu9ytR3EpY00gRbVF_rT5xo-RJARCA>
 <xmx:7qqaYAiFxyfGs_-YkmvRDfRIyPll0lqIUJ7Bm1FZZKrrEY-UnGCFkA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 12:03:56 -0400 (EDT)
Date: Tue, 11 May 2021 18:03:54 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Message-ID: <YJqq6rTRTL3mxMK6@apples.localdomain>
References: <20210511073511.32511-1-hare@suse.de>
 <YJp2/AeqfgQ46ZyV@apples.localdomain>
 <5fe71d92-842b-2b86-1d5e-c7a106753d2a@suse.de>
 <YJqImppDvOKSbgh2@apples.localdomain>
 <27cc0341-3a32-4a75-f5fd-9987b1b37799@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6PxxicRUdhfeOh6b"
Content-Disposition: inline
In-Reply-To: <27cc0341-3a32-4a75-f5fd-9987b1b37799@suse.de>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <keith.busch@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6PxxicRUdhfeOh6b
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 11 16:54, Hannes Reinecke wrote:
>On 5/11/21 3:37 PM, Klaus Jensen wrote:
>> On May 11 15:12, Hannes Reinecke wrote:
>>> On 5/11/21 2:22 PM, Klaus Jensen wrote:
>[ .. ]
>>>> The hotplug fix looks good - I'll post a series that tries to integrate
>>>> both.
>>>>
>>> Ta.
>>>
>>> The more I think about it, the more I think we should be looking into
>>> reparenting the namespaces to the subsystem.
>>> That would have the _immediate_ benefit that 'device_del' and
>>> 'device_add' becomes symmetric (ie one doesn't have to do a separate
>>> 'device_add nvme-ns'), as the nvme namespace is not affected by the
>>> hotplug event.
>>>
>>
>> I have that working, but I'm struggling with a QEMU API technicality in
>> that I apparently cannot simply move the NvmeBus creation to the
>> nvme-subsys device. For some reason the bus is not available for the
>> nvme-ns devices. That is, if one does something like this:
>>
>> =C2=A0 -device nvme-subsys,...
>> =C2=A0 -device nvme-ns,...
>>
>> Then I get an error that "no 'nvme-bus' bus found for device 'nvme'ns".
>> This is probably just me not grok'ing the qdev well enough, so I'll keep
>> trying to fix that. What works now is to have the regular setup:
>>
>_Normally_ the 'id' of the parent device spans a bus, so the syntax
>should be
>
>-device nvme-subsys,id=3Dsubsys1,...
>-device nvme-ns,bus=3Dsubsys1,...

Yeah, I know, I just oversimplified the example. This *is* how I wanted=20
it to work ;)

>
>As for the nvme device I would initially expose any namespace from the
>subsystem to the controller; the nvme spec has some concept of 'active'
>or 'inactive' namespaces which would allow us to blank out individual
>namespaces on a per-controller basis, but I fear that's not easy to
>model with qdev and the structure above.
>

The nvme-ns device already supports the boolean 'detached' parameter to=20
support the concept of an inactive namespace.

>> =C2=A0 -device nvme-subsys,...
>> =C2=A0 -device nvme,...
>> =C2=A0 -device nvme-ns,...
>>
>> And the nvme-ns device will then reparent to the NvmeBus on nvme-subsys
>> (which magically now IS available when nvme-ns is realized). This has
>> the same end result, but I really would like that the namespaces could
>> be specified as children of the subsys directly.
>>
>Shudder.
>Automatic reparenting.
>To my understanding from qdev that shouldn't even be possible.
>Please don't.
>

It's perfectly possible with the API and used to implement stuff like=20
failover. We are not changing the parent object, we are changing the=20
parent bus. hw/sd does something like this (but does mention that its a=20
bit of a hack). In this case I'd say we could argue to get away with it=20
as well.=20

Allowing the nvme-ns device to be a child of the controller allows the=20
initially attached controller of non-shared namespaces to be easily=20
expressible. But I agree, the approach is a bit wacky, which is why I=20
havnt posted anything yet.

--6PxxicRUdhfeOh6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCaqukACgkQTeGvMW1P
DenDXAf9FQbEjO4AR+Ki3Qnr/ji3ai5wHkUFJKqbEd6WPMxfXwC6etANoduVlOtZ
m/XiFjo7PLpeGhmaORgHVbhMVsekoEuCgzWCS2bZCfVvH0VrIgnTFm40NGk83tch
8tCOll8LVjn7yW2Txo4oz9TRvOEK4NmCdFIZC68kE9VCYeCdA+JEmvIjP6IpABlq
3vQWE8tQnX2DZ8XJxXdPgzUoxG6ySoClTOWFWGp5XSWAqZpPkzgeX9SYuTWUPTEC
FSyGeXEZDffieWxYHpC5W8QeBUlDkaMIDmXDR90xu1acomQi+348kiwFX+99cn8F
WjkrT56rmGedXDsGVZAdbF8H9C++EA==
=Xe5J
-----END PGP SIGNATURE-----

--6PxxicRUdhfeOh6b--

