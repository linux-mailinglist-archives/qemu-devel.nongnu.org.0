Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D0AF1811
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 15:14:01 +0100 (CET)
Received: from localhost ([::1]:59272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSM4N-0005CB-RI
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 09:13:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55278)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iSM3Q-0004fX-RK
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:13:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iSM3P-0000BL-Jm
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:13:00 -0500
Received: from 9.mo173.mail-out.ovh.net ([46.105.72.44]:51315)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iSM3P-00009q-DB
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 09:12:59 -0500
Received: from player714.ha.ovh.net (unknown [10.109.159.68])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id BC4AD11CBD8
 for <qemu-devel@nongnu.org>; Wed,  6 Nov 2019 15:12:56 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: groug@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id 720D9BC12524;
 Wed,  6 Nov 2019 14:12:48 +0000 (UTC)
Date: Wed, 6 Nov 2019 15:12:46 +0100
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] numa: Add missing \n to error message
Message-ID: <20191106151246.2bf44314@bahia.lan>
In-Reply-To: <bb828956-28b3-9fe7-1d57-ceb723a32997@vivier.eu>
References: <157304440026.351774.14607704217028190097.stgit@bahia.lan>
 <bb828956-28b3-9fe7-1d57-ceb723a32997@vivier.eu>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 15341512132197063128
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddujedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdduleehrddvuddvrddvledrudeiieenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedugedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.72.44
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Nov 2019 14:01:01 +0100
Laurent Vivier <laurent@vivier.eu> wrote:

> Le 06/11/2019 =C3=A0 13:46, Greg Kurz a =C3=A9crit=C2=A0:
> > If memory allocation fails when using -mem-path, QEMU is supposed to pr=
int
> > out a message to indicate that fallback to anonymous RAM is deprecated.=
 This
> > is done with error_printf() which does output buffering. As a consequen=
ce,
> > the message is only printed at the next flush, eg. when quiting QEMU, a=
nd
> > it also lacks a trailing newline:
> >=20
> > qemu-system-ppc64: unable to map backing store for guest RAM: Cannot al=
locate memory
> > qemu-system-ppc64: warning: falling back to regular RAM allocation
> > QEMU 4.1.50 monitor - type 'help' for more information
> > (qemu) q
> > This is deprecated. Make sure that -mem-path  specified path has suffic=
ient resources to allocate -m specified RAM amountgreg@boss02:~/Work/qemu/q=
emu-spapr$
> >=20
> > Add the missing \n to fix both issues.
> >=20
> > Fixes: cb79224b7e4b "deprecate -mem-path fallback to anonymous RAM"
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  hw/core/numa.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/core/numa.c b/hw/core/numa.c
> > index 038c96d4abc6..e3332a984f7c 100644
> > --- a/hw/core/numa.c
> > +++ b/hw/core/numa.c
> > @@ -503,7 +503,7 @@ static void allocate_system_memory_nonnuma(MemoryRe=
gion *mr, Object *owner,
> >              warn_report("falling back to regular RAM allocation");
> >              error_printf("This is deprecated. Make sure that -mem-path=
 "
> >                           " specified path has sufficient resources to =
allocate"
> > -                         " -m specified RAM amount");
> > +                         " -m specified RAM amount\n");
> >              /* Legacy behavior: if allocation failed, fall back to
> >               * regular RAM allocation.
> >               */
> >=20
> >=20
>=20
> Why is this an error_printf() and not an error_report()?
>=20

Because CODING_STYLE suggests to do so I guess:

Reporting errors to the human user
----------------------------------

Do not use printf(), fprintf() or monitor_printf().  Instead, use
error_report() or error_vreport() from error-report.h.  This ensures the
error is reported in the right place (current monitor or stderr), and in
a uniform format.

Use error_printf() & friends to print additional information. <=3D=3D=3D

error_report() prints the current location.  In certain common cases
like command line parsing, the current location is tracked
automatically.  To manipulate it manually, use the loc_``*``() from
error-report.h.

> Thanks,
> Laurent
>=20


