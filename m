Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3F2C2828
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:36:53 +0100 (CET)
Received: from localhost ([::1]:51492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYV2-0003Iv-Aq
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1khYTj-00027R-I2
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:35:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1khYTh-0002wM-Jy
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606224929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/bW7KMbmlysipo48cuzP1/uqO8myOwJzLxr7vLzaW8=;
 b=QxNcGPjWLVO6neuYCazZv0zaGZRL5xtMb9VIa31Q++FeldjJ/Qm5RmQFUjsVs2q+P5ddlj
 0v4uQGh6w7BxLioqhKK7TUMkgx40ZDkxbupvcLKdQIEQHGZJVC+RW0u1w/4SKxS3MG0tsg
 eDPkiIDNn4nRsvIJBZ3Conf5S6UtAj0=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-kuTUDgL-OUCemOo6XYyz-A-1; Tue, 24 Nov 2020 08:35:27 -0500
X-MC-Unique: kuTUDgL-OUCemOo6XYyz-A-1
Received: by mail-il1-f200.google.com with SMTP id l8so16816132ilf.10
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 05:35:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k/bW7KMbmlysipo48cuzP1/uqO8myOwJzLxr7vLzaW8=;
 b=OOPaJOFtUhI4nl4Z+GobFIXxiR/EGUbuBNviRk2C3dJt4JwnqMoSaSiXWpg/Ap2yFE
 BghI8UtuCIord8WdIb0pE3N5sjwv9s9mFB6SSwNVf7xBkN+iM56dZdPixfD3725cQ7DL
 L+rmYZcBIdT2aqDFMrg0sMLld0xfVnPM+BXrqdq06HZU0iV6FQq0W38CqKCv7atTsDMh
 pv6YukMcFy1jnHP28fL9rGrJnTk+AvZ/UvMV2UqWbTDhTqu8j+4L6d/jB/YAfFYmaQyi
 sjFMT4ij3XmDKtuJJPNT9I59tZG8FWsoPJmRZjkCPLZ7fCWa2nKHBlPpIeFZRSHQWb0w
 Natg==
X-Gm-Message-State: AOAM533dVI8AeMlrqwHcAQTjS/x3SJqkF0lK6LZUOENwfz1CjDi+Wn3n
 7O5MYWq1B+OGzgGdd/K97/5anNT9z/lmYXWl7O/GGzO8/lLKmCghgiBFbRCwXFAgrKG3VSzv6CV
 D1WZzF3mQj8N0a550NiWpp4r5IQ7t4SU=
X-Received: by 2002:a92:c8c4:: with SMTP id c4mr4353657ilq.161.1606224926884; 
 Tue, 24 Nov 2020 05:35:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9K4NT+z1UQweKVQzf6cO1bbQX5CE7DoNmBixfG9GIzoLcn796Oi5QlAYfsxgymMnwVW0vfrsCn/LE2DV0ph0=
X-Received: by 2002:a92:c8c4:: with SMTP id c4mr4353635ilq.161.1606224926653; 
 Tue, 24 Nov 2020 05:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20201118080902.30033-1-marcandre.lureau@redhat.com>
 <20201118080902.30033-3-marcandre.lureau@redhat.com>
 <20201124115405.GE3366@work-vm>
 <CAMxuvayBgw9Y4sor79nZw1sj4Y4H6txdUKOr=k6JxoSNryiYTw@mail.gmail.com>
In-Reply-To: <CAMxuvayBgw9Y4sor79nZw1sj4Y4H6txdUKOr=k6JxoSNryiYTw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 24 Nov 2020 17:35:15 +0400
Message-ID: <CAMxuvawEKzx2v+HRVQBxGANecPjOG+8NW6rZERximJ_VMD5kOw@mail.gmail.com>
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

On Tue, Nov 24, 2020 at 5:32 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Tue, Nov 24, 2020 at 3:54 PM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * marcandre.lureau@redhat.com (marcandre.lureau@redhat.com) wrote:
> > > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > >
> > > Undo the damage from commit 5f9ff1eff3 ("libvhost-user: Support track=
ing
> > > inflight I/O in shared memory") which introduced glib dependency thro=
ugh
> > > osdep.h inclusion.
> > >
> > > libvhost-user.c tries to stay free from glib usage.
> > >
> > > Use glibc memfd_create directly when available (assumed so when
> > > MFD_ALLOW_SEALING is defined).
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  contrib/libvhost-user/libvhost-user.c | 50 +++++++++++++++++++++++--=
--
> > >  1 file changed, 43 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/contrib/libvhost-user/libvhost-user.c b/contrib/libvhost=
-user/libvhost-user.c
> > > index 1c1cfbf1e7..805521859d 100644
> > > --- a/contrib/libvhost-user/libvhost-user.c
> > > +++ b/contrib/libvhost-user/libvhost-user.c
> > > @@ -42,8 +42,6 @@
> > >  #endif
> > >
> > >  #include "qemu/atomic.h"
> > > -#include "qemu/osdep.h"
> > > -#include "qemu/memfd.h"
> > >
> > >  #include "libvhost-user.h"
> > >
> > > @@ -1615,11 +1613,45 @@ vu_inflight_queue_size(uint16_t queue_size)
> > >             sizeof(uint16_t), INFLIGHT_ALIGNMENT);
> > >  }
> > >
> > > +#ifdef MFD_ALLOW_SEALING
> > > +static void *
> > > +memfd_alloc(const char *name, size_t size, unsigned int flags, int *=
fd)
> > > +{
> > > +    void *ptr;
> > > +    int ret;
> > > +
> > > +    *fd =3D memfd_create(name, MFD_ALLOW_SEALING);
> > > +    if (*fd < 0) {
> > > +        return NULL;
> > > +    }
> > > +
> > > +    ret =3D ftruncate(*fd, size);
> >
> > Do you need to do any of the page alignment?
>
> We don't do any in util/memfd.c, I don't see an explicit requirement
> in memfd_create(). (however, util/memfd.c did check power of 2 for
> hugetlb usage, but this isn't necessary here)
>
> On mmap(), "if addr is NULL, then the kernel chooses the (page-aligned) a=
ddress"
>
> >
> > > +    if (ret < 0) {
> > > +        close(*fd);
> > > +        return NULL;
> > > +    }
> > > +
> > > +    ret =3D fcntl(*fd, F_ADD_SEALS, F_SEAL_GROW | F_SEAL_SHRINK | F_=
SEAL_SEAL);
> >
> > I think you'd intended to use the 'flags' parameter there.
>
> indeed, thanks
>
> >
> > > +    if (ret < 0) {
> > > +        close(*fd);
> > > +        return NULL;
> > > +    }
> > > +
> > > +    ptr =3D mmap(0, size, PROT_READ | PROT_WRITE, MAP_SHARED, *fd, 0=
);
> > > +    if (ptr =3D=3D MAP_FAILED) {
> > > +        close(*fd);
> > > +        return NULL;
> > > +    }
> > > +
> > > +    return ptr;
> > > +}
> > > +#endif
> > > +
> > >  static bool
> > >  vu_get_inflight_fd(VuDev *dev, VhostUserMsg *vmsg)
> > >  {
> > > -    int fd;
> > > -    void *addr;
> > > +    int fd =3D -1;
> > > +    void *addr =3D NULL;
> > >      uint64_t mmap_size;
> > >      uint16_t num_queues, queue_size;
> > >
> > > @@ -1637,9 +1669,13 @@ vu_get_inflight_fd(VuDev *dev, VhostUserMsg *v=
msg)
> > >
> > >      mmap_size =3D vu_inflight_queue_size(queue_size) * num_queues;
> > >
> > > -    addr =3D qemu_memfd_alloc("vhost-inflight", mmap_size,
> > > -                            F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEA=
L,
> > > -                            &fd, NULL);
> > > +#ifdef MFD_ALLOW_SEALING
> > > +    addr =3D memfd_alloc("vhost-inflight", mmap_size,
> > > +                       F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL,
> > > +                       &fd);
> > > +#else
> > > +    vu_panic(dev, "Not implemented: memfd support is missing");
> >
> > Should there be an ifdef somewhere on the declared features, so it
> > doesn't get this far because it wont negotiate the feature?
>
> Sealing grow/shrink came together with memfd, it was one of the main
> selling point. I assume if MFD_ALLOW_SEALING is defined, we have
> memfd_create and basic libc defines. But yes, if we want to handle
> weird corner cases, we should add more ifdef-ry. I'd pass for now.


However, let's avoid compiling code that can panic. I am updating the
series with a standalone meson subproject.


