Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310C1465639
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 20:14:17 +0100 (CET)
Received: from localhost ([::1]:38678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msV3V-0008Oi-DS
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 14:14:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msUws-0006ZJ-IM
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 14:07:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msUwp-0008IF-5I
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 14:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638385637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Cdmoi17sAnD1ngm1y+3xZ0gnfkJRbaPx+YMyNkrOAs=;
 b=NS0fsUU8rbpo9VvE+y6pUXKDV2wMfbfBg521VG5BHLeQAkzYPVFD+Xl1Xck9WnI+6OewXt
 vqU+H89fqN7gApwyGRzwUwD5qI8E1ItNSJvOM8LPh+JAY9GqSL+rHEkl5SRdacdofW+6AR
 07KwvFTgfNuWZLmWHfxvG7wfA/hF/Uk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-OtF8MaMUMSOKQIx3fbAzIA-1; Wed, 01 Dec 2021 14:07:14 -0500
X-MC-Unique: OtF8MaMUMSOKQIx3fbAzIA-1
Received: by mail-lf1-f72.google.com with SMTP id
 c15-20020a05651200cf00b0040524451deeso9898716lfp.20
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 11:07:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3Cdmoi17sAnD1ngm1y+3xZ0gnfkJRbaPx+YMyNkrOAs=;
 b=HpYaiSRTVYUK90weVYXWK1IbsWAilKs8c7y9kkMk7B8IE29fitij/EnklxCJW77aP+
 Yh5JKCljyVyUXqX9vTQBMQahhInRRls0eaHmODLvKu6E1bYDo0UuCTTPCFD3oYFIII0Y
 yXCwE4T6eEHKb3lIWstcEkK2DoawOeXEEnGVk4j+K1EpkBcFp93nHZ9uguj++6XLtfDp
 9v6zteCV8h++iON4nV1IDQ+94FuwbmSNNDy5iRLqhxGgspnNbOCQ7S5gUH4I0O1MqSiV
 nI3jOlgKglcMQqVtJcHvRX4cqlMgjZyjIXhAUZGg2nlr6lcTTIzRJ+kQoFF7gOtFUcBm
 zTFg==
X-Gm-Message-State: AOAM5303T1mY4eTbV/PsM8En7IBMesW3EPH0BwAZki5GpuB3YO6Q2FhJ
 VthKxW1ZLCZtL1rtI8EBEGxsr0Aq9MPhnmbx0eEZ4tHN53cC9REkjez8fcr/Kmn9K0fvv/QVd+7
 DdpXi8IJNoZtZ+FKemfiqZBAVLWkKdMA=
X-Received: by 2002:a05:6512:158e:: with SMTP id
 bp14mr7731308lfb.630.1638385632645; 
 Wed, 01 Dec 2021 11:07:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+W+yM61VtmpErWr2a2IcbQ3KF5bxD/xwvUzd5MN4b5oa7/TRnYHYFbeYNsK+y/LOhUjZrIdj9PxkerVaDCBA=
X-Received: by 2002:a05:6512:158e:: with SMTP id
 bp14mr7731296lfb.630.1638385632461; 
 Wed, 01 Dec 2021 11:07:12 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-5-leobras@redhat.com>
 <87pmr5vdmm.fsf@secure.mitica> <YY5LFM6dAF/+enCP@redhat.com>
 <87a6i9h9eg.fsf@dusky.pond.sub.org>
In-Reply-To: <87a6i9h9eg.fsf@dusky.pond.sub.org>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 1 Dec 2021 16:07:01 -0300
Message-ID: <CAJ6HWG4JTkb_Z6E56jjK0+46XC6uUah18bjNTm22hpbtG+wM-Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] migration: Add zerocopy parameter for QMP/HMP for
 Linux
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Markus,
Thanks for sharing this info!

Best regards,
Leo

On Fri, Nov 12, 2021 at 8:59 AM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
> > On Fri, Nov 12, 2021 at 12:04:33PM +0100, Juan Quintela wrote:
> >> Leonardo Bras <leobras@redhat.com> wrote:
>
> [...]
>
> >> > diff --git a/migration/migration.c b/migration/migration.c
> >> > index abaf6f9e3d..add3dabc56 100644
> >> > --- a/migration/migration.c
> >> > +++ b/migration/migration.c
> >> > @@ -886,6 +886,10 @@ MigrationParameters *qmp_query_migrate_paramete=
rs(Error **errp)
> >> >      params->multifd_zlib_level =3D s->parameters.multifd_zlib_level=
;
> >> >      params->has_multifd_zstd_level =3D true;
> >> >      params->multifd_zstd_level =3D s->parameters.multifd_zstd_level=
;
> >> > +#ifdef CONFIG_LINUX
> >> > +    params->has_zerocopy =3D true;
> >> > +    params->zerocopy =3D s->parameters.zerocopy;
> >> > +#endif
> >> >      params->has_xbzrle_cache_size =3D true;
> >> >      params->xbzrle_cache_size =3D s->parameters.xbzrle_cache_size;
> >> >      params->has_max_postcopy_bandwidth =3D true;
> >> > @@ -1538,6 +1542,11 @@ static void migrate_params_test_apply(Migrate=
SetParameters *params,
> >> >      if (params->has_multifd_compression) {
> >> >          dest->multifd_compression =3D params->multifd_compression;
> >> >      }
> >> > +#ifdef CONFIG_LINUX
> >> > +    if (params->has_zerocopy) {
> >> > +        dest->zerocopy =3D params->zerocopy;
> >> > +    }
> >> > +#endif
> >> >      if (params->has_xbzrle_cache_size) {
> >> >          dest->xbzrle_cache_size =3D params->xbzrle_cache_size;
> >> >      }
> >> > @@ -1650,6 +1659,11 @@ static void migrate_params_apply(MigrateSetPa=
rameters *params, Error **errp)
> >> >      if (params->has_multifd_compression) {
> >> >          s->parameters.multifd_compression =3D params->multifd_compr=
ession;
> >> >      }
> >> > +#ifdef CONFIG_LINUX
> >> > +    if (params->has_zerocopy) {
> >> > +        s->parameters.zerocopy =3D params->zerocopy;
> >> > +    }
> >> > +#endif
> >>
> >> After seing all this CONFIG_LINUX mess, I am not sure that it is a goo=
d
> >> idea to add the parameter only for LINUX.  It appears that it is bette=
r
> >> to add it for all OS's and just not allow to set it to true there.
> >>
> >> But If QAPI/QOM people preffer that way, I am not going to get into th=
e middle.
> >
> > I don't like all the conditionals either, but QAPI design wants the
> > conditionals, as that allows mgmt apps to query whether the feature
> > is supported in a build or not.
>
> Specifically, the conditionals keep @zerocopy out of query-qmp-schema
> (a.k.a. schema introspection) when it's not actually supported.
>
> This lets management applications recognize zero-copy support.
>
> Without conditionals, the only way to probe for it is trying to switch
> it on.  This is inconvenient and error-prone.
>
> Immature ideas to avoid conditionals:
>
> 1. Make *values* conditional, i.e. unconditional false, but true only if
> CONFIG_LINUX.  The QAPI schema language lets you do this for
> enumerations today, but not for bool.
>
> 2. A new kind of conditional that only applies to schema introspection,
> so you can eat your introspection cake and keep the #ifdef-less code
> cake (and the slight binary bloat that comes with it).
>


