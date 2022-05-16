Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BBC528434
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:29:54 +0200 (CEST)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZrF-0000aY-4j
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqYvf-0006Zx-Gx
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:30:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqYvd-0006gr-A6
 for qemu-devel@nongnu.org; Mon, 16 May 2022 07:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652700620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SV3L3QRaOo/yfmqVMS+gd3jmCo9XcnD3zPxOTyyRTrU=;
 b=b9vZqeajjk8GmsBCGwFekOmg6cAa2zgZ47eVHDnoRD/QJN7w0aRcDw9g6im6edTaXzoBpK
 w1u7BBbK3Bgz6GcusltIh9amEJMqSTefT6ZvlUsATYRN4x0bnCgh0DG/LQ0JKWD3+EHZoo
 X/ufOawV1UVeHLSBIIjRZF6FajY4l6U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-FlOzGzr5NfCnQi874WHHkg-1; Mon, 16 May 2022 07:30:19 -0400
X-MC-Unique: FlOzGzr5NfCnQi874WHHkg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso2178680wma.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 04:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SV3L3QRaOo/yfmqVMS+gd3jmCo9XcnD3zPxOTyyRTrU=;
 b=BZja/TgffH6jx4aFpNRWh0ndPdcvqBKMJbqDXha81Rg811KsyYz7SHQAXJ7zZXOEKF
 KGwUxTzEeJDvlH3BaHdEJLcgagtdFxt33Z5t0eJ6EhzQKhDyttTH6TITkyiAE2xTMoqG
 CZp10kibRHHziISaaYNabXPBpODxhEsbm7eEuOF+tDTPZhQnIEoOLBvMcjppfgPpaM5k
 HI+8e1sLaHab+7d5iLIWCJ8hk6sU9j6/sZywi4LFtsB9aWEjMEYACSoJllHQ0QW/8P3l
 q8opT64HFV7NPtfly3PJtvpGxSp44lfURnkLIeCijpK1Tjpet78ZLV41pAbouB4NaKGQ
 L+sw==
X-Gm-Message-State: AOAM531Sthr26rUF7XN4PvijaK8RlIyCyyBoONwrnKEW+BLD6EzvVu8k
 +h3h13Zz6pTdYCQ+A68qq/jN7FKjuPaMLggM++1DTLY3Hw7BrK3/GHbRAduKv1JIXWdHVAUfBzE
 aprzzVvi9JRj0G7g=
X-Received: by 2002:a5d:6c64:0:b0:20d:599:ac5 with SMTP id
 r4-20020a5d6c64000000b0020d05990ac5mr5460619wrz.188.1652700618362; 
 Mon, 16 May 2022 04:30:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5aTtl3y8UUOe9M0SpcC0/XujwhcEBevVHWoslTc9Gw3BX6g4hr8Jl8TujO0u8WYJfBI2Iaw==
X-Received: by 2002:a5d:6c64:0:b0:20d:599:ac5 with SMTP id
 r4-20020a5d6c64000000b0020d05990ac5mr5460584wrz.188.1652700618040; 
 Mon, 16 May 2022 04:30:18 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 v23-20020adfa1d7000000b0020d09f0b766sm2475106wrv.71.2022.05.16.04.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 04:30:17 -0700 (PDT)
Date: Mon, 16 May 2022 12:30:15 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH v13 1/8] meson.build: Fix docker-test-build@alpine when
 including linux/errqueue.h
Message-ID: <YoI1x7PNtnuAAPr4@work-vm>
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-2-leobras@redhat.com>
 <YoIxzC88w+jQlqoG@work-vm> <YoIyzi1PRYotgOyC@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YoIyzi1PRYotgOyC@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Mon, May 16, 2022 at 12:13:16PM +0100, Dr. David Alan Gilbert wrote:
> > * Leonardo Bras (leobras@redhat.com) wrote:
> > > A build error happens in alpine CI when linux/errqueue.h is included
> > > in io/channel-socket.c, due to redefining of 'struct __kernel_timespec':
> > 
> > OK, looks to be same mechanism as other meson tests.
> 
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> As of about an hour or so ago, this patch should not be required.
> 
>   https://gitlab.alpinelinux.org/alpine/aports/-/issues/13813

I'll take it anyway as protection against any other broken build envs.

Dave

> > 
> > > ===
> > > ninja: job failed: [...]
> > > In file included from /usr/include/linux/errqueue.h:6,
> > >                  from ../io/channel-socket.c:29:
> > > /usr/include/linux/time_types.h:7:8: error: redefinition of 'struct __kernel_timespec'
> > >     7 | struct __kernel_timespec {
> > >       |        ^~~~~~~~~~~~~~~~~
> > > In file included from /usr/include/liburing.h:19,
> > >                  from /builds/user/qemu/include/block/aio.h:18,
> > >                  from /builds/user/qemu/include/io/channel.h:26,
> > >                  from /builds/user/qemu/include/io/channel-socket.h:24,
> > >                  from ../io/channel-socket.c:24:
> > > /usr/include/liburing/compat.h:9:8: note: originally defined here
> > >     9 | struct __kernel_timespec {
> > >       |        ^~~~~~~~~~~~~~~~~
> > > ninja: subcommand failed
> > > ===
> > > 
> > > As above error message suggests, 'struct __kernel_timespec' was already
> > > defined by liburing/compat.h.
> > > 
> > > Fix alpine CI by adding test to disable liburing in configure step if a
> > > redefinition happens between linux/errqueue.h and liburing/compat.h.
> > > 
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > ---
> > >  meson.build | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/meson.build b/meson.build
> > > index 9b20dcd143..a996690c9b 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -515,12 +515,23 @@ if not get_option('linux_aio').auto() or have_block
> > >                             required: get_option('linux_aio'),
> > >                             kwargs: static_kwargs)
> > >  endif
> > > +
> > > +linux_io_uring_test = '''
> > > +  #include <liburing.h>
> > > +  #include <linux/errqueue.h>
> > > +
> > > +  int main(void) { return 0; }'''
> > > +
> > >  linux_io_uring = not_found
> > >  if not get_option('linux_io_uring').auto() or have_block
> > >    linux_io_uring = dependency('liburing', version: '>=0.3',
> > >                                required: get_option('linux_io_uring'),
> > >                                method: 'pkg-config', kwargs: static_kwargs)
> > > +  if not cc.links(linux_io_uring_test)
> > > +    linux_io_uring = not_found
> > > +  endif
> > >  endif
> > > +
> > >  libnfs = not_found
> > >  if not get_option('libnfs').auto() or have_block
> > >    libnfs = dependency('libnfs', version: '>=1.9.3',
> > > -- 
> > > 2.36.1
> > > 
> > > 
> > -- 
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


