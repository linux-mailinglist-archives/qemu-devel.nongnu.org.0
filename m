Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC8365944
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:52:05 +0200 (CEST)
Received: from localhost ([::1]:42118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYprI-00069s-1o
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lYpi7-0000yF-Es
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:42:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lYpi3-0001Og-OB
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618922550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3gCD00ET+n7VbBORPyPjyHJvaw2cGdexdrikhhDygu8=;
 b=guSoyvKXr0bEVguArOTuzC0dW9HNcvqUd/seeZXRSpKf2SurYR0KP2BLFcjMKdf6bnjhkZ
 J11yKbjQ/rP7qNw4Hk+jfkNWRkvyJue1T2gkOpuqIHgfFpSiiTbDz0Zfpql5+EBCddVEuj
 0zc76/HdQ1lR7fhc0XHzaoQ/2iI+a/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-iX02n9-yNhqW1qhuPn3EbA-1; Tue, 20 Apr 2021 08:42:28 -0400
X-MC-Unique: iX02n9-yNhqW1qhuPn3EbA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04EC61093FA8;
 Tue, 20 Apr 2021 12:41:58 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-244.ams2.redhat.com
 [10.36.113.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D46819172;
 Tue, 20 Apr 2021 12:41:54 +0000 (UTC)
Date: Tue, 20 Apr 2021 14:41:51 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.1] hw: add compat machines for 6.1
Message-ID: <20210420144151.39e391eb.cohuck@redhat.com>
In-Reply-To: <CAFEAcA-Zt8U4mQmgjHiNDMUiH3tkVRKEtD-acW0rze1WYnmzKg@mail.gmail.com>
References: <20210331111900.118274-1-cohuck@redhat.com>
 <CAFEAcA-Zt8U4mQmgjHiNDMUiH3tkVRKEtD-acW0rze1WYnmzKg@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Apr 2021 13:37:07 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 31 Mar 2021 at 12:19, Cornelia Huck <cohuck@redhat.com> wrote:
> >
> > Add 6.1 machine types for arm/i440fx/q35/s390x/spapr.
> >
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >  hw/arm/virt.c              |  7 ++++++-
> >  hw/core/machine.c          |  3 +++
> >  hw/i386/pc.c               |  3 +++
> >  hw/i386/pc_piix.c          | 14 +++++++++++++-
> >  hw/i386/pc_q35.c           | 13 ++++++++++++-
> >  hw/ppc/spapr.c             | 15 +++++++++++++--
> >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
> >  include/hw/boards.h        |  3 +++
> >  include/hw/i386/pc.h       |  3 +++
> >  9 files changed, 69 insertions(+), 6 deletions(-)  
> 
> I have a pending patch for arm for 6.1 which will need to update
> hw_compat_6_0[]. Does anybody mind if I take this patch via
> target-arm.next, or do you already have it queued for s390?
> (If so I'll just wait for it to hit master: the pending patch
> I have is not urgent.)

I have it on my s390-next branch locally, but nothing else so far. Feel
free to queue it yourself.


