Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281711A950C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 09:47:36 +0200 (CEST)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOclj-0002Ni-8T
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 03:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOckd-0001ih-Gt
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:46:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOckc-0006Ov-HZ
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:46:27 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47830)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOcka-0006OA-ET; Wed, 15 Apr 2020 03:46:24 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 66845BF603;
 Wed, 15 Apr 2020 07:46:22 +0000 (UTC)
Date: Wed, 15 Apr 2020 09:46:19 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v7 06/48] nvme: refactor nvme_addr_read
Message-ID: <20200415074619.4ggqdelx3zgaos5v@apples.localdomain>
References: <20200415055140.466900-1-its@irrelevant.dk>
 <20200415055140.466900-7-its@irrelevant.dk>
 <08ae8e87-1bfc-85a2-edac-f704fed4fb3b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08ae8e87-1bfc-85a2-edac-f704fed4fb3b@redhat.com>
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

On Apr 15 09:03, Philippe Mathieu-Daud=C3=A9 wrote:
> On 4/15/20 7:50 AM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Pull the controller memory buffer check to its own function. The chec=
k
> > will be used on its own in later patches.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Acked-by: Keith Busch <kbusch@kernel.org>
> > ---
> >   hw/block/nvme.c | 16 ++++++++++++----
> >   1 file changed, 12 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 622103c42d0a..02d3dde90842 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -52,14 +52,22 @@
> >   static void nvme_process_sq(void *opaque);
> > +static inline bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
>=20
> 'inline' not really necessary here.
>=20

Fixed.


