Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE0A1992A8
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 11:47:12 +0200 (CEST)
Received: from localhost ([::1]:34824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJDUF-0001iH-UN
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 05:47:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39231)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jJDT9-00013j-Qz
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 05:46:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1jJDT8-0005sb-KE
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 05:46:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33924
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1jJDT8-0005sN-F6
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 05:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585647962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRHjqcenFChBxj7azJ5qJFo6gU9cR6bPe8CKx8p4/Pc=;
 b=LgS0+qcYRsdEEFDOO2g3UG1HFrUdFPaeBWaXkKiCB2LZoQ84FvCmgJBRQK04QWr2xnWh1d
 +OB30iyqGA1wnavVRMCtWtsBNUqUd6oe1besn6Qi5BjNEqEgFWCEfVa7s/z9OCk9gPWzeC
 tOXR2dOuvkHe9XZuMEXyAzjqCPUGk1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-8yQjV9vbO26f38vDDaHKFQ-1; Tue, 31 Mar 2020 05:46:00 -0400
X-MC-Unique: 8yQjV9vbO26f38vDDaHKFQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ACE6800D50;
 Tue, 31 Mar 2020 09:45:58 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B94E60BE0;
 Tue, 31 Mar 2020 09:45:55 +0000 (UTC)
Message-ID: <4107ea7ca5b4810d1d5d9e498fbd336a17a57936.camel@redhat.com>
Subject: Re: [PATCH v6 12/42] nvme: add support for the get log page command
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Klaus Birkelund Jensen <its@irrelevant.dk>
Date: Tue, 31 Mar 2020 12:45:55 +0300
In-Reply-To: <20200331054109.zq6yluixcnpdbust@apples.localdomain>
References: <20200316142928.153431-1-its@irrelevant.dk>
 <20200316142928.153431-13-its@irrelevant.dk>
 <a7c92a47957a8185a9bd8d7d8b919072d757ff3a.camel@redhat.com>
 <20200331054109.zq6yluixcnpdbust@apples.localdomain>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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

On Tue, 2020-03-31 at 07:41 +0200, Klaus Birkelund Jensen wrote:
> On Mar 25 12:40, Maxim Levitsky wrote:
> > On Mon, 2020-03-16 at 07:28 -0700, Klaus Jensen wrote:
> > > From: Klaus Jensen <k.jensen@samsung.com>
> > > 
> > > Add support for the Get Log Page command and basic implementations of
> > > the mandatory Error Information, SMART / Health Information and Firmware
> > > Slot Information log pages.
> > > 
> > > In violation of the specification, the SMART / Health Information log
> > > page does not persist information over the lifetime of the controller
> > > because the device has no place to store such persistent state.
> > > 
> > > Note that the LPA field in the Identify Controller data structure
> > > intentionally has bit 0 cleared because there is no namespace specific
> > > information in the SMART / Health information log page.
> > > 
> > > Required for compliance with NVMe revision 1.2.1. See NVM Express 1.2.1,
> > > Section 5.10 ("Get Log Page command").
> > > 
> > > Signed-off-by: Klaus Jensen <klaus.jensen@cnexlabs.com>
> > > Acked-by: Keith Busch <kbusch@kernel.org>
> > > ---
> > >  hw/block/nvme.c       | 138 +++++++++++++++++++++++++++++++++++++++++-
> > >  hw/block/nvme.h       |  10 +++
> > >  hw/block/trace-events |   2 +
> > >  3 files changed, 149 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > index 64c42101df5c..83ff3fbfb463 100644
> > > 
> > > +static uint16_t nvme_error_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf_len,
> > > +                                uint64_t off, NvmeRequest *req)
> > > +{
> > > +    uint32_t trans_len;
> > > +    uint64_t prp1 = le64_to_cpu(cmd->dptr.prp1);
> > > +    uint64_t prp2 = le64_to_cpu(cmd->dptr.prp2);
> > > +    uint8_t errlog[64];
> > 
> > I'll would replace this with sizeof(NvmeErrorLogEntry)
> > (and add NvmeErrorLogEntry to the nvme.h), just for the sake of consistency,
> > and in case we end up reporting some errors to the log in the future.
> > 
> 
> NvmeErrorLog is already in nvme.h; Fixed to actually use it.
True that! I'll would rename it to NvmeErrorLogEntry to be honest
(in that patch that added many nvme spec changes) but I don't mind
keeping it as is as well.


> 
> > 
> > > +
> > > +    if (off > sizeof(errlog)) {
> > > +        return NVME_INVALID_FIELD | NVME_DNR;
> > > +    }
> > > +
> > > +    memset(errlog, 0x0, sizeof(errlog));
> > > +
> > > +    trans_len = MIN(sizeof(errlog) - off, buf_len);
> > > +
> > > +    return nvme_dma_read_prp(n, errlog, trans_len, prp1, prp2);
> > > +}
> > 
> > Besides this, looks good now.
> > 
> > 
> > Best regards,
> > 	Maxim Levitsky
> > 
> 
> 

Best regards,	
	Maxim Levitsky



