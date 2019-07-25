Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743C77495A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 10:47:16 +0200 (CEST)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqZP9-0000QV-Av
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 04:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50858)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqZOo-00089W-4a
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 04:46:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqZOn-0001EV-6V
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 04:46:54 -0400
Received: from mail.ispras.ru ([83.149.199.45]:57318)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1hqZOm-0001DN-VQ
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 04:46:53 -0400
Received: from PASHAISP (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 4C9C854006A;
 Thu, 25 Jul 2019 11:46:50 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: "'Kevin Wolf'" <kwolf@redhat.com>, "'Paolo Bonzini'" <pbonzini@redhat.com>
References: <156395778867.510.17588721322993616668.stgit@pasha-Precision-3630-Tower>
 <83f7a43a-3039-0ac2-e7c7-5e802811d431@redhat.com>
 <20190725084453.GA8294@linux.fritz.box>
In-Reply-To: <20190725084453.GA8294@linux.fritz.box>
Date: Thu, 25 Jul 2019 11:46:53 +0300
Message-ID: <000b01d542c5$82394700$86abd500$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Content-Language: ru
Thread-Index: AdVCxUAtlqanUL3pQAaL+B91K4mnygAABdRw
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
> 
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

I split the series and already sent the modified "no-block" part.
Therefore I'll send the rebased block related patches soon.

Pavel Dovgalyuk


