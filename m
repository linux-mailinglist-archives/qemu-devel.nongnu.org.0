Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B6411B63B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 17:00:10 +0100 (CET)
Received: from localhost ([::1]:44986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if4PI-0005nM-OS
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 11:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60170)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1if4O1-0004vQ-N8
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 10:58:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1if4O0-0004Ex-GL
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 10:58:49 -0500
Received: from 9.mo68.mail-out.ovh.net ([46.105.78.111]:43349)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1if4O0-0004C8-8d
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 10:58:48 -0500
Received: from player696.ha.ovh.net (unknown [10.108.1.121])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id C440714D14E
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 16:58:45 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player696.ha.ovh.net (Postfix) with ESMTPSA id BA5DAD3C227F;
 Wed, 11 Dec 2019 15:58:38 +0000 (UTC)
Date: Wed, 11 Dec 2019 16:58:37 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] ppc/pnv: Make PnvXScomInterface an incomplete type
Message-ID: <20191211165837.35375bd9@bahia.tlslab.ibm.com>
In-Reply-To: <c66981b1-0be1-6f59-8dd7-5f4744c506e1@kaod.org>
References: <157607473444.179018.14127987124523137347.stgit@bahia.lan>
 <c66981b1-0be1-6f59-8dd7-5f4744c506e1@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 1311954866988095883
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelhedgjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeliedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.78.111
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Dec 2019 16:35:41 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 11/12/2019 15:32, Greg Kurz wrote:
> > PnvXScomInterface is an interface instance. It should never be
> > dereferenced. Drop the dummy type definition for extra safety,
> > which is the common practice with QOM interfaces.
> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  include/hw/ppc/pnv_xscom.h |    4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >=20
> > diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> > index 1c1d76bf9be5..b738011ab205 100644
> > --- a/include/hw/ppc/pnv_xscom.h
> > +++ b/include/hw/ppc/pnv_xscom.h
> > @@ -22,9 +22,7 @@
> > =20
> >  #include "qom/object.h"
> > =20
> > -typedef struct PnvXScomInterface {
> > -    Object parent;
> > -} PnvXScomInterface;
> > +typedef struct PnvXScomInterface PnvXScomInterface;
> > =20
> >  #define TYPE_PNV_XSCOM_INTERFACE "pnv-xscom-interface"
> >  #define PNV_XSCOM_INTERFACE(obj) \
>=20
> We should use INTERFACE_CHECK() here.
>=20

Heh you're right, I missed that :) I'll send a v2 right away.

> C.
>=20
> =20
>=20


