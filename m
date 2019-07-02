Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CFD5D6E4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 21:28:45 +0200 (CEST)
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiOSK-0005W3-Lv
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 15:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hiM7b-0002hV-5Y
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:59:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hiM7a-0004NP-2O
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:59:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46464)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hiM7Z-0004Mo-I7
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 12:59:09 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 27F0D308427E;
 Tue,  2 Jul 2019 16:59:08 +0000 (UTC)
Received: from redhat.com (ovpn-124-209.rdu2.redhat.com [10.10.124.209])
 by smtp.corp.redhat.com (Postfix) with SMTP id 7E82287B4;
 Tue,  2 Jul 2019 16:58:54 +0000 (UTC)
Date: Tue, 2 Jul 2019 12:58:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Message-ID: <20190702125842-mutt-send-email-mst@kernel.org>
References: <20190619094907.10131-1-pagupta@redhat.com>
 <20190619094907.10131-4-pagupta@redhat.com>
 <20190702135030.6159266b.cohuck@redhat.com>
 <918283919.38605393.1562068757047.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <918283919.38605393.1562068757047.JavaMail.zimbra@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 02 Jul 2019 16:59:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 3/7] virtio-pmem: sync linux headers
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
Cc: kwolf@redhat.com, aarcange@redhat.com,
 xiaoguangrong eric <xiaoguangrong.eric@gmail.com>, riel@surriel.com,
 armbru@redhat.com, Cornelia Huck <cohuck@redhat.com>, david@redhat.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com, lcapitulino@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 dan j williams <dan.j.williams@intel.com>, nilal@redhat.com,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 02, 2019 at 07:59:17AM -0400, Pankaj Gupta wrote:
> 
> > 
> > On Wed, 19 Jun 2019 15:19:03 +0530
> > Pankaj Gupta <pagupta@redhat.com> wrote:
> > 
> > > Sync linux headers for virtio pmem.
> > > 
> > > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> > > ---
> > >  include/standard-headers/linux/virtio_ids.h  |  1 +
> > >  include/standard-headers/linux/virtio_pmem.h | 35
> > >  ++++++++++++++++++++++++++++
> > >  2 files changed, 36 insertions(+)
> > >  create mode 100644 include/standard-headers/linux/virtio_pmem.h
> > 
> > That's not yet upstream, right?
> 
> right.
> 
> > 
> > If so, I fear this feature won't make 4.1, as the merge window for
> > Linux only opens in one or two weeks :(
> 
> Looks so. Its lined up for 5.3 merge window.

In which tree is it?

> Waiting for the kernel patch series to be merged and send an updated version
> of qemu series with review suggestion if any :)  
> 
> Thanks,
> Pankaj 
> 
> > 

