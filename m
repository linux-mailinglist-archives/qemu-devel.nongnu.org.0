Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AF97B931
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 07:42:18 +0200 (CEST)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hshNR-0003Ds-9E
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 01:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dovgaluk@ispras.ru>) id 1hshMu-0002ny-Dv
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 01:41:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1hshMt-0003nv-Du
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 01:41:44 -0400
Received: from mail.ispras.ru ([83.149.199.45]:39762)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1hshMr-0003kE-FA
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 01:41:43 -0400
Received: from PASHAISP (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id E5C4554006A;
 Wed, 31 Jul 2019 08:41:35 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: "'Kevin Wolf'" <kwolf@redhat.com>, "'Paolo Bonzini'" <pbonzini@redhat.com>
References: <156395778867.510.17588721322993616668.stgit@pasha-Precision-3630-Tower>
 <83f7a43a-3039-0ac2-e7c7-5e802811d431@redhat.com>
 <20190725084453.GA8294@linux.fritz.box>
In-Reply-To: <20190725084453.GA8294@linux.fritz.box>
Date: Wed, 31 Jul 2019 08:41:37 +0300
Message-ID: <000001d54762$9f61ede0$de25c9a0$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdVCxUAtlqanUL3pQAaL+B91K4mnygEnSShw
Content-Language: ru
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.45
Subject: Re: [Qemu-devel] [PATCH for-4.2 00/14] Some record/replay fixes
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
 boost.lists@gmail.com, thomas.dullien@googlemail.com, mreitz@redhat.com,
 artem.k.pisarenko@gmail.com, dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Kevin Wolf [mailto:kwolf@redhat.com]
> Am 24.07.2019 um 16:35 hat Paolo Bonzini geschrieben:
> > On 24/07/19 10:43, Pavel Dovgalyuk wrote:
> > > The set of patches include the latest fixes for record/replay icount function:
> > >  - fix for icount for the case when translation blocks are chained
> > >  - block operation fixes for rr mode
> > >  - development documentation update
> > >  - some refactoring
> > >
> > > These patches make record/replay functional on the latest 4.2 QEMU core.
> >
> > Please separate patches 1 and 9-14, I can merge those.
> 
> The block related parts have my Acked-by and the rest looks a bit like
> no man's land, so I think you could just take the whole series.

Paolo, I've sent the rest of the patches as a separate series.
But they are rebased upon the first series.
Since Kevin agreed to merge them, can you put them in your queue?

Pavel Dovgalyuk


