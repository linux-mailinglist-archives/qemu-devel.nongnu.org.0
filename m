Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9831A9431
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 09:25:52 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOcQh-0004r8-DH
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 03:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOcPt-0004N8-EZ
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:25:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOcPs-0003np-IF
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:25:01 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47770)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOcPq-0003mu-KO; Wed, 15 Apr 2020 03:24:58 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 00DCCBF603;
 Wed, 15 Apr 2020 07:24:56 +0000 (UTC)
Date: Wed, 15 Apr 2020 09:24:53 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v7 12/48] nvme: add temperature threshold feature
Message-ID: <20200415072453.cs4urfwreedqlmbl@apples.localdomain>
References: <20200415055140.466900-1-its@irrelevant.dk>
 <20200415055140.466900-13-its@irrelevant.dk>
 <0ab46987-8026-c059-1470-6cac2e6cbcbb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0ab46987-8026-c059-1470-6cac2e6cbcbb@redhat.com>
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

On Apr 15 09:19, Philippe Mathieu-Daud=C3=A9 wrote:
> On 4/15/20 7:51 AM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > It might seem wierd to implement this feature for an emulated device,
>=20
> 'weird'

Thanks, fixed :)

>=20
> > but it is mandatory to support and the feature is useful for testing
> > asynchronous event request support, which will be added in a later
> > patch.
>=20
> Which patch? I can't find how you set the temperature in this series.
>=20

The temperature cannot be changed, but the thresholds can with the Set
Features command (and that can then trigger AERs). That is added in
"nvme: add temperature threshold feature" and "nvme: add support for the
asynchronous event request command" respectively.

There is a test in SPDK that does this.


