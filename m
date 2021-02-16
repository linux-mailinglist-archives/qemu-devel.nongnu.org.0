Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DFE31CA32
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:53:01 +0100 (CET)
Received: from localhost ([::1]:58238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByua-00035j-Sq
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lBytg-0002fu-Gb
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:52:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lBytf-0001SJ-3Y
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613476322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CgLnDCnoZwgqvOROCHOsMIbY+Gn/cI5oI0ov7soiR8Y=;
 b=Lc4r2TH4zIAQMX/HxgwLMknDOPAOeArwKy0ZbPT6r8LlF2vPURbmBXKfCeAeuMalY/C251
 bJb6eS5Xu+Joy1P4jJSxQiWonws63o98EpQ77NsGkboyuEwhpvXQbzha689i48OJXILII/
 AvrsDFHsHeFv5CJyscXZiQ25ozVr7RY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-rq2xS1_mOeWWzWXu6qt24w-1; Tue, 16 Feb 2021 06:51:58 -0500
X-MC-Unique: rq2xS1_mOeWWzWXu6qt24w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13AF580403B;
 Tue, 16 Feb 2021 11:51:57 +0000 (UTC)
Received: from gondolin (ovpn-113-145.ams2.redhat.com [10.36.113.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB34A1002382;
 Tue, 16 Feb 2021 11:51:52 +0000 (UTC)
Date: Tue, 16 Feb 2021 12:51:50 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] virtio-ccw: commands on revision-less devices
Message-ID: <20210216125150.5cce488d.cohuck@redhat.com>
In-Reply-To: <20210216064013-mutt-send-email-mst@kernel.org>
References: <20210216111830.1087847-1-cohuck@redhat.com>
 <20210216064013-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 06:40:41 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Tue, Feb 16, 2021 at 12:18:30PM +0100, Cornelia Huck wrote:
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
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Feel free to merge.
> 
> Curious how was this discovered.

Code reading :)

I have not seen any errors in the wild.


