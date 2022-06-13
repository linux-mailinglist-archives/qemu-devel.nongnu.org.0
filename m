Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F8654A14B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 23:23:37 +0200 (CEST)
Received: from localhost ([::1]:56930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0rX6-0000gY-43
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 17:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o0rVA-0008Q7-Ei
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1o0rV7-0000kJ-I4
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 17:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655155291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ge5237O8NafkFTvwjnUds0fbUDQwkrcmsAZ3LsCT59g=;
 b=PhrRx/11JCcCRRoRV2WHzA3RxGt1PhCh58Ur37/0tdDxIWhVis1LdYpNt9+iYT3Fj2EPVf
 Q2LwLTBIsJ6Xxxa4CVPnH3wrYAjUbDGrhWupoKMSf9rI9FhhNkATbt15GwIrJK0I+Ai4FC
 DrvDCXTLo44GkX8zbC+XcJvdUXX9XZg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-uqcqUW0GPiK8_d_7aSoPeA-1; Mon, 13 Jun 2022 17:21:30 -0400
X-MC-Unique: uqcqUW0GPiK8_d_7aSoPeA-1
Received: by mail-ej1-f72.google.com with SMTP id
 l2-20020a170906078200b006fed42bfeacso2216803ejc.16
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 14:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ge5237O8NafkFTvwjnUds0fbUDQwkrcmsAZ3LsCT59g=;
 b=KneOoIS9PHegs3yD2z3Fe0QYEhrV62kYfKGjfURtFke9KNkqvc9F2bWavqamE9ioWn
 jejZhZnJW4WWKrio55lXnnchioJ549RXHHsbDK7fj6cRVJtz7uLN3Ur+k8z3cLgfVo9Z
 8FQg5k9nQXzdBoMKpqRjGrQGTEw5Oji8oRH78y6/3zZNagWh+QCAEtnwvr1jehL34Z4g
 6c2O0JcNJ2NqOCkCeJdtpwArlM7KaXusjwIRWtIlFC7mh5g4pzWYOeqax9qQcOuTjLgi
 xgvt6rb4Nl2ZOGMunM0U6MOpQhakIi7YWbGfRbZkLJDgGGNNYy2zUPZB/sfeW5THXz+u
 OcZg==
X-Gm-Message-State: AOAM530mX+dPWSfibIm1IV537Ih/orRgxYJjQBmDZOC5Il0cnld7AbAq
 VHO6MtbUAfq0daTDiq2TLHSpYgDlqNG7o92bTH3zTcUJlJ+aIu4D5/mbDWuHnLDlMiqXrJOzPNv
 IcI378fULsYf9cv/5nikwSmzVNouyXDg=
X-Received: by 2002:a05:6402:11d2:b0:42d:e68a:eae0 with SMTP id
 j18-20020a05640211d200b0042de68aeae0mr1963251edw.111.1655155289328; 
 Mon, 13 Jun 2022 14:21:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1stCu+YElgJBS6b65AyEoli7GE8EjT+0qCE1j+xofzke6ysvSqk1ivuwcCArjBOiXMAlzs2Fxlb0dhEGOI51Kw=
X-Received: by 2002:a05:6402:11d2:b0:42d:e68a:eae0 with SMTP id
 j18-20020a05640211d200b0042de68aeae0mr1963227edw.111.1655155289076; Mon, 13
 Jun 2022 14:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220608210403.84006-1-leobras@redhat.com>
 <YqGq0Bw7V26vaNoI@redhat.com>
 <CAJ6HWG41=Wwf5gMY=Q0G2VCKfdNsyDRGDXELwvgRBjXMNB9GKw@mail.gmail.com>
 <YqL/3VTze/b9DKUL@redhat.com>
In-Reply-To: <YqL/3VTze/b9DKUL@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 13 Jun 2022 18:21:18 -0300
Message-ID: <CAJ6HWG5kCiprhCB6578ZibRSWW9ie5kBhbh7DFW-=K1sEnSHWg@mail.gmail.com>
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

On Fri, Jun 10, 2022 at 5:25 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>

[...]

> Ok, so if it is checked earlier then we merely need an assert.
>
>      if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
>  #ifdef QEMU_MSG_ZEROCOPY
>          sflags =3D MSG_ZEROCOPY;
>          zero_copy_enabled =3D true;
>  #else
>          g_assert_unreachable();
>  #endif
> >     }

Ok, I will add that in the next version.

>
>
>
> > > > @@ -592,15 +594,13 @@ static ssize_t qio_channel_socket_writev(QIOC=
hannel *ioc,
> > > >              return QIO_CHANNEL_ERR_BLOCK;
> > > >          case EINTR:
> > > >              goto retry;
> > > > -#ifdef QEMU_MSG_ZEROCOPY
> > > >          case ENOBUFS:
> > > > -            if (sflags & MSG_ZEROCOPY) {
> > > > +            if (zero_copy_enabled) {
> > >
> > > if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY)
> > >
> > > avoids the #ifdef without needing to add yet another
> > > variable expressing what's already expressed in both
> > > 'flags' and 'sflags'.
> >
> > Yes, it does, but at the cost of not compiling-out the zero-copy part
> > when it's not supported,
> > since the QIO_CHANNEL_WRITE_FLAG_ZERO_COPY comes as a parameter. This e=
nds up
> > meaning there will be at least one extra test for every time this
> > function is called (the one in the next patch).
>
> The cost of a simple bit test is between negligible-and-non-existant
> with branch prediction. I doubt it would be possible to even measure
> it.

Yeah, you are probably right on that.
So the main learning point here is that it's not worth creating a new
boolean for compiling-out
code that should not impact performance ?
I mean, if performance-wise they should be the same, then a new
variable would be just a
bother for the programmer.

Best regards,
Leo






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


