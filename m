Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121B2527FD1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:39:06 +0200 (CEST)
Received: from localhost ([::1]:57746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqWFt-0007Go-5P
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqVwd-0006GY-8r
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nqVwa-0008Ub-3e
 for qemu-devel@nongnu.org; Mon, 16 May 2022 04:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652689146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZUylH/fvUFckp4Qv2lZt4M3qWan6n8s/PGwWpab+hs=;
 b=U+57GYc5nwzwFB9gNoxEV6ML0lEH5KuKXTD13C00IgE4c/ylKtm6IlgIe+zFIbwmmvb0rn
 5tMrm8ZIhdwZUe7BbMF9+7ZkDKNcMZ6rcCAtupLprx276kqDz09ehcQxrkfzYySzUFNas0
 y6bHA3n1z7Wfkkfcai58mkBGbbPpL28=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-lAjsnjFfPni_NmlJXNJa8Q-1; Mon, 16 May 2022 04:19:03 -0400
X-MC-Unique: lAjsnjFfPni_NmlJXNJa8Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso9997933wms.1
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 01:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=eZUylH/fvUFckp4Qv2lZt4M3qWan6n8s/PGwWpab+hs=;
 b=XYHSlSe4kesbcKwaMubW4jdMzctpaVhqRBQ7K8JYGtaocvLl21jBCidmzIL5IC3Fc+
 eGUzbJaDLgdD4nVqVWHCTbxaSFLsQcSqnbrnOsSqS5at55suyAhYVBWynJ0DpCGI5pgt
 rb7eHMBpcq5pStZDPh1YNarV5BvCXcYsgxwOF1APXj9H64PtbtbiSlNCW5mt6z5/Bcbt
 HCNvn2alEdPg8DQsPm3OxC7Wc7nD0rHYIFQVPllTG/KzSGF2WDdbXgJGN1Y3s+xpAm9m
 YafdLOtTBCTdkNxkklGoJtCklxjTEmR5tMX6o9qhU8FdsrZrfWN0lcYpANtu570JsbPU
 XV+Q==
X-Gm-Message-State: AOAM530P+JkL0hHtJOIAmnS1/jpuhe0QLzCrwsMEvSfgKqtZuZ2w1v3H
 Hd5lTCgUuoUP76Ccdg3miIRjB+LSxKRrz/mw3myBMl1blxnyinyD7eFQkLlY7PhgOACTA7RBDWh
 TT8MdJWVZZtAmhgo=
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr26574051wmq.139.1652689141936; 
 Mon, 16 May 2022 01:19:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuF9k2m7+pXc2mewLuFs8THJj0LJlvpG4k7TvzwvbUArvPy9p8LC2XRXHpAefcIFs8ma9j0w==
X-Received: by 2002:a05:600c:a4b:b0:37b:ea2b:5583 with SMTP id
 c11-20020a05600c0a4b00b0037bea2b5583mr26574035wmq.139.1652689141695; 
 Mon, 16 May 2022 01:19:01 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 v3-20020adf8b43000000b0020c5253d8c2sm8986824wra.14.2022.05.16.01.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 01:19:01 -0700 (PDT)
Date: Mon, 16 May 2022 09:18:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PULL 00/16] migration queue
Message-ID: <YoII85MMsmXvyECW@work-vm>
References: <20220510083355.92738-1-dgilbert@redhat.com>
 <Yno3RvWhwSDZjI7o@work-vm> <Yno8NV5bQPUlqvcx@redhat.com>
 <YnpB4vg2ozbBzUCg@work-vm>
 <CAJ6HWG5Mgaqt9dOVH-0-Y78x96HO5c-TevYeuN5xMvSQqj7W8Q@mail.gmail.com>
 <Ynt58gRnsNJBXzfg@work-vm>
 <CAJ6HWG5wiod4gJJi2-bMkLPECiow4bC-ux-szWL-0=p3edpTvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ6HWG5wiod4gJJi2-bMkLPECiow4bC-ux-szWL-0=p3edpTvg@mail.gmail.com>
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

* Leonardo Bras Soares Passos (leobras@redhat.com) wrote:
> On Wed, May 11, 2022 at 5:55 AM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Leonardo Bras Soares Passos (leobras@redhat.com) wrote:
> > > From a previous thread:
> > >
> > > On Thu, Apr 28, 2022 at 1:20 PM Dr. David Alan Gilbert
> > > <dgilbert@redhat.com> wrote:
> > > >
> > > > Leo:
> > > >   Unfortunately this is failing a couple of CI tests; the MSG_ZEROCOPY
> > > > one I guess is the simpler one; I think Stefanha managed to find the
> > > > liburing fix for the __kernel_timespec case, but that looks like a bit
> > > > more fun!
> > > >
> > > > Dave
> > >
> > > I thought Stefanha had fixed this bug, and we were just waiting for a
> > > new alpine rootfs/image with that fixed.
> > > Is that correct?
> > >
> > > On Tue, May 10, 2022 at 7:43 AM Dr. David Alan Gilbert
> > > <dgilbert@redhat.com> wrote:
> > > >
> > > > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > > > On Tue, May 10, 2022 at 10:58:30AM +0100, Dr. David Alan Gilbert wrote:
> > > [...]
> > > > >
> > > > > Yuk. That very much looks like a bug in liburing itself to me.
> > > > >
> > > > >
> > > > > We've exposed the latent bug by including linux/errqueue.h
> > > >
> > > > Yes, I think there was a thread after the 1st pull where Leo identified
> > > > the patch that fixed it; but it's not in that image.
> > >
> > > I only fixed the MSG_ZEROCOPY missing define bug, as I got that
> > > Stefanha had already fixed the issue in liburing/alpine.
> > >
> > > questions:
> > > - Has Stefanha really fixed that, and we are just waiting for a new
> > > image, or have I got that wrong?
> > > - How should I proceed with that?
> > >
> > > - If we proceed with fixing this up in alpine, will that require this
> > > patchset to be on pause until it's fixed there?
> >
> > It needs to pass in CI; so yes.
> >
> > > - If so, is there any suggestion on how to fix that in qemu code?
> > > (this header is needed because of SO_EE_* defines)
> >
> > I've not actually looked at the detail of the failure; but yes I think
> > we need a qemu workaround here.
> >
> > If there's no simple fix, then adding a test to meson.build to
> > conditionally disable liburing might be best; like the test code for
> > libcap_ng I guess (search in meson.build for libcap_ng.found  at around
> > line 540.
> 
> Hello Dave,
> 
> I solved this issue by doing this:
> 
> +linux_io_uring_test = '''
> +  #include <liburing.h>
> +  #include <linux/errqueue.h>
> +
> +  int main(void) { return 0; }'''
> +
>  linux_io_uring = not_found
>  if not get_option('linux_io_uring').auto() or have_block
>    linux_io_uring = dependency('liburing', version: '>=0.3',
>                                required: get_option('linux_io_uring'),
>                                method: 'pkg-config', kwargs: static_kwargs)
> +  if not cc.links(linux_io_uring_test)
> +    linux_io_uring = not_found
> +  endif
>  endif
> +
> 
> Seems to work fine in CI, and now Alpine does not fail anymore.
> (See pipeline https://gitlab.com/LeoBras/qemu/-/pipelines/538123933
> for reference)
> 
> I am not sure if this is the right thing to do, but I will be sending
> it as a full new patchset (v13), with the first patch being the one
> with the above change and the rest just carrying the recommended
> fixes.

Thanks! That looks promising.  I'll cook a new pull.

> I was also thinking I could instead send the single "fix" patch, and
> recommend adding it before my v12. If that is the correct approach for
> this case, please let me know so I can improve in the future. (I am
> trying to figure out what is simpler/best for maintainers)

Either way would be fine; the full series is probably better.

Dave

> Best regards,
> Leo
> 
> 
> 
> 
> 
> 
> 
> >
> > Dave
> >
> > > Thank you all!
> > >
> > > Best regards,
> > > Leo
> > >
> > > >
> > > > Dave
> > > >
> > > > > With regards,
> > > > > Daniel
> > > > > --
> > > > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > > > > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > > > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > > > >
> > > > --
> > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > >
> > >
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


