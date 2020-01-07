Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ED4132975
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:01:15 +0100 (CET)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqM5-0008VY-Qt
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:01:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57188)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iopO3-0001f0-93
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:59:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iopO2-0005Es-2R
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:59:11 -0500
Received: from 4.mo179.mail-out.ovh.net ([46.105.36.149]:35050)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iopNz-000590-OB
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:59:07 -0500
Received: from player795.ha.ovh.net (unknown [10.109.143.210])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 5ECBB152B2D
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 14:59:02 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: groug@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 46686DD123E4;
 Tue,  7 Jan 2020 13:58:58 +0000 (UTC)
Date: Tue, 7 Jan 2020 14:58:53 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v1 44/59] 9p-local.c: remove unneeded label in
 local_unlinkat_common()
Message-ID: <20200107145853.3f523dc6@bahia.lan>
In-Reply-To: <16442994.pYkbpd2YfT@silver>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-45-danielhb413@gmail.com>
 <16442994.pYkbpd2YfT@silver>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10278903200864246080
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehgedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdduleehrddvuddvrddvledrudeiieenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.36.149
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
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 07 Jan 2020 13:04:20 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 6. Januar 2020 19:24:10 CET Daniel Henrique Barboza wrote:
> > 'err_out' can be replaced by 'return ret' in the error conditions
> > the jump was being made.
> > 
> > CC: Greg Kurz <groug@kaod.org>
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >  hw/9pfs/9p-local.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> > 
> > diff --git a/hw/9pfs/9p-local.c b/hw/9pfs/9p-local.c
> > index ca641390fb..f9bdd2ad7c 100644
> > --- a/hw/9pfs/9p-local.c
> > +++ b/hw/9pfs/9p-local.c
> > @@ -1094,12 +1094,12 @@ static int local_unlinkat_common(FsContext *ctx, int
> > dirfd, const char *name,
> > 
> >              fd = openat_dir(dirfd, name);
> >              if (fd == -1) {
> > -                goto err_out;
> > +                return ret;
> >              }
> >              ret = unlinkat(fd, VIRTFS_META_DIR, AT_REMOVEDIR);
> >              close_preserve_errno(fd);
> >              if (ret < 0 && errno != ENOENT) {
> > -                goto err_out;
> > +                return ret;
> >              }
> >          }
> >          map_dirfd = openat_dir(dirfd, VIRTFS_META_DIR);
> > @@ -1107,16 +1107,14 @@ static int local_unlinkat_common(FsContext *ctx, int
> > dirfd, const char *name, ret = unlinkat(map_dirfd, name, 0);
> >              close_preserve_errno(map_dirfd);
> >              if (ret < 0 && errno != ENOENT) {
> > -                goto err_out;
> > +                return ret;
> >              }
> >          } else if (errno != ENOENT) {
> > -            goto err_out;
> > +            return ret;
> >          }
> >      }
> > 
> > -    ret = unlinkat(dirfd, name, flags);
> > -err_out:
> > -    return ret;
> > +    return unlinkat(dirfd, name, flags);
> >  }
> > 
> >  static int local_remove(FsContext *ctx, const char *path)
> 
> Well, personally I don't see any improvement by these changes. It probably 
> makes the code slightly more elegant, but IMO not more readable. And return 
> constructed functions vs. jump to label constructed functions are more likely 
> to gather missing-cleanup bugs.
> 
> At least this patch does not cause any behaviour change, so I leave that up to 
> you Greg to decide. ;-)
> 

I don't care that much but in the present case, the function has a bug that
can be fixed with a variant of this patch if 'goto err_out' is turned into
'return -1'. I've hence asked Daniel to move this patch out of the series and
to turn it into a real fix that I'll merge directly.

> Best regards,
> Christian Schoenebeck
> 
> 


