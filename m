Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B07E4671A0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 06:27:10 +0100 (CET)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt16D-0003aU-2R
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 00:27:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mt14P-0002rZ-CA
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 00:25:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mt14L-0004NQ-7a
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 00:25:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638509110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=irUvQlCmdvqGuDXErfj31FIPbJEteBVIernFNR331qY=;
 b=BkGGfRbsETaVEF3s/qnQ25VRxQCcg5h3Z2YLrvB4ul93cEuv3ECp0l6Bfx04XGeezWvDA7
 24uMrN83nTgBuCAIph6o3xbwmJCVKwyEW17LOEXUdIyDfEUGwOd/89w0CY1+JS4VE3eRkF
 XJE+wdle/q0tuQbw5nPFZLkhNyleyjw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-ROO_o9WWOJOJJJdGfhWUTQ-1; Fri, 03 Dec 2021 00:25:05 -0500
X-MC-Unique: ROO_o9WWOJOJJJdGfhWUTQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 k5-20020a05651210c500b0040934a07fbdso626324lfg.22
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 21:25:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=irUvQlCmdvqGuDXErfj31FIPbJEteBVIernFNR331qY=;
 b=u+rbfWBqGpJlzVEyKX8RahchKoCmbEoklbO0G6tLK/BfeewX4nGDN8zD1B3rueHHG1
 5o3hGrifZjLJA0TmtvGQ4kXrJRfBEM8Q26LIJvd0t9zosGvnG9fJx9vov7kav+1rf/Hj
 gOyTDS8SV051mkbmiypD14RbFArPIypmrfqskyLecmC+M+N5/FHuBd1eCddBwsOqPFiG
 XgwUyTw9Bp63TUKqLUkNowdNftibY+uG1R/U+0y6cbk3ue6I13lpOUjDlBlI4SRTrzpV
 fc4rHjZgLqYf//ncI/RpcWTibHhf8yUa6XuChaAgE5rCTAyDziwcqxEwL+7bAAgmTWFy
 K/2Q==
X-Gm-Message-State: AOAM533VyfAQvTYnEDem/vSNjpj9igIPKohSKqItHwXqrXnd/yv/+glJ
 5F5pa7ZS0hs5yFPbCriZ5kPFKp1W2Yx+c9S1h4DYZv8oiGpHAISO4gOXiv1PmuAccwogo6jsRW0
 9FdbbwuX+b5bK+pjslIHPDIcuYtnDJHI=
X-Received: by 2002:a2e:141e:: with SMTP id u30mr16194573ljd.434.1638509104135; 
 Thu, 02 Dec 2021 21:25:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQ7gGia0BVvaGNpLKSjKOcHs1aeFQ8UIAawmJAHIaXgzcrrgv0zgGG01eQusbtJLCOXDc6mX852ASqE7kaCAQ=
X-Received: by 2002:a2e:141e:: with SMTP id u30mr16194545ljd.434.1638509103822; 
 Thu, 02 Dec 2021 21:25:03 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-2-leobras@redhat.com>
 <YY4+LWnRTV7iaErs@redhat.com>
 <CAJ6HWG4Z7Y=qvp4SZE1+hsk-imouHrsBr9M8Seo1_zPvMtOWjg@mail.gmail.com>
 <YZy4Kz/H/9sZpjCi@redhat.com>
In-Reply-To: <YZy4Kz/H/9sZpjCi@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Fri, 3 Dec 2021 02:24:52 -0300
Message-ID: <CAJ6HWG6T5HnwUp0u-w8ViYRPTt88MLjNawXzTh+zCHkq+UKS0A@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] QIOChannel: Add io_writev_zerocopy &
 io_flush_zerocopy callbacks
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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

On Tue, Nov 23, 2021 at 6:45 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Nov 22, 2021 at 08:18:09PM -0300, Leonardo Bras Soares Passos wro=
te:
> > Hello Daniel,
> > Thanks for the feedback!
> >
> > On Fri, Nov 12, 2021 at 7:13 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> > >
> > > On Fri, Nov 12, 2021 at 02:10:36AM -0300, Leonardo Bras wrote:
> > > > -int qio_channel_writev_all(QIOChannel *ioc,
> > > > -                           const struct iovec *iov,
> > > > -                           size_t niov,
> > > > -                           Error **erp);
> > > > +int qio_channel_writev_all_flags(QIOChannel *ioc,
> > > > +                                 const struct iovec *iov,
> > > > +                                 size_t niov,
> > > > +                                 int flags,
> > > > +                                 Error **errp);
> > > > +#define qio_channel_writev_all(ioc, iov, niov, errp) \
> > > > +    qio_channel_writev_all_flags(ioc, iov, niov, 0, errp)
> > >
> > > We already have separate methods for zerocopy, instead of adding
> > > flags, so we shouldn't add flags to this either.
> > >
> > > Add a qio_channel_writev_zerocopy_all method instead.
> > >
> > > Internally, we can still make both qio_channel_writev_zerocopy_all
> > > and qio_channel_writev_all use the same helper method, just don't
> > > expose flags in the public API. Even internally we don't really
> > > need flags, just a bool
> >
> > I see.
> > The idea of having a flag was to make it easier to expand the
> > interface in the future.
> > I got some feedback on v1 that would suggest it would be desired:
> > http://patchwork.ozlabs.org/project/qemu-devel/patch/20210831110238.299=
458-2-leobras@redhat.com/
> >
> >
> > >
> > [...]
> > > > +#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, err=
p) \
> > > > +    qio_channel_writev_full_all_flags(ioc, iov, niov, fds, nfds, 0=
, errp)
> > >
> > > There's no need for this at all. Since fd passing is not supported
> > > with zerocopy, there's no reason to ever use this method.
> > >
> > > > +/**
> > > > + * qio_channel_writev_zerocopy:
> > > > + * @ioc: the channel object
> > > > + * @iov: the array of memory regions to write data from
> > > > + * @niov: the length of the @iov array
> > > > + * @errp: pointer to a NULL-initialized error object
> > > > + *
> > > > + * Behaves like qio_channel_writev_full_all_flags, but may write
> > >
> > > qio_channel_writev
> > >
> > > > + * data asynchronously while avoiding unnecessary data copy.
> > > > + * This function may return before any data is actually written,
> > > > + * but should queue every buffer for writing.
> > >
> > > Callers mustn't rely on "should" docs - they must rely on the
> > > return value indicating how many bytes were accepted.
> > >
> > > Also mention that this requires locked memory and can/will fail if
> > > insufficient locked memory is available.
> > >
> >
> > Sure, I will update that.
> >
> > > > +/**
> > > > + * qio_channel_flush_zerocopy:
> > > > + * @ioc: the channel object
> > > > + * @errp: pointer to a NULL-initialized error object
> > > > + *
> > > > + * Will block until every packet queued with
> > > > + * qio_channel_writev_zerocopy() is sent, or return
> > > > + * in case of any error.
> > > > + *
> > > > + * Returns -1 if any error is found, 0 otherwise.
> > >
> > >   Returns -1 if any error is found, 0 if all data was sent,
> > >            or 1 if all data was sent but at least some was copied.
> > >
> >
> > I don't really get the return 1 part, I mean, per description it will
> > 'block until every queued packet was sent, so "at least some was
> > copied" doesn't seem to fit here.
> > Could you elaborate?
>
> Passing the ZEROCOPY flag to the kernel does not guarantee
> that the copy is avoided, it is merely a hint to the kernel
>
> When getting the notification, the ee_code  field in the
> notification struct will have the flag
> SO_EE_CODE_ZEROCOPY_COPIED  set if the kernel could not
> avoid the copy.
>

Correct,

> In this case, it is better for the application to stop
> using the ZEROCOPY flag and just do normal writes, so
> it avoids the overhead of the the notifications.
>
> This is described in "Deferred copies" section of the
> Documentation/networking/msg_zerocopy.rst in linux.git
>
> So I'm suggesting that the return value of this method
> be '0' if SO_EE_CODE_ZEROCOPY_COPIED was *NOT* set in
> /all/ notifications, or '1' if SO_EE_CODE_ZEROCOPY_COPIED
> was set in at least one notification.

So, here you say that once a message has SO_EE_CODE_ZEROCOPY_COPIED we
should return 1.
Is the idea here to understand if zerocopy is working at all, so we
can disable zerocopy and avoid overhead ?

If so, we should somehow check if every write was sent with
SO_EE_CODE_ZEROCOPY_COPIED instead.
I mean, we should not disable Zerocopy if a single write got
SO_EE_CODE_ZEROCOPY_COPIED ?



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

Best regards,
Leo


