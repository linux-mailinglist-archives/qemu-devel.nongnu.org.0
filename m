Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEBAF35BB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 18:31:02 +0100 (CET)
Received: from localhost ([::1]:46430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSlca-00064t-V6
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 12:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52161)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iSlbF-0005WM-JM
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:29:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iSlbE-00006j-C2
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:29:37 -0500
Received: from 7.mo68.mail-out.ovh.net ([46.105.63.230]:40897)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iSlbE-00006D-6d
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:29:36 -0500
Received: from player762.ha.ovh.net (unknown [10.109.143.225])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id A052D1454A6
 for <qemu-devel@nongnu.org>; Thu,  7 Nov 2019 18:29:33 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player762.ha.ovh.net (Postfix) with ESMTPSA id 98129BE210BC;
 Thu,  7 Nov 2019 17:29:19 +0000 (UTC)
Subject: Re: [PATCH 2/5] ipmi: Add support to customize OEM functions
To: cminyard@mvista.com
References: <20191021131215.3693-1-clg@kaod.org>
 <20191021131215.3693-3-clg@kaod.org> <20191021143017.GH25427@t560>
 <20191027174739.GN3552@umbus.metropole.lan>
 <20191027183347.GC2461@minyard.net> <20191107170025.GD2461@umbus.Home>
 <156e5bd5-726c-2db5-4b24-394d5ec0f268@kaod.org>
 <20191107172532.GH10313@minyard.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fd097ebe-c50c-63c9-4f02-8a78863a759f@kaod.org>
Date: Thu, 7 Nov 2019 18:29:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191107172532.GH10313@minyard.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 6088022275282930643
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudduledguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.63.230
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
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Joel Stanley <joel@jms.id.au>, "Marty E . Plummer" <hanetzer@startmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/11/2019 18:25, Corey Minyard wrote:
> On Thu, Nov 07, 2019 at 06:14:58PM +0100, C=C3=A9dric Le Goater wrote:
>>>>> What's the plan for merging this, once it's ready?  Is there an IPM=
I
>>>>> tree for it to be staged in?  If not I could take it through the pp=
c
>>>>> tree, but I'd need some Acked-bys in that case.
>>>>
>>>> I have an IPMI tree for this.  I was assuming it was going in to the=
 PPC
>>>> tree, but it's not big deal.
>>>
>>> I'd be more comfortable if the generic ipmi changes went through the
>>> ipmi tree. =20
>>
>> Here is the patch :
>>
>> 	http://patchwork.ozlabs.org/patch/1185187/
>=20
> Ok, I have this in my tree.
>=20
> I assume there is nothing like the linux-next tree for qemu, right?

no. These IPMI OEM commands are handled by the OPAL firmware only.

C.=20


