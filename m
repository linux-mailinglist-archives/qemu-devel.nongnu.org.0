Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BB1525B96
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 08:33:55 +0200 (CEST)
Received: from localhost ([::1]:55122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npOs5-0007e5-O8
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 02:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1npOmm-0006Zr-15
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:28:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1npOmi-0000Ud-DS
 for qemu-devel@nongnu.org; Fri, 13 May 2022 02:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652423298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8An3TqTH7nB8a6sa25GCXU9zMgBK0s1n1SAED2VqBU=;
 b=JAXdb7Sl+u5ppgs8Y0X9NhHphZxm8V7o5p9qpwCd62s1ip5bt2xXpxaWOHm5BoSS07j3X3
 lIdLO7eBsLIANexcArTFNIpQ1HMN9E4VdNt6Uc+YakHkH1EGx+K8kUpO6Kh+UVI7FMcQgA
 ydhk1zMdMJT6RnKeIptm+8BABnCwf8I=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-1BILYin8OUmpr8L96T3q0A-1; Fri, 13 May 2022 02:28:17 -0400
X-MC-Unique: 1BILYin8OUmpr8L96T3q0A-1
Received: by mail-ej1-f72.google.com with SMTP id
 i14-20020a17090639ce00b006dabe6a112fso3632144eje.13
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 23:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h8An3TqTH7nB8a6sa25GCXU9zMgBK0s1n1SAED2VqBU=;
 b=ig1esRvBzUCG70Uha7EwUcpXp7aTpMb7Li5eCaLp2kh+AsjBZBFxodg1A99Mt0zWlR
 Hls4Y3tSkQfku3bvRU4iOnXFKohAfeGn9cJlX7XAfS3cb1aHEBz7LrxcGT2DOvPskUWJ
 rk3kXhwqujdZwafKKHBNYa9QesclOpGqL4+wksiF4EJ3x+OybBcHr1aNiw1/n2nxQkiG
 5gTglqWzAKdqmUgR9iX7uzbHHIq5OlJtMtJRBwGS/qDrLsUkqs/pGR2M82R/XDk+rqRG
 EbWw5Iqfq3ruCLk2R3c6ru0+h1LnBKuuZg7s7uWJ2xYlqIq3NltcC7CwbKGN2/SGOIdH
 OWGA==
X-Gm-Message-State: AOAM533gZG5LreD1wQCtNzS1DR4z8Mo+BTsO/LIsrSoohBRRK6KHye6J
 bZ6ThsgIU8oeZDM+OhriH0jjjNdU5HQn90gh+qGYmMjIXkf0lfCLRuoKubTvPmlfhvACStMSNmz
 4wfhpFgmKM6jlJSCSZQe47wYclVHpy5M=
X-Received: by 2002:a17:907:e8e:b0:6f4:64aa:5813 with SMTP id
 ho14-20020a1709070e8e00b006f464aa5813mr2932539ejc.648.1652423295943; 
 Thu, 12 May 2022 23:28:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmbWcyoB/sdy+T9LM+rqiUJyi4anc8AgCC5GPUFUH9JqMLMyGl2Kz/eJItesjh3SFEpNeqxKZU9YXA7oq58Dg=
X-Received: by 2002:a17:907:e8e:b0:6f4:64aa:5813 with SMTP id
 ho14-20020a1709070e8e00b006f464aa5813mr2932524ejc.648.1652423295708; Thu, 12
 May 2022 23:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220510083355.92738-1-dgilbert@redhat.com>
 <Yno3RvWhwSDZjI7o@work-vm>
 <Yno8NV5bQPUlqvcx@redhat.com> <YnpB4vg2ozbBzUCg@work-vm>
 <CAJ6HWG5Mgaqt9dOVH-0-Y78x96HO5c-TevYeuN5xMvSQqj7W8Q@mail.gmail.com>
 <Ynt58gRnsNJBXzfg@work-vm>
In-Reply-To: <Ynt58gRnsNJBXzfg@work-vm>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Fri, 13 May 2022 03:28:04 -0300
Message-ID: <CAJ6HWG5wiod4gJJi2-bMkLPECiow4bC-ux-szWL-0=p3edpTvg@mail.gmail.com>
Subject: Re: [PULL 00/16] migration queue
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
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

On Wed, May 11, 2022 at 5:55 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Leonardo Bras Soares Passos (leobras@redhat.com) wrote:
> > From a previous thread:
> >
> > On Thu, Apr 28, 2022 at 1:20 PM Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > Leo:
> > >   Unfortunately this is failing a couple of CI tests; the MSG_ZEROCOP=
Y
> > > one I guess is the simpler one; I think Stefanha managed to find the
> > > liburing fix for the __kernel_timespec case, but that looks like a bi=
t
> > > more fun!
> > >
> > > Dave
> >
> > I thought Stefanha had fixed this bug, and we were just waiting for a
> > new alpine rootfs/image with that fixed.
> > Is that correct?
> >
> > On Tue, May 10, 2022 at 7:43 AM Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > > > On Tue, May 10, 2022 at 10:58:30AM +0100, Dr. David Alan Gilbert wr=
ote:
> > [...]
> > > >
> > > > Yuk. That very much looks like a bug in liburing itself to me.
> > > >
> > > >
> > > > We've exposed the latent bug by including linux/errqueue.h
> > >
> > > Yes, I think there was a thread after the 1st pull where Leo identifi=
ed
> > > the patch that fixed it; but it's not in that image.
> >
> > I only fixed the MSG_ZEROCOPY missing define bug, as I got that
> > Stefanha had already fixed the issue in liburing/alpine.
> >
> > questions:
> > - Has Stefanha really fixed that, and we are just waiting for a new
> > image, or have I got that wrong?
> > - How should I proceed with that?
> >
> > - If we proceed with fixing this up in alpine, will that require this
> > patchset to be on pause until it's fixed there?
>
> It needs to pass in CI; so yes.
>
> > - If so, is there any suggestion on how to fix that in qemu code?
> > (this header is needed because of SO_EE_* defines)
>
> I've not actually looked at the detail of the failure; but yes I think
> we need a qemu workaround here.
>
> If there's no simple fix, then adding a test to meson.build to
> conditionally disable liburing might be best; like the test code for
> libcap_ng I guess (search in meson.build for libcap_ng.found  at around
> line 540.

Hello Dave,

I solved this issue by doing this:

+linux_io_uring_test =3D '''
+  #include <liburing.h>
+  #include <linux/errqueue.h>
+
+  int main(void) { return 0; }'''
+
 linux_io_uring =3D not_found
 if not get_option('linux_io_uring').auto() or have_block
   linux_io_uring =3D dependency('liburing', version: '>=3D0.3',
                               required: get_option('linux_io_uring'),
                               method: 'pkg-config', kwargs: static_kwargs)
+  if not cc.links(linux_io_uring_test)
+    linux_io_uring =3D not_found
+  endif
 endif
+

Seems to work fine in CI, and now Alpine does not fail anymore.
(See pipeline https://gitlab.com/LeoBras/qemu/-/pipelines/538123933
for reference)

I am not sure if this is the right thing to do, but I will be sending
it as a full new patchset (v13), with the first patch being the one
with the above change and the rest just carrying the recommended
fixes.

I was also thinking I could instead send the single "fix" patch, and
recommend adding it before my v12. If that is the correct approach for
this case, please let me know so I can improve in the future. (I am
trying to figure out what is simpler/best for maintainers)

Best regards,
Leo







>
> Dave
>
> > Thank you all!
> >
> > Best regards,
> > Leo
> >
> > >
> > > Dave
> > >
> > > > With regards,
> > > > Daniel
> > > > --
> > > > |: https://berrange.com      -o-    https://www.flickr.com/photos/d=
berrange :|
> > > > |: https://libvirt.org         -o-            https://fstop138.berr=
ange.com :|
> > > > |: https://entangle-photo.org    -o-    https://www.instagram.com/d=
berrange :|
> > > >
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > >
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


