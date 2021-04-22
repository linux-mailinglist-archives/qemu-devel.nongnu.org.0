Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFE736872D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 21:27:35 +0200 (CEST)
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZez8-0002oB-CW
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 15:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZepZ-0006C4-V3; Thu, 22 Apr 2021 15:17:42 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:41099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZepV-0000my-Ni; Thu, 22 Apr 2021 15:17:41 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A041C1AB5;
 Thu, 22 Apr 2021 15:17:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 22 Apr 2021 15:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=PvVOWPsHr15qvJ3+U7xVyRRsDtD
 7CRVTzFUc6bUTr6c=; b=E4i0V66d1oH1gv+xnPhnvaA9cREJxXPWpY9K3q3CMDI
 qSXml5UkGyqTMBJzzgoUUQzZxoJTIBEA0EGFsWbmbtnPE3OpO9BFtRSDU72cG6Ai
 d+0iUVLHZYrOYbN5c7B8aMQ+Ehl3qXgoZ9N6saj5mOftuZkhXfuINwPh7q5D3Cc1
 U3DxBSPSi0B7K0pjCOtpk6aIzL+dSgxmk7BGNGisB0aRaZM3rAkNJjHOIMLwK8Oo
 r7EP16F9XUGy9H9dNy03eDREu36JJ8Af6EOqQgSmY2fnhEiYwf3ukrnMzHrx7h4M
 eiqqXhTBsEDkvsIlRTZ4cou6P01LNfVX708COjdY19Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PvVOWP
 sHr15qvJ3+U7xVyRRsDtD7CRVTzFUc6bUTr6c=; b=RdIPg1akMhobFWeT2ZSCeK
 q9JAftydj56V28H0UhSDJ/6f8cvb0IkRPUo42PvnIBWKDrJEggdx9pKTlaaILtlw
 1TE8fDJuu4k5xUPHyNoc+bRdCl82a6FgClxPb0E1wB96rwGM9ZSXmRQTooK0KSVR
 pzMfsbZYM62lbVLwZboM3SnrvmTILvz9P+9FeRgnXTsNWTJd/CG4w/k8XZWQKCeJ
 QrBi3ZgpLNBoRfzWZo9tm1QI8w3PlM75S+DW/FBA4PFcyWTTBcbEanWc7Uxg1GHK
 JfnIl/y0K6S/eEaw+MTkT9YSPwUXb+Qqckch+MoHBR0Cs6q6vE39G3ZsNSqZ4H/w
 ==
X-ME-Sender: <xms:ysuBYK_r2v7RTbsu8tfTB-931elnWMiUFJTzRMw5hoAOxni0QpWV_g>
 <xme:ysuBYKuvP4Ik6kwoJWySfZD1HKZbkceMjz-hQUN9aYvcz1E1-QwZ212w51Fg2uUVO
 jKcCX1rmSVBTyaaieM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddutddgudefhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ysuBYADG9d_OYXeyaOpazZTZI8QqaXCE9P0J7c9avybs0w4q7EcJCw>
 <xmx:ysuBYCe6bPgd9VwB4eAHp2HGBNT94-9ZEgDxcBbL10bJt5bkhJO_Pw>
 <xmx:ysuBYPMQwh_kW18TmafqAB5bPwjEa4y8P8uj6eg-q_sCexziJCVWtw>
 <xmx:y8uBYK3CLh5WMsIpY83KFSxcT82pOo5fatnEuX8WwCmTZIh-FJCgyQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0633E24005A;
 Thu, 22 Apr 2021 15:17:28 -0400 (EDT)
Date: Thu, 22 Apr 2021 21:17:27 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.0? 0/1] hw/block/nvme: fix msix uninit
Message-ID: <YIHLx9W71LtTbjT2@apples.localdomain>
References: <20210422135834.406688-1-its@irrelevant.dk>
 <YIGDG5qKcZwVj88t@apples.localdomain>
 <CAFEAcA8LZXVgOLYAVvqMFvO6Hi8618eYtT5_c=vJjAcsN9vCCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LWsU9ViqB6hN06kS"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8LZXVgOLYAVvqMFvO6Hi8618eYtT5_c=vJjAcsN9vCCw@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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


--LWsU9ViqB6hN06kS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Apr 22 19:58, Peter Maydell wrote:
>On Thu, 22 Apr 2021 at 15:07, Klaus Jensen <its@irrelevant.dk> wrote:
>>
>> On Apr 22 15:58, Klaus Jensen wrote:
>> >From: Klaus Jensen <k.jensen@samsung.com>
>> >
>> >Hi Peter,
>> >
>> >The commit message on the patch describes the issue. This is a QEMU
>> >crashing bug in -rc4 that I introduced early in the cycle and never
>> >found in time. Lack of testing device hotplugging is the cause for that.
>> >
>> >I'm not sure what to say other than I'm terribly sorry for introducing
>> >this and if this means an -rc5 needs to be rolled, then I'm even more
>> >sorry.
>> >
>> >I think an acceptance test could have caught this, and I am already
>> >working on an acceptance test suite for the nvme device, so I'll add
>> >something that test this as well. But, well, it doesn't help now.
>
>> As far as I can tell, to cause this crash, monitor access is required,
>> so I am not sure if we can get away with a note on this in the release
>> notes and fix this in a potential stable release or next.
>
>Is this a regression since 5.2 ?
>

Yes.

--LWsU9ViqB6hN06kS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCBy8UACgkQTeGvMW1P
DekLhAf9HtmHwJLV+La6VLYRZjxeBsOVO1fyj3P5pWmVZvlJFFgTC+vQIvBj6toy
Go7LMVRaRnAzSkQ/Z05DYxKVUZeYvvXraPH+JoFfal9JcyJdv/Cusx8ii/15H27C
f6xMQQw/Wg5lOdvDJRS4OrWMRa6YJMZpI9yaj9O3IsE38Tc4q16OVxTwNk7ud1hM
OPQofhQU296s27jL/UJESqEF8k2A1YZRZEkg5oYvtYp+j7eGmiws7uAYQCw1js8J
ynqz1l8PmUHKN1592a/7tmx8ApxALwx6hk6WvAYawafFDxQ3pXBhBdNO63VONjic
Gb1FgfZ+0Ko+jJ1rBy0zgNDmer+7lw==
=NTDe
-----END PGP SIGNATURE-----

--LWsU9ViqB6hN06kS--

