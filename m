Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F48C201A9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 10:49:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRC4U-0008Ga-FL
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 04:49:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hRC2U-00075F-My
	for qemu-devel@nongnu.org; Thu, 16 May 2019 04:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hRBoR-00017f-3a
	for qemu-devel@nongnu.org; Thu, 16 May 2019 04:32:28 -0400
Received: from 3.mo178.mail-out.ovh.net ([46.105.44.197]:47298)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hRBoQ-00014P-Sq
	for qemu-devel@nongnu.org; Thu, 16 May 2019 04:32:27 -0400
Received: from player772.ha.ovh.net (unknown [10.108.42.83])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 75D2367F1D
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 10:32:23 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id E54C65CBC44F;
	Thu, 16 May 2019 08:32:16 +0000 (UTC)
Date: Thu, 16 May 2019 10:32:15 +0200
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Message-ID: <20190516103215.6ba7a70c@bahia.lan>
In-Reply-To: <3d7a99b9-5f31-e18d-5cd8-a20c4361efc2@kaod.org>
References: <155799221739.527449.14907564571096243745.stgit@bahia.lan>
	<20190516074551.GB25414@sathnaga86>
	<3d7a99b9-5f31-e18d-5cd8-a20c4361efc2@kaod.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 2312035460353726859
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddttddgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.44.197
Subject: Re: [Qemu-devel] [PATCH] spapr: Print out extra hints when CAS
 negotiation of interrupt mode fails
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
Cc: qemu-ppc@nongnu.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 May 2019 10:22:26 +0200
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 5/16/19 9:45 AM, Satheesh Rajendran wrote:
> > On Thu, May 16, 2019 at 09:36:57AM +0200, Greg Kurz wrote: =20
> >> Let's suggest to the user how the machine should be configured to allow
> >> the guest to boot successfully.
> >>
> >> Suggested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> >> Signed-off-by: Greg Kurz <groug@kaod.org>
> >> ---
> >>  hw/ppc/spapr_hcall.c |    4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-) =20
> >=20
> > Reviewed-and-Tested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com=
> =20
>=20
> you should use two different tags. I don't think patchwork understand
> compounds.
>=20
> C.=20
>=20

It doesn't indeed.

$ pwclient view 1100396 | grep Reviewed
$
=20
> > 2019-05-16T07:42:43.018771Z qemu-system-ppc64: Guest requested unavaila=
ble interrupt mode (XICS), either don't set the ic-mode machine property or=
 try ic-mode=3Dxics or ic-mode=3Ddual
> > 2019-05-16 07:42:43.394+0000: shutting down, reason=3Dcrashed
> >  =20
> >>
> >> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> >> index 63a55614b83d..aae9fd2b3e6d 100644
> >> --- a/hw/ppc/spapr_hcall.c
> >> +++ b/hw/ppc/spapr_hcall.c
> >> @@ -1646,12 +1646,12 @@ static target_ulong h_client_architecture_supp=
ort(PowerPCCPU *cpu,
> >>       */
> >>      if (guest_xive) {
> >>          if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_LEGACY) {
> >> -            error_report("Guest requested unavailable interrupt mode =
(XIVE)");
> >> +            error_report("Guest requested unavailable interrupt mode =
(XIVE), try the ic-mode=3Dxive or ic-mode=3Ddual machine property");
> >>              exit(EXIT_FAILURE);
> >>          }
> >>      } else {
> >>          if (spapr->irq->ov5 =3D=3D SPAPR_OV5_XIVE_EXPLOIT) {
> >> -            error_report("Guest requested unavailable interrupt mode =
(XICS)");
> >> +            error_report("Guest requested unavailable interrupt mode =
(XICS), either don't set the ic-mode machine property or try ic-mode=3Dxics=
 or ic-mode=3Ddual");
> >>              exit(EXIT_FAILURE);
> >>          }
> >>      }
> >> =20
> >  =20
>=20


