Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203E241CCC7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:45:22 +0200 (CEST)
Received: from localhost ([::1]:44468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfW4-0006oz-Ez
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVfUj-0005Aj-PC
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVfUc-00055l-D9
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lKy/3fLJkO+r9/rTR/V5DjZPYvpsh/DBxB6c+kPO+Y=;
 b=aY5Je+jgkEDEow8QsMoNuQUr6luSI3HTVr/RS/m/Wo2p8ydxOwKcJ88n3Z2amgbsvzZPyS
 4tMo1Vfp6vBPX5iczLFOOFRXogGJ/F5py3RTsr/rH8vEBvB6CFS91/iahyk82mzLm/DP38
 QA/xi6wn5PypD0DuNTB/77/vESvQfuA=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-LpxRWZfdO16boaytlcMplQ-1; Wed, 29 Sep 2021 15:43:43 -0400
X-MC-Unique: LpxRWZfdO16boaytlcMplQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 d22-20020a0565123d1600b003fd0097d747so3380723lfv.2
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 12:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1lKy/3fLJkO+r9/rTR/V5DjZPYvpsh/DBxB6c+kPO+Y=;
 b=G9tiaSmiGsP0/3S/6ZlNujg9XbpqVevhkUhQzk/SSDXeawlWxSlk7jOy7Fhq867soP
 MVVcwTDRIkdVUKRpVQtE7CEpMkIY8pLHvxv7I/BgA6Q926zK4Ikg+0tI2OYINOLljQxg
 HsA7zKOzHH19r2dO+FfJ5FwuSR/a7WIiuOaA9zfSGkRkKaEubMtCj2ERBdInoQ5Gyk2j
 tfiRjXDpFXeS0QamMS95hrZGtY8ie6xZmWeetTuqeMEy/K28tX3kfoJr7+6Y3tHTWM+2
 hH2Kn4qbtOKF6lvYeIhzQ+eG1sdPQLszQxWRVadDpoAsmnXYvpGtikKLDlTeam1/HbDX
 ig9g==
X-Gm-Message-State: AOAM532aUo6cEjXufk/w3cOWHC4BixSXaad7YCN4HERtt62ogE8juryk
 YtoXs2fXJh0rIAJIqvdoLwDJOAOAOxWKMLtiXLBQRF4JS9igOXSVJg7SP15WTJZUlGWMX0BMiIc
 PHFnaa4B4Bh4yzwSe2iJ8w5CF5iFTSOo=
X-Received: by 2002:ac2:48bc:: with SMTP id u28mr1539014lfg.370.1632944621666; 
 Wed, 29 Sep 2021 12:43:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbqul9ViwZHn9saKN6gTQ9PtsoZvbXs13/NA0DXlp6u8RdnCb2dPSzWamGnleqoIQX8x/PKWNJqQ0LQJCJHro=
X-Received: by 2002:ac2:48bc:: with SMTP id u28mr1538856lfg.370.1632944619384; 
 Wed, 29 Sep 2021 12:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-4-leobras@redhat.com>
 <YU4OVZLo8oSpGrdI@redhat.com>
In-Reply-To: <YU4OVZLo8oSpGrdI@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 29 Sep 2021 16:44:13 -0300
Message-ID: <CAJ6HWG600zg6mKokbtPTs5K4xLEFePnrGSKvKaJf+3bAq-CEDg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] multifd: Send using asynchronous write on nocomp
 to send RAM pages.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 24, 2021 at 2:44 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Sep 22, 2021 at 07:24:23PM -0300, Leonardo Bras wrote:
> > Change multifd nocomp version to use asynchronous write for RAM pages, =
and
> > benefit of MSG_ZEROCOPY when it's available.
> >
> > The asynchronous flush happens on cleanup only, before destroying the Q=
IOChannel.
> >
> > This will work fine on RAM migration because the RAM pages are not usua=
lly freed,
> > and there is no problem on changing the pages content between async_sen=
d() and
> > the actual sending of the buffer, because this change will dirty the pa=
ge and
> > cause it to be re-sent on a next iteration anyway.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  migration/multifd.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 377da78f5b..d247207a0a 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -105,7 +105,7 @@ static int nocomp_send_prepare(MultiFDSendParams *p=
, uint32_t used,
> >   */
> >  static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Erro=
r **errp)
> >  {
> > -    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
> > +    return qio_channel_async_writev_all(p->c, p->pages->iov, used, err=
p);
> >  }
>
> This needs to be made conditional so zeroopy is only used if rquested
> by the mgmt app, and it isn't going to work in all cases (eg TLS) so
> silently enabling it is not good.

I agree, that seems a better approach.


>
> >
> >  /**
> > @@ -546,6 +546,7 @@ void multifd_save_cleanup(void)
> >          MultiFDSendParams *p =3D &multifd_send_state->params[i];
> >          Error *local_err =3D NULL;
> >
> > +        qio_channel_async_flush(p->c, NULL);
> >          socket_send_channel_destroy(p->c);
> >          p->c =3D NULL;
> >          qemu_mutex_destroy(&p->mutex);
>
> This isn't reliable beucase qio_channel_async_flush will return early
> even if not everything is flushed.

Yeah, I need to make sure qio_channel_async_flush will only return after
everything is sent, or at least return the number of missing requests.

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
Leonardo


