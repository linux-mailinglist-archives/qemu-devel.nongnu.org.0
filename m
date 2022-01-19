Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D1D493414
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 05:41:39 +0100 (CET)
Received: from localhost ([::1]:44558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA2mv-0005Ch-VK
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 23:41:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nA2kA-0003rX-SR
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 23:38:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nA2k6-0005tZ-Tu
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 23:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642567121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRLS3hfhOzwNepaFO08S/DSBXSUgAMcyZg+KqynYUzk=;
 b=Xmo+mxSanEyJqNm1ooeHAva50royfT/Uv0eKk3ppi/v0HuPablEUW6sSyV+zQiYtpchoxC
 8CokSOyE0y9nCpXwPd9xUmIRd1/dGzzBYIgjanaIxlQNr9bp9dmbcW9cvS6E4DC/Q7+SCl
 W3q+RFLZnCIWY19ptbx/X8OjyZ+OJZo=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-19louF9eN0uKrsm0m-X7LA-1; Tue, 18 Jan 2022 23:38:40 -0500
X-MC-Unique: 19louF9eN0uKrsm0m-X7LA-1
Received: by mail-lf1-f69.google.com with SMTP id
 x23-20020ac25dd7000000b0042ffb81aaffso707383lfq.5
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 20:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WRLS3hfhOzwNepaFO08S/DSBXSUgAMcyZg+KqynYUzk=;
 b=O4bOhw3QKJf05QWqckF8BB9+tEtt+KrQplI8Nawlnxj6dKdr164F+DM3a517qp1P3A
 ACHfxdTDl0NDGMWMcd3yE56tsn5kyBEUXyzJLmO9LwclVncc00QJZPWNbIDHUERZfxEK
 viEKjh2MNy4zgrioyvxUNHbO088oMTYJle+IZCIk3Gbv7mv+WHcvsAqhjnbljwk76qLU
 5Q65EPe5FAyJlasbiKpG0Km6juzY2gHV4k7+5HQDeHxDYA4q84c/JoXorq4+VWGSCYlf
 VPZCYFGTGilAyMMa1yCmI0yn6hcqzcdaFQJ4jO3UBB20k31guQl6fS8bSG77M+y30yUs
 s3sw==
X-Gm-Message-State: AOAM531UYSJzwtlhsUppLElZ9OnWQoWucBqI4JXf8zOMD8GEaf+OCszG
 Vfwq8nKnOdME0fTQa3gNnja0mHwALmhnj5P8QrBYkqS6zOgBbhMv60MmrRVAUucFfMrbmq+v7tC
 IkYMupqVl24sq8dnimo11MNesDCiTjUU=
X-Received: by 2002:a05:651c:1207:: with SMTP id
 i7mr14192121lja.10.1642567117947; 
 Tue, 18 Jan 2022 20:38:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycrgn0fr+MRYS731c61C3Jlh7ftIUSgKDQgxViRVhR8yVqlz6tpWjF5CKyskR7NYFb8lw1bAvhWa6KzPl018Y=
X-Received: by 2002:a05:651c:1207:: with SMTP id
 i7mr14192101lja.10.1642567117662; 
 Tue, 18 Jan 2022 20:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-2-leobras@redhat.com>
 <YeAEeZ1eDKqzDSc5@redhat.com>
In-Reply-To: <YeAEeZ1eDKqzDSc5@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 19 Jan 2022 01:38:26 -0300
Message-ID: <CAJ6HWG5FNOdVsBq2jr8OymrQfzqeQ-eufSMvfxOQrgnkczVszA@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel,

On Thu, Jan 13, 2022 at 7:53 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Thu, Jan 06, 2022 at 07:13:38PM -0300, Leonardo Bras wrote:
> > Add flags to io_writev and introduce io_flush as optional callback to
> > QIOChannelClass, allowing the implementation of zero copy writes by
> > subclasses.
> >
> > How to use them:
> > - Write data using qio_channel_writev(...,QIO_CHANNEL_WRITE_FLAG_ZERO_C=
OPY),
> > - Wait write completion with qio_channel_flush().
> >
> > Notes:
> > As some zero copy implementations work asynchronously, it's
> > recommended to keep the write buffer untouched until the return of
> > qio_channel_flush(), to avoid the risk of sending an updated buffer
> > instead of the buffer state during write.
> >
> > As io_flush callback is optional, if a subclass does not implement it, =
then:
> > - io_flush will return 0 without changing anything.
> >
> > Also, some functions like qio_channel_writev_full_all() were adapted to
> > receive a flag parameter. That allows shared code between zero copy and
> > non-zero copy writev, and also an easier implementation on new flags.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  include/io/channel.h | 67 +++++++++++++++++++++++++++++++++++---------
> >  io/channel-buffer.c  |  1 +
> >  io/channel-command.c |  1 +
> >  io/channel-file.c    |  1 +
> >  io/channel-socket.c  |  2 ++
> >  io/channel-tls.c     |  1 +
> >  io/channel-websock.c |  1 +
> >  io/channel.c         | 51 +++++++++++++++++++++++----------
> >  migration/rdma.c     |  1 +
> >  9 files changed, 98 insertions(+), 28 deletions(-)
> >
> > diff --git a/include/io/channel.h b/include/io/channel.h
> > index 88988979f8..343766ce5b 100644
> > --- a/include/io/channel.h
> > +++ b/include/io/channel.h
> > @@ -32,12 +32,15 @@ OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
> >
> >  #define QIO_CHANNEL_ERR_BLOCK -2
> >
> > +#define QIO_CHANNEL_WRITE_FLAG_ZERO_COPY 0x1
> > +
> >  typedef enum QIOChannelFeature QIOChannelFeature;
> >
> >  enum QIOChannelFeature {
> >      QIO_CHANNEL_FEATURE_FD_PASS,
> >      QIO_CHANNEL_FEATURE_SHUTDOWN,
> >      QIO_CHANNEL_FEATURE_LISTEN,
> > +    QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY,
> >  };
> >
> >
> > @@ -104,6 +107,7 @@ struct QIOChannelClass {
> >                           size_t niov,
> >                           int *fds,
> >                           size_t nfds,
> > +                         int flags,
> >                           Error **errp);
> >      ssize_t (*io_readv)(QIOChannel *ioc,
> >                          const struct iovec *iov,
> > @@ -136,6 +140,8 @@ struct QIOChannelClass {
> >                                    IOHandler *io_read,
> >                                    IOHandler *io_write,
> >                                    void *opaque);
> > +    int (*io_flush)(QIOChannel *ioc,
> > +                    Error **errp);
> >  };
> >
> >  /* General I/O handling functions */
> > @@ -222,12 +228,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
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
> > @@ -255,12 +262,16 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
> >   * or QIO_CHANNEL_ERR_BLOCK if no data is can be sent
> >   * and the channel is non-blocking
> >   */
> > -ssize_t qio_channel_writev_full(QIOChannel *ioc,
> > -                                const struct iovec *iov,
> > -                                size_t niov,
> > -                                int *fds,
> > -                                size_t nfds,
> > -                                Error **errp);
> > +ssize_t qio_channel_writev_full_flags(QIOChannel *ioc,
> > +                                      const struct iovec *iov,
> > +                                      size_t niov,
> > +                                      int *fds,
> > +                                      size_t nfds,
> > +                                      int flags,
> > +                                      Error **errp);
> > +
> > +#define qio_channel_writev_full(ioc, iov, niov, fds, nfds, errp) \
> > +    qio_channel_writev_full_flags(ioc, iov, niov, fds, nfds, 0, errp)
>
> Don't introduce yet another API variant here. Just add flags to
> all the existing write APIs with "full" in their name. The word
> "full" in their name was intended to indicate that they are
> accepting all possible parameters, so it doesn't mean sense to
> add APIs which take even more possible parameters.

Oh, I was not aware of that. Thanks for letting me know!

Sure, I will do this change for v8.


>
> > +int qio_channel_writev_full_all_flags(QIOChannel *ioc,
> > +                                      const struct iovec *iov,
> > +                                      size_t niov,
> > +                                      int *fds, size_t nfds,
> > +                                      int flags, Error **errp);
> > +#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
> > +    qio_channel_writev_full_all_flags(ioc, iov, niov, fds, nfds, 0, er=
rp)
>
> Same note.
>
> > +/**
> > + * qio_channel_flush:
> > + * @ioc: the channel object
> > + * @errp: pointer to a NULL-initialized error object
> > + *
> > + * Will block until every packet queued with
> > + * qio_channel_writev_full_flags() + QIO_CHANNEL_WRITE_FLAG_ZERO_COPY
> > + * is sent, or return in case of any error.
> > + *
> > + * If not implemented, acts as a no-op, and returns 0.
> > + *
> > + * Returns -1 if any error is found,
> > + *          1 if every send failed to use zero copy.
> > + *          0 otherwise.
> > + */
> > +
> > +int qio_channel_flush(QIOChannel *ioc,
> > +                      Error **errp);
>
>

Best regards,
Leo


