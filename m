Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5369D4ED7C2
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:28:40 +0200 (CEST)
Received: from localhost ([::1]:34610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZs2X-0000nl-Ey
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:28:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nZruS-0003Jv-L6
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:20:08 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:34321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nZruQ-0005vo-Al
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=kV6QpYllfU1KNAo7YsdCuDAiEbvEyTkPEITDeb1bC60=; b=SFGWelTYgL63BoAaMPmSVDau5X
 6vzNd52ldKDKpX1KOEpnQIJQwXm/fEbcji+rjuUgufQWMoDfuR9AgSs2KmWmhQM6xFwwyQDneRjZ4
 ZQZtZS9T9SGY8Pxl2a8GBhUUxJj/BbKZIvzQbGm9q43TXE1iIhczF8TixO66NeIM4IHgjIn7vZXgo
 s52dgCVVgZ5IPCYjUkrYSB298io5Wp5r5hzlrdOOd9WSyhqC2zOe+g7UxXQXzibtceHJPwJfQh6j2
 cMSpBdxf2gVoOcSlOwIDfFRfrcnoTnzjTEygowKJ8FnVlfUc+3ECVFzGUp7zMN3uqACTObOAyFPE/
 iJ5adV8Ng5imOHdB2W06haJEnjPnGpbvt3HCLyVPfEoBCkogyzAcJmnFarKW1c/+TuI42sQK1aCwE
 lPWYf7DXGgHOHd584h1Zr5nHnT1UW679LnEp/TyEhkCyo6OZ85Zzqn0VY+PJx2f2WW/2a6S0Awt6T
 30qn0ExuhFkJ6mfhkOPLncZ+duimTyxyQihud30ZRbWFliXn739xBwABOZOmkZqRs43rkmfNsZRPj
 d5YMRhPYfj1WdspwZAon1RxxRFcB2JI2iZaGy+bWOazpWl/wO/Ixlxgk6HY5F5nn1UQqZUaeViI2j
 jQywX4ms90yCbYxXb0gvHBM5OHxp6NWDkdKNLXlX8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?=
 <philippe.mathieu.daude@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Fabian Franz <fabianfranz.oss@gmail.com>, Greg Kurz <groug@kaod.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, hi@alyssa.is
Subject: Re: [PATCH] 9p: move limits.h include from 9p.c to 9p.h
Date: Thu, 31 Mar 2022 12:20:00 +0200
Message-ID: <1945982.nC2RM7dPtK@silver>
In-Reply-To: <CAB26zV0StFAcX3KbwfTpXZxjza8N0gr2S5zMwQEJPCKxBEQ5Sw@mail.gmail.com>
References: <20220330181947.68497-1-wwcohen@gmail.com>
 <b7487b9a-fda3-3576-34b3-5cf556c83de6@gmail.com>
 <CAB26zV0StFAcX3KbwfTpXZxjza8N0gr2S5zMwQEJPCKxBEQ5Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 30. M=E4rz 2022 23:17:02 CEST Will Cohen wrote:
> On Wed, Mar 30, 2022 at 4:24 PM Philippe Mathieu-Daud=E9 <
>=20
> philippe.mathieu.daude@gmail.com> wrote:
> > Hi,
> >=20
> > On 30/3/22 20:19, Will Cohen wrote:
> > > As noted by https://gitlab.com/qemu-project/qemu/-/issues/950, within
> > > the patch set adding 9p functionality to darwin, the commit
> > > 38d7fd68b0c8775b5253ab84367419621aa032e6 introduced an issue where
> > > limits.h, which defines XATTR_SIZE_MAX, is included in 9p.c, though t=
he
> > > referenced constant is needed in 9p.h. This commit fixes that issue by
> > > moving the include to 9p.h.
> >=20
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/950
>=20
> Thanks -- I'll adjust the syntax accordingly in v2.

As you are sending a v2 anyway, then also add please:

=46ixes: 38d7fd68b0 ("9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX")

Also note ...

> > > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > > ---
> > >=20
> > >   hw/9pfs/9p.c | 5 -----
> > >   hw/9pfs/9p.h | 5 +++++
> > >   2 files changed, 5 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> > > index dcaa602d4c..59c531ed47 100644
> > > --- a/hw/9pfs/9p.c
> > > +++ b/hw/9pfs/9p.c
> > > @@ -33,11 +33,6 @@
> > >=20
> > >   #include "migration/blocker.h"
> > >   #include "qemu/xxhash.h"
> > >   #include <math.h>
> > >=20
> > > -#ifdef CONFIG_LINUX
> > > -#include <linux/limits.h>
> > > -#else
> > > -#include <limits.h>
> > > -#endif
> > >=20
> > >   int open_fd_hw;
> > >   int total_open_fd;
> > >=20
> > > diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> > > index af2635fae9..0ce4da375c 100644
> > > --- a/hw/9pfs/9p.h
> > > +++ b/hw/9pfs/9p.h
> > > @@ -9,6 +9,11 @@
> > >=20
> > >   #include "qemu/thread.h"
> > >   #include "qemu/coroutine.h"
> > >   #include "qemu/qht.h"
> > >=20
> > > +#ifdef CONFIG_LINUX
> > > +#include <linux/limits.h>
> > > +#else
> > > +#include <limits.h>
> > > +#endif

=2E.. it is usually better to include system headers before project headers.

> >=20
> > Except XATTR_SIZE_MAX, I don't see anything in 9p.h which
> > requires <limits.h>.
> >=20
> > $ git grep P9_XATTR_SIZE_MAX
> > hw/9pfs/9p.c:3960:    if (size > P9_XATTR_SIZE_MAX) {
> > hw/9pfs/9p.h:484:#define P9_XATTR_SIZE_MAX XATTR_SIZE_MAX
> > hw/9pfs/9p.h:495:#define P9_XATTR_SIZE_MAX 65536
> > hw/9pfs/9p.h:497:#error Missing definition for P9_XATTR_SIZE_MAX for
> > this host system
> >=20
> > Only 9p.c requires this definition, what about moving the
> > offending code to the .c?
>=20
> That works as well. I suppose I was just trying to keep it conceptually
> cleaner with the constants in the .h, but on second thought I agree keepi=
ng
> it more efficiently contained in the .c is a better move. Will resubmit
> with that change as v2.
>=20
> > Regards,
> >=20
> > Phil.



