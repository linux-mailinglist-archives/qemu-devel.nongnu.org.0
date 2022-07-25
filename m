Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5258057F985
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 08:39:44 +0200 (CEST)
Received: from localhost ([::1]:48352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFrkl-0001uI-6h
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 02:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1oFrg4-0007Ga-3L; Mon, 25 Jul 2022 02:34:52 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:57027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1oFrg1-0002O7-Qc; Mon, 25 Jul 2022 02:34:51 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7E805320025E;
 Mon, 25 Jul 2022 02:34:44 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Mon, 25 Jul 2022 02:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1658730884; x=
 1658817284; bh=JlzLQlWyT368MPsvcCqpeCYGDZciINrNal04cguLjvU=; b=R
 CbQrOgYO5T2wFSq7PUJXHfp0gB4D30pRgC+CN3IVrVj2xnVP1jydf0Uw7iPM/yyq
 qTHqjTtd1CIIWtICv+idinQyobGFisrzMb4KVqbzbp23e1tbmLI8Mp/LZLbi+KcR
 MeOH7PaH08Ek8xG+LR+j5364rSxt0T1Zxdm8Ku0CpN+lNSb03D3ucpRZ4D2c6qL1
 h/m1n2rpz1UstmD+de0RpAq9odN5XhCmCNyj9CN8XZrHSDDE6T/lS9xMsEev0dR5
 +rPh6euDH0m9gQ9MZbGzW/Tcc/6xb93LQ3PcMJiJgZSC0DtVnxCeci4/vk5XGogL
 4a4whksg18HHk0twT2zbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658730884; x=
 1658817284; bh=JlzLQlWyT368MPsvcCqpeCYGDZciINrNal04cguLjvU=; b=g
 tPVHmqyyHJeJCRuOuVc+yDQHWwKL38LojkOBJXww3d14FWI+PYAbzLXXYheHV1ET
 bQBBzZI6nHSrtrURZOODNy9xGkJ4AVHkUjTwme5W9btAHZxnmItEEsTj4wRFrrbH
 Zh7ADPOFx33x68NCRBlYn1aOGFGWC5RLNmOh66lIYBhu4DNr7RXGyRTWna+V+dA9
 1B+Y9cafHsawdJQ1CL8UwRfzIo9iI/mKsbBUowJb3AIZ4KPaApI6GcasTbIdCpdt
 ZfFqwy2N5VwnZ6O02UpEppw/CN7Bax3hr3sG6Gdbpi3flijK6sE7WVnXlYrkfjkQ
 JR96EgZqtdRWgvF3yRb5Q==
X-ME-Sender: <xms:gzneYj06kLmnVh6hSpvf6LbWCyAMJpzOumXjQGNUqR7NGFX4BGzx4Q>
 <xme:gzneYiG27XSMTIabk-ktbRaVMtPkwIxBvY_Y2YxIjc8FXI7ELC7WH6uD1KrPO-tRN
 AUY0JtYgh9r8oLpzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtjedgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
 tehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenuc
 ggtffrrghtthgvrhhnpeehhfdviedvfeeutefgieetgfdtgeehvddtkeelgfekgeelffeg
 teekgfdtleejueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
 fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgu
 rdgruh
X-ME-Proxy: <xmx:gzneYj6KpNa09ODGSOmXCTykxJRpV78XrxVd78M8llvarvpESxDj4g>
 <xmx:gzneYo38TbJVYM9vWa7vlQbImR9PGyrtAqMI85HcHaL0eFmc_5sgWQ>
 <xmx:gzneYmH6WlAntsLT7Kn5Q34LIm8P_eq6a33EqLoHPcANXpwfYxUaYg>
 <xmx:hDneYp0KJWWRuRiwq9ETv1HEQ5TxpurRUJEiSqObhWTe1qL760osQw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7568B170007E; Mon, 25 Jul 2022 02:34:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-757-gc3ad9c75d3-fm-20220722.001-gc3ad9c75
Mime-Version: 1.0
Message-Id: <dd779816-0c25-4a07-b8d7-c9b94b5f30f2@www.fastmail.com>
In-Reply-To: <257967d9-fd97-41ed-e5a1-23e4a89dba57@kaod.org>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-9-clg@kaod.org>
 <e98735a4-19ae-4628-bacb-549511821c41@www.fastmail.com>
 <257967d9-fd97-41ed-e5a1-23e4a89dba57@kaod.org>
Date: Mon, 25 Jul 2022 16:04:23 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Cameron Esfahani via" <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9_via?= <qemu-arm@nongnu.org>,
 qemu-block@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Alistair Francis" <alistair@alistair23.me>, 
 "Francisco Iglesias" <frasse.iglesias@gmail.com>,
 "Iris Chen" <irischenlj@fb.com>, "Michael Walle" <michael@walle.cc>
Subject: Re: [PATCH v3 8/8] arm/aspeed: Replace mx25l25635e chip model
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.25; envelope-from=andrew@aj.id.au;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 25 Jul 2022, at 16:02, C=C3=A9dric Le Goater wrote:
> On 7/25/22 04:08, Andrew Jeffery wrote:
>>=20
>>=20
>> On Fri, 22 Jul 2022, at 16:06, C=C3=A9dric Le Goater wrote:
>>> aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
>>>       mc->desc       =3D "OpenPOWER Witherspoon BMC (ARM1176)";
>>>       amc->soc_name  =3D "ast2500-a1";
>>>       amc->hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1;
>>> -    amc->fmc_model =3D "mx25l25635e";
>>> +    amc->fmc_model =3D "mx25l25635f";
>>=20
>> The witherspoon I checked also reported mx25l25635e in dmesg for the
>> FMC.
>>=20
>> You do say "generally" in the commit message though.
>
> You can not tell from dmesg.
>
> The MX25L25635F and MX25L25635E models share the same JEDEC ID and
> the spi-nor flash device table only contains a mx25l25635e entry.
> The MX25L25635F is detected in mx25l25635_post_bfpt_fixups using SFDP.
>
> That's why I added this warning  :
>
>   =20
> https://github.com/legoater/linux/commit/934f0708ac597022cbf6c8d6f2ce9=
1d55025e943
>

Oh righto, sorry for the noise.

