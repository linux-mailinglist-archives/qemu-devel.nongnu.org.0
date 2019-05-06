Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B811496E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 14:18:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNca5-0004wX-Bs
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 08:18:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hNcYn-0004Z9-GJ
	for qemu-devel@nongnu.org; Mon, 06 May 2019 08:17:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hNcYm-0002Gv-Ju
	for qemu-devel@nongnu.org; Mon, 06 May 2019 08:17:33 -0400
Received: from 10.mo3.mail-out.ovh.net ([87.98.165.232]:49473)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hNcYm-0002AG-Ek
	for qemu-devel@nongnu.org; Mon, 06 May 2019 08:17:32 -0400
Received: from player729.ha.ovh.net (unknown [10.108.35.90])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id BB03E20A049
	for <qemu-devel@nongnu.org>; Mon,  6 May 2019 14:17:22 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player729.ha.ovh.net (Postfix) with ESMTPSA id 66B9559A73EE;
	Mon,  6 May 2019 12:17:17 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20190430044036.1144-1-joel@jms.id.au>
	<CAFEAcA9qyzHiEY-OudwBUDzCia-jSQ7CkY_L7oC0t4Nu_665uA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d5f88bee-1873-d985-b926-17c159464e53@kaod.org>
Date: Mon, 6 May 2019 14:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9qyzHiEY-OudwBUDzCia-jSQ7CkY_L7oC0t4Nu_665uA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 2725240725283769152
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrjeejgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.165.232
Subject: Re: [Qemu-devel] [PATCH v3 0/2] arm: aspeed: Add RTC Model
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/19 3:36 PM, Peter Maydell wrote:
> On Tue, 30 Apr 2019 at 05:40, Joel Stanley <joel@jms.id.au> wrote:
>>
>> v3: Add some commit messages, resend as v2 didn't send properly
>> v2: Minor fixes, added vmstate and reset, and rebased on C=C3=A9dric's=
 series
>>
>> Based-on: 20190411161013.4514-4-clg@kaod.org
>> [PATCH 3/3] aspeed: use sysbus_init_child_obj() to initialize children
>>
>> A model for the ASPEED BMC real time clock (RTC). The model is suffici=
ent
>> for running the guest Linux kernel driver, and ticks in time with the
>> host when programmed.
>>
>> It does not implement the alarm functionality, which includes the
>> interrupt.
>=20
> Hi -- I've reviewed this series, but can't apply it yet as
> it's based on Cedric's patchset which needs a respin. If
> I forget to apply this when I apply the respin of that one,
> please ping me...

I will work on a fix ASAP.

Thanks,

C.

