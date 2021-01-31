Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA717309F68
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 00:16:35 +0100 (CET)
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6LxK-0000Rg-Dq
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 18:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1l6Lvk-00088c-I8; Sun, 31 Jan 2021 18:14:56 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:47845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1l6Lvi-0007Yu-5Z; Sun, 31 Jan 2021 18:14:56 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 691323D1;
 Sun, 31 Jan 2021 18:14:50 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 31 Jan 2021 18:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=QL2wV
 oywdKCdzr/sz6Hzg82zJRnzT/ofcvjVKrp0RTk=; b=JtX7yMesNigkPm5ib7Sz2
 XJleUxFkcD19jr4oiUYwGQwAO/AhjJAwSswp+JD9WWDUPSC4Q9/jDDChoZ50kk5Y
 DyfbJgx1RsbjOxXEjcg/OxdXEood/Japi0RFVwo1euQPocO/r8zW9Mb7GiDWquJN
 lkXY3H04HaE5tI6axOfkaPgUdjrHaoNtphh8hd9UKnuRji/nUWHBjsAbzeLQCVe3
 YHIfu2d5X8GHLPDJsvBsmfsfogxtLRSElh8+9KsmGHoG9WOx/wIgZhAWzb/zVJkF
 6ff85EC6faTF/2yUsNO9jsrbPtHJxUfxJeK3Ss8LGy9sXg24jj2hfNthEOgNmp0s
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=QL2wVoywdKCdzr/sz6Hzg82zJRnzT/ofcvjVKrp0R
 Tk=; b=UY6OitF0Q8+7NuY90pSpWZRIKORPYzThU3RisBMlVFgMQ9fEXgDiLbWZV
 UKOvQfxizpVv91Xz5Sx1GYSae3bX8VDUkqULnVXrOkNNA067A0l1fwvdGlHsLhXz
 kH+SisnMTI7ZyOJlPcZCLoLgThEGdj5i6ZkW1YKqvcJetASTBbGzgxRqviXx1+xn
 CRYacsqsXNwZX8doA3R2psbni+O7pQayqd77S/RR1WfTB3tQpz268dk3Yef8LSaX
 A+C7uJ9a/1FOIyrAwQIeJiRvxnQfB9Xz257P9No/gZw7q1GK/SprtplOvXbnsCiL
 hZO4SkT1P+9/+HD+bf/DYsYplH7HQ==
X-ME-Sender: <xms:6DkXYJ_uv42NIOa-M2IX5YwlHJyIgYKH1xT2POOMINo54epeLUpTYQ>
 <xme:6DkXYNuPpe8Yr8bM_RetdWNq-p0V1uYV0-vakf5s3mR94QFWvqjgzZTVHgM7lq3l4
 Xna07lwFtUqhruGew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephffgkefhudeghfejudfhtdfguedtfeehjeevteffgeduudetjeeijefh
 heffgfefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:6DkXYHBaAUjZszNRSevpgZAjKxjKVXUoQ4RogK4xK-N6ijhWf7oi9w>
 <xmx:6DkXYNeN96PSvzfRvx27v1pjSZOgk4d5Hj5LwUIj4H_EKkZjyUoxzg>
 <xmx:6DkXYONSTqqiPfqeTwB1K_KjKdP2ER9y1Gz2V6pmELLabN0NmdxHiA>
 <xmx:6jkXYLoE37lcSeag9qKLAtXfIulUyCyO9G28Cubo0ot7mKXpaHRhWw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7C91DA0005D; Sun, 31 Jan 2021 18:14:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-84-gfc141fe8b8-fm-20210125.001-gfc141fe8
Mime-Version: 1.0
Message-Id: <ebb9e6e3-f250-4b0e-89f7-2898460c34d4@www.fastmail.com>
In-Reply-To: <9cd3c937-90a7-5a5d-aefd-8f1d1fd4ff48@kaod.org>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-5-clg@kaod.org>
 <CACPK8Xfw-E8TetGdfDYpMZChFbY7cQNGLX8_xh390A-vanS--w@mail.gmail.com>
 <9ea1ce11-15ba-3eea-f7a4-b036a9db841f@kaod.org>
 <20210128224011.GB6951@yekko.fritz.box>
 <9cd3c937-90a7-5a5d-aefd-8f1d1fd4ff48@kaod.org>
Date: Mon, 01 Feb 2021 09:44:28 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "David Gibson" <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 4/7] ppc/pnv: Simplify pnv_bmc_create()
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.24; envelope-from=andrew@aj.id.au;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Cameron Esfahani via <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 29 Jan 2021, at 19:09, C=C3=A9dric Le Goater wrote:
> On 1/28/21 11:40 PM, David Gibson wrote:
> > On Thu, Jan 28, 2021 at 08:46:01AM +0100, C=C3=A9dric Le Goater wrot=
e:
> >> On 1/28/21 1:46 AM, Joel Stanley wrote:
> >>> On Tue, 26 Jan 2021 at 17:14, C=C3=A9dric Le Goater <clg@kaod.org>=
 wrote:
> >>>>
> >>>> and reuse pnv_bmc_set_pnor() to share the setting of the PNOR.
> >>>>
> >>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >>>> ---
> >>>>  hw/ppc/pnv_bmc.c | 7 +------
> >>>>  1 file changed, 1 insertion(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> >>>> index 67ebb16c4d5f..86d16b493539 100644
> >>>> --- a/hw/ppc/pnv_bmc.c
> >>>> +++ b/hw/ppc/pnv_bmc.c
> >>>> @@ -260,13 +260,8 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
> >>>>      Object *obj;
> >>>>
> >>>>      obj =3D object_new(TYPE_IPMI_BMC_SIMULATOR);
> >>>> -    object_ref(OBJECT(pnor));
> >>>> -    object_property_add_const_link(obj, "pnor", OBJECT(pnor));
> >>>
> >>> I assume it's ok to move the link set to after the realise of the =
BMC object?
> >> =20
> >>
> >> When 2 objects need to be linked, one has to be realized first.=20
> >> I suppose this is why it is allowed but I am not expert in that are=
a.=20
> >>
> >> Greg  ?
> >>
> >> That was the case already when defining a "ipmi-bmc-sim" device on =
the=20
> >> command line.
> >=20
> > Well, the other thing here is that the IPMI_BMC_SIMULATOR isn't a
> > POWER specific object, and doesn't actually know anything about pnor=
,
> > so it never looks at that property.  Do we even need it?
>=20
> It does through hiomap_cmd() which handles HIOMAP commands related=20
> to the PNOR. The link was introduced to remove a reference to the=20
> global machine (qdev_get_machine()). The PNOR device is instantiated=20=

> at the machine level but conceptually, this is incorrect.=20
>=20
> The PNOR is a device controlled by the BMC and accessed by the host=20=

> through a mapping on the LPC FW address space. It used to be controlle=
d=20
> from the host also, through the iLPC2AHB device and mboxes, but these=20=

> "doors" were closed sometime ago.

Right, so rehashing what C=C3=A9dric said about the context for the PNOR=
 and IPMI:

On PowerNV platforms, the host firmware accesses the data in the PNOR by=
=20
sending commands over IPMI to the BMC to change the mappings in the LPC =
FW=20
space. HIOMAP (Host I/O Map)[1] is the name of the little spec/protocol =
that=20
defines the layout of data in the FW space and the commands and ABI for=20=

manipulating the mappings.

[1] https://github.com/openbmc/hiomapd/blob/master/Documentation/protoco=
l.md

It's all terrible, but IPMI was the most well-trodden path I had at my d=
isposal=20
for improving the security of the (Aspeed) BMCs' hardware configuration =
for=20
Power platform designs. From BMC reset the host has unrestricted access =
to the=20
BMC's AHB via bridges on the LPC and PCIe buses until the BMC firmware d=
isables=20
them. Leaving the bridges enabled is not great for security or stability=
 of the=20
BMC firmware, so this meant cooking up some magic to allow the host to w=
rite=20
back to the PNOR (owned by the BMC as C=C3=A9dric mentions above) withou=
t exposing=20
the BMC in unacceptable ways.

Andrew

