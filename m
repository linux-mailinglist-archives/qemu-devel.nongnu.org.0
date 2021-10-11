Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BBB4297A3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 21:40:03 +0200 (CEST)
Received: from localhost ([::1]:53498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma19V-0006q0-TO
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 15:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1ma183-00064G-5g
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1ma17z-0000FS-Ge
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633981106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/oZ+J1ZIIh36RnphJ7uOLrr9vTAHAlR78GfHKahiSRk=;
 b=MrhM4oIHgNo/g3xIqrIfOHQp0Bowx/PiMB3K3W1MMyWoQQny+i0BH2v63mj+pvg1x92H6O
 7Thrm3/Qll0nWNC9wwNoGNEDlLuZ49bhmAjJ1SWh3qCmBnQS7TjHW6C62JUNqUKDBYnkyN
 OEErj1HBNMsle+xsRWXr3l2GMzZ1qTw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-JwZPpGchNOGZzkkalxvdjQ-1; Mon, 11 Oct 2021 15:38:25 -0400
X-MC-Unique: JwZPpGchNOGZzkkalxvdjQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 g9-20020a0565123b8900b003f33a027130so13478182lfv.18
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 12:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/oZ+J1ZIIh36RnphJ7uOLrr9vTAHAlR78GfHKahiSRk=;
 b=oiYblIXRheH6HZOVfXUmZQGK+NDxcuJfHzhqYLKIqHkekKUy4oPKMHqx+AUE0PfnUY
 g5RrUEGNKM0ZqjgC34V4dyDjKiVoGVoOHi9N5GxN5/UybkLmoI4NGAD1B9z7L1WMdxyg
 aVqenCSqzNH+Yqk0gzbVJXo7npCG/HxbT5V7UzREYjGTUd1Lmo+TqjVPjvL1MK56UJRw
 Be3t7UA1gwZjREcbpVAEaSqNhrY5FnCp7+VVPPhhXZwQIJuSckS5OlPN4O/pYZp4rvhg
 eSv547Hv7kywNIqgb7HMyidGcx8cUy2UviuxLhuTfwlAG5ci0zMb1cJyCkdXwbOUFYX7
 NnHw==
X-Gm-Message-State: AOAM530GLYx7C2NV5fwNAGGojFW/wZEC3tHA+d9Fm5FzSWUtUHmrS9pG
 onU/Daot6lGaFIXCQ2yyZ7AbAhKAm9XLdQ36Lupy7qIaK0N5M7L0/lKV3+fTdvGsUs8hEdvSw/N
 vjpVEWRhXlAVWiveIen50zcWydy7cCkg=
X-Received: by 2002:ac2:592f:: with SMTP id v15mr13789604lfi.17.1633981102857; 
 Mon, 11 Oct 2021 12:38:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytEZsaWQgYnRpiNxEqPUGtR2dxeGatcHnoZau/Vi1Nr5Ca4Fr4v4r7HaHEzmE1LOqwKt9+OULfUHXJpEGXIL8=
X-Received: by 2002:ac2:592f:: with SMTP id v15mr13789569lfi.17.1633981102475; 
 Mon, 11 Oct 2021 12:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-2-leobras@redhat.com>
 <20211011191708.or43v24srlm6srog@redhat.com>
In-Reply-To: <20211011191708.or43v24srlm6srog@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 11 Oct 2021 16:38:23 -0300
Message-ID: <CAJ6HWG6jMC__-iQ6Xu6uRmzyUr4u0Pq55POc=J6bhHr9m2Nf+A@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Eric, thank you for the feedback!

On Mon, Oct 11, 2021 at 4:17 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Sat, Oct 09, 2021 at 04:56:11AM -0300, Leonardo Bras wrote:
> > Adds io_async_writev and io_async_flush as optional callback to QIOChannelClass,
>
> Are these names accurate?

I am sorry, I think I missed some renaming before generating the patchset.
As you suggested those names are incorrect (as they reflect a previous
naming used in v3).
I will replace them for io_{writev,flush}_zerocopy in v5.

>
> > allowing the implementation of asynchronous writes by subclasses.
> >
> > How to use them:
> > - Write data using qio_channel_writev_zerocopu(),
>
> s/copu/copy/

Thanks, I will fix that.

>
> > - Wait write completion with qio_channel_flush_zerocopy().
> >
> > Notes:
> > As some zerocopy implementations work asynchronously, it's
> > recommended to keep the write buffer untouched until the return of
> > qio_channel_flush_zerocopy(), by the risk of sending an updated buffer
>
> s/by/to avoid/
>
> > instead of the one at the write.
> >
> > As the new callbacks are optional, if a subclass does not implement them, then:
> > - io_async_writev will return -1,
> > - io_async_flush will return 0 without changing anything.
>
> Are these names accurate?

They are not, I will replace them for io_{writev,flush}_zerocopy in v5.

>
> >
> > Also, some functions like qio_channel_writev_full_all() were adapted to
> > receive a flag parameter. That allows shared code between zerocopy and
> > non-zerocopy writev.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  include/io/channel.h | 103 +++++++++++++++++++++++++++++++++++--------
> >  io/channel.c         |  74 +++++++++++++++++++++++--------
> >  2 files changed, 141 insertions(+), 36 deletions(-)
> >
> > diff --git a/include/io/channel.h b/include/io/channel.h
> > index 88988979f8..e7d4e1521f 100644
> > --- a/include/io/channel.h
> > +++ b/include/io/channel.h
> > @@ -32,12 +32,15 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
> >
> >  #define QIO_CHANNEL_ERR_BLOCK -2
> >
> > +#define QIO_CHANNEL_WRITE_FLAG_ZEROCOPY 0x1
> > +
> >  typedef enum QIOChannelFeature QIOChannelFeature;
> >
> >  enum QIOChannelFeature {
> >      QIO_CHANNEL_FEATURE_FD_PASS,
> >      QIO_CHANNEL_FEATURE_SHUTDOWN,
> >      QIO_CHANNEL_FEATURE_LISTEN,
> > +    QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY,
> >  };
> >
> >
> > @@ -136,6 +139,12 @@ struct QIOChannelClass {
> >                                    IOHandler *io_read,
> >                                    IOHandler *io_write,
> >                                    void *opaque);
> > +    ssize_t (*io_writev_zerocopy)(QIOChannel *ioc,
> > +                                  const struct iovec *iov,
> > +                                  size_t niov,
> > +                                  Error **errp);
> > +    int (*io_flush_zerocopy)(QIOChannel *ioc,
> > +                              Error **errp);
>
> Indentation is off by one.

Thanks, I will fix that for v5.

>
> >  };
> >
> >  /* General I/O handling functions */
> > @@ -222,12 +231,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
> >
> >
> >  /**
> > - * qio_channel_writev_full:
> > + * qio_channel_writev_full_flags:
> >   * @ioc: the channel object
> >   * @iov: the array of memory regions to write data from
> >   * @niov: the length of the @iov array
> >   * @fds: an array of file handles to send
> >   * @nfds: number of file handles in @fds
> > + * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
> >   * @errp: pointer to a NULL-initialized error object
> >   *
> >   * Write data to the IO channel, reading it from the
> > @@ -242,6 +252,10 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
> >   * guaranteed. If the channel is non-blocking and no
> >   * data can be sent, it will return QIO_CHANNEL_ERR_BLOCK
> >   *
> > + * If flag QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed,
> > + * function will return once each buffer was queued for
> > + * sending.
>
> This would be a good place to document the requirement to keep the
> buffer unchanged until the zerocopy sequence completes.

That makes sense, even though that may be true for just some implementations,
it makes sense to document it here.

>
> >                                 Error **errp);
> >
> >  /**
> > - * qio_channel_writev_full_all:
> > + * qio_channel_writev_full_all_flags:
> >   * @ioc: the channel object
> >   * @iov: the array of memory regions to write data from
> >   * @niov: the length of the @iov array
> >   * @fds: an array of file handles to send
> >   * @nfds: number of file handles in @fds
> > + * @flags: write flags (QIO_CHANNEL_WRITE_FLAG_*)
> >   * @errp: pointer to a NULL-initialized error object
> >   *
> >   *
> > @@ -846,13 +868,58 @@ int qio_channel_readv_full_all(QIOChannel *ioc,
> >   * to be written, yielding from the current coroutine
> >   * if required.
> >   *
> > + * If QIO_CHANNEL_WRITE_FLAG_ZEROCOPY is passed in flags,
> > + * instead of waiting for all requested data to be written,
> > + * this function will wait until it's all queued for writing.
>
> Another good place to document restrictions on buffer stability.

Ok :)

>
> > + *
> >   * Returns: 0 if all bytes were written, or -1 on error
> >   */
> >
> > -int qio_channel_writev_full_all(QIOChannel *ioc,
> > -                                const struct iovec *iov,
> > -                                size_t niov,
> > -                                int *fds, size_t nfds,
> > -                                Error **errp);
> > +int qio_channel_writev_full_all_flags(QIOChannel *ioc,
> > +                                      const struct iovec *iov,
> > +                                      size_t niov,
> > +                                      int *fds, size_t nfds,
> > +                                      int flags, Error **errp);
> > +#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
> > +    qio_channel_writev_full_all_flags(ioc, iov, niov, fds, nfds, 0, errp)
> > +
> > +/**
> > + * qio_channel_writev_zerocopy:
> > + * @ioc: the channel object
> > + * @iov: the array of memory regions to write data from
> > + * @niov: the length of the @iov array
> > + * @errp: pointer to a NULL-initialized error object
> > + *
> > + * Behaves like qio_channel_writev_full_all_flags, but will write
> > + * data asynchronously while avoiding unnecessary data copy.
> > + * This function may return before any data is actually written,
> > + * but should queue every buffer for writting.
>
> writing
>
> Another place to document buffer stability considerations.

Ok,
Is it enough to document it in a single one of the places suggested, or
would you recommend documenting it in all suggested places?

>
> > + *
> > + * If at some point it's necessary wait for all data to be
>
> s/wait/to wait/

I will fix that for v5, thanks!

>
> > + * written, use qio_channel_flush_zerocopy().
> > + *
> > + * If zerocopy is not available, returns -1 and set errp.
> > + */
> > +
> > +ssize_t qio_channel_writev_zerocopy(QIOChannel *ioc,
> > +                                    const struct iovec *iov,
> > +                                    size_t niov,
> > +                                    Error **errp);
> > +
> > +/**
> > + * qio_channel_flush_zerocopy:
> > + * @ioc: the channel object
> > + * @errp: pointer to a NULL-initialized error object
> > + *
> > + * Will lock until every packet queued with
>
> s/lock/block/

Yeah, I should have fixed it in v4.
Thanks for pointing this out.

>
> > + * qio_channel_writev_zerocopy() is sent, or return
> > + * in case of any error.
> > + *
> > + * Returns -1 if any error is found, 0 otherwise.
> > + * If not implemented, returns 0 without changing anything.
> > + */
> > +
> > +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> > +                               Error **errp);
> >
> >  #endif /* QIO_CHANNEL_H */
> > diff --git a/io/channel.c b/io/channel.c
> > index e8b019dc36..811c93ae23 100644
> > --- a/io/channel.c
> > +++ b/io/channel.c
>
> > +int qio_channel_flush_zerocopy(QIOChannel *ioc,
> > +                               Error **errp)
> > +{
> > +    QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> > +
> > +    if (!klass->io_flush_zerocopy ||
> > +        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY)) {
> > +        return 0;
>
> Matches your documentation, but an ideal app should not be trying to
> flush if the write failed in the first place.  So wouldn't it be
> better to return -1 or even abort() on a coding error?

The point here is that any valid user of zrocopy_flush would have
already used zerocopy_writev
at some point, and failed if not supported / enabled.

Having this not returning error can help the user keep a simpler
approach when using
a setup in which the writev can happen in both zerocopy or default behavior.

I mean, the user will not need to check if zerocopy was or was not
enabled, and just flush anyway.

But if it's not good behavior, or you guys think it's a better
approach to fail here, I can also do that.

>
> > +    }
> > +
> > +    return klass->io_flush_zerocopy(ioc, errp);
> > +}
> > +
> > +
> >  static void qio_channel_restart_read(void *opaque)
> >  {
> >      QIOChannel *ioc = opaque;
> > --
> > 2.33.0
> >
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>

Thank you for reviewing!

Best regards,
Leo


