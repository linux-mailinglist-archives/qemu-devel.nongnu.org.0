Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEFE459854
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 00:19:43 +0100 (CET)
Received: from localhost ([::1]:38376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpIb7-0005ZI-TZ
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 18:19:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mpIZz-0004tX-89
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 18:18:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mpIZv-0001Dv-7r
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 18:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637623105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2haoMnpnIxAnPQvH0KP5S5Ujktti2HMPUHpS+W81mk=;
 b=dTxRtbmV5dPegw8evSyjy1VY+hvqArwcBOxodEIhjllSCEh+n+iMkf58fhgC3RweCTi1L2
 imglvr7SLb1pTIqVV6i0ylZDWdd8lVDbax2ImcYkKJz5KAdVIrZRkke7vP+DvigzL0GHfl
 xObWGXkiqy3HLExqw3O0NHSFYLidH4Y=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-U4xGCzjWNtSrL1DsFWjlZg-1; Mon, 22 Nov 2021 18:18:22 -0500
X-MC-Unique: U4xGCzjWNtSrL1DsFWjlZg-1
Received: by mail-lj1-f199.google.com with SMTP id
 j11-20020a2ea90b000000b00218c174bb5dso718059ljq.22
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 15:18:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t2haoMnpnIxAnPQvH0KP5S5Ujktti2HMPUHpS+W81mk=;
 b=Ixcd3mxIqXvdh8S7yDAD9db58G68aGlxxliOv82A1H1Ot0hxhcZQP1sjfGSo+B103S
 nG6dguwnF2B3zXSzPX1K7wQb6LzTjyTbQyEzHYJCfGHGkgrfSznqrggVXJo+3jDm2PBP
 jHjYdYF4SIHI5vIIu8/yE06tFlMGxKbhHdbcFRPYTg+jUs4su9MuopVgaKwbYUipBw6j
 xRk/waKcFAknM5QhryxVeRtuYk/k+T4vnrDA58Hj/czIfsxaDeAXyayN9eysWtdTHsuA
 esxz6WATJhZhceYXTOLNzdSf6Ya7guTNGcJZs8DjhwN7LAzpnKVOKkaYNZl5xtJccZHp
 YaHQ==
X-Gm-Message-State: AOAM533BzTRyxBjDGQ954EmcA/PhnMsehdfy+xQm+X9KXj7qhauVBZoq
 ODussMfZJP7cwI9fi5kLj5kHkitRTTFTS+pO/rRucDWkvt86Ij2YUIIrVWB6zCqvTFbrPDh+CJS
 Utqc0DqS4UmZZCtYoHEwdrJowHEYMRDw=
X-Received: by 2002:a05:6512:158e:: with SMTP id
 bp14mr71054lfb.630.1637623100827; 
 Mon, 22 Nov 2021 15:18:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5AghVqieahi9XFPaoh1hU7wu8aNx8m2vPO08lPG7phLcfxB/z33TjPwIAO9+lgAG4OQMfDU3OcWzbNfTSkYI=
X-Received: by 2002:a05:6512:158e:: with SMTP id
 bp14mr71023lfb.630.1637623100526; 
 Mon, 22 Nov 2021 15:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-2-leobras@redhat.com>
 <YY4+LWnRTV7iaErs@redhat.com>
In-Reply-To: <YY4+LWnRTV7iaErs@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 22 Nov 2021 20:18:09 -0300
Message-ID: <CAJ6HWG4Z7Y=qvp4SZE1+hsk-imouHrsBr9M8Seo1_zPvMtOWjg@mail.gmail.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Thanks for the feedback!

On Fri, Nov 12, 2021 at 7:13 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Fri, Nov 12, 2021 at 02:10:36AM -0300, Leonardo Bras wrote:
> > -int qio_channel_writev_all(QIOChannel *ioc,
> > -                           const struct iovec *iov,
> > -                           size_t niov,
> > -                           Error **erp);
> > +int qio_channel_writev_all_flags(QIOChannel *ioc,
> > +                                 const struct iovec *iov,
> > +                                 size_t niov,
> > +                                 int flags,
> > +                                 Error **errp);
> > +#define qio_channel_writev_all(ioc, iov, niov, errp) \
> > +    qio_channel_writev_all_flags(ioc, iov, niov, 0, errp)
>
> We already have separate methods for zerocopy, instead of adding
> flags, so we shouldn't add flags to this either.
>
> Add a qio_channel_writev_zerocopy_all method instead.
>
> Internally, we can still make both qio_channel_writev_zerocopy_all
> and qio_channel_writev_all use the same helper method, just don't
> expose flags in the public API. Even internally we don't really
> need flags, just a bool

I see.
The idea of having a flag was to make it easier to expand the
interface in the future.
I got some feedback on v1 that would suggest it would be desired:
http://patchwork.ozlabs.org/project/qemu-devel/patch/20210831110238.299458-=
2-leobras@redhat.com/


>
[...]
> > +#define qio_channel_writev_full_all(ioc, iov, niov, fds, nfds, errp) \
> > +    qio_channel_writev_full_all_flags(ioc, iov, niov, fds, nfds, 0, er=
rp)
>
> There's no need for this at all. Since fd passing is not supported
> with zerocopy, there's no reason to ever use this method.
>
> > +/**
> > + * qio_channel_writev_zerocopy:
> > + * @ioc: the channel object
> > + * @iov: the array of memory regions to write data from
> > + * @niov: the length of the @iov array
> > + * @errp: pointer to a NULL-initialized error object
> > + *
> > + * Behaves like qio_channel_writev_full_all_flags, but may write
>
> qio_channel_writev
>
> > + * data asynchronously while avoiding unnecessary data copy.
> > + * This function may return before any data is actually written,
> > + * but should queue every buffer for writing.
>
> Callers mustn't rely on "should" docs - they must rely on the
> return value indicating how many bytes were accepted.
>
> Also mention that this requires locked memory and can/will fail if
> insufficient locked memory is available.
>

Sure, I will update that.

> > +/**
> > + * qio_channel_flush_zerocopy:
> > + * @ioc: the channel object
> > + * @errp: pointer to a NULL-initialized error object
> > + *
> > + * Will block until every packet queued with
> > + * qio_channel_writev_zerocopy() is sent, or return
> > + * in case of any error.
> > + *
> > + * Returns -1 if any error is found, 0 otherwise.
>
>   Returns -1 if any error is found, 0 if all data was sent,
>            or 1 if all data was sent but at least some was copied.
>

I don't really get the return 1 part, I mean, per description it will
'block until every queued packet was sent, so "at least some was
copied" doesn't seem to fit here.
Could you elaborate?

Best regards,
Leo


