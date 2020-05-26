Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F17B9198BD0
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 07:42:20 +0200 (CEST)
Received: from localhost ([::1]:60628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJ9fI-00064F-18
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 01:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jJ9dq-0004Nx-8P
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 01:40:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jJ9dp-0002cv-6H
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 01:40:50 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47988)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jJ9dm-0002bS-SN; Tue, 31 Mar 2020 01:40:47 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id C813FBF48F;
 Tue, 31 Mar 2020 05:40:45 +0000 (UTC)
Date: Tue, 31 Mar 2020 07:40:42 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v6 11/42] nvme: add temperature threshold feature
Message-ID: <20200331054042.rf4nzrtocqzkw4if@apples.localdomain>
References: <20200316142928.153431-1-its@irrelevant.dk>
 <20200316142928.153431-12-its@irrelevant.dk>
 <47ef3ec5800b5f74017df60e599f16ba905daab6.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47ef3ec5800b5f74017df60e599f16ba905daab6.camel@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mar 25 12:40, Maxim Levitsky wrote:
> On Mon, 2020-03-16 at 07:28 -0700, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> > 
> > It might seem wierd to implement this feature for an emulated device,
> > but it is mandatory to support and the feature is useful for testing
> > asynchronous event request support, which will be added in a later
> > patch.
> > 
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Acked-by: Keith Busch <kbusch@kernel.org>
> > ---
> >  hw/block/nvme.c      | 48 ++++++++++++++++++++++++++++++++++++++++++++
> >  hw/block/nvme.h      |  2 ++
> >  include/block/nvme.h |  8 +++++++-
> >  3 files changed, 57 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > index b7c465560eea..8cda5f02c622 100644
> > --- a/hw/block/nvme.h
> > +++ b/hw/block/nvme.h
> > @@ -108,6 +108,7 @@ typedef struct NvmeCtrl {
> >      uint64_t    irq_status;
> >      uint64_t    host_timestamp;                 /* Timestamp sent by the host */
> >      uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
> > +    uint16_t    temperature;
> You forgot to move this too.
> 

Fixed!
> 
> With 'temperature' field removed from the header:
> 
> Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
> 
> Best regards,
> 	Maxim Levitsky
> 


