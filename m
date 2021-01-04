Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1166B2E94AC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 13:23:34 +0100 (CET)
Received: from localhost ([::1]:48458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwOtZ-0000YM-2z
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 07:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwOsD-00088a-7x
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 07:22:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwOs6-0007XU-SP
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 07:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609762922;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=y0PKIlKJMF04r11E/ZYXIxOnJQ6TT02qvL8u/Pn4/QQ=;
 b=T+OT4fSilrOyqzsTeDFlUVQR4woVJHSJWM7GBqCkifPAUPuRaQY/wZcOQp+rtqNIxjPpVa
 9bR4FhmwAfGXEQMbYTIXmUNHolh1WGOa8GWE8z9PoRgZA8U1NpZNPGVY4PYvyujkNnsxQA
 KIOGLrsPbAcLMf7aG7qskLNQURtYMpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-jA0UobPpM_CT8L6jS-jYMQ-1; Mon, 04 Jan 2021 07:21:58 -0500
X-MC-Unique: jA0UobPpM_CT8L6jS-jYMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F577A0CA0;
 Mon,  4 Jan 2021 12:21:57 +0000 (UTC)
Received: from redhat.com (ovpn-114-43.ams2.redhat.com [10.36.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 289E85D9D3;
 Mon,  4 Jan 2021 12:21:51 +0000 (UTC)
Date: Mon, 4 Jan 2021 12:21:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
Message-ID: <20210104122149.GH640208@redhat.com>
References: <20210102125213.41279-1-r.bolshakov@yadro.com>
 <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 02, 2021 at 01:25:07PM +0000, Peter Maydell wrote:
> On Sat, 2 Jan 2021 at 12:54, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> >
> > crypto/tlscreds.h includes GnuTLS headers if CONFIG_GNUTLS is set, but
> > GNUTLS_CFLAGS, that describe include path, are not propagated
> > transitively to all users of crypto and build fails if GnuTLS headers
> > reside in non-standard directory (which is a case for homebrew on Apple
> > Silicon).
> >
> > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> 
> Ah, this is https://bugs.launchpad.net/qemu/+bug/1909256
> -- thanks for finding a fix.
> 
> > ---
> >  block/meson.build          | 2 +-
> >  io/meson.build             | 2 +-
> >  meson.build                | 5 +++--
> >  storage-daemon/meson.build | 2 +-
> >  tests/meson.build          | 6 +++---
> >  ui/meson.build             | 2 +-
> >  6 files changed, 10 insertions(+), 9 deletions(-)
> 
> > diff --git a/ui/meson.build b/ui/meson.build
> > index 013258a01c..e6655c94a6 100644
> > --- a/ui/meson.build
> > +++ b/ui/meson.build
> > @@ -29,7 +29,7 @@ vnc_ss.add(files(
> >    'vnc-ws.c',
> >    'vnc-jobs.c',
> >  ))
> > -vnc_ss.add(zlib, png, jpeg)
> > +vnc_ss.add(zlib, png, jpeg, gnutls)
> >  vnc_ss.add(when: sasl, if_true: files('vnc-auth-sasl.c'))
> >  softmmu_ss.add_all(when: vnc, if_true: vnc_ss)
> >  softmmu_ss.add(when: vnc, if_false: files('vnc-stubs.c'))
> 
> Question to Paolo -- it seems pretty fragile to have to explicitly
> list "these source files need these extra CFLAGS" in half a dozen
> meson.build files, because it's pretty non-obvious that adding
> eg '#include "block/nbd.h"' to a .c file means that you also
> need to update the meson.build file to say "and now it needs these
> extra CFLAGS". Isn't there some way we can just have the CFLAGS
> added more globally so that if we use gnutls.h directly or
> indirectly from more .c files in future it Just Works ?

The actual usage of gnutls should be confined to the crypto/ code.

The rest of QEMU should only ever be using QEMU's TLS abstractions
and not directly be tied to GNUTLS. So ideally the gnutls flags
should only ever be added in the crypto/meson.build, and anything
which depends on that should then get the flags indirectly.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


