Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC903278C27
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 17:09:31 +0200 (CEST)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLpLm-0000e4-RR
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 11:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kLpFq-0004U2-0k
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 11:03:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kLpFn-0002Mn-VC
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 11:03:21 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601046197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xL97XlBbfHiz2VEyXf7pSUtqtIihQnTCmuROMWX3SdI=;
 b=YCEqhgvjYhbWw5bw8Hc5fVqga2pQtaxp5PhjPhlpKxdM0rzX7YGczg/7qF1dO+5go3noDf
 ufiiJPqkJuh21ZCKYig7ktaVnkVRU6Xhtp5wCKmSCpHoF7nZi31Ce/d1a2Y9ntuMyF0wtI
 Z/7dJvaUSYlWXkBOr9RqtlYq9wAyV1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-vXd7rks9PreMvDI1eAvNsg-1; Fri, 25 Sep 2020 11:03:15 -0400
X-MC-Unique: vXd7rks9PreMvDI1eAvNsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2B60802EA3;
 Fri, 25 Sep 2020 15:03:13 +0000 (UTC)
Received: from gondolin (ovpn-112-192.ams2.redhat.com [10.36.112.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0D576198B;
 Fri, 25 Sep 2020 15:03:02 +0000 (UTC)
Date: Fri, 25 Sep 2020 17:03:00 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH 3/7] s390x/pci: create a header dedicated to PCI CLP
Message-ID: <20200925170300.1367e307.cohuck@redhat.com>
In-Reply-To: <9303d8c1-dd93-6e63-d90e-0303bd42677b@linux.ibm.com>
References: <1600529672-10243-1-git-send-email-mjrosato@linux.ibm.com>
 <1600529672-10243-4-git-send-email-mjrosato@linux.ibm.com>
 <20200925111746.2e3bf28f.cohuck@redhat.com>
 <9303d8c1-dd93-6e63-d90e-0303bd42677b@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: thuth@redhat.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 david@redhat.com, schnelle@linux.ibm.com, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Sep 2020 10:10:12 -0400
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> On 9/25/20 5:17 AM, Cornelia Huck wrote:
> > On Sat, 19 Sep 2020 11:34:28 -0400
> > Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> >   
> >> From: Pierre Morel <pmorel@linux.ibm.com>
> >>
> >> To have a clean separation between s390-pci-bus.h and s390-pci-inst.h
> >> headers we export the PCI CLP instructions in a dedicated header.
> >>
> >> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> >> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> >> ---
> >>   hw/s390x/s390-pci-bus.h  |   1 +
> >>   hw/s390x/s390-pci-clp.h  | 211 +++++++++++++++++++++++++++++++++++++++++++++++
> >>   hw/s390x/s390-pci-inst.h | 196 -------------------------------------------
> >>   3 files changed, 212 insertions(+), 196 deletions(-)
> >>   create mode 100644 hw/s390x/s390-pci-clp.h  
> > 
> > Looks sane; but I wonder whether we should move the stuff under
> > include/hw/s390x/.
> >   
> 
> Probably.  I'd be fine with creating this file under include, but if 
> we're going to do that we should plan to move the other s390-pci* ones 
> too.  For this patchset, I can change this patch to put the new header 
> in include/hw/s390x, easy enough.
> 
> I'll plan to do a separate cleanup patchset to move s390-pci-bus.h and 
> s390-pci-inst.h.
> 
> How would you like me to handle s390-pci-vfio.h (this is a new file 
> added by both this patch set and 's390x/pci: Accomodate vfio DMA 
> limiting') --  It seems likely that the latter patch set will merge 
> first, so my thought would be to avoid a cleanup on this one and just 
> re-send 's390x/pci: Accomodate vfio DMA limiting' once the kernel part 
> hits mainline (it's currently in linux-next via Alex) with 
> s390-pci-vfio.h also created in include/hw/s390x (and I guess the 
> MAINTAINERS hit for it too). Sound OK?

Yes, I guess that would be best.



