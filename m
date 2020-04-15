Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC1B1A943E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 09:29:08 +0200 (CEST)
Received: from localhost ([::1]:45052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOcTr-00088U-Ic
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 03:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47337)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOcT4-0007Ql-Fp
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:28:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOcT3-0005EL-Is
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:28:18 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47796)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOcT1-0005DH-Ev; Wed, 15 Apr 2020 03:28:15 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 18BA7BF603;
 Wed, 15 Apr 2020 07:28:14 +0000 (UTC)
Date: Wed, 15 Apr 2020 09:28:10 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v7 12/48] nvme: add temperature threshold feature
Message-ID: <20200415072810.2tszvrv3lo3ypue2@apples.localdomain>
References: <20200415055140.466900-1-its@irrelevant.dk>
 <20200415055140.466900-13-its@irrelevant.dk>
 <0ab46987-8026-c059-1470-6cac2e6cbcbb@redhat.com>
 <20200415072453.cs4urfwreedqlmbl@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200415072453.cs4urfwreedqlmbl@apples.localdomain>
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
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apr 15 09:24, Klaus Birkelund Jensen wrote:
> On Apr 15 09:19, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 4/15/20 7:51 AM, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > >=20
> > > It might seem wierd to implement this feature for an emulated devic=
e,
> >=20
> > 'weird'
>=20
> Thanks, fixed :)
>=20
> >=20
> > > but it is mandatory to support and the feature is useful for testin=
g
> > > asynchronous event request support, which will be added in a later
> > > patch.
> >=20
> > Which patch? I can't find how you set the temperature in this series.
> >=20
>=20
> The temperature cannot be changed, but the thresholds can with the Set
> Features command (and that can then trigger AERs). That is added in
> "nvme: add temperature threshold feature" and "nvme: add support for th=
e
> asynchronous event request command" respectively.
>=20
> There is a test in SPDK that does this.
>=20

Oh, I think I misunderstood you.

No, setting the temperature was moved to the "nvme: add support for the
get log page command" patch since that is the patch that actually uses
it. This was on request by Maxim in an earlier review.

