Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF977B607F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 11:39:13 +0200 (CEST)
Received: from localhost ([::1]:56560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAWQa-0001eY-UP
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 05:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1iAWPA-0000Vy-RA
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 05:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1iAWP9-0006DS-Fk
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 05:37:44 -0400
Received: from mail.ispras.ru ([83.149.199.45]:57188)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1iAWP9-0006Cl-4i
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 05:37:43 -0400
Received: from PASHAISP (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id D310954011C;
 Wed, 18 Sep 2019 12:37:40 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: "'Kevin Wolf'" <kwolf@redhat.com>
References: <156872146565.1757.3033215873677512474.stgit@pasha-Precision-3630-Tower>
 <156872148244.1757.2888672921697745021.stgit@pasha-Precision-3630-Tower>
 <20190918091831.GD5207@localhost.localdomain>
 <001201d56e02$9d88b5f0$d89a21d0$@ru>
 <20190918093305.GF5207@localhost.localdomain>
In-Reply-To: <20190918093305.GF5207@localhost.localdomain>
Date: Wed, 18 Sep 2019 12:37:43 +0300
Message-ID: <001401d56e04$b93c02a0$2bb407e0$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdVuBBnatdIe8W0KRsu0PGmTkwIexQAAFiAg
Content-Language: ru
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: Re: [Qemu-devel] [for-4.2 PATCH 3/6] replay: update docs for
 record/replay with block devices
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
Cc: peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru,
 crosthwaite.peter@gmail.com, ciro.santilli@gmail.com, jasowang@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 alex.bennee@linaro.org, 'Pavel Dovgalyuk' <pavel.dovgaluk@gmail.com>,
 maria.klimushenkova@ispras.ru, mst@redhat.com, kraxel@redhat.com,
 boost.lists@gmail.com, thomas.dullien@googlemail.com, pbonzini@redhat.com,
 mreitz@redhat.com, artem.k.pisarenko@gmail.com, dgilbert@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Kevin Wolf [mailto:kwolf@redhat.com]
> Am 18.09.2019 um 11:22 hat Pavel Dovgalyuk geschrieben:
> > > From: Kevin Wolf [mailto:kwolf@redhat.com]
> > > Am 17.09.2019 um 13:58 hat Pavel Dovgalyuk geschrieben:
> > > > From: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
> > > >
> > > > This patch updates the description of the command lines for using
> > > > record/replay with attached block devices.
> > > >
> > > > Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
> > > > ---
> > > >  docs/replay.txt |   12 +++++++++---
> > > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/docs/replay.txt b/docs/replay.txt
> > > > index ee6aee9861..ce97c3f72f 100644
> > > > --- a/docs/replay.txt
> > > > +++ b/docs/replay.txt
> > > > @@ -27,7 +27,7 @@ Usage of the record/replay:
> > > >   * First, record the execution with the following command line:
> > > >      qemu-system-i386 \
> > > >       -icount shift=7,rr=record,rrfile=replay.bin \
> > > > -     -drive file=disk.qcow2,if=none,id=img-direct \
> > > > +     -drive file=disk.qcow2,if=none,snapshot,id=img-direct \
> > > >       -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay \
> > > >       -device ide-hd,drive=img-blkreplay \
> > > >       -netdev user,id=net1 -device rtl8139,netdev=net1 \
> > > > @@ -35,7 +35,7 @@ Usage of the record/replay:
> > > >   * After recording, you can replay it by using another command line:
> > > >      qemu-system-i386 \
> > > >       -icount shift=7,rr=replay,rrfile=replay.bin \
> > > > -     -drive file=disk.qcow2,if=none,id=img-direct \
> > > > +     -drive file=disk.qcow2,if=none,snapshot,id=img-direct \
> > > >       -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay \
> > > >       -device ide-hd,drive=img-blkreplay \
> > > >       -netdev user,id=net1 -device rtl8139,netdev=net1 \
> > > > @@ -223,7 +223,7 @@ Block devices record/replay module intercepts calls of
> > > >  bdrv coroutine functions at the top of block drivers stack.
> > > >  To record and replay block operations the drive must be configured
> > > >  as following:
> > > > - -drive file=disk.qcow2,if=none,id=img-direct
> > > > + -drive file=disk.qcow2,if=none,snapshot,id=img-direct
> > > >   -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
> > > >   -device ide-hd,drive=img-blkreplay
> > > >
> > > > @@ -252,6 +252,12 @@ This snapshot is created at start of recording and restored at
> start
> > > >  of replaying. It also can be loaded while replaying to roll back
> > > >  the execution.
> > > >
> > > > +'snapshot' flag of the disk image must be removed to save the snapshots
> > > > +in the overlay (or original image) instead of using the temporary overlay.
> > > > + -drive file=disk.ovl,if=none,id=img-direct
> > > > + -drive driver=blkreplay,if=none,image=img-direct,id=img-blkreplay
> > > > + -device ide-hd,drive=img-blkreplay
> > >
> > > Wait, didn't patch 2 just make -snapshot unconditionally incompatible
> > > with replay? So isn't saving the snapshot in the original image the only
> > > supported mode now?
> >
> > There are two ways to run record/replay:
> > 1. Disk with snapshot option and any image to make it unchanged
> > 2. Disk with overlay without snapshot option to save VM snapshots on it
> 
> Yes, I think I understand the two options that you intend to make
> available, but when -snapshot sets a replay blocker, how can 1. still
> work? Is there some code that ignores replay blockers?

I checked the text and don't see anything about global "-snapshot" option.
All references are about drive snapshot flag.
Can you point me where did I missed that?

Pavel Dovgalyuk


