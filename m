Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB35406744
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 08:37:27 +0200 (CEST)
Received: from localhost ([::1]:41596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOaA9-0001Gk-Le
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 02:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mOa8x-0000Gq-Co
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:36:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mOa8u-0002oz-8X
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 02:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631255767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TyRrKd79pxxG9O9JWOFZJMSQEr/3duIIohVMkTV5WPA=;
 b=aPzGJynf51TKp0RI7F4aAg6NzZcsK3ERMnYjfe0btkhHehq2dHAu2Ts59/aUlMt15Dsc6u
 zAj/xVySXY7a7vJu0iJpthNG+ulZdC5NL5ZAPO/nwNSVVUADgRSqf5zyDz2O/LRF4mVpX6
 RyKKJVVb+EF7yom359r3tix7tTDAnQU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-2zaxc9pAP-Gmufg33Paj3A-1; Fri, 10 Sep 2021 02:35:59 -0400
X-MC-Unique: 2zaxc9pAP-Gmufg33Paj3A-1
Received: by mail-ed1-f71.google.com with SMTP id
 g17-20020a056402425100b003cd5ba2852fso392202edb.1
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 23:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TyRrKd79pxxG9O9JWOFZJMSQEr/3duIIohVMkTV5WPA=;
 b=tPaib8a1nJVPxIwLyCgKxhd7W/Ciisp3rkxJd7AzUwMgJR7loy3mZ+KNuTSaHw391w
 69NBg8+sb8Sgf7FfWrSe/f0toVQIy9kxoCunFb3wexBp3npgWSx5qxYdptmGYjlhy1Zm
 wy0SUco2OPCRodU8WDLYbmagl9RrPlk3KnPl1rVVuFo5xZatsf4QCOLCi864ArsKjM8d
 ZDERjj5Fo59u0YjUkbSzqqULqfBJxs8JITLbZKv5gWh3IY8qAYXxzqRNMdwK+JoapWzt
 2HavxS0KKYk3fHCzEtsMONW6YjdfGElEdqM8YO4Yw0Sq2Uee7HrxsETfYBtXpMnwRffp
 onfQ==
X-Gm-Message-State: AOAM532muP4y7j4Mj8iySjj6pG4/czWLLRLwT4dsSLFn3WF2wX9Pyn4Z
 4trlpbyFFFqusWdSqQlMmR4oTYugFXaI/HMI3NFTADxsbe5ZgYTQUs2V3qKw6OgoTTPvfzkNBF2
 +TWuuE6iSPvIjzks=
X-Received: by 2002:a05:6402:1855:: with SMTP id
 v21mr7433139edy.349.1631255757464; 
 Thu, 09 Sep 2021 23:35:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRExtwPWxGWBk5fhlBEJNQ30zHGiphLgGJnRDf+Ji5sOp5ommNePqW0qg7Q1bQRmu1oMabNg==
X-Received: by 2002:a05:6402:1855:: with SMTP id
 v21mr7433115edy.349.1631255757260; 
 Thu, 09 Sep 2021 23:35:57 -0700 (PDT)
Received: from redhat.com ([2.55.145.189])
 by smtp.gmail.com with ESMTPSA id i13sm2024644edc.48.2021.09.09.23.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Sep 2021 23:35:56 -0700 (PDT)
Date: Fri, 10 Sep 2021 02:35:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] vhost-vsock: fix migration issue when seqpacket is
 supported
Message-ID: <20210909063623-mutt-send-email-mst@kernel.org>
References: <20210907124935.147164-1-sgarzare@redhat.com>
 <YTdnkPR+LjNFXaeQ@redhat.com>
 <20210909044603-mutt-send-email-mst@kernel.org>
 <YTnNlEz+0LohJHRG@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTnNlEz+0LohJHRG@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Jiang Wang <jiang.wang@bytedance.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 10:02:12AM +0100, Daniel P. Berrangé wrote:
> On Thu, Sep 09, 2021 at 04:47:42AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Sep 07, 2021 at 02:22:24PM +0100, Daniel P. Berrangé wrote:
> > > On Tue, Sep 07, 2021 at 02:49:35PM +0200, Stefano Garzarella wrote:
> > > > Commit 1e08fd0a46 ("vhost-vsock: SOCK_SEQPACKET feature bit support")
> > > > enabled the SEQPACKET feature bit.
> > > > This commit is released with QEMU 6.1, so if we try to migrate a VM where
> > > > the host kernel supports SEQPACKET but machine type version is less than
> > > > 6.1, we get the following errors:
> > > > 
> > > >     Features 0x130000002 unsupported. Allowed features: 0x179000000
> > > >     Failed to load virtio-vhost_vsock:virtio
> > > >     error while loading state for instance 0x0 of device '0000:00:05.0/virtio-vhost_vsock'
> > > >     load of migration failed: Operation not permitted
> > > > 
> > > > Let's disable the feature bit for machine types < 6.1, adding a
> > > > `features` field to VHostVSock to simplify the handling of upcoming
> > > > features we will support.
> > > 
> > > IIUC, this will still leave migration broken for anyone migrating
> > > a >= 6.1 machine type between a kernel that supports SEQPACKET and
> > > a kernel lacking that, or vica-verca.  
> > > 
> > > If a feature is dependant on a host kernel feature we can't turn
> > > that on automatically as part of the machine type, as we need
> > > ABI stability across migration indepdant of kernel version.
> > > 
> > > 
> > > Regards,
> > > Daniel
> > 
> > This is a fundamental problem we have with kernel accelerators.
> > A higher level solution at management level is needed.
> > For now yes, we do turn features on by default,
> > consistent kernels on source and destination are assumed.
> > For downstreams not a problem at all as they update
> > userspace and kernel in concert.
> 
> Even downstream in RHEL that is not actually valid anymore. Container
> based deployment has killed any assumptions that can be made in this
> respect. Even if the userspace and kernel are updated in lockstep in
> a particular RHEL release, you cannot assume the running environment
> will have a matched pair.
> 
> Users can be running QEMU userspace from RHEL-8.5 inside a container
> that has been deployed on a host using a 8.3 kernel. We've even had
> cases of running QEMU from RHEL-8, on a RHEL-7 host.
> 
> Regards,
> Daniel

Is there finally an interest in addressing this then?  This would
involve collecting host features across a cluster and for each host
figuring out a configuration that works for migration. IIRC a tool was
proposed for the task (to live alongside e.g. qemu-img).

As long as we just stick to the machine type the best we can do is
probably to keep doing what we do now (hope that the two host kernels
are more or less consistent) as otherwise we'd have to never enable any
new features in vsock.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


