Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7371A9B99
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 13:01:07 +0200 (CEST)
Received: from localhost ([::1]:48000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOfn0-0007aR-9y
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 07:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOflm-0006cb-RV
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:59:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOfll-0006df-Up
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:59:50 -0400
Received: from charlie.dont.surf ([128.199.63.193]:48326)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOflk-0006bp-2O; Wed, 15 Apr 2020 06:59:48 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 53851BF7AF;
 Wed, 15 Apr 2020 10:59:46 +0000 (UTC)
Date: Wed, 15 Apr 2020 12:59:42 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 13/16] nvme: factor out namespace setup
Message-ID: <20200415105942.aolfoyjykut3ehy3@apples.localdomain>
References: <20200415102445.564803-1-its@irrelevant.dk>
 <20200415102445.564803-14-its@irrelevant.dk>
 <1f57886a-8645-eeda-f482-4353b423c80f@redhat.com>
 <20200415105322.iuirj5sphp7i5whu@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200415105322.iuirj5sphp7i5whu@apples.localdomain>
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

On Apr 15 12:53, Klaus Birkelund Jensen wrote:
> On Apr 15 12:38, Philippe Mathieu-Daud=C3=A9 wrote:
> >=20
> > I'm not sure this line belong to this patch.
> >=20
> =20
> It does. It is already there in the middle of the realize function. It
> is moved to nvme_init_namespace as
>=20
>   n->ns_size =3D bs_size;
>=20
> since only a single namespace can be configured anyway. I will remove
> the for-loop that initializes multiple namespaces as well.

I'm gonna backtrack on that. Removing that for loop is just noise I
think.

