Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF964FDE49
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 13:50:27 +0100 (CET)
Received: from localhost ([::1]:38484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVb3S-0007CF-SP
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 07:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iVazZ-0003ci-Qu
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:46:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iVazX-0000uw-Sw
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:46:24 -0500
Received: from 19.mo4.mail-out.ovh.net ([87.98.179.66]:50801)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iVazX-0000uL-Mb
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:46:23 -0500
Received: from player771.ha.ovh.net (unknown [10.108.57.150])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id D29FC20C748
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 13:46:21 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player771.ha.ovh.net (Postfix) with ESMTPSA id 9E0B8C278B09;
 Fri, 15 Nov 2019 12:46:17 +0000 (UTC)
Date: Fri, 15 Nov 2019 13:46:16 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-5.0 8/8] ppc/pnv: Link "chip" property to
 PnvXive::chip pointer
Message-ID: <20191115134616.41a6eaca@bahia.lan>
In-Reply-To: <d13e444c-78b0-bb7b-09db-088f63fcfbe9@kaod.org>
References: <157381880498.136087.3775284829737989585.stgit@bahia.lan>
 <157381884958.136087.2386559512465741955.stgit@bahia.lan>
 <d13e444c-78b0-bb7b-09db-088f63fcfbe9@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 11393262634346191243
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudefhedggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejuddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.179.66
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

On Fri, 15 Nov 2019 13:25:01 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> > diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> > index 5ecd3ba6ed24..d82484ecf669 100644
> > --- a/include/hw/ppc/pnv.h
> > +++ b/include/hw/ppc/pnv.h
> > @@ -87,9 +87,9 @@ typedef struct Pnv8Chip {
> >  typedef struct Pnv9Chip {
> >      /*< private >*/
> >      PnvChip      parent_obj;
> > +    PnvXive      xive;
> > =20
> >      /*< public >*/
> > -    PnvXive      xive;
> >      Pnv9Psi      psi;
> >      PnvLpcController lpc;
> >      PnvOCC       occ;
> >=20
>=20
> Why this change ?=20
>=20

Same reason as in patch 7/8.

> C.


