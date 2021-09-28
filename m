Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EAE41AE51
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:58:43 +0200 (CEST)
Received: from localhost ([::1]:36670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVBkw-0007Nn-8B
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVBjb-0006eu-38
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVBjZ-0001an-4j
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632830236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ypo1w9GGKlP4+VSquLf83Z1RRRxwelttMUW/+yNsSos=;
 b=J1QTCL1/D+4g03KkUL4t2vp1DMdhphLD6563f29lc57M/js4oJcnCFvAAvWJ/vxrUC3uLs
 FZ8J2J5J9uAAzOQQZKCtrboadOmqHR2lOGU2senwGavug6k/t0Zaam3ZSCNY63m27pPQBL
 HsC1Gn8rUtWa2YV2sWq1IyP/dhhObxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-_-M5fkOwPF632e0WoX0B0g-1; Tue, 28 Sep 2021 07:57:13 -0400
X-MC-Unique: _-M5fkOwPF632e0WoX0B0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C1C4835DE1;
 Tue, 28 Sep 2021 11:57:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01A0E5C3E0;
 Tue, 28 Sep 2021 11:57:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 060D718003B6; Tue, 28 Sep 2021 13:56:59 +0200 (CEST)
Date: Tue, 28 Sep 2021 13:56:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Subject: Re: [PATCH 1/1] virtio-gpu: CONTEXT_INIT feature
Message-ID: <20210928115659.khoadnhe56goixpv@sirius.home.kraxel.org>
References: <20210927144840.3661593-1-antonio.caggiano@collabora.com>
 <20210927144840.3661593-2-antonio.caggiano@collabora.com>
 <20210928051358.qlyssfoyrslm7544@sirius.home.kraxel.org>
 <fd389acb-1055-acf0-5d9c-1ab3857fe906@collabora.com>
MIME-Version: 1.0
In-Reply-To: <fd389acb-1055-acf0-5d9c-1ab3857fe906@collabora.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > This needs a config option, simliar to the other features.  It is a
> > guest-visible change so we must be able to turn it off for live
> > migration compatibility reasons.  We also need a compat property to
> > turn it off by default for 6.1 + older machine types.
> 
> Could you give me a hint on how to add this compat property?

No need to do that for now, see below.  But "git log" or "git blame"
should find the patches doing the same for the other features).

> > > +    if (cc.context_init) {
> > > +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> > > +                                                 cc.context_init,
> > > +                                                 cc.nlen,
> > > +                                                 cc.debug_name);
> > 
> > This requires a minimum virglrenderer version I guess?
> 
> Definitely, that is going to be >= 0.9.0

... because we can hardly enable that by default if it isn't even
released.  We'll need #ifdefs so qemu continues to build with older
virglrenderer versions for a while.  It also must stay disabled by
default so you don't get different qemu behavior depending on the
version compiled against.

Then, in 1-2 years, when distributions have picked up the new version,
we can consider to raise the minimal required version to 0.9.0 and flip
the default to enabled.

> > > --- a/include/standard-headers/linux/virtio_gpu.h
> > > +++ b/include/standard-headers/linux/virtio_gpu.h
> > 
> > Separate patch please.
> > Also use scripts/update-linux-headers.sh for this.
> Well, then I believe we will need to wait for this patch series:
> 
> https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg367531.html

Ah, right.  Too much stuff on my todo list :(

take care,
  Gerd


