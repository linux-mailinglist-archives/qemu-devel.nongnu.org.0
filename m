Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566CB31B6F7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:20:55 +0100 (CET)
Received: from localhost ([::1]:45632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBazt-00075d-NI
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBayh-0006P5-0s
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:19:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBayc-0003vb-GX
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:19:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613384371;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mdAN1to1fpQoEz/7lAhoZGUfYUymiINLr+2fUfAes/M=;
 b=ILHlNL6llvR0KyGK3gunqrK6h2+qqYe6uOUddFjcxxW1k0QRLbsal+LqIWeDq6oeMzxqV4
 jnLcZ+MhnzphW8t/8drR+ImhsTgzcPZzTb95A9uVtawWElKyaCcfLdzxT7i1mPWgKykaJe
 egc1MDKrSuGZ7cjV7cFuMaT2oAA2DG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-3evTs4vbPBO7d_56J4aj2w-1; Mon, 15 Feb 2021 05:19:21 -0500
X-MC-Unique: 3evTs4vbPBO7d_56J4aj2w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A1D2100CCC4;
 Mon, 15 Feb 2021 10:19:20 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E00666A16;
 Mon, 15 Feb 2021 10:19:14 +0000 (UTC)
Date: Mon, 15 Feb 2021 10:19:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH V2 1/7] block/rbd: bump librbd requirement to luminous
 release
Message-ID: <20210215101911.GA1542881@redhat.com>
References: <20210126112540.11880-1-pl@kamp.de>
 <20210126112540.11880-2-pl@kamp.de>
 <20210215101123.GC7226@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20210215101123.GC7226@merkur.fritz.box>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, Peter Lieven <pl@kamp.de>,
 ct@flyingcircus.io, mreitz@redhat.com, pbonzini@redhat.com,
 dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 11:11:23AM +0100, Kevin Wolf wrote:
> Am 26.01.2021 um 12:25 hat Peter Lieven geschrieben:
> > even luminous (version 12.2) is unmaintained for over 3 years now.
> > Bump the requirement to get rid of the ifdef'ry in the code.
> > 
> > Signed-off-by: Peter Lieven <pl@kamp.de>
> 
> > diff --git a/meson.build b/meson.build
> > index 5943aa8a51..02d263ad33 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -691,19 +691,24 @@ if not get_option('rbd').auto() or have_block
> >                             required: get_option('rbd'),
> >                             kwargs: static_kwargs)
> >    if librados.found() and librbd.found()
> > -    if cc.links('''
> > +    result = cc.run('''
> 
> Doesn't running compiled binaries break cross compilation?
> 
> >        #include <stdio.h>
> >        #include <rbd/librbd.h>
> >        int main(void) {
> >          rados_t cluster;
> >          rados_create(&cluster, NULL);
> > +        rados_shutdown(cluster);
> > +        #if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 12, 0)
> > +        return 1;
> > +        #endif
> >          return 0;
> 
> Would #error achieve what you want without running the binary?
> 
> But most, if not all, other version checks use pkg-config instead of
> trying to compile code, so that's probably what we should be doing here,
> too.

Yep, for something that is merely a version number check there's no
need to compile anything. pkg-config can just validate the version
straightup.

> 
> > -      }''', dependencies: [librbd, librados])
> > +    }''', dependencies: [librbd, librados], name: 'librbd version check')
> > +    if result.compiled() and result.returncode() == 0
> >        rbd = declare_dependency(dependencies: [librbd, librados])
> >      elif get_option('rbd').enabled()
> > -      error('could not link librados')
> > +      error('librados/librbd >= 12.0.0 required')
> >      else
> > -      warning('could not link librados, disabling')
> > +      warning('librados/librbd >= 12.0.0 not found, disabling rbd support')
> >      endif
> >    endif
> >  endif

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


