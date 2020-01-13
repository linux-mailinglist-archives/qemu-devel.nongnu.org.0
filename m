Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A22138C77
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 08:46:03 +0100 (CET)
Received: from localhost ([::1]:46760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iquQD-0004ib-TQ
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 02:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53287)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iquPB-0004B1-1A
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 02:44:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iquP9-0002Ug-Iw
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 02:44:56 -0500
Received: from 16.mo5.mail-out.ovh.net ([87.98.174.144]:35226)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iquP9-0002PV-DK
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 02:44:55 -0500
Received: from player729.ha.ovh.net (unknown [10.109.146.132])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 21F60266A16
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 08:44:51 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player729.ha.ovh.net (Postfix) with ESMTPSA id 005A1E45ECCB;
 Mon, 13 Jan 2020 07:44:44 +0000 (UTC)
Subject: Re: [PATCH 0/5] aspeed: extensions and fixes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200107073423.30043-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c059d9c9-a04b-a7ce-7738-62ee88f23463@kaod.org>
Date: Mon, 13 Jan 2020 08:44:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107073423.30043-1-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2302183835244858147
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledguddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.174.144
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/20 8:34 AM, C=C3=A9dric Le Goater wrote:
> Hi,
>=20
> Here is a short series adding :
>=20
>  - a new eMMC controller model for the AST2600 SoC (Andrew)
>  - accessors to control the led state of the pca9552 device (Joel)
>  - a 'execute-in-place' property to boot directly from CE0

There is a naming issue with the eMMC model. I will let Andrew resend.
We can drop this patchset for now.

Thanks,

C.

