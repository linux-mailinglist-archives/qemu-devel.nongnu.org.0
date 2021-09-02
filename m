Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9A33FE962
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 08:42:31 +0200 (CEST)
Received: from localhost ([::1]:36122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgQf-0005Zc-IR
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 02:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLgMa-000158-Tk
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:38:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLgMY-0005Ye-Eo
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 02:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630564693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+2IAQssCWLnzpH7UgCZ4E1ey+pKiH0SqI03vjoddrg=;
 b=IKdQUtC2L33ODvIp+J0Fwz0vEdTXOYS6zi4jJaG2gqpAfNy1uwnKgp8an3ceHs5Pjt3bDw
 neBAasFzzp7vj6ZDc5p7WN/Kup79+NmZLNzaNwZH6wpug1TbyKtDK6B/icqtGaCVX2r+YI
 YVBW3SnadKh4OF6iI2sr3JQgwt0+pgA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-Qbw0os7GNV65-oCpXk4U5g-1; Thu, 02 Sep 2021 02:38:02 -0400
X-MC-Unique: Qbw0os7GNV65-oCpXk4U5g-1
Received: by mail-lf1-f72.google.com with SMTP id
 d10-20020ac24c8a000000b003dce50ea2c4so448852lfl.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 23:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d+2IAQssCWLnzpH7UgCZ4E1ey+pKiH0SqI03vjoddrg=;
 b=Pa2BiN930uY4Gv4Qf4LsfHyO2DSLwfSKRHoiTNDJgzBMO5DZOPgebiWcjBEu6GN6A3
 VrTimXV3EyCa2r+w/lTsNSLjxdMEGRXZ6kJpZWHJyOGR8Aw7/IIC7Z63cuzT5B04zxDd
 o9p4/tTXT75FvoZkq4VGQf2gksj4IFKBPYCSkkBk7egobwkKNrTMJA9w0wcsTSrXsdiN
 cbx3eZYPuqzt2i6YCEPObKaX3rCTPHioPC1q2trhdTGeJH30TSbFKIcFlb11mPLn6wt6
 B+R3IshS9mEvEtujv/9M9lCeVkwonyif8Pri5bhtusTkNtZBRlCCFuOeETsYO8h57vFj
 n5Dw==
X-Gm-Message-State: AOAM530c+nvR9oqsSlwjIhOxgEaaEz+s8Ytl83mfiPwl6htYka8lNSQh
 iKu+GOvZKM4W+d7RPSiRUWBFI30hlmR0BG1LgnVtpGiCayv0nIuC+HBXkk867pm2FhpteQ2rkwM
 Z8rxihVGLRWCTBl8pE/Pvng4VNVDOwjQ=
X-Received: by 2002:a05:6512:301:: with SMTP id
 t1mr1390612lfp.626.1630564680145; 
 Wed, 01 Sep 2021 23:38:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPxHjlrwGeG77fq6ucupI4Kw/ug0ZuLkCZcGiDaXsMQYMJmtOMO/V5JKrZ1p0GiEhNIqi3KFzwf/zAZP/nMwc=
X-Received: by 2002:a05:6512:301:: with SMTP id
 t1mr1390588lfp.626.1630564679797; 
 Wed, 01 Sep 2021 23:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com>
In-Reply-To: <YS4nPfEBCy9IC3rd@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 03:38:11 -0300
Message-ID: <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel, thank you for the feedback!

Comments inline.

On Tue, Aug 31, 2021 at 9:57 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Aug 31, 2021 at 08:02:38AM -0300, Leonardo Bras wrote:
> > MSG_ZEROCOPY is a feature that enables copy avoidance in TCP/UDP socket
> > send calls. It does so by avoiding copying user data into kernel buffer=
s.
> >
> > To make it work, three steps are needed:
> > 1 - A setsockopt() system call, enabling SO_ZEROCOPY
> > 2 - Passing down the MSG_ZEROCOPY flag for each send*() syscall
> > 3 - Process the socket's error queue, dealing with any error
>
> AFAICT, this is missing the single most critical aspect of MSG_ZEROCOPY.
>
> It is non-obvious, but setting the MSG_ZEROCOPY flag turns sendmsg()
> from a synchronous call to an asynchronous call.

You are correct. I tried to adapt io_writev() interface to use MSG_ZEROCOPY=
 in
a somehow synchronous way, but returning errp (and sometimes closing the
channel because of it) was a poor implementation.

>
> It is forbidden to overwrite/reuse/free the buffer passed to sendmsg
> until an asynchronous completion notification has been received from
> the socket error queue. These notifications are not required to
> arrive in-order, even for a TCP stream, because the kernel hangs on
> to the buffer if a re-transmit is needed.
>
> https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
>
>   "Page pinning also changes system call semantics. It temporarily
>    shares the buffer between process and network stack. Unlike with
>    copying, the process cannot immediately overwrite the buffer
>    after system call return without possibly modifying the data in
>    flight. Kernel integrity is not affected, but a buggy program
>    can possibly corrupt its own data stream."
>

By the above piece of documentation, I get there is no problem in
overwriting the buffer, but a corrupt, or newer version of the memory may
be sent instead of the original one. I am pointing this out because there
are workloads like page migration that would not be impacted, given
once the buffer is changed, it will dirty the page and it will be re-sent.

But I agree with you.
It's not a good choice to expect all the users to behave like that,
and since an interface for dealing with those errors is not provided
to the using code, there is no way of using that in other scenarios.

> AFAICT, the design added in this patch does not provide any way
> to honour these requirements around buffer lifetime.
>
> I can't see how we can introduce MSG_ZEROCOPY in any seemless
> way. The buffer lifetime requirements imply need for an API
> design that is fundamentally different for asynchronous usage,
> with a callback to notify when the write has finished/failed.
>

That is a good point.
Proposing a new optional method like io_async_writev() + an error
checking mechanism could do the job.
io_async_writev() could fall-back to io_writev() in cases where it's not
implemented.

I am not sure about the error checking yet.
Options I can see are:
1 - A callback, as you suggested, which IIUC would be provided by
code using the QIOChannel, and would only fix the reported errors,
leaving the responsibility of checking for errors to the IOChannel code.

2 - A new method, maybe io_async_errck(), which would be called
whenever the using code wants to deal with pending errors. It could
return an array/list of IOVs that need to be re-sent, for example,
and code using QIOChannel could deal with it however it wants.

[snip]

> >   * qio_channel_set_cork:
> >   * @ioc: the channel object
> > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > index e377e7303d..a69fec7315 100644
> > --- a/io/channel-socket.c
> > +++ b/io/channel-socket.c
> > @@ -26,8 +26,10 @@
> >  #include "io/channel-watch.h"
> >  #include "trace.h"
> >  #include "qapi/clone-visitor.h"
> > +#include <linux/errqueue.h>
>
> That's going to fail to biuld on non-Linux

Good catch, thanks!

[snip]

> > @@ -571,6 +623,14 @@ static ssize_t qio_channel_socket_writev(QIOChanne=
l *ioc,
> >                           "Unable to write to socket");
> >          return -1;
> >      }
> > +
> > +    if ((flags & MSG_ZEROCOPY) && sioc->zerocopy_enabled) {
> > +        sioc->errq_pending +=3D niov;
> > +        if (sioc->errq_pending > SOCKET_ERRQ_THRESH) {
> > +            qio_channel_socket_errq_proc(sioc, errp);
> > +        }
> > +    }
>
> This silently looses any errors set from upto the final
> SOCKET_ERRQ_THRESH write() calls with MSG_ZEROCOPY set.

You are right.

>
> Also means if you have a series of writes without
> MSG_ZEROCOPY, it'll delay checking any pending
> errors.

That's expected... if there are only happening sends without MSG_ZEROCOPY,
it means the ones sent with zerocopy can wait. The problem would be
the above case.

>
> I would suggest checkig in close(), but as mentioned
> earlier, I think the design is flawed because the caller
> fundamentally needs to know about completion for every
> single write they make in order to know when the buffer
> can be released / reused.

Well, there could be a flush mechanism (maybe in io_sync_errck(),
activated with a
parameter flag, or on a different method if callback is preferred):
In the MSG_ZEROCOPY docs, we can see that the example includes using a poll=
()
syscall after each packet sent, and this means the fd gets a signal after e=
ach
sendmsg() happens, with error or not.

We could harness this with a poll() and a relatively high timeout:
- We stop sending packets, and then call poll().
- Whenever poll() returns 0, it means a timeout happened, and so it
took too long
without sendmsg() happening, meaning all the packets are sent.
- If it returns anything else, we go back to fixing the errors found (re-se=
nd)

The problem may be defining the value of this timeout, but it could be
called only
when zerocopy is active.

What do you think?


>
> > +static void
> > +qio_channel_socket_set_zerocopy(QIOChannel *ioc,
> > +                                bool enabled)
> > +{
> > +    QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc);
> > +    int v =3D enabled ? 1 : 0;
> > +    int ret;
> > +
> > +    ret =3D qemu_setsockopt(sioc->fd, SOL_SOCKET, SO_ZEROCOPY, &v, siz=
eof(v));
> > +    if (ret >=3D 0) {
> > +        sioc->zerocopy_enabled =3D true;
> > +    }
> > +}
>
> Surely we need to tell the caller wether this succeeed, otherwise
> the later sendmsg() is going to fail with EINVAL on older kernels
> where MSG_ZEROCOPY is not supported.

Yeah, that was the idea on sioc->zerocopy_enabled, but in fact it
should have been
something like 'sioc->zerocopy_enabled =3D (ret >=3D 0) && enabled ', this
way it would
reflect zerocopy only if it was enabled and the syscall worked, and not_zer=
ocopy
otherwise.

or something like this, if we want it to stick with zerocopy if
setting it off fails.
if (ret >=3D 0) {
    sioc->zerocopy_enabled =3D enabled;
}

>
>
> > diff --git a/io/channel-tls.c b/io/channel-tls.c
> > index 4ce890a538..bf44b0f7b0 100644
> > --- a/io/channel-tls.c
> > +++ b/io/channel-tls.c
> > @@ -350,6 +350,16 @@ static void qio_channel_tls_set_delay(QIOChannel *=
ioc,
> >      qio_channel_set_delay(tioc->master, enabled);
> >  }
> >
> > +
> > +static void qio_channel_tls_set_zerocopy(QIOChannel *ioc,
> > +                                         bool enabled)
> > +{
> > +    QIOChannelTLS *tioc =3D QIO_CHANNEL_TLS(ioc);
> > +
> > +    qio_channel_set_zerocopy(tioc->master, enabled);
> > +}
>
> This is going to be unsafe because gnutls will discard/reuse the
> buffer for the ciphertext after every write(). I can't see a
> way to safely enable MSG_ZEROCOPY when TLS is used.

Yeah, that makes sense.
It would make more sense to implement KTLS, as IIRC it kind of does
'zerocopy', since it saves the encrypted data directly in kernel buffer.

We could implement KTLS as io_async_writev() for Channel_TLS, and change th=
is
flag to async_enabled. If KTLS is not available, it would fall back to
using gnuTLS
on io_writev, just like it would happen in zerocopy.

>
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


