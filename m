Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEBD4655DF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 19:54:23 +0100 (CET)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msUkI-0005SF-PT
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 13:54:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msUi4-0001zI-So
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 13:52:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msUi0-0003aZ-SR
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 13:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638384720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qQ2sZbaevUo0V+esF0sKhXsChT3eePl60k+G/4z5dzY=;
 b=J4lHgiMCT4/XVq7FJ6UNZJFJ2hxH51aGMTPoYzEXPx73WddmfpPaEkKa6HZ/Atb0ZCngUk
 eCnn9cTHIRKkH3sq4hj96oN6Hbh0k09TlyBdIEMVReBtJ2xrF/hRi23kb75JG4ibHvH+kV
 xMAIpVVGiyaphcLAMSToi+n1NDOwuN0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-3uBJR1vHOq6tcSnNLL3rmg-1; Wed, 01 Dec 2021 13:51:59 -0500
X-MC-Unique: 3uBJR1vHOq6tcSnNLL3rmg-1
Received: by mail-lf1-f70.google.com with SMTP id
 d26-20020ac244da000000b00417e1d212a2so4933556lfm.0
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 10:51:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qQ2sZbaevUo0V+esF0sKhXsChT3eePl60k+G/4z5dzY=;
 b=4KP4sz7NDu2UCda/h5HfYHWvf6ltY1aZkYPD2kY4UbKSd3CaG/fJtQFX1lNv7nIK1J
 6pkHaM1mZIEK7NyufTXM5+SiFD1WpkHYrChAvTKtK/QduhofcZecpgJStoQe027bKCPl
 4NffOcJWCQeXxBgJSXVuC445Tvn82czp4Qhgcihw2iyHDjBDYHZSFTQlKg22IG6uk0pw
 r7KglL38Ak5Lu3N0CuZmdIhWBWdnDMZL9HvN/MQytKr0cz365MIj2Ug5psfq5+MGaiJc
 LwSaYbMmiAHrS7b3PTXGmz6Gbe4mJr2rL/g3j0fbgaWQC9GW1ZapOtpANoJ4HD6S78qB
 7TWQ==
X-Gm-Message-State: AOAM531nVR45MRKlmlvG6WZqX4YZqWUsJ/c2x2btLV9dTzO9uo5SGJrs
 7MSyw2ojA8Z7i7bCmPpQXj8Ub8qPNPOlKMzty0nQvbrNxfqZ33BF90DxXqZ5Uccvt6WsPVsvJBu
 pNXHONu+p8/wY/6OjfN2yJFIA8mGPMH8=
X-Received: by 2002:a2e:a4d1:: with SMTP id p17mr6979384ljm.318.1638384717469; 
 Wed, 01 Dec 2021 10:51:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpu/lyXcvC/JulelVd1XKqIXwpEELocJbIm31+vFChddmokfpmScLmRPItvUi1PKu1QARI0IL6IlOtkhQ3qnM=
X-Received: by 2002:a2e:a4d1:: with SMTP id p17mr6979369ljm.318.1638384717215; 
 Wed, 01 Dec 2021 10:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-5-leobras@redhat.com>
 <87pmr5vdmm.fsf@secure.mitica>
In-Reply-To: <87pmr5vdmm.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 1 Dec 2021 15:51:46 -0300
Message-ID: <CAJ6HWG4vq4Qki6AkFi1XzDMzutjFHSSDn1xvu+K8zMWxW5=Mcg@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] migration: Add zerocopy parameter for QMP/HMP for
 Linux
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000134fae05d21a2b9a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000134fae05d21a2b9a
Content-Type: text/plain; charset="UTF-8"

Hello Juan,

On Fri, Nov 12, 2021 at 8:04 AM Juan Quintela <quintela@redhat.com> wrote:

> Leonardo Bras <leobras@redhat.com> wrote:
> > Add property that allows zerocopy migration of memory pages,
> > and also includes a helper function migrate_use_zerocopy() to check
> > if it's enabled.
> >
> > No code is introduced to actually do the migration, but it allow
> > future implementations to enable/disable this feature.
> >
> > On non-Linux builds this parameter is compiled-out.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
>
> Hi
>
> > +# @zerocopy: Controls behavior on sending memory pages on migration.
> > +#            When true, enables a zerocopy mechanism for sending memory
> > +#            pages, if host supports it.
> > +#            Defaults to false. (Since 6.2)
> > +#
>
> This needs to be changed to next release, but not big deal.
>
>
> > +#ifdef CONFIG_LINUX
> > +int migrate_use_zerocopy(void);
>
> Please, return bool
>
> > +#else
> > +#define migrate_use_zerocopy() (0)
> > +#endif
>
> and false here.
>
> I know, I know.  We are not consistent here, but the preffered way is
> the other way.
>
>
Ok, changed for v6



> >  int migrate_use_xbzrle(void);
> >  uint64_t migrate_xbzrle_cache_size(void);
> >  bool migrate_colo_enabled(void);
> > diff --git a/migration/migration.c b/migration/migration.c
> > index abaf6f9e3d..add3dabc56 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -886,6 +886,10 @@ MigrationParameters
> *qmp_query_migrate_parameters(Error **errp)
> >      params->multifd_zlib_level = s->parameters.multifd_zlib_level;
> >      params->has_multifd_zstd_level = true;
> >      params->multifd_zstd_level = s->parameters.multifd_zstd_level;
> > +#ifdef CONFIG_LINUX
> > +    params->has_zerocopy = true;
> > +    params->zerocopy = s->parameters.zerocopy;
> > +#endif
> >      params->has_xbzrle_cache_size = true;
> >      params->xbzrle_cache_size = s->parameters.xbzrle_cache_size;
> >      params->has_max_postcopy_bandwidth = true;
> > @@ -1538,6 +1542,11 @@ static void
> migrate_params_test_apply(MigrateSetParameters *params,
> >      if (params->has_multifd_compression) {
> >          dest->multifd_compression = params->multifd_compression;
> >      }
> > +#ifdef CONFIG_LINUX
> > +    if (params->has_zerocopy) {
> > +        dest->zerocopy = params->zerocopy;
> > +    }
> > +#endif
> >      if (params->has_xbzrle_cache_size) {
> >          dest->xbzrle_cache_size = params->xbzrle_cache_size;
> >      }
> > @@ -1650,6 +1659,11 @@ static void
> migrate_params_apply(MigrateSetParameters *params, Error **errp)
> >      if (params->has_multifd_compression) {
> >          s->parameters.multifd_compression = params->multifd_compression;
> >      }
> > +#ifdef CONFIG_LINUX
> > +    if (params->has_zerocopy) {
> > +        s->parameters.zerocopy = params->zerocopy;
> > +    }
> > +#endif
>
> After seing all this CONFIG_LINUX mess, I am not sure that it is a good
> idea to add the parameter only for LINUX.  It appears that it is better
> to add it for all OS's and just not allow to set it to true there.
>
> But If QAPI/QOM people preffer that way, I am not going to get into the
> middle.
>
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 7c9deb1921..ab8f0f97be 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -854,16 +854,17 @@ static void multifd_new_send_channel_async(QIOTask
> *task, gpointer opaque)
> >      trace_multifd_new_send_channel_async(p->id);
> >      if (qio_task_propagate_error(task, &local_err)) {
> >          goto cleanup;
> > -    } else {
> > -        p->c = QIO_CHANNEL(sioc);
> > -        qio_channel_set_delay(p->c, false);
> > -        p->running = true;
> > -        if (!multifd_channel_connect(p, sioc, local_err)) {
> > -            goto cleanup;
> > -        }
> > -        return;
> >      }
> >
> > +    p->c = QIO_CHANNEL(sioc);
> > +    qio_channel_set_delay(p->c, false);
> > +    p->running = true;
> > +    if (!multifd_channel_connect(p, sioc, local_err)) {
> > +        goto cleanup;
> > +    }
> > +
> > +    return;
> > +
> >  cleanup:
> >      multifd_new_send_channel_cleanup(p, sioc, local_err);
> >  }
>
> As far as I can see, this chunk is a NOP, and it don't belong to this
> patch.
>
>
Yeah, it made sense in a previous version, but now it doesn't matter
anymore.
Removed for v6.



> Later, Juan.
>
>
Thanks,
Leo

--000000000000134fae05d21a2b9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small"><br></div></div><div style=3D"fo=
nt-family:arial,sans-serif;font-size:small" class=3D"gmail_default">Hello J=
uan,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Nov 12, 2021 at 8:04 AM Juan Quintela &lt;<a href=3D"mailto:qui=
ntela@redhat.com">quintela@redhat.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Leonardo Bras &lt;<a href=3D"mailto:le=
obras@redhat.com" target=3D"_blank">leobras@redhat.com</a>&gt; wrote:<br>
&gt; Add property that allows zerocopy migration of memory pages,<br>
&gt; and also includes a helper function migrate_use_zerocopy() to check<br=
>
&gt; if it&#39;s enabled.<br>
&gt;<br>
&gt; No code is introduced to actually do the migration, but it allow<br>
&gt; future implementations to enable/disable this feature.<br>
&gt;<br>
&gt; On non-Linux builds this parameter is compiled-out.<br>
&gt;<br>
&gt; Signed-off-by: Leonardo Bras &lt;<a href=3D"mailto:leobras@redhat.com"=
 target=3D"_blank">leobras@redhat.com</a>&gt;<br>
<br>
Hi<br>
<br>
&gt; +# @zerocopy: Controls behavior on sending memory pages on migration.<=
br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 When true, enables a zeroc=
opy mechanism for sending memory<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pages, if host supports it=
.<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Defaults to false. (Since =
6.2)<br>
&gt; +#<br>
<br>
This needs to be changed to next release, but not big deal.<br>
<br>
<br>
&gt; +#ifdef CONFIG_LINUX<br>
&gt; +int migrate_use_zerocopy(void);<br>
<br>
Please, return bool<br>
<br>
&gt; +#else<br>
&gt; +#define migrate_use_zerocopy() (0)<br>
&gt; +#endif<br>
<br>
and false here.<br>
<br>
I know, I know.=C2=A0 We are not consistent here, but the preffered way is<=
br>
the other way.<br>
<br></blockquote><div><br></div><div><div style=3D"font-family:arial,sans-s=
erif;font-size:small" class=3D"gmail_default">Ok, changed for v6</div><br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 int migrate_use_xbzrle(void);<br>
&gt;=C2=A0 uint64_t migrate_xbzrle_cache_size(void);<br>
&gt;=C2=A0 bool migrate_colo_enabled(void);<br>
&gt; diff --git a/migration/migration.c b/migration/migration.c<br>
&gt; index abaf6f9e3d..add3dabc56 100644<br>
&gt; --- a/migration/migration.c<br>
&gt; +++ b/migration/migration.c<br>
&gt; @@ -886,6 +886,10 @@ MigrationParameters *qmp_query_migrate_parameters=
(Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 params-&gt;multifd_zlib_level =3D s-&gt;parameters=
.multifd_zlib_level;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 params-&gt;has_multifd_zstd_level =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 params-&gt;multifd_zstd_level =3D s-&gt;parameters=
.multifd_zstd_level;<br>
&gt; +#ifdef CONFIG_LINUX<br>
&gt; +=C2=A0 =C2=A0 params-&gt;has_zerocopy =3D true;<br>
&gt; +=C2=A0 =C2=A0 params-&gt;zerocopy =3D s-&gt;parameters.zerocopy;<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 params-&gt;has_xbzrle_cache_size =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 params-&gt;xbzrle_cache_size =3D s-&gt;parameters.=
xbzrle_cache_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 params-&gt;has_max_postcopy_bandwidth =3D true;<br=
>
&gt; @@ -1538,6 +1542,11 @@ static void migrate_params_test_apply(MigrateSe=
tParameters *params,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (params-&gt;has_multifd_compression) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dest-&gt;multifd_compression =3D par=
ams-&gt;multifd_compression;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +#ifdef CONFIG_LINUX<br>
&gt; +=C2=A0 =C2=A0 if (params-&gt;has_zerocopy) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dest-&gt;zerocopy =3D params-&gt;zerocopy=
;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (params-&gt;has_xbzrle_cache_size) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dest-&gt;xbzrle_cache_size =3D param=
s-&gt;xbzrle_cache_size;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -1650,6 +1659,11 @@ static void migrate_params_apply(MigrateSetPara=
meters *params, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (params-&gt;has_multifd_compression) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;parameters.multifd_compression=
 =3D params-&gt;multifd_compression;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +#ifdef CONFIG_LINUX<br>
&gt; +=C2=A0 =C2=A0 if (params-&gt;has_zerocopy) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;parameters.zerocopy =3D params-&gt;=
zerocopy;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
<br>
After seing all this CONFIG_LINUX mess, I am not sure that it is a good<br>
idea to add the parameter only for LINUX.=C2=A0 It appears that it is bette=
r<br>
to add it for all OS&#39;s and just not allow to set it to true there.<br>
<br>
But If QAPI/QOM people preffer that way, I am not going to get into the mid=
dle.<br>
<br>
&gt; diff --git a/migration/multifd.c b/migration/multifd.c<br>
&gt; index 7c9deb1921..ab8f0f97be 100644<br>
&gt; --- a/migration/multifd.c<br>
&gt; +++ b/migration/multifd.c<br>
&gt; @@ -854,16 +854,17 @@ static void multifd_new_send_channel_async(QIOTa=
sk *task, gpointer opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 trace_multifd_new_send_channel_async(p-&gt;id);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 if (qio_task_propagate_error(task, &amp;local_err)=
) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; -=C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;c =3D QIO_CHANNEL(sioc);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_set_delay(p-&gt;c, false);<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 p-&gt;running =3D true;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!multifd_channel_connect(p, sioc, loc=
al_err)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 p-&gt;c =3D QIO_CHANNEL(sioc);<br>
&gt; +=C2=A0 =C2=A0 qio_channel_set_delay(p-&gt;c, false);<br>
&gt; +=C2=A0 =C2=A0 p-&gt;running =3D true;<br>
&gt; +=C2=A0 =C2=A0 if (!multifd_channel_connect(p, sioc, local_err)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return;<br>
&gt; +<br>
&gt;=C2=A0 cleanup:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 multifd_new_send_channel_cleanup(p, sioc, local_er=
r);<br>
&gt;=C2=A0 }<br>
<br>
As far as I can see, this chunk is a NOP, and it don&#39;t belong to this p=
atch.<br>
<br>
</blockquote><div><br></div><div><div style=3D"font-family:arial,sans-serif=
;font-size:small" class=3D"gmail_default">Yeah, it made sense in a previous=
 version, but now it doesn&#39;t matter anymore.</div><div style=3D"font-fa=
mily:arial,sans-serif;font-size:small" class=3D"gmail_default">Removed for =
v6.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Later, Juan.<br>
<br></blockquote><div><br></div><div style=3D"font-family:arial,sans-serif;=
font-size:small" class=3D"gmail_default">Thanks,</div><div style=3D"font-fa=
mily:arial,sans-serif;font-size:small" class=3D"gmail_default">Leo</div></d=
iv></div>

--000000000000134fae05d21a2b9a--


