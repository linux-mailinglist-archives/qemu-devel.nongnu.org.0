Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C150129930C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 17:56:10 +0100 (CET)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX5mz-0007G5-RD
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 12:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kX5lA-0005vH-Ew
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kX5l8-0004wN-NB
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:54:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603731253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLEKZXx53bC/AXofQXHwBHnCSy+NkKOX2yE9+4TERTk=;
 b=ZRyjwoT/yKFdi8aCeag/RAk3bUWlhwlHGAHe3/dp0Y4wMAtA1SmR1FzMyKVhgWL0qe+GMM
 53iWLTYq5ZsIRkcdtQhhyVZi5Nt+Xbr4/iiqXrmoSgfX3OqLUMeHeL1VGEKCquHCs8R1kF
 4e16T3lftZf0grUH8fKsmsHW05NU22k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-6gZAGOtrPBiQoHan6C7dTA-1; Mon, 26 Oct 2020 12:54:11 -0400
X-MC-Unique: 6gZAGOtrPBiQoHan6C7dTA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF78B1009E27;
 Mon, 26 Oct 2020 16:54:09 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E01445D9E4;
 Mon, 26 Oct 2020 16:53:54 +0000 (UTC)
Date: Mon, 26 Oct 2020 10:53:54 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 00/13] s390x/pci: s390-pci updates for kernel 5.10-rc1
Message-ID: <20201026105354.703fc480@w520.home>
In-Reply-To: <20201026174124.1a662fa3.cohuck@redhat.com>
References: <1603726481-31824-1-git-send-email-mjrosato@linux.ibm.com>
 <20201026171947.0f302dcc.cohuck@redhat.com>
 <20201026174124.1a662fa3.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, Matthew Rosato <mjrosato@linux.ibm.com>,
 pmorel@linux.ibm.com, david@redhat.com, schnelle@linux.ibm.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, mst@redhat.com, kvm@vger.kernel.org,
 pbonzini@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Oct 2020 17:41:24 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Mon, 26 Oct 2020 17:19:47 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Mon, 26 Oct 2020 11:34:28 -0400
> > Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> >   
> > > Combined set of patches that exploit vfio/s390-pci features available in
> > > kernel 5.10-rc1.  This patch set is a combination of 
> > > 
> > > [PATCH v4 0/5] s390x/pci: Accomodate vfio DMA limiting
> > > 
> > > and
> > > 
> > > [PATCH v3 00/10] Retrieve zPCI hardware information from VFIO
> > > 
> > > with duplicate patches removed and a single header sync.  All patches have
> > > prior maintainer reviews except for:
> > > 
> > > - Patch 1 (update-linux-headers change to add new file)     
> > 
> > That one has ;)
> >   
> > > - Patch 2 (header sync against 5.10-rc1)    
> > 
> > I'm still unsure about the rdma/(q)atomic stuff -- had we reached any
> > conclusion there?
> >   
> > > - Patch 13 - contains a functional (debug) change; I switched from using
> > >   DPRINTFs to using trace events per Connie's request.  
> 
> Looks good.
> 
> I think that should go through the vfio tree, in case there are
> collisions with the migration stuff?
> 
> (The s390x queue is currently empty.)

Patches appear to apply cleanly on top of the migration series, but I
can take it if preferred.  Thanks,

Alex


