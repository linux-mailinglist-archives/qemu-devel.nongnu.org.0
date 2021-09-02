Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94C13FEB57
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:34:58 +0200 (CEST)
Received: from localhost ([::1]:36890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLj7Z-0000qX-Uo
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLj6d-0008Jk-Lr
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLj6a-0002ic-F8
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5aYb4v3RMho+rQpDcrQ0efqkGlIdXbUvrHPNVKcw5PE=;
 b=ejaytb39JOoOeD3NnRh9K4rN3ft0W/+MJZGHm+7RsOfslfWsuyxKuQBeVwZllsvAHI+S7f
 arXdghI12JbS40kVFU03JEhJ0lZi/CuYfvzBiOiTFSBe0pCq3Jr2HNnAFKM5lg1OjREVC+
 +VNyjh9u+Zeo9o9wFL4Q7djFPFE34HM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-Z8FS_7nOO0KgT476jGxBQQ-1; Thu, 02 Sep 2021 05:33:52 -0400
X-MC-Unique: Z8FS_7nOO0KgT476jGxBQQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 d2-20020ac25442000000b003e52a038afaso597822lfn.10
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 02:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5aYb4v3RMho+rQpDcrQ0efqkGlIdXbUvrHPNVKcw5PE=;
 b=EUW/6gVY+FDW81R+XjSv8AVSiGZIA+vGLmiTBor1S2DtAJ0wjtJG/uu5EGAjhLGiO/
 cJq7c9goDoTFWoyhn129sI7AdDlYIQZ46KA+LZQQpHdXXBWadbc3frEFzgP+cOmiI/VI
 McfGmCTW8EsL+HCGWAcm5PvFJ+W//TXUkyuVaILD9L4OMBpD7WygDc31WmVhu5VHnsP4
 XEeTgJXmgxEkh5sgKWHG1cbpio8Z/HLpyqXFJ+coQqSpvMPeCzAGZ3J/tL7iDHlljhIO
 Zcv2SjOBFMDS99MFpWa6LS01uHz7AlFtDNny+nm5p5fh4+xaxjdX4On5T4alyvVoTvaR
 5ewg==
X-Gm-Message-State: AOAM530E3zrk2BDSqfvEWVbpoybGlbztd48k6TlGN26es09ioFRZrDJQ
 HOmcaebOSywKDzBTxFWetKGxUI0l98Iyl18bh4THaHqSWQBKWKuGU87oraKck9g0+OVH9XUjSdY
 l5K+SULMXsoCtIRC3svrN+CI3RSymK9g=
X-Received: by 2002:a05:6512:128b:: with SMTP id
 u11mr1986947lfs.384.1630575230884; 
 Thu, 02 Sep 2021 02:33:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywvhr1b66flmIM5vtX0I7Rvr4lQneSczTfo2sUKD+FMyz15sdsdYyz0qWnYfrAgVJt4oJuBM7wsu10UAsT5tU=
X-Received: by 2002:a05:6512:128b:: with SMTP id
 u11mr1986912lfs.384.1630575230469; 
 Thu, 02 Sep 2021 02:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
In-Reply-To: <YTCPngNB+l70sl06@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 06:34:01 -0300
Message-ID: <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Sep 2, 2021 at 5:47 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Sep 02, 2021 at 03:38:11AM -0300, Leonardo Bras Soares Passos wro=
te:
> > Hello Daniel, thank you for the feedback!
> >
> > Comments inline.
> >
> > On Tue, Aug 31, 2021 at 9:57 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Tue, Aug 31, 2021 at 08:02:38AM -0300, Leonardo Bras wrote:
> > > > MSG_ZEROCOPY is a feature that enables copy avoidance in TCP/UDP so=
cket
> > > > send calls. It does so by avoiding copying user data into kernel bu=
ffers.
> > > >
> > > > To make it work, three steps are needed:
> > > > 1 - A setsockopt() system call, enabling SO_ZEROCOPY
> > > > 2 - Passing down the MSG_ZEROCOPY flag for each send*() syscall
> > > > 3 - Process the socket's error queue, dealing with any error
> > >
> > > AFAICT, this is missing the single most critical aspect of MSG_ZEROCO=
PY.
> > >
> > > It is non-obvious, but setting the MSG_ZEROCOPY flag turns sendmsg()
> > > from a synchronous call to an asynchronous call.
> >
> > You are correct. I tried to adapt io_writev() interface to use MSG_ZERO=
COPY in
> > a somehow synchronous way, but returning errp (and sometimes closing th=
e
> > channel because of it) was a poor implementation.
> >
> > >
> > > It is forbidden to overwrite/reuse/free the buffer passed to sendmsg
> > > until an asynchronous completion notification has been received from
> > > the socket error queue. These notifications are not required to
> > > arrive in-order, even for a TCP stream, because the kernel hangs on
> > > to the buffer if a re-transmit is needed.
> > >
> > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > >
> > >   "Page pinning also changes system call semantics. It temporarily
> > >    shares the buffer between process and network stack. Unlike with
> > >    copying, the process cannot immediately overwrite the buffer
> > >    after system call return without possibly modifying the data in
> > >    flight. Kernel integrity is not affected, but a buggy program
> > >    can possibly corrupt its own data stream."
> > >
> >
> > By the above piece of documentation, I get there is no problem in
> > overwriting the buffer, but a corrupt, or newer version of the memory m=
ay
> > be sent instead of the original one. I am pointing this out because the=
re
> > are workloads like page migration that would not be impacted, given
> > once the buffer is changed, it will dirty the page and it will be re-se=
nt.
>
> The idea of having the buffer overwritten is still seriously worrying
> me. I get the idea that in theory the "worst" that should happen is
> that we unexpectedly transmit newer guest memory contents. There are
> so many edge cases in migration code though that I'm worried there
> might be scenarios in which that is still going to cause problems.

I agree we should keep a eye on that, maybe have David Gilbert's opinion
on that.

>
> The current migration code has a synchronization point at the end of
> each iteration of the migration loop. At the end of each iteration,
> the source has a guarantee that all pages from the dirty bitmap have
> now been sent. With the ZEROCOPY feature we have entirely removed all
> synchronization points from the source host wrt memory sending. At
> best we know that the pages will have been sent if we get to close()
> without seeing errors, unless we're going to explicitly track the
> completion messages. The TCP re-transmit semantics are especially
> worrying to me, because the re-transmit is liable to send different
> data than was in the original lost TCP packet.
>
> Maybe everything is still safe because TCP is a reliable ordered
> stream, and thus eventually the dst will get the newest guest
> page contents. I'm still very worried that we have code in the
> source that implicitly relies on there being some synchronization
> points that we've effectively removed.
>
> > > AFAICT, the design added in this patch does not provide any way
> > > to honour these requirements around buffer lifetime.
> > >
> > > I can't see how we can introduce MSG_ZEROCOPY in any seemless
> > > way. The buffer lifetime requirements imply need for an API
> > > design that is fundamentally different for asynchronous usage,
> > > with a callback to notify when the write has finished/failed.
> >
> > That is a good point.
> > Proposing a new optional method like io_async_writev() + an error
> > checking mechanism could do the job.
> > io_async_writev() could fall-back to io_writev() in cases where it's no=
t
> > implemented.
> >
> > I am not sure about the error checking yet.
> > Options I can see are:
> > 1 - A callback, as you suggested, which IIUC would be provided by
> > code using the QIOChannel, and would only fix the reported errors,
> > leaving the responsibility of checking for errors to the IOChannel code=
.
>
> A callback is fairly simple, but potentially limits performance. Reading
> the kernel docs it seems they intentionally merge notifications to enable
> a whole contiguous set to be processed in one go. A callback would
> effectively be unmerging them requiring processing one a time. Not
> sure how much this matters to our usage.
>
> > 2 - A new method, maybe io_async_errck(), which would be called
> > whenever the using code wants to deal with pending errors. It could
> > return an array/list of IOVs that need to be re-sent, for example,
> > and code using QIOChannel could deal with it however it wants.
>
> Considering that we're using TCP, we get a reliable, ordered data
> stream. So there should never be a failure that requires use to
> know specific IOVs to re-sent - the kernel still handles TCP
> re-transmit - we just have to still have the buffer available.
> As noted above though, the re-transmit is liable to send different
> data than the original transmit, which worries me.
>
> So the only errors we should get from the completion notifications
> would be errors that are completely fatal for the TCP stream. So
> for errors, we only need to know whether an error has ocurred or
> not. The second reason for the completion notifications is for
> providing a synchronization, to know when the buffer can be released
> or overwritten. That is the only scenario we need to know list of
> IOVs that completed.
>
>
>
> > > > @@ -571,6 +623,14 @@ static ssize_t qio_channel_socket_writev(QIOCh=
annel *ioc,
> > > >                           "Unable to write to socket");
> > > >          return -1;
> > > >      }
> > > > +
> > > > +    if ((flags & MSG_ZEROCOPY) && sioc->zerocopy_enabled) {
> > > > +        sioc->errq_pending +=3D niov;
> > > > +        if (sioc->errq_pending > SOCKET_ERRQ_THRESH) {
> > > > +            qio_channel_socket_errq_proc(sioc, errp);
> > > > +        }
> > > > +    }
> > >
> > > This silently looses any errors set from upto the final
> > > SOCKET_ERRQ_THRESH write() calls with MSG_ZEROCOPY set.
> >
> > You are right.
> >
> > >
> > > Also means if you have a series of writes without
> > > MSG_ZEROCOPY, it'll delay checking any pending
> > > errors.
> >
> > That's expected... if there are only happening sends without MSG_ZEROCO=
PY,
> > it means the ones sent with zerocopy can wait. The problem would be
> > the above case.
>
> Well it depends whether there are synchonization requirements in the
> caller. For example, current migration code knows that at the end of
> each iteration sending pages, that the data has all actally been
> sent. With this new logic, we might have done several more iterations
> of the migration loop before the data for the original iteration has
> been sent. The writes() for the original iteration may well be sending
> the data from the later iterations. Possibly this is ok, but it is
> a clear difference in the data that will actually go out on the wire
> with this code.
>
> > > I would suggest checkig in close(), but as mentioned
> > > earlier, I think the design is flawed because the caller
> > > fundamentally needs to know about completion for every
> > > single write they make in order to know when the buffer
> > > can be released / reused.
> >
> > Well, there could be a flush mechanism (maybe in io_sync_errck(),
> > activated with a
> > parameter flag, or on a different method if callback is preferred):
> > In the MSG_ZEROCOPY docs, we can see that the example includes using a =
poll()
> > syscall after each packet sent, and this means the fd gets a signal aft=
er each
> > sendmsg() happens, with error or not.
> >
> > We could harness this with a poll() and a relatively high timeout:
> > - We stop sending packets, and then call poll().
> > - Whenever poll() returns 0, it means a timeout happened, and so it
> > took too long
> > without sendmsg() happening, meaning all the packets are sent.
> > - If it returns anything else, we go back to fixing the errors found (r=
e-send)
> >
> > The problem may be defining the value of this timeout, but it could be
> > called only
> > when zerocopy is active.
>
> Maybe we need to check completions at the end of each iteration of the
> migration dirtypage loop ?

Sorry, I am really new to this, and I still couldn't understand why would w=
e
need to check at the end of each iteration, instead of doing a full check a=
t the
end.

Is that a case of a fatal error on TCP stream, in which a lot of packets
were reported as 'sent' but we may lose track of which were in fact sent?

Would the poll() approach above be enough for a 'flush()' ?

>
>
> > > > +static void
> > > > +qio_channel_socket_set_zerocopy(QIOChannel *ioc,
> > > > +                                bool enabled)
> > > > +{
> > > > +    QIOChannelSocket *sioc =3D QIO_CHANNEL_SOCKET(ioc);
> > > > +    int v =3D enabled ? 1 : 0;
> > > > +    int ret;
> > > > +
> > > > +    ret =3D qemu_setsockopt(sioc->fd, SOL_SOCKET, SO_ZEROCOPY, &v,=
 sizeof(v));
> > > > +    if (ret >=3D 0) {
> > > > +        sioc->zerocopy_enabled =3D true;
> > > > +    }
> > > > +}
> > >
> > > Surely we need to tell the caller wether this succeeed, otherwise
> > > the later sendmsg() is going to fail with EINVAL on older kernels
> > > where MSG_ZEROCOPY is not supported.
> >
> > Yeah, that was the idea on sioc->zerocopy_enabled, but in fact it
> > should have been
> > something like 'sioc->zerocopy_enabled =3D (ret >=3D 0) && enabled ', t=
his
> > way it would
> > reflect zerocopy only if it was enabled and the syscall worked, and not=
_zerocopy
> > otherwise.
> >
> > or something like this, if we want it to stick with zerocopy if
> > setting it off fails.
> > if (ret >=3D 0) {
> >     sioc->zerocopy_enabled =3D enabled;
> > }
>
> Yes, that is a bug fix we need, but actually I was refering
> to the later sendmsg() call. Surely we need to clear MSG_ZEROCOPY
> from 'flags', if zerocopy_enabled is not set, to avoid EINVAL
> from sendmsg.

Agree, something like io_writev(,, sioc->zerocopy_enabled ?
MSG_ZEROCOPY : 0, errp)'
should do, right?
(or an io_async_writev(), that will fall_back to io_writev() if
zerocopy is disabled)

>
> > > > diff --git a/io/channel-tls.c b/io/channel-tls.c
> > > > index 4ce890a538..bf44b0f7b0 100644
> > > > --- a/io/channel-tls.c
> > > > +++ b/io/channel-tls.c
> > > > @@ -350,6 +350,16 @@ static void qio_channel_tls_set_delay(QIOChann=
el *ioc,
> > > >      qio_channel_set_delay(tioc->master, enabled);
> > > >  }
> > > >
> > > > +
> > > > +static void qio_channel_tls_set_zerocopy(QIOChannel *ioc,
> > > > +                                         bool enabled)
> > > > +{
> > > > +    QIOChannelTLS *tioc =3D QIO_CHANNEL_TLS(ioc);
> > > > +
> > > > +    qio_channel_set_zerocopy(tioc->master, enabled);
> > > > +}
> > >
> > > This is going to be unsafe because gnutls will discard/reuse the
> > > buffer for the ciphertext after every write(). I can't see a
> > > way to safely enable MSG_ZEROCOPY when TLS is used.
> >
> > Yeah, that makes sense.
> > It would make more sense to implement KTLS, as IIRC it kind of does
> > 'zerocopy', since it saves the encrypted data directly in kernel buffer=
.
>
> I would hope it is zerocopy, in so much as the kernel can directly
> use the userspace pages as the plaintext, and then the ciphertext
> in kernel space can be sent directly without further copies.
>
> What i'm not sure is whether this means it also becomes an effectively
> asynchronous API for transmitting data. ie does it have the same
> constraints about needing to lock pages, and not modify data in the
> pages? I've not investigated it in any detail, but I don't recall
> that being mentioned, and if it was the case, it would be impossible
> to enable that transparently in gnutls as its a major semantic changed.

I think it somehow waits for the user buffer to be encrypted to the kernel
buffer, and then returns, behaving like a normal sendmsg().
(except if it's using kernel async cripto API,  which I don't think is the =
case)

>
> > We could implement KTLS as io_async_writev() for Channel_TLS, and chang=
e this
> > flag to async_enabled. If KTLS is not available, it would fall back to
> > using gnuTLS on io_writev, just like it would happen in zerocopy.
>
> If gnutls is going to support KTLS in a way we can use, I dont want to
> have any of that duplicated in QEMU code. I want to be able delegate
> as much as possible to gnutls, at least so that QEMU isn't in the loop
> for any crypto sensitive parts, as that complicates certification
> of crypto.

Yeah, that's a very good argument :)
I think it's probably the case to move from the current callback implementa=
tion
to the implementation in which we give gnuTLS the file descriptor.

( I was thinking on implementing an simpler direct gnuTLS version only
for the 'zerocopy' QIOChannel_TLS, but I think it would not make much sense=
.)


