Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 248E762EE0B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:01:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovvM9-0002QD-Bv; Fri, 18 Nov 2022 02:00:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovvLj-0002Fd-Oa; Fri, 18 Nov 2022 01:59:44 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ovvLh-0001OS-5i; Fri, 18 Nov 2022 01:59:43 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E82FE3200932;
 Fri, 18 Nov 2022 01:59:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 18 Nov 2022 01:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668754774; x=1668841174; bh=pW
 6Kgx4cj+nlQORhSJz95x6N6ZJaQS3qrgFFcVd4b28=; b=a06gxQ+pl1He0Dn20Q
 3OxfN7T6oEVSHvyOOTQl+NX72SUu111gebauuurSb7HTNu/3mr23B6ZU6aZaEhtK
 KJMQR9i70gmDfY/byac4Gda546G7/M88wEoGdEz5hD6/5/LU85/DIR9U+ToPnWnC
 CaTw53NCqVqcjyPBGoSd1D6nteJjvQMS/LMygF6p/oDaQx/suPtGTwOMNa52iD6r
 vvBKoqYALje4BzvKKUQovDe1R1KH1Jbtniy+Hrakk7xw+BS0ZEcwTFQs/u1mAtb3
 +eKi0SZzT59EHGj+UUytIbc1iEMXJN+Uqk7znp4gAssDPa8UW+9Xq9WLR26+gRp7
 Tf0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668754774; x=1668841174; bh=pW6Kgx4cj+nlQORhSJz95x6N6ZJa
 QS3qrgFFcVd4b28=; b=eiaK6jn9TIEePt+yX/M3jgJvn9V8/gLP932gMgLaJ3C9
 IzjHWyelxDKXNuiEmpltlGNgpKKgc3gkXknTvWxren7X3jPmmVfDX0L5FUTFfxCa
 BcX+SyS7lTETe2PLyUFFp7JGKWO/HjerDsOXha3csxBudYEh6pNYWLtbW6VUWDdE
 Bpwb/6Q+GmMkF5lIQmSojDrPggVsxj4e1YBZVPRx+YZIydbH44ur8pcn40aRTm6H
 +yy/IMeUWpaFfiuHjl/PaQ90hu6gPaNg99cDgvwCE4Z2Tt7nr4Y7ZJfWrtg58GqT
 IQysrVe49aQt3Q3Re74xDMLhlIMEBcx9buV0tV6gZQ==
X-ME-Sender: <xms:VS13Y9q000UpdFUh7eWJtWVYoXCJ7a9VgtaFwUiZ_GtGvwcHjLHbsA>
 <xme:VS13Y_r4jfw39phFJJ-PH7tYMKPzxTmWDc4K7Jp6p4eNV4mEqNQFUtY8zxzAHQ-U2
 k39eZB-6blJwPgRzho>
X-ME-Received: <xmr:VS13Y6P2-1-6nzXfeUO_AXOWNO8IuzleNcf6B2hfMUoVC3TyXN5X7L5xjUsD498sHnbxBtL8CW-vFcoLKYgjAffVdLX4Vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeelgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:VS13Y47hBTvN8gHzPYMtdu0LWmbHdiwIIlOhAz9QxAalfvn3acrDag>
 <xmx:VS13Y85hUrk-KpmfO9NIhVVzcSLZCm2iZ_80Bb9jhgbqdKJK0LnFjw>
 <xmx:VS13YwhVwTrq6IiHA7fISKlRsYcnjSmvXsjYOnhCzwqB-mpKZJdtQw>
 <xmx:Vi13Y8i59jN3naGkGmM67_-7l9XomxvOoDobjMr9yVacHe6pUA730Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Nov 2022 01:59:31 -0500 (EST)
Date: Fri, 18 Nov 2022 07:59:29 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Keith Busch <kbusch@kernel.org>, Corey Minyard <cminyard@mvista.com>,
 Peter Delevoryas <peter@pjd.dev>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH maybe-7.2 1/3] hw/i2c: only schedule pending master when
 bus is idle
Message-ID: <Y3ctUbaowmewOQuc@cormorant.local>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-2-its@irrelevant.dk>
 <8dd9ed34-93c3-0638-e152-f619f9e097e6@kaod.org>
 <Y3XXcWUnntBrIXq+@cormorant.local>
 <6bfe7b2e-2e4f-c286-530a-b0342f9107a0@kaod.org>
 <Y3Xktt8b85RvJ89A@cormorant.local>
 <465b2d2e-5958-d63f-02dc-cf96dd1d459e@kaod.org>
 <Y3YiAhXX1FKuYMoc@cormorant.local>
 <15100caa-4c03-a166-7ce3-fe1d30471a30@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JKoW8XXF55sI3fLG"
Content-Disposition: inline
In-Reply-To: <15100caa-4c03-a166-7ce3-fe1d30471a30@kaod.org>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--JKoW8XXF55sI3fLG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17 14:40, C=C3=A9dric Le Goater wrote:
> On 11/17/22 12:58, Klaus Jensen wrote:
> > On Nov 17 09:01, C=C3=A9dric Le Goater wrote:
> > > On 11/17/22 08:37, Klaus Jensen wrote:
> > > > On Nov 17 07:56, C=C3=A9dric Le Goater wrote:
> > > > > On 11/17/22 07:40, Klaus Jensen wrote:
> > > > > > On Nov 16 16:58, C=C3=A9dric Le Goater wrote:
> > > > > > > On 11/16/22 09:43, Klaus Jensen wrote:
> > > > > > > > From: Klaus Jensen <k.jensen@samsung.com>
> > > > > > > >=20
> > > > > > > > It is not given that the current master will release the bu=
s after a
> > > > > > > > transfer ends. Only schedule a pending master if the bus is=
 idle.
> > > > > > > >=20
> > > > > > > > Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
> > > > > > > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > > > > > > > ---
> > > > > > > >      hw/i2c/aspeed_i2c.c  |  2 ++
> > > > > > > >      hw/i2c/core.c        | 37 ++++++++++++++++++++++------=
---------
> > > > > > > >      include/hw/i2c/i2c.h |  2 ++
> > > > > > > >      3 files changed, 26 insertions(+), 15 deletions(-)
> > > > > > > >=20
> > > > > > > > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > > > > > > > index c166fd20fa11..1f071a3811f7 100644
> > > > > > > > --- a/hw/i2c/aspeed_i2c.c
> > > > > > > > +++ b/hw/i2c/aspeed_i2c.c
> > > > > > > > @@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(A=
speedI2CBus *bus, uint64_t value)
> > > > > > > >              }
> > > > > > > >              SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_=
STOP_CMD, 0);
> > > > > > > >              aspeed_i2c_set_state(bus, I2CD_IDLE);
> > > > > > > > +
> > > > > > > > +        i2c_schedule_pending_master(bus->bus);
> > > > > > >=20
> > > > > > > Shouldn't it be i2c_bus_release() ?
> > > > > > >=20
> > > > > >=20
> > > > > > The reason for having both i2c_bus_release() and
> > > > > > i2c_schedule_pending_master() is that i2c_bus_release() sort of=
 pairs
> > > > > > with i2c_bus_master(). They either set or clear the bus->bh mem=
ber.
> > > > > >=20
> > > > > > In the current design, the controller (in this case the Aspeed =
I2C) is
> > > > > > an "implicit" master (it does not have a bottom half driving it=
), so
> > > > > > there is no bus->bh to clear.
> > > > > >=20
> > > > > > I should (and will) write some documentation on the asynchronou=
s API.
> > > > >=20
> > > > > I found the routine names confusing. Thanks for the clarification.
> > > > >=20
> > > > > Maybe we could do this rename  :
> > > > >=20
> > > > >     i2c_bus_release()             -> i2c_bus_release_and_clear()
> > > > >     i2c_schedule_pending_master() -> i2c_bus_release()
> > > > >=20
> > > > > and keep i2c_schedule_pending_master() internal the I2C core subs=
ystem.
> > > > >=20
> > > >=20
> > > > How about renaming i2c_bus_master to i2c_bus_acquire() such that it
> > > > pairs with i2c_bus_release().
> > >=20
> > > Looks good to me.
> > >=20
> > > > And then add an i2c_bus_yield() to be used by the controller? I thi=
nk we
> > > > should be able to assert in i2c_bus_yield() that bus->bh is NULL. B=
ut
> > > > I'll take a closer look at that.
> > >=20
> > > I am using your i2c-echo slave device to track regressions in the Asp=
eed
> > > machines. May be we could merge it for tests ?
> > >=20
> >=20
> > Oh, cool.
> >=20
> > Sure, I'd be happy to help "maintain" it ;)
>=20
> And so, I am seeing errors with the little POC you sent.
>=20
> without:
>   console: echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device
>   console: # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_dev=
ice
>   console: [    4.252431] i2c i2c-3: new_device: Instantiated device slav=
e-24c02 at 0x64
>   console: i2cset -y 3 0x42 0x64 0x00 0xaa i
>   /console: # i2cset -y 3 0x42 0x64 0x00 0xaa i
>   console: # hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom
>   console: 0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
>   console: poweroff
>   console: 0000010 ffff ffff ffff ffff ffff ffff ffff ffff
>   console: *
>   console: 0000100
>=20
> with:
>   console: echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device
>   console: # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_dev=
ice
>   console: [    4.413210] i2c i2c-3: new_device: Instantiated device slav=
e-24c02 at 0x64
>   console: i2cset -y 3 0x42 0x64 0x00 0xaa i
>   console: # i2cset -y 3 0x42 0x64 0x00 0xaa i
>   console: # hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom
>   console: 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
>   console: *
>   console: 0000100
> C.

Interesting,

I'll check it out.

--JKoW8XXF55sI3fLG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmN3LVAACgkQTeGvMW1P
Del8XQf/dj8z2GjqEoRl6jvoylakl2FiY2HqBrfqJb82piBuK4LwJjQnY37uFZ+j
aX92GiHjOFdC6rVYo5Hf0AOg3/j09o6G3tWtElaQwiFMALyguUzy0NOrc/iYln3K
0TOJCLT7RGA9TuR5qR2CK7zAMryREYZhNjDf6rpeJjFW8n/m39O4Lw97X/B18+xV
xDZfsj5GST2+kqnBZiXFR+eugEevqvTN04xJi2qAEcFK5o8vkTdtGlqZabpOrV0t
1y3auwoNNb5Fl8iNR8F6M+XzbTP3ZkYcgLEu74tToq0APdD4Rn6Dz13BEEFiLzu8
V1tQX8zcXQJn1NMZZbociADhyyYgbw==
=pfee
-----END PGP SIGNATURE-----

--JKoW8XXF55sI3fLG--

