Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D2452A520
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:43:39 +0200 (CEST)
Received: from localhost ([::1]:33962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyQE-00041o-SV
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nqyKd-0001Uu-01
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:37:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nqyKb-00019b-C3
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:37:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652798268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=os/dLer8zmWY8X/D2Ivlqo0jM2m9VuelSoBXh7UZoxM=;
 b=XvYjIJ4BlmeXHf0KXX9KGc/Q62sxPKDbgV93kf45SBUUwh+i/qVT7J39NxZf/GdJA1xbeX
 mcykurr2HLco2LyGN+2ctAsC1u5Qoowql3ILRLtVzFyYWiH7NF1qkZ72fuXNhdBjS98UUY
 ZjrXs4q1ckjJAmRvKH2TWi5EhQBj3Fc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-ZPK7k6kFMnqlmN55M7U_Sw-1; Tue, 17 May 2022 10:37:47 -0400
X-MC-Unique: ZPK7k6kFMnqlmN55M7U_Sw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t9-20020a5d5349000000b0020d02cd51fbso1422373wrv.13
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 07:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=os/dLer8zmWY8X/D2Ivlqo0jM2m9VuelSoBXh7UZoxM=;
 b=l6QQQ4JyBxOMEONnW/Sdg2eSh9ar1cHh3HqBSqWKJeYTKEHhuYXzPHYan5qC2dlJcf
 b9k3oQ/T80ewGHeX4d54wqz2Hvrzegt3LaSzE53VEzc1bLlffTZ4/45JgSOKw01X7yQ1
 rzO7CXCQrabVC3EmlCgcc0xL48WIuVxm+ayXU57UGQaspAoXh5Djs5NTxyKFv7UPrwDc
 2+hDzGWMkrCfKhIDC/xxdAhOXWjkAgjhyIuj1B79nHmxfLfTKgfF37TyY+kiD6XrPaBS
 S13yQdDSkeoZw4pNZmPh1y3iOJwUjb7pGBjNAIPwr+Wr6nkrWxGEP7rakf2cvssO+Vte
 Tf4w==
X-Gm-Message-State: AOAM532JDR1kJOycalH/sMhcOq4JGqjgSFBDOIYLoAYtdDPI5wYEpS3J
 RYHVI3CS5RrsgsrA/gFAxc5lPOTiYfIWD+ZyYPkqUlgswYrIKDWopsQL5IsdPr+DtEWVlTb+tUQ
 Y5E5diZgiujNAwtY=
X-Received: by 2002:adf:efcd:0:b0:20d:4b7:ef9c with SMTP id
 i13-20020adfefcd000000b0020d04b7ef9cmr10658139wrp.228.1652798266334; 
 Tue, 17 May 2022 07:37:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsvTQ0g2og7cKrzDFvfbwo1sGDcwAWx5b5sB0AJYVCBdmFHF/KIKJP9w79fVpEhF5L2p35Fg==
X-Received: by 2002:adf:efcd:0:b0:20d:4b7:ef9c with SMTP id
 i13-20020adfefcd000000b0020d04b7ef9cmr10658122wrp.228.1652798266043; 
 Tue, 17 May 2022 07:37:46 -0700 (PDT)
Received: from ?IPv6:2a0c:5a80:1d02:ba00:f4f8:7394:c8:7ddf?
 ([2a0c:5a80:1d02:ba00:f4f8:7394:c8:7ddf])
 by smtp.gmail.com with ESMTPSA id
 bd10-20020a05600c1f0a00b00394538d039esm2135348wmb.6.2022.05.17.07.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 07:37:45 -0700 (PDT)
Message-ID: <f2012b0a303f95df3a85a9a12df5307195619962.camel@redhat.com>
Subject: Re: [PATCH v3 2/3] thread-pool: replace semaphore with condition
 variable
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, =?UTF-8?Q?Luk=C3=A1=C5=A1?= Doktor
 <ldoktor@redhat.com>
Date: Tue, 17 May 2022 16:37:45 +0200
In-Reply-To: <ecf91e34-b588-f3ee-45eb-34fbde597cad@redhat.com>
References: <20220514065012.1149539-1-pbonzini@redhat.com>
 <20220514065012.1149539-3-pbonzini@redhat.com>
 <c5fcbce258e2671f1ee22b3f4fdddea361cb2509.camel@redhat.com>
 <ecf91e34-b588-f3ee-45eb-34fbde597cad@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, 2022-05-17 at 16:18 +0200, Paolo Bonzini wrote:
> On 5/17/22 14:46, Nicolas Saenz Julienne wrote:
> > > -    while (!pool->stopping) {
> > > +    while (!pool->stopping && pool->cur_threads <=3D pool->max_threa=
ds) {
> > >           ThreadPoolElement *req;
> > >           int ret;
> > >  =20
> > > -        do {
> > > +        if (QTAILQ_EMPTY(&pool->request_list)) {
> > >               pool->idle_threads++;
> > > -            qemu_mutex_unlock(&pool->lock);
> > > -            ret =3D qemu_sem_timedwait(&pool->sem, 10000);
> > > -            qemu_mutex_lock(&pool->lock);
> > > +            ret =3D qemu_cond_timedwait(&pool->request_cond, &pool->=
lock, 10000);
> > >               pool->idle_threads--;
> > > -        } while (back_to_sleep(pool, ret));
> > > -        if (ret =3D=3D -1 || pool->stopping ||
> > > -            pool->cur_threads > pool->max_threads) {
> > > -            break;
> > > +            if (ret =3D=3D 0 &&
> > > +                QTAILQ_EMPTY(&pool->request_list) &&
> > > +                pool->cur_threads > pool->min_threads) {
> > > +                /* Timed out + no work to do + no need for warm thre=
ads =3D exit.  */
> > > +                break;
> > > +            }
> >=20
> >   Some comments:
> >=20
> > - A completely idle pool will now never be able to lose its threads, as=
 the
> >    'pool->cur_threads <=3D pool->max_threads' condition is only checked=
 after a
> >    non-timeout wakeup.
>=20
> Are you sure?  The full code is:
>=20
>              ret =3D qemu_cond_timedwait(&pool->request_cond, &pool->lock=
, 10000);
>              pool->idle_threads--;
>              if (ret =3D=3D 0 &&
>                  QTAILQ_EMPTY(&pool->request_list) &&
>                  pool->cur_threads > pool->min_threads) {
>                  /* Timed out + no work to do + no need for warm threads =
 exit.  */
>                  break;
>              }
>              /*
>               * Even if there was some work to do, check if there aren't
>               * too many worker threads before picking it up.
>               */
>              continue;
>=20

OK, I somehow missed this 'continue', I wonder if I managed to re-review v2=
 by
accident... Anyway, it looks fine to me now.

Regards,

--=20
Nicol=C3=A1s S=C3=A1enz


