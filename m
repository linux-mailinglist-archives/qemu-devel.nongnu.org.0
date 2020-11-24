Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C902C281A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:34:43 +0100 (CET)
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYSw-0000bB-SB
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1khYRB-0008L2-Sx
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1khYR8-0001zm-Ag
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606224768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TYW2ceypTnNkZ1+X3GyP1E1ySfXLa/1MPhx23MUywE=;
 b=hutoSM8RnebE7AnQDsXDnnOzrWLWsMMb9JE/zYMB1RNZn28W+cAIGvBneiAEkUzMGgl/V/
 CAOq/nCThDOqHAEsnNvzt7wFzgUF1yv5uxe0XGAIeGX/fw/5wQ4ZxKl7KZjUNIda/2MejL
 xyZyKIzid3Cpg8Kw8y1orrqTuoVq4fU=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-CIxqUlZsPKmNoOeuUz5hKw-1; Tue, 24 Nov 2020 08:32:46 -0500
X-MC-Unique: CIxqUlZsPKmNoOeuUz5hKw-1
Received: by mail-io1-f71.google.com with SMTP id j10so15582159iog.22
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 05:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2TYW2ceypTnNkZ1+X3GyP1E1ySfXLa/1MPhx23MUywE=;
 b=mS3B0FIHC6JsjBoH0sa0AueZwE3dAyG5GGx9dEiIJsfl7xk+gXgu5BbvqE3jzkfTGd
 3Rlqsx1gqMNU4U44UBGdETt48oXsOQjrb30ssRD/IoUNOM1tXnJC3rqIbYl0cpObqI7U
 paaal3Ve4Jm+5D4yWOjK0Hq9FTyiSN2NF8SZWstgzCyK3nmN7Y9aKc8I6B+40IGBlgQ1
 Vqdx8fJb4rlvBliAIVuPrOHxD7ZCPwn0UULcDeniA4l/QJg2HtEL6inDbrnWdW6MEvHs
 KJdwzd88klb6+do+xDqu0sZ50lUUO0CUbQl8TSaTkdASjA35cKoQCz5mOTEb+WKRCGwv
 YdTg==
X-Gm-Message-State: AOAM533v6BMreXhrQuonY+dwrYNYbaTl/BBcIXkaL6AdNwSoJbykxu53
 TF924xv9p8Vj//rbA8W9TN2ZFh+1jnnM7QWO3w/KPVdA5shIyuAgbe5JhG+XTw/Ru1SKHuNr5pp
 J82AY9D1gbFKil2fEtnfiuuc5pVNjCQc=
X-Received: by 2002:a92:c8c4:: with SMTP id c4mr4342173ilq.161.1606224765383; 
 Tue, 24 Nov 2020 05:32:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4cmD0FH85BpPaJjYlxjt8gymHj8aA+0fgY5BvN0V3daOeI4dfzNE4sJ59t/vPB2Csc571Fnf5IrcRbbLRUPE=
X-Received: by 2002:a92:c8c4:: with SMTP id c4mr4342150ilq.161.1606224765097; 
 Tue, 24 Nov 2020 05:32:45 -0800 (PST)
MIME-Version: 1.0
References: <20201118080902.30033-1-marcandre.lureau@redhat.com>
 <20201118080902.30033-3-marcandre.lureau@redhat.com>
 <20201124115405.GE3366@work-vm>
In-Reply-To: <20201124115405.GE3366@work-vm>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 24 Nov 2020 17:32:33 +0400
Message-ID: <CAMxuvayBgw9Y4sor79nZw1sj4Y4H6txdUKOr=k6JxoSNryiYTw@mail.gmail.com>
Subject: Re: [PATCH 2/2] libvhost-user: replace qemu/memfd.h usage
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Armbruster, Markus" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Tue, Nov 24, 2020 at 3:54 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * marcandre.lureau@redhat.com (marcandre.lureau@redhat.com) wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Undo the damage from commit 5f9ff1eff3 ("libvhost-user: Support trackin=
g
> > inflight I/O in shared memory") which introduced glib dependency throug=
h
> > osdep.h inclusion.
> >
> > libvhost-user.c tries to stay free from glib usage.
> >
> > Use glibc memfd_create directly when available (assumed so when
> > MFD_ALLOW_SEALING is defined).
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  contrib/libvhost-user/libvhost-user.c | 50 +++++++++++++++++++++++----
> >  1 file changed, 43 insertions(+), 7 deletions(-)
> >
> > diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost-u=
ser/libvhost-user.c
> > index 1c1cfbf1e7..805521859d 100644
> > --- a/contrib/libvhost-user/libvhost-user.c
> > +++ b/contrib/libvhost-user/libvhost-user.c
> > @@ -42,8 +42,6 @@
> >  #endif
> >
> >  #include "qemu/atomic.h"
> > -#include "qemu/osdep.h"
> > -#include "qemu/memfd.h"
> >
> >  #include "libvhost-user.h"
> >
> > @@ -1615,11 +1613,45 @@ vu_inflight_queue_size(uint16_t queue_size)
> >             sizeof(uint16_t), INFLIGHT_ALIGNMENT);
> >  }
> >
> > +#ifdef MFD_ALLOW_SEALING
> > +static void *
> > +memfd_alloc(const char *name, size_t size, unsigned int flags, int *fd=
)
> > +{
> > +    void *ptr;
> > +    int ret;
> > +
> > +    *fd =3D memfd_create(name, MFD_ALLOW_SEALING);
> > +    if (*fd < 0) {
> > +        return NULL;
> > +    }
> > +
> > +    ret =3D ftruncate(*fd, size);
>
> Do you need to do any of the page alignment?

We don't do any in util/memfd.c, I don't see an explicit requirement
in memfd_create(). (however, util/memfd.c did check power of 2 for
hugetlb usage, but this isn't necessary here)

On mmap(), "if addr is NULL, then the kernel chooses the (page-aligned) add=
ress"

>
> > +    if (ret < 0) {
> > +        close(*fd);
> > +        return NULL;
> > +    }
> > +
> > +    ret =3D fcntl(*fd, F_ADD_SEALS, F_SEAL_GROW | F_SEAL_SHRINK | F_SE=
AL_SEAL);
>
> I think you'd intended to use the 'flags' parameter there.

indeed, thanks

>
> > +    if (ret < 0) {
> > +        close(*fd);
> > +        return NULL;
> > +    }
> > +
> > +    ptr =3D mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, *fd, 0);
> > +    if (ptr =3D=3D MAP_FAILED) {
> > +        close(*fd);
> > +        return NULL;
> > +    }
> > +
> > +    return ptr;
> > +}
> > +#endif
> > +
> >  static bool
> >  vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
> >  {
> > -    int fd;
> > -    void *addr;
> > +    int fd =3D -1;
> > +    void *addr =3D NULL;
> >      uint64_t mmap_size;
> >      uint16_t num_queues, queue_size;
> >
> > @@ -1637,9 +1669,13 @@ vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vms=
g)
> >
> >      mmap_size =3D vu_inflight_queue_size(queue_size) * num_queues;
> >
> > -    addr =3D qemu_memfd_alloc("vhost-inflight", mmap_size,
> > -                            F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
> > -                            &fd, NULL);
> > +#ifdef MFD_ALLOW_SEALING
> > +    addr =3D memfd_alloc("vhost-inflight", mmap_size,
> > +                       F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
> > +                       &fd);
> > +#else
> > +    vu_panic(dev, "Not implemented: memfd support is missing");
>
> Should there be an ifdef somewhere on the declared features, so it
> doesn't get this far because it wont negotiate the feature?

Sealing grow/shrink came together with memfd, it was one of the main
selling point. I assume if MFD_ALLOW_SEALING is defined, we have
memfd_create and basic libc defines. But yes, if we want to handle
weird corner cases, we should add more ifdef-ry. I'd pass for now.

thanks

>
> Dave
>
> > +#endif
> >
> >      if (!addr) {
> >          vu_panic(dev, "Failed to alloc vhost inflight area");
> > --
> > 2.29.0
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>


