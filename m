Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFBEFDE43
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 13:48:38 +0100 (CET)
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVb1h-0004dS-6k
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 07:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iVazC-0003FJ-GN
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:46:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iVazB-0000pB-AM
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:46:02 -0500
Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149]:51792)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iVazB-0000ob-4X
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 07:46:01 -0500
Received: from player770.ha.ovh.net (unknown [10.108.54.59])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 772381B078D
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 13:45:58 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player770.ha.ovh.net (Postfix) with ESMTPSA id 709ACC28F3EF;
 Fri, 15 Nov 2019 12:45:54 +0000 (UTC)
Date: Fri, 15 Nov 2019 13:45:52 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH for-5.0 7/8] ppc/pnv: Link "chip" property to
 PnvCore::chip pointer
Message-ID: <20191115134552.4c40155c@bahia.lan>
In-Reply-To: <35f82bf2-3557-2d0c-5915-7f2b4b977fbe@kaod.org>
References: <157381880498.136087.3775284829737989585.stgit@bahia.lan>
 <157381884403.136087.1106071650789146002.stgit@bahia.lan>
 <35f82bf2-3557-2d0c-5915-7f2b4b977fbe@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 11386788710819469707
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudefhedggeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejtddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.53.149
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

On Fri, 15 Nov 2019 13:24:50 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> > diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
> > index 55eee95104da..fce6d8d9b31b 100644
> > --- a/include/hw/ppc/pnv_core.h
> > +++ b/include/hw/ppc/pnv_core.h
> > @@ -36,11 +36,11 @@ typedef struct PnvChip PnvChip;
> >  typedef struct PnvCore {
> >      /*< private >*/
> >      CPUCore parent_obj;
> > +    PnvChip *chip;
> > =20
> >      /*< public >*/
> >      PowerPCCPU **threads;
> >      uint32_t pir;
> > -    PnvChip *chip;
> > =20
> >      MemoryRegion xscom_regs;
> >  } PnvCore;
> >=20
>=20
>=20
> Why this change ?=20
>=20

Because PnvCore::chip is an PnvCore internal that shouldn't be
used outside pnv_core.c IMHO.

> C.


