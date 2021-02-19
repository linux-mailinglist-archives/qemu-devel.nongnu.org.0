Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F29231FDBB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:16:15 +0100 (CET)
Received: from localhost ([::1]:35158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9O2-00034G-MR
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lD9A7-0007eu-M2
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:01:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lD9A3-0002i4-He
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613754106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjwwtAsVD/JnN2nQ/Si6tomWGTx+UGpsB+TxSF2edSE=;
 b=ig/nav5DhRtWRDUWZsfkxIDbrNIew6NOtCgjapm6Xl2eBbRgi5GkSiKAL89ALLS7SGWlsJ
 2oPxbs/bdEkoAPGC8zdwJiVwL3eT7h9h//Pmc/PBhHvvWNAm18FXCktFijY8uC7eXZ/Gk+
 P3m65L7fCgGgmRoxJNv44G9gCrQqC2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-ETymYVXeMtmbNndrU_wLiw-1; Fri, 19 Feb 2021 12:01:37 -0500
X-MC-Unique: ETymYVXeMtmbNndrU_wLiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 756F4814279;
 Fri, 19 Feb 2021 17:01:36 +0000 (UTC)
Received: from gondolin (ovpn-113-92.ams2.redhat.com [10.36.113.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DDDA5C1BB;
 Fri, 19 Feb 2021 17:01:31 +0000 (UTC)
Date: Fri, 19 Feb 2021 18:01:29 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH] virtio-ccw: commands on revision-less devices
Message-ID: <20210219180129.00350816.cohuck@redhat.com>
In-Reply-To: <20210219122136.5d97e0bf.cohuck@redhat.com>
References: <20210216111830.1087847-1-cohuck@redhat.com>
 <20210219122136.5d97e0bf.cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 12:21:36 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, 16 Feb 2021 12:18:30 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > The virtio standard specifies that any non-transitional device must
> > reject commands prior to revision setting (which we do) and else
> > assume revision 0 (legacy) if the driver sends a non-revision-setting
> > command first. We neglected to do the latter.
> > 
> > Fortunately, nearly everything worked as intended anyway; the only
> > problem was not properly rejecting revision setting after some other
> > command had been issued. Easy to fix by setting revision to 0 if
> > we see a non-revision command on a legacy-capable revision-less
> > device.
> > 
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >  hw/s390x/virtio-ccw.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)  
> 
> I now have:
> 
> Author: Cornelia Huck <cohuck@redhat.com>
> Date:   Tue Feb 16 12:18:30 2021 +0100
> 
>     virtio-ccw: commands on revision-less devices
>     
>     The virtio standard specifies that any non-transitional device must
>     reject commands prior to revision setting (which we do). Devices
>     that are transitional need to assume revision 0 (legacy) if the
>     driver sends a non-revision-setting command first in order to
>     support legacy drivers. We neglected to do the latter.
>     
>     Fortunately, nearly everything worked as intended anyway; the only
>     problem was not properly rejecting revision setting after some other
>     command had been issued. Easy to fix by setting revision to 0 if
>     we see a non-revision command on a legacy-capable revision-less
>     device.
>     
>     Found by code inspection, not observed in the wild.
>     
>     Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>     Reviewed-by: Thomas Huth <thuth@redhat.com>
>     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>     Acked-by: Halil Pasic <pasic@linux.ibm.com>
>     Message-Id: <20210216111830.1087847-1-cohuck@redhat.com>
> 
> Any objections?

Queued now with this description.


