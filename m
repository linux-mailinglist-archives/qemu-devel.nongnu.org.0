Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D50F74955
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 10:45:52 +0200 (CEST)
Received: from localhost ([::1]:57204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqZNm-00042N-Sr
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 04:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50320)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hqZN2-0001dy-SW
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 04:45:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hqZN1-0000LR-Qm
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 04:45:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40444)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1hqZN1-0000Jy-JM
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 04:45:03 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 84912C024B02;
 Thu, 25 Jul 2019 08:45:01 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-146.ams2.redhat.com [10.36.117.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB1BD60605;
 Thu, 25 Jul 2019 08:44:54 +0000 (UTC)
Date: Thu, 25 Jul 2019 10:44:53 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190725084453.GA8294@linux.fritz.box>
References: <156395778867.510.17588721322993616668.stgit@pasha-Precision-3630-Tower>
 <83f7a43a-3039-0ac2-e7c7-5e802811d431@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83f7a43a-3039-0ac2-e7c7-5e802811d431@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Thu, 25 Jul 2019 08:45:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
 alex.bennee@linaro.org, Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>,
 maria.klimushenkova@ispras.ru, mst@redhat.com, kraxel@redhat.com,
 boost.lists@gmail.com, thomas.dullien@googlemail.com, dovgaluk@ispras.ru,
 mreitz@redhat.com, artem.k.pisarenko@gmail.com, dgilbert@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.07.2019 um 16:35 hat Paolo Bonzini geschrieben:
> On 24/07/19 10:43, Pavel Dovgalyuk wrote:
> > The set of patches include the latest fixes for record/replay icount function:
> >  - fix for icount for the case when translation blocks are chained
> >  - block operation fixes for rr mode
> >  - development documentation update
> >  - some refactoring
> > 
> > These patches make record/replay functional on the latest 4.2 QEMU core.
> 
> Please separate patches 1 and 9-14, I can merge those.

The block related parts have my Acked-by and the rest looks a bit like
no man's land, so I think you could just take the whole series.

Kevin

