Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD100249EC5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 14:55:51 +0200 (CEST)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Nd8-0007za-J6
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 08:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k8NcI-00073n-Fo
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 08:54:58 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:60591
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k8NcF-0004OT-Uk
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 08:54:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597841694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Z7/D53ccBg/IM7nMouyDrSZXCMCcaAMllMbukg+oec=;
 b=OCS+xvoaiqnUcT3KuiaaGLPDyiVD43sF3NHEjPzvMDXI5176AAE2aXWHOWHQINkH9dvvcX
 bmprHZ8gMZ0chqhcCGr5shHvAA0K0+3Pq6wSyOWRJlSMD8CM2AZWHJ12D8q/X1V7qSlRtv
 k/2J4DtUPUcAACw+wcmDJ2FET5MesjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-Nu-IKj0JP42yvHgrRcp3RA-1; Wed, 19 Aug 2020 08:54:53 -0400
X-MC-Unique: Nu-IKj0JP42yvHgrRcp3RA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1117F873079;
 Wed, 19 Aug 2020 12:54:51 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54BD67A40F;
 Wed, 19 Aug 2020 12:54:27 +0000 (UTC)
Date: Wed, 19 Aug 2020 14:54:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v6 2/7] hw: add 5.2 machine types and 5.1 compat options
Message-ID: <20200819145425.622a0751@redhat.com>
In-Reply-To: <20200818171132.551e2c72.cohuck@redhat.com>
References: <20200818143348.310613-1-stefanha@redhat.com>
 <20200818143348.310613-3-stefanha@redhat.com>
 <20200818171132.551e2c72.cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 01:46:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Richard Henderson <rth@twiddle.net>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Max Reitz <mreitz@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Aug 2020 17:11:32 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, 18 Aug 2020 15:33:43 +0100
> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> 
> > arm, i386, ppc, and s390x have versioned machine types and associated
> > compatibility options. Introduce new ones now that QEMU 5.1 has been
> > released.
> > 
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  include/hw/boards.h        |  3 +++
> >  include/hw/i386/pc.h       |  3 +++
> >  hw/arm/virt.c              |  9 ++++++++-
> >  hw/core/machine.c          |  4 ++++
> >  hw/i386/pc.c               |  4 ++++
> >  hw/i386/pc_piix.c          | 14 +++++++++++++-
> >  hw/i386/pc_q35.c           | 13 ++++++++++++-
> >  hw/ppc/spapr.c             | 15 +++++++++++++--
> >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
> >  9 files changed, 73 insertions(+), 6 deletions(-)  
> 
> https://lore.kernel.org/qemu-devel/20200728094645.272149-1-cohuck@redhat.com/
> is already out there :)

That one doesn't apply anymore (or I did something wrong when applying it),

but Stefan's version applies cleanly

> 
> 


