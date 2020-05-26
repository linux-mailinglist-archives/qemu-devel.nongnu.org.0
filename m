Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E891A961B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 10:20:10 +0200 (CEST)
Received: from localhost ([::1]:45850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOdHF-0008Q3-DQ
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 04:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55193)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOdFx-0005pV-WF
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 04:18:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOdFx-0003Gz-0c
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 04:18:49 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOdFu-0003EY-Sh; Wed, 15 Apr 2020 04:18:47 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id D28A9BF603;
 Wed, 15 Apr 2020 08:18:44 +0000 (UTC)
Date: Wed, 15 Apr 2020 10:18:41 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v7 11/48] nvme: refactor device realization
Message-ID: <20200415081841.c3uvtrzppqc7ejan@apples.localdomain>
References: <20200415055140.466900-1-its@irrelevant.dk>
 <20200415055140.466900-12-its@irrelevant.dk>
 <e79da783-872a-4cda-a33e-4ba795fb4a59@redhat.com>
 <20200415072555.pvrircyuy2t4y3fj@apples.localdomain>
 <aa44ad63-34a4-7c07-c2a0-3612883738a6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aa44ad63-34a4-7c07-c2a0-3612883738a6@redhat.com>
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apr 15 09:55, Philippe Mathieu-Daud=C3=A9 wrote:
> On 4/15/20 9:25 AM, Klaus Birkelund Jensen wrote:
> > On Apr 15 09:14, Philippe Mathieu-Daud=C3=A9 wrote:
> > > Hi Klaus,
> > >=20
> > > This patch is a pain to review... Could you split it? I'd use one t=
rivial
> > > patch for each function extracted from nvme_realize().
> > >=20
> >=20
> > Understood, I will split it up!
>=20
> Thanks, that will help the review.
>=20
> As this series is quite big, I recommend you to split it, so part of it=
 can
> get merged quicker and you don't have to carry tons of patches that sca=
re
> reviewers/maintainers.
>=20
> Suggestions:
>=20
> - 1: cleanups/refactors
> - 2: support v1.3
> - 3: more refactors, strengthening code
> - 4: improve DMA & S/G
> - 5: support for multiple NS
> - 6: tests for multiple NS feature
> - 7: tests bus unplug/replug (idea)
>=20
> Or less :)
>=20

Okay, good idea. Thanks.

