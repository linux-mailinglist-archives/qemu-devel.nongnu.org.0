Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5F81B0958
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 14:30:22 +0200 (CEST)
Received: from localhost ([::1]:34656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQVZ7-0007IO-HN
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 08:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47736 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jQVYD-0006m9-Nu
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 08:29:26 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jQVYD-00068N-5b
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 08:29:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56604
 helo=us-smtp-1.mimecast.com)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jQVYC-00067o-Oi
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 08:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587385764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CU8rWqkuORd5/JIVET3f+JFPtiY9r0mv3Fsd7i3fjlQ=;
 b=BgSLZQ5smvM6cvtMP4Ar7usoWJEm1nrmEVvJmeRdWPD2Z65iXw5IgGUePpTRIZVtMdueeX
 MbF5e2nWcmw7yYcOVsItG8y9kIKhWMoWCqgvRYN/+8RzplT8Q3HCHnkcwudiHnoCD+COs/
 NJQd376aYTuHRUdglnFHYEMRMuKYKQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-lCU7UuA1NzCDFPV0G6ixfQ-1; Mon, 20 Apr 2020 08:29:22 -0400
X-MC-Unique: lCU7UuA1NzCDFPV0G6ixfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4150518C43C2;
 Mon, 20 Apr 2020 12:29:21 +0000 (UTC)
Received: from gondolin (ovpn-112-224.ams2.redhat.com [10.36.112.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 278675DA82;
 Mon, 20 Apr 2020 12:29:19 +0000 (UTC)
Date: Mon, 20 Apr 2020 14:29:17 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Jared Rossi <jrossi@linux.ibm.com>
Subject: Re: [PATCH 1/1] vfio-ccw: Enable transparent CCW IPL from DASD
Message-ID: <20200420142917.206d36a5.cohuck@redhat.com>
In-Reply-To: <20200420142617.5e255265.cohuck@redhat.com>
References: <20200417183838.11796-1-jrossi@linux.ibm.com>
 <20200417183838.11796-2-jrossi@linux.ibm.com>
 <20200420142617.5e255265.cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 04:32:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Apr 2020 14:26:17 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, 17 Apr 2020 14:38:38 -0400
> Jared Rossi <jrossi@linux.ibm.com> wrote:
> 
> > Remove the explicit prefetch check when using vfio-ccw devices.
> > This check is not needed as all Linux channel programs are intended
> > to use prefetch and will be executed in the same way regardless.  
> 
> As already commented on the Linux patch: Can we log something, so this
> is debuggable if this statement does not hold true in the future?
> 
> > 
> > Signed-off-by: Jared Rossi <jrossi@linux.ibm.com>
> > ---
> >  hw/vfio/ccw.c | 13 +++----------
> >  1 file changed, 3 insertions(+), 10 deletions(-)
> > 
> > diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> > index 50cc2ec75c..e649377b68 100644
> > --- a/hw/vfio/ccw.c
> > +++ b/hw/vfio/ccw.c
> > @@ -74,16 +74,9 @@ static IOInstEnding vfio_ccw_handle_request(SubchDev *sch)
> >      struct ccw_io_region *region = vcdev->io_region;
> >      int ret;
> >  
> > -    if (!(sch->orb.ctrl0 & ORB_CTRL0_MASK_PFCH)) {
> > -        if (!(vcdev->force_orb_pfch)) {
> > -            warn_once_pfch(vcdev, sch, "requires PFCH flag set");
> > -            sch_gen_unit_exception(sch);
> > -            css_inject_io_interrupt(sch);
> > -            return IOINST_CC_EXPECTED;
> > -        } else {
> > -            sch->orb.ctrl0 |= ORB_CTRL0_MASK_PFCH;
> > -            warn_once_pfch(vcdev, sch, "PFCH flag forced");
> > -        }
> > +    if (!(sch->orb.ctrl0 & ORB_CTRL0_MASK_PFCH) && vcdev->force_orb_pfch) {
> > +        sch->orb.ctrl0 |= ORB_CTRL0_MASK_PFCH;
> > +        warn_once_pfch(vcdev, sch, "PFCH flag forced");
> >      }  
> 
> What happens when you run it with an old kernel? I guess the I/O is
> only rejected later (after a trip into the kernel), but has that path
> ever been tested?
> 
> >  
> >      QEMU_BUILD_BUG_ON(sizeof(region->orb_area) != sizeof(ORB));  
> 

Oh, and do we want to deprecate the force prefetch interface in the
future? We probably need to wait a bit, until the kernel changes have
become widely available.


