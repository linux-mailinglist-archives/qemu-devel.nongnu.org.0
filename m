Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB736ED77
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 17:34:23 +0200 (CEST)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc8gI-0004Ss-0A
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 11:34:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lc8e0-0003uN-16
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:32:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1lc8dw-0006S4-1f
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619710308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VaPoerpVO1NeuTYoTqiT9olm+bbYFth6/cdJ2kgJiSo=;
 b=DF5/EHWDB5ffvqJTCRl3OLwuSk+DZ3fN5J5JXPESsjFU1l4W+oHAQzkxF6Qexv3gpj9HNy
 /4+aCS1q//+gAtutLO6Pfkb/ybE9Zg+QsrTdGG75Z9JY91NymJyS601PdgvoR904nTTofB
 tGssLTPtF1mrD9Dhxr+/zoDolWg7Cwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-Pfagu8vFPceyPgMlDhPBDg-1; Thu, 29 Apr 2021 11:31:45 -0400
X-MC-Unique: Pfagu8vFPceyPgMlDhPBDg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B0321008064;
 Thu, 29 Apr 2021 15:31:43 +0000 (UTC)
Received: from localhost (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06E9860936;
 Thu, 29 Apr 2021 15:31:41 +0000 (UTC)
Date: Thu, 29 Apr 2021 16:31:41 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [ANNOUNCE] libblkio v0.1.0 preview release
Message-ID: <20210429153141.GW26415@redhat.com>
References: <YIq9PpAd6nP9XTmz@stefanha-x1.localdomain>
 <20210429142259.GR26415@redhat.com>
 <YIrFmZgh5IAeiLdm@stefanha-x1.localdomain>
 <20210429150038.GT26415@redhat.com> <YIrL5kE+0ULVN2lK@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YIrL5kE+0ULVN2lK@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Alberto Garcia <berto@igalia.com>, slp@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 mreitz@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 philmd@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 04:08:22PM +0100, Daniel P. Berrangé wrote:
> On Thu, Apr 29, 2021 at 04:00:38PM +0100, Richard W.M. Jones wrote:
> > On Thu, Apr 29, 2021 at 03:41:29PM +0100, Stefan Hajnoczi wrote:
> > > On Thu, Apr 29, 2021 at 03:22:59PM +0100, Richard W.M. Jones wrote:
> > > > On Thu, Apr 29, 2021 at 03:05:50PM +0100, Stefan Hajnoczi wrote:
> > > > > The purpose of this preview release is to discuss both the API design
> > > > > and general direction of the project. API documentation is available
> > > > > here:
> > > > > 
> > > > >   https://gitlab.com/libblkio/libblkio/-/blob/v0.1.0/docs/blkio.rst
> > > > 
> > > > libvirt originally, and now libnbd, keep a per-thread error message
> > > > (stored in thread-local storage).  It's a lot nicer than having to
> > > > pass &errmsg to every function.  You can just write:
> > > > 
> > > >  if (nbd_connect_tcp (nbd, "remote", "nbd") == -1) {
> > > >    fprintf (stderr,
> > > >             "failed to connect to remote server: %s (errno = %d)\n",
> > > >             nbd_get_error (), nbd_get_errno ());
> > > >    exit (EXIT_FAILURE);
> > > >  }
> > > > 
> > > > (https://libguestfs.org/libnbd.3.html#ERROR-HANDLING)
> > > > 
> > > > It means you can extend the range of error information available in
> > > > future.  Also you can return a 'const char *' and the application
> > > > doesn't have to worry about lifetimes, at least in the common case.
> > > 
> > > Thanks for sharing the idea, I think it would work well for libblkio
> > > too.
> > > 
> > > Do you ignore the dlclose(3) memory leak?
> > 
> > I believe this mechanism in libnbd ensures there is no leak in the
> > ordinary shared library (not dlopen/dlclose) case:
> > 
> > https://gitlab.com/nbdkit/libnbd/-/blob/f9257a9fdc68706a4079deb4ced61e1d468f28d6/lib/errors.c#L35
> > 
> > However I'm not sure what happens in the dlopen case, so I'm going to
> > test that out now ...
> 
> pthread_key destructors are a disaster waiting to happen with
> dlclose, if the dlclose happens while non-main threads are
> still running. When those threads exit, they'll run the
> destructor which points to a function that is no longer
> resident in memory.
> 
> IOW if you have destrutors, then you need to make sure your
> library uses "-z nodelete" when linking, to turn dlclose()
> into a no-op.

I suspect letting the string leak is a better idea for libnbd.

Still trying to write a nice reproducer ..

Rich.

>   commit 8e44e5593eb9b89fbc0b54fde15f130707a0d81e
>   Author: Daniel P. Berrangé <berrange@redhat.com>
>   Date:   Thu Sep 1 17:57:06 2011 +0100
> 
>     Prevent crash from dlclose() of libvirt.so
>     
>     When libvirt calls virInitialize it creates a thread local
>     for the virErrorPtr storage, and registers a callback to
>     cleanup memory when a thread exits. When libvirt is dlclose()d
>     or otherwise made non-resident, the callback function is
>     removed from memory, but the thread local may still exist
>     and if a thread later exists, it will invoke the callback
>     and SEGV. There may also be other thread locals with callbacks
>     pointing to libvirt code, so it is in general never safe to
>     unload libvirt.so from memory once initialized.
>     
>     To allow dlclose() to succeed, but keep libvirt.so resident
>     in memory, link with '-z nodelete'. This issue was first
>     found with the libvirt CIM provider, but can potentially
>     hit many of the dynamic language bindings which all ultimately
>     involve dlopen() in some way, either on libvirt.so itself,
>     or on the glue code for the binding which in turns links
>     to libvirt
> 
> 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


