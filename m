Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AD84A64E5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 20:21:53 +0100 (CET)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEyit-0003Gr-Rx
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 14:21:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nEwvI-0007bb-4j
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:26:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nEwvD-0008LW-AD
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643736343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1h2pQBxhub5l7le/NgZgQiPNEVuP6qFJUuizUgtjMJA=;
 b=U2FN2d5l9qUUTbv/ZC9Pt6flXvyyNxqAdLRZZU4Vglj79xFUiHfhSDSsaE+Dnk8xmws+lg
 9WNeNinKtztvFmSwnE2Yvre/CH9e3gIkpTahczzmbEXXyOqNqyVny3tfmMjzhkV3veCzz9
 j4YnSa8Gu01NkYywK8CWMcirBoJQNa4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-XXzRB7oWMQi51Kw9ZKAsiw-1; Tue, 01 Feb 2022 12:25:40 -0500
X-MC-Unique: XXzRB7oWMQi51Kw9ZKAsiw-1
Received: by mail-lj1-f199.google.com with SMTP id
 k18-20020a05651c10b200b002430548189aso2249130ljn.15
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1h2pQBxhub5l7le/NgZgQiPNEVuP6qFJUuizUgtjMJA=;
 b=USRchc3iSDFd6SPmgijmaGuUIri72odXBtLzT26t+m2SVAxcyf3o1ocrEW6RjErAaY
 oqDHkJJmvMaXittrnrft2l3Njbd1taTqB6hKKihZlATAlvEmQYbYMvQzMD0StOAtrtpc
 PhdV9plErfh89mqaG+MvmrUJWRTwGkX8l1wCsH4BnPz7cAmzFXLbJQ0gOjGZ94iiqkv2
 jwYL6StwZkSD8ZLUFF7Gb4Iw0eBZhyWHAwgZriDNURKt2PA5kyCx/h4vYsPL8Dst51C/
 e3GHqBQQ9hcT1FZVoPpL277ciCTSbGqaUcjOvNrEaCDcry2ZJjphgWjnuxiVELZBH/h8
 0nfQ==
X-Gm-Message-State: AOAM533TAMuLhTDrBc/wKo5y7MuQlAbdSzZdib4ZL3r18dfY+Mflcc4j
 oCYv/K2kYMpFsa8vLV5MYzwgZEsj+wV5RFrxr5HoayCzicspuAsUX/sqPvllUxEbvY6+lUuWcRt
 ux5J0SdMZZA4tP4BxFIfI4aD+Mp/Gszg=
X-Received: by 2002:a05:6512:2292:: with SMTP id
 f18mr20312565lfu.473.1643736339358; 
 Tue, 01 Feb 2022 09:25:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy6FMA23nZabmaTttPO6vuYoLrizTbptFsn+uCkSVj5eKubR0qnSM9ZDOCh/t945WAur9/alU2zCHeNE4g50kQ=
X-Received: by 2002:a05:6512:2292:: with SMTP id
 f18mr20312532lfu.473.1643736338942; 
 Tue, 01 Feb 2022 09:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-2-leobras@redhat.com>
 <Yfj+yTzzNgL80scj@redhat.com>
In-Reply-To: <Yfj+yTzzNgL80scj@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 1 Feb 2022 14:25:27 -0300
Message-ID: <CAJ6HWG7=krq4Ek+rCm6vzR02y0bcmkKTsLmkJa_LFDGqYHxJsg@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] QIOChannel: Add flags on io_writev and introduce
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Daniel, thanks for reviewing!

On Tue, Feb 1, 2022 at 6:35 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Feb 01, 2022 at 03:28:59AM -0300, Leonardo Bras wrote:
> > Add flags to io_writev and introduce io_flush as optional callback to
> > QIOChannelClass, allowing the implementation of zero copy writes by
> > subclasses.
> >
> > How to use them:
> > - Write data using qio_channel_writev*(...,QIO_CHANNEL_WRITE_FLAG_ZERO_=
COPY),
> > - Wait write completion with qio_channel_flush().
> >
> > Notes:
> > As some zero copy write implementations work asynchronously, it's
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
> >  include/io/channel.h                | 38 ++++++++++++++++++++-
> >  chardev/char-io.c                   |  2 +-
> >  hw/remote/mpqemu-link.c             |  2 +-
> >  io/channel-buffer.c                 |  1 +
> >  io/channel-command.c                |  1 +
> >  io/channel-file.c                   |  1 +
> >  io/channel-socket.c                 |  2 ++
> >  io/channel-tls.c                    |  1 +
> >  io/channel-websock.c                |  1 +
> >  io/channel.c                        | 53 +++++++++++++++++++++++------
> >  migration/rdma.c                    |  1 +
> >  scsi/pr-manager-helper.c            |  2 +-
> >  tests/unit/test-io-channel-socket.c |  1 +
> >  13 files changed, 92 insertions(+), 14 deletions(-)
> >
> > diff --git a/io/channel.c b/io/channel.c
> > index e8b019dc36..b8b99fdc4c 100644
> > --- a/io/channel.c
> > +++ b/io/channel.c
> > @@ -72,18 +72,32 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
> >                                  size_t niov,
> >                                  int *fds,
> >                                  size_t nfds,
> > +                                int flags,
> >                                  Error **errp)
> >  {
> >      QIOChannelClass *klass =3D QIO_CHANNEL_GET_CLASS(ioc);
> >
> > -    if ((fds || nfds) &&
> > -        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
> > +    if (fds || nfds) {
> > +        if (!qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)=
) {
> > +            error_setg_errno(errp, EINVAL,
> > +                             "Channel does not support file descriptor=
 passing");
> > +            return -1;
> > +        }
> > +        if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > +            error_setg_errno(errp, EINVAL,
> > +                             "Zero Copy does not support file descript=
or passing");
> > +            return -1;
> > +        }
>
> Here you gracefully reject FD passing when zero copy is requested
> which is good.
>
> > +    }
> > +
>
> > @@ -235,10 +249,16 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
> >                            iov, niov,
> >                            0, iov_size(iov, niov));
> >
> > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > +        assert(fds =3D=3D NULL && nfds =3D=3D 0);
> > +    }
>
> But here you  abort QEMU if FD passing is requested when zero copy
> is set.
>
> AFAICT, if you just delete this assert, the code to gracefully
> report errors will do the right thing.

Yeah, that=C5=9B right. This test is unnecessary since qio_channel_writev_f=
ull()
will be called and will return error if fds + zerocopy happens.

Good catch!

>
> Without the assert:
>
>   Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Thanks!
I will wait for more feedback on other patches before sending the v9,
but it should not take too long this time.

Best regards,
Leo


