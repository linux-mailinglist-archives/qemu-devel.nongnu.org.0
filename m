Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B495545999
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 03:33:03 +0200 (CEST)
Received: from localhost ([::1]:59744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzTWH-0005lz-EY
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 21:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nzTTy-0004vF-On
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 21:30:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nzTTv-0001lV-Ct
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 21:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654824633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHx0xosdHLMP4x1cxujo4E/5U6N6v/YKoOC7ZMViuhU=;
 b=JGbrrlpZlCUWFebzhTSnpnXBTlyMwbDpXTJzY8Mwycw7fMhypGYh3W54c9W6BIBmApJSa0
 Mp4LKoVAD495KvC27cawrOX6MuTbQKaWcqOYNP5CbhcfpaYYtBPtB0ojwqBHOLLrmQoT7M
 TA6vRQyFBNdzduVjuRYxi5AFuZPXxpM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-cZ85pq-UPCCVFwaBhWG0ew-1; Thu, 09 Jun 2022 21:30:32 -0400
X-MC-Unique: cZ85pq-UPCCVFwaBhWG0ew-1
Received: by mail-ej1-f70.google.com with SMTP id
 gh36-20020a1709073c2400b0070759e390fbso11656255ejc.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 18:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SHx0xosdHLMP4x1cxujo4E/5U6N6v/YKoOC7ZMViuhU=;
 b=q6Ea0sHrJuNNrw8eUWVJHqgHakD0kLaQVFU1NQIZMN2jHHHmeyye/FeVlIBvjIRChz
 XIRLTpQur6KzExjUdJ2hHT0g80zCoOsenfvnyzixErTgNwX9rZVqIWENDkmehxFTx/FY
 gNu0A6TbUsQd6um//iay8RHWx8Gnys3fv6EuHtC+abOmUqhxBweOZuS8JGTUxmg0Q5eR
 Pbc7U/CccS2gw/N66GgUA9vm2ZWWgfVL8PwfGslb2FBEWEpaineIfDBIRxO75zndfF5A
 6jJoYkhoJYeaFOlb2Dplrd2GiwLEzfPUO61TFnuXq2zDS4bnksc62CoH7Hbti7gh7aZE
 vwWw==
X-Gm-Message-State: AOAM5325pIj8/8o5aAL8W2BvBrNLbNFa2ZCODzEg0q9Z1eG7mCo7kQhI
 8uXsB3EbBJdz3vhSvQYkbeXQXjHXbxTmq5ONlHrmXweFtbEyXyXfDFm8G/3cf6DjO4MbH1a+e4F
 4PjL0rHqyWRdAdJomhxXuqxJCNH0BRdE=
X-Received: by 2002:a05:6402:322a:b0:42e:1778:1f1f with SMTP id
 g42-20020a056402322a00b0042e17781f1fmr46014784eda.115.1654824630944; 
 Thu, 09 Jun 2022 18:30:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgQxC76QI0MLjbvAqPFMCaIw5DFVBjcdhqT2NhkKWrVFv+E0e8NF1b5A4sDXLgkPFN55GifBNJfqArhgChMx0=
X-Received: by 2002:a05:6402:322a:b0:42e:1778:1f1f with SMTP id
 g42-20020a056402322a00b0042e17781f1fmr46014766eda.115.1654824630647; Thu, 09
 Jun 2022 18:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220608210403.84006-1-leobras@redhat.com>
 <YqGq0Bw7V26vaNoI@redhat.com>
In-Reply-To: <YqGq0Bw7V26vaNoI@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 9 Jun 2022 22:30:19 -0300
Message-ID: <CAJ6HWG41=Wwf5gMY=Q0G2VCKfdNsyDRGDXELwvgRBjXMNB9GKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] QIOChannelSocket: Reduce ifdefs to improve
 readability
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>, 
 David Gilbert <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hello Daniel,

On Thu, Jun 9, 2022 at 5:10 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Wed, Jun 08, 2022 at 06:04:02PM -0300, Leonardo Bras wrote:
> > During implementation of MSG_ZEROCOPY feature, a lot of #ifdefs were
> > introduced, particularly at qio_channel_socket_writev().
> >
> > Rewrite some of those changes so it's easier to read.
> >                                                                       .=
..
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  io/channel-socket.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/io/channel-socket.c b/io/channel-socket.c
> > index dc9c165de1..ef7c7cfbac 100644
> > --- a/io/channel-socket.c
> > +++ b/io/channel-socket.c
> > @@ -554,6 +554,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel=
 *ioc,
> >      size_t fdsize =3D sizeof(int) * nfds;
> >      struct cmsghdr *cmsg;
> >      int sflags =3D 0;
> > +    bool zero_copy_enabled =3D false;
> >
> >      memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
> >
> > @@ -581,6 +582,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel=
 *ioc,
> >  #ifdef QEMU_MSG_ZEROCOPY
> >      if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> >          sflags =3D MSG_ZEROCOPY;
> > +        zero_copy_enabled =3D true;
> >      }
>
> There should be a
>
>  #else
>     error_setg(errp, "Zero copy not supported on this platform");
>     return -1;
>  #endif
>

IIUC, if done as suggested, it will break every non-zero-copy call of
qio_channel_socket_writev();

I think you are suggesting something like :

    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
#ifdef QEMU_MSG_ZEROCOPY
        sflags =3D MSG_ZEROCOPY;
        zero_copy_enabled =3D true; // I know you suggested this out,
just for example purposes
#else
        error_setg(errp, "Zero copy not supported on this platform");
        return -1;
#endif
    }

Which is supposed to fail if QIO_CHANNEL_WRITE_FLAG_ZERO_COPY is specified,=
 but
qemu does not support it at compile time.

If I get the part above correctly, it would not be necessary, as
qio_channel_socket_writev() is
called only by qio_channel_writev_full(), which tests:

    if ((flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) &&
        !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY))=
 {
        error_setg_errno(errp, EINVAL,
                         "Requested Zero Copy feature is not available");
        return -1;
    }

and QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY is only set in
qio_channel_socket_connect_sync(), and is conditional to QEMU_MSG_ZEROCOPY
being enabled during compile time. Meaning it's the same test as
before mentioned, but
failing earlier.

> >  #endif
> >
> > @@ -592,15 +594,13 @@ static ssize_t qio_channel_socket_writev(QIOChann=
el *ioc,
> >              return QIO_CHANNEL_ERR_BLOCK;
> >          case EINTR:
> >              goto retry;
> > -#ifdef QEMU_MSG_ZEROCOPY
> >          case ENOBUFS:
> > -            if (sflags & MSG_ZEROCOPY) {
> > +            if (zero_copy_enabled) {
>
> if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY)
>
> avoids the #ifdef without needing to add yet another
> variable expressing what's already expressed in both
> 'flags' and 'sflags'.

Yes, it does, but at the cost of not compiling-out the zero-copy part
when it's not supported,
since the QIO_CHANNEL_WRITE_FLAG_ZERO_COPY comes as a parameter. This ends =
up
meaning there will be at least one extra test for every time this
function is called (the one in the next patch).

An option would be testing sflags & MSG_ZEROCOPY, which would
compile-out zero-copy code
if it's not supported, but there was a bug in some distros where
MSG_ZEROCOPY is not defined,
causing the build to fail.

I understand the idea of reusing those variables instead of creating a
new one, but this boolean
variable will most certainly be compiled-out in this function, and
will allow compiling out the
zero-copy code where it's not supported.

Best regards,
Leo


>
> >                  error_setg_errno(errp, errno,
> >                                   "Process can't lock enough memory for=
 using MSG_ZEROCOPY");
> >                  return -1;
> >              }
> >              break;
> > -#endif
> >          }
> >
> >          error_setg_errno(errp, errno,
> > --
> > 2.36.1
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


