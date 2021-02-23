Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA81322F26
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:55:29 +0100 (CET)
Received: from localhost ([::1]:56182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEay8-0001eo-T1
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lEawN-0008ST-OX
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:53:41 -0500
Received: from 4.mo51.mail-out.ovh.net ([188.165.42.229]:51976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lEawI-0000Za-CY
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:53:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 8AF83263B70;
 Tue, 23 Feb 2021 17:53:30 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 23 Feb
 2021 17:53:29 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002b5e4d627-de63-488d-a8f5-862f1e847b85,
 6F2917FB5EF69EFB637F8DE19110E4015BA123FD) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Tue, 23 Feb 2021 17:53:28 +0100
From: Greg Kurz <groug@kaod.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: Editing QEMU POWER Platform wiki page
Message-ID: <20210223175328.35685d15@bahia.lan>
In-Reply-To: <f800b5f2-f502-cdfc-777d-f353a71477e4@ilande.co.uk>
References: <91874f1e-4b14-5fb1-f1ae-1225938df759@linux.ibm.com>
 <20210222120138.31f313c9@bahia.lan>
 <3c3fc3f0-afb8-1012-eaf7-11ecbe146025@linux.ibm.com>
 <YDSJxzxjs3jJImEY@yekko.fritz.box>
 <20210223085910.6928135a@bahia.lan>
 <f800b5f2-f502-cdfc-777d-f353a71477e4@ilande.co.uk>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: dcf4e921-d1d6-4804-b7d6-caf180bcd197
X-Ovh-Tracer-Id: 3677470573108894057
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeehgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepteeffedvkeejkedvhfduudelheejgeegteeufefhheetgeejgffggedtteefveffnecuffhomhgrihhnpehqvghmuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=groug@kaod.org;
 helo=4.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU devel list <qemu-devel@nongnu.org>,
 Programmingkid <programmingkidx@gmail.com>,
 QEMU PPC devel list <qemu-ppc@nongnu.org>, Cedric Le
 Goater <clg@kaod.org>, lagarcia@br.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021 08:18:17 +0000
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:

> On 23/02/2021 07:59, Greg Kurz wrote:
>=20
> > On Tue, 23 Feb 2021 15:51:19 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >=20
> >> On Mon, Feb 22, 2021 at 06:18:08PM -0300, Leonardo Augusto Guimar=C3=
=A3es Garcia wrote:
> >>> On 2/22/21 8:01 AM, Greg Kurz wrote:
> >>>> On Thu, 18 Feb 2021 10:16:25 -0300
> >>>> Leonardo Augusto Guimar=C3=A3es Garcia <lagarcia@linux.ibm.com> wrot=
e:
> >>>>
> >>>>> Hi there,
> >>>>>
> >>>>> I would like to edit the wiki page at [0] as it contains some outda=
ted
> >>>>> information. Could anyone that has access to the wiki please help me
> >>>>> create a user so that I can edit it?
> >>>>>
> >>>>> 0. https://wiki.qemu.org/Documentation/Platforms/POWER
> >>>>>
> >>>> Hi Leo,
> >>>>
> >>>> User creation isn't publicly available to avoid spam : only an exist=
ing
> >>>> user can create a new account.
> >>>
> >>> Yeah, I saw that. That's why I asked here.
> >>
> >> The other concerns raised in this thread are valid, but those
> >> notwithstanding, I think it makes sense to let you update the Wiki if
> >> you have the time and inclination.
> >>
> >=20
> > Sure, but the point is that this incentive to update documentation
> > would be better used in the main QEMU documentation, i.e. the
> > docs/system/ppc/pseries.rst file in Cedric's "docs/system: Extend PPC
> > section" patch.
>=20
> Certainly in an ideal world it would make sense to have everything held i=
n the=20
> documentation, but in real life there are circumstances where having the =
wiki is useful.
>=20

Hi Mark,

I don't say wiki isn't useful, sorry if I wasn't clear.

The current content of the POWER wiki page is extremely out-dated
and would deserve a massive rewrite. Since we don't have any
documentation for the pseries platform (e.g. supported devices)
in the main documentation, I'm just suggesting to Leo to contribute
there and then we'll link to it from the wiki. This also has the
advantage of more reviewers and it will likely be better maintained.

Then, if someone is also willing to provide extra documentation or
examples or whatever, that's perfectly fine with me. Even recommended
if it comes along an incentive to maintain that documentation as
well ! :)

Cheers,

--
Greg


> I spend a lot of my time with people interested in emulating older machin=
es, and for=20
> these people who aren't particularly technical, the manual is far too com=
plicated:=20
> all they want is examples, and to know what works and what doesn't.
>=20
> There was a recent thread where I think Peter discussed removing the Quic=
kStart=20
> section from the documentation because it was out of date, and to me the =
wiki is a=20
> good replacement here - pretty much all of the content at=20
> https://wiki.qemu.org/Documentation/Platforms/PowerPC is user-generated. =
I also like=20
> the wiki organisation of Documentation/Platforms/FOO since it's easy to p=
oint people=20
> towards tips that will help them get started on IRC.
>=20
> Another example is the SPARC page that I maintain at=20
> https://wiki.qemu.org/Documentation/Platforms/SPARC which mainly came abo=
ut as people=20
> kept emailing me off-list to ask whether a particular OS will run under Q=
EMU, and=20
> would then follow up by asking me for examples because the QEMU command l=
ine is=20
> intimidating for new users.
>=20
>=20
> ATB,
>=20
> Mark.


