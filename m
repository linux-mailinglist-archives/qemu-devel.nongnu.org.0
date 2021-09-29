Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC38841CD0C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 22:00:15 +0200 (CEST)
Received: from localhost ([::1]:55526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfkU-0000CJ-N5
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 16:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVfWm-00086B-Ll
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:46:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mVfWk-0006wD-6k
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:46:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjuJYVzMYnYXGwCbtViBhH4yM5M5MLYcRe3pezhIe8U=;
 b=BzgAmZAnCQrDh1nprgeaTlvlXM4SK1f5o0PasbRYeyU520qlGYST9V+GXiiej5yWC9gVFr
 Vvcx45m63TrpWglCCfeeAhrpFLGYFqntz64VuXFnyX/dujODJ8swBhsC3zcwcv9lnAxJg3
 byINP3pMfm1RtWGaOfy8/A7n3iiofhA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-w3BnEhBaPc-bBMioGUkG9g-1; Wed, 29 Sep 2021 15:46:00 -0400
X-MC-Unique: w3BnEhBaPc-bBMioGUkG9g-1
Received: by mail-lf1-f69.google.com with SMTP id
 x4-20020a056512078400b003fc8e963f1dso3362743lfr.5
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 12:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QjuJYVzMYnYXGwCbtViBhH4yM5M5MLYcRe3pezhIe8U=;
 b=baeUjaq1yiW8K+mgelqV0711HSUsHVwVlx7UqGNjJE9aok4MTiPtIm3x204ie7kamI
 gQiN68ST8I2A7Uwz38+DYVY2gMJZa9ff1BKKwVORqvS+eUBP/BAxIx3pSAIfDkAEdl7R
 uAfccKw4VyjMxK4BYFhuyIvvJ39k8F6Fwucu2lnhCA50XZ2UdxXYhK5g17iDAYIUFxx3
 v5pTdl6dGyvQR3IVybYJ+1Ye76e659vZVQrenv6Mo7hMyIEtIoUzzHNfiHbuImarkY4/
 HtJAPh0NGiKwmxbuj3FLoKxwTpPghU7Znpkv3aIA9YH+ZXJMlcfreQcekbbXiL4ySWQ/
 kHLw==
X-Gm-Message-State: AOAM530EYmhyHhA0lcYWNLsGGnnigKvv9B9jRKsru4BAEZzbkfOvXv+Z
 di2Cv/Z2ANr8QP25QI1WGrilCcFRgkYBGLc788KX5a/N4tvYXThwr5t/i2ZxzJXLSnzefXeECEf
 gNjVqGqX3IxNrnpZmHxqR0p59Mhpakw0=
X-Received: by 2002:a05:6512:22c1:: with SMTP id
 g1mr1565032lfu.169.1632944758478; 
 Wed, 29 Sep 2021 12:45:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDfB3NkTJMH21QbsjLuLDgwfxJM59IYx7y/rCM8t9MBWlrUjoeu7iIuJFBII4cMA34+wQQHix9I9Ic2g9zEOs=
X-Received: by 2002:a05:6512:22c1:: with SMTP id
 g1mr1565019lfu.169.1632944758329; 
 Wed, 29 Sep 2021 12:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210922222423.644444-1-leobras@redhat.com>
 <20210922222423.644444-4-leobras@redhat.com>
 <YU4OVZLo8oSpGrdI@redhat.com> <YVOby/PvqPuXRqSH@t490s>
In-Reply-To: <YVOby/PvqPuXRqSH@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 29 Sep 2021 16:46:33 -0300
Message-ID: <CAJ6HWG4sfD-1Rrq8TMki0matCXyQFqPOHqFbUhAS-N806HW6gA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] multifd: Send using asynchronous write on nocomp
 to send RAM pages.
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 28, 2021 at 7:49 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Sep 24, 2021 at 06:43:49PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > > @@ -546,6 +546,7 @@ void multifd_save_cleanup(void)
> > >          MultiFDSendParams *p =3D &multifd_send_state->params[i];
> > >          Error *local_err =3D NULL;
> > >
> > > +        qio_channel_async_flush(p->c, NULL);
> > >          socket_send_channel_destroy(p->c);
> > >          p->c =3D NULL;
> > >          qemu_mutex_destroy(&p->mutex);
> >
> > This isn't reliable beucase qio_channel_async_flush will return early
> > even if not everything is flushed.
>
> Right, though I think the problem is in patch 2 where we should make sure
> flush() will only return if all data sent.
>
> And at the meantime we may also want to move it to before we send the dev=
ices
> states for both pre/post copy.  multifd_save_cleanup() is called only unt=
il
> migration completed and we're cleaning stuffs, I'm afraid it's too late, =
so
> potentially the device states can arrive and dest vm running without the =
latest
> src VM memories.

Thanks for that Peter!
I had some trouble sorting out when to flush, and I think I still missed th=
is.

I will have thet improved for v3.

>
> --
> Peter Xu
>

Best regards,
Leonardo


