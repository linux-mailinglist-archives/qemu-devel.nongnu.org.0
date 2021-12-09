Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D83746E468
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 09:39:54 +0100 (CET)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvEy0-0002zk-QZ
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 03:39:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mvEwt-0001lF-8V
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 03:38:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mvEwp-0000r9-SE
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 03:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639039118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBKxjhk/Pmc39Frb5V9EcNpqmSpQ5uMkBc/edr7CkOs=;
 b=DXRca8amjc1k1EI4WnjrdERPzY1R8/3w9/s5sePUG71Q59LyAwUoiYv+MdTORCbMeN8AVl
 uxssNbdJ+3BJ/Y6aDcS1UIvhqG1W7wne9Ng1Mt9ULDhL7LP/aHEvqW/TBLTXAaUwEt3QpN
 w5NdUUSmtB/LDfQx71GlDdjZ2gZJpNc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-x4vGwqBzOuWJwFA4ldJTvg-1; Thu, 09 Dec 2021 03:38:31 -0500
X-MC-Unique: x4vGwqBzOuWJwFA4ldJTvg-1
Received: by mail-lj1-f199.google.com with SMTP id
 h18-20020a05651c159200b0021cf7c089d0so1526871ljq.21
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 00:38:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WBKxjhk/Pmc39Frb5V9EcNpqmSpQ5uMkBc/edr7CkOs=;
 b=mEgudr0k2ojSMHnkmRfeudnimdQ/wP5II/P1ndrMSNL3m+2UORtJ9q4keJnKZ62Am9
 xeY4w8VerArGnesAD+FFOueZ4F2z4277SWc1R57WDyVfxI6Pd4yui9gHryf664Uf9P5r
 pEfe7lmQOBbTLeZnKKqAtTJx0PeknEQv/MNoiWtiecTzf97tgYzE+9FcUgf4EFVqJseJ
 E6EX63cyN+u/swB/36KSimVxe+CfiEUXCwMkU87vqws5+bdEak2AKgJT0YPJ2PdhvDCc
 xN4o/r4ZqZyOyGFvTWrsx6Jo1l6iWDYuUp0rGe4AJkPHb/IFS7kbhytlyv2XN8isuYp2
 QCqw==
X-Gm-Message-State: AOAM5338fpOsVdaBvP8YQWszBNeMSKujtGRU93lu2jmgrM4MYGaNJy8a
 ukspkXorSDhKJl1ATZZVWmeSatotZNglBTJBsyiET0nKnuITmVAMWESdiIl41HQ+IXKGXx03oc+
 0LHsJl9otZPM3fQhupDCgWfvD7Ofiv2M=
X-Received: by 2002:a05:6512:200e:: with SMTP id
 a14mr4776527lfb.370.1639039109748; 
 Thu, 09 Dec 2021 00:38:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJMt/5zOzGdvKjOVabkDI667XRbO9F8ECMPjP53uIqL5yKdIM7u3gaUX1cLQu6+6U9lTMcGulYCUnXXYrlaXI=
X-Received: by 2002:a05:6512:200e:: with SMTP id
 a14mr4776497lfb.370.1639039109427; 
 Thu, 09 Dec 2021 00:38:29 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-4-leobras@redhat.com>
 <YY5H2ixqGpfbo5jI@redhat.com>
 <CAJ6HWG6TczHZC6EFcicG8irVb3XKdhB05bcyOb0ANAZKmRWqZg@mail.gmail.com>
 <YZy6qifB8JNwYEkp@redhat.com>
 <CAJ6HWG5e5VGW0pt_ek+jMZi+oz4uDOLnC0dHczkqMBBspdLf5A@mail.gmail.com>
 <YangvtnXSwge0R0U@redhat.com>
In-Reply-To: <YangvtnXSwge0R0U@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 9 Dec 2021 05:38:18 -0300
Message-ID: <CAJ6HWG4GoONK1M_+GOemmLhNsRiN29313Q8sfkLOxQfS3XUznw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel,

On Fri, Dec 3, 2021 at 6:18 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Fri, Dec 03, 2021 at 02:42:19AM -0300, Leonardo Bras Soares Passos wro=
te:
> > Hello Daniel,
> >
> > On Tue, Nov 23, 2021 at 6:56 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Tue, Nov 23, 2021 at 01:46:44AM -0300, Leonardo Bras Soares Passos=
 wrote:
> > > > Hello Daniel,
> > > >
> > > > On Fri, Nov 12, 2021 at 7:54 AM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
> > > > > > +
> > > > > > +#ifdef CONFIG_LINUX
> > > > > > +
> > > > > > +static int qio_channel_socket_poll(QIOChannelSocket *sioc, boo=
l zerocopy,
> > > > > > +                                   Error **errp)
> > > > >
> > > > > There's only one caller and it always passes zerocopy=3Dtrue,
> > > > > so this parmeter looks pointless.
> > > >
> > > > I did that for possible reuse of this function in the future:
> > > > - As of today, this is certainly compiled out, but if at some point
> > > > someone wants to use poll for something other
> > > > than the reading of an zerocopy errqueue, it could be reused.
> > > >
> > > > But sure, if that's not desirable, I can remove the parameter (and =
the
> > > > if clause for !zerocopy).
> > > >
> > > > >
> > > > > > +{
> > > > > > +    struct pollfd pfd;
> > > > > > +    int ret;
> > > > > > +
> > > > > > +    pfd.fd =3D sioc->fd;
> > > > > > +    pfd.events =3D 0;
> > > > > > +
> > > > > > + retry:
> > > > > > +    ret =3D poll(&pfd, 1, -1);
> > > > > > +    if (ret < 0) {
> > > > > > +        switch (errno) {
> > > > > > +        case EAGAIN:
> > > > > > +        case EINTR:
> > > > > > +            goto retry;
> > > > > > +        default:
> > > > > > +            error_setg_errno(errp, errno,
> > > > > > +                             "Poll error");
> > > > > > +            return ret;
> > > > >
> > > > >        return -1;
> > > > >
> > > > > > +        }
> > > > > > +    }
> > > > > > +
> > > > > > +    if (pfd.revents & (POLLHUP | POLLNVAL)) {
> > > > > > +        error_setg(errp, "Poll error: Invalid or disconnected =
fd");
> > > > > > +        return -1;
> > > > > > +    }
> > > > > > +
> > > > > > +    if (!zerocopy && (pfd.revents & POLLERR)) {
> > > > > > +        error_setg(errp, "Poll error: Errors present in errque=
ue");
> > > > > > +        return -1;
> > > > > > +    }
> > > > >
> > > > > > +
> > > > > > +    return ret;
> > > > >
> > > > >   return 0;
> > > >
> > > > In the idea of future reuse I spoke above, returning zero here woul=
d
> > > > make this function always look like the poll timed out. Some future
> > > > users may want to repeat the waiting if poll() timed out, or if
> > > > (return > 0) stop polling.
> > >
> > > Now that I'm looking again, we should not really use poll() at all,
> > > as GLib provides us higher level APIs. We in fact already have the
> > > qio_channel_wait() method as a general purpose helper for waiting
> > > for an I/O condition to occur.;
> > >
> >
> > So you suggest using
> > qio_channel_wait(sioc, G_IO_IN);
> > instead of creating the new qio_channel_socket_poll().
> >
> > Is the above correct? I mean, is it as simple as that?
>
> Yes, hopefully it is that simple.

It seems not to be the case.
After some testing, I found out using this stalls the migration.

This happens when multifd_send_sync_main() calls flush_zerocopy(), but
the migration threads are
in multifd_send_thread() calling qemu_sem_wait(&p->sem);

I don't really understand enough of GLib to know how much this is
different from a poll(), but seems to make a difference.

>
> > > > I understand the idea of testing SO_EE_CODE_ZEROCOPY_COPIED to be a=
ble
> > > > to tell whenever zerocopy fell back to copying for some reason, but=
 I
> > > > don't see how this can be helpful here.
> > > >
> > > > Other than that I would do rv++ instead of rv=3D1 here, if I want t=
o
> > > > keep track of how many buffers were sent with zerocopy and how many
> > > > ended up being copied.
> > >
> > > Sure, we could do   "ret > 0 =3D=3D number of buffers that were copie=
d"
> > > as the API contract, rather than just treating it as a boolean.
> >
> > Ok, then you suggest the responsibility of checking the number of
> > writes with SO_EE_CODE_ZEROCOPY_COPIED, comparing with the total
> > number of writes,  and deciding whether to disable or not zerocopy
> > should be on the caller.
>
> Yep, its a usage policy so nicer to allow caller to decide the
> policy.
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


