Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E8FE0D14
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 22:08:58 +0200 (CEST)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iN0Se-0001SI-LT
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 16:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iN0Ri-0000wd-0F
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 16:07:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iN0Rf-0006QO-Ve
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 16:07:57 -0400
Received: from 10.mo179.mail-out.ovh.net ([46.105.79.46]:59431)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iN0Rf-0006Pg-Gu
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 16:07:55 -0400
Received: from player763.ha.ovh.net (unknown [10.108.54.87])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 247B9145D43
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 22:07:52 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player763.ha.ovh.net (Postfix) with ESMTPSA id 41CD4B4822EC;
 Tue, 22 Oct 2019 20:07:46 +0000 (UTC)
Subject: Re: [PATCH] aspeed: Add an AST2600 eval board
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191016090745.15334-1-clg@kaod.org>
 <CACPK8XdT0_JCxzfxd4dCafK0Ae9+18ZWcusuXV+d4eEmwwBnkA@mail.gmail.com>
 <CAFEAcA_6yxaanT2N6Twos_FxjJNgvVKShwgq=pR4fqmcZUsQFA@mail.gmail.com>
 <CAFEAcA8py1obBXc1o02wTRkXms9NwCnCT6Q9ZZ-4W=NzNocLrQ@mail.gmail.com>
 <a0b2779c-bcd5-0fe9-ff3f-d4254aba8805@kaod.org>
 <CAFEAcA9nymSxBkEm8GcJm9p4Y_obmK-fbojFEi+Et52H-mPFdA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5da3ef50-cf48-b5fd-f343-abac72774842@kaod.org>
Date: Tue, 22 Oct 2019 22:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9nymSxBkEm8GcJm9p4Y_obmK-fbojFEi+Et52H-mPFdA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7032370818775157568
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgddugeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.79.46
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/10/2019 19:20, Peter Maydell wrote:
> On Tue, 22 Oct 2019 at 18:16, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>> Is it time for me to install an OSX system for dev and tests or is the=
re
>> a way to reproduce the issue ? no errors spotted in valgrind.
>=20
> I dunno. You could have a look to see if you can repro
> it with the travis builds. I would investigate but I
> don't have time this week given impending softfreeze
> and KVM Forum next week.

Sure. I will reinstall a Mac I have under OSX.

C.=20

