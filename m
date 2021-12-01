Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3F546562C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 20:09:11 +0100 (CET)
Received: from localhost ([::1]:35524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msUyc-00065A-C7
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 14:09:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msUuw-0004ir-Iz
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 14:05:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msUut-0007tR-FZ
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 14:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638385517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q7BwkL/sUbDJawnsKD2yR7w1KV7Iia9AgMKAwOBELtM=;
 b=BOOhdn3uqfDeWWml7WGPS50RvFBUMyg+EuMcE2q8qNwdEdO2g0kXgk18qAMvN2yG7kInAk
 p7XViRxsjDYRuPX68rJfd/jzmdwRBK1uj6c2SB/75UwwcAu71DGO5QaByg/vgJMuH1RG4y
 AbG42EbYvxSS0XsMbMaPJs+luV2jdQY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-Oii1boi4M5Oh3egaPCXlEw-1; Wed, 01 Dec 2021 14:05:13 -0500
X-MC-Unique: Oii1boi4M5Oh3egaPCXlEw-1
Received: by mail-lf1-f71.google.com with SMTP id
 bp10-20020a056512158a00b0040376f60e35so9998357lfb.8
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 11:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q7BwkL/sUbDJawnsKD2yR7w1KV7Iia9AgMKAwOBELtM=;
 b=WXI5wf6Ccb8LMSkYOxhgVtmasEtOfI/VcXDkRYMsu3fl+nqGT/7Eqy86e+EDnTx47f
 NOI/JY0Ki4q9HJ+GvrlNu/SU+PIIIcs+oU5rxeu6hw8H2wUZHRRpIj6bo56OxyQdQ43l
 1+T6drs53B2QBL+hZmRqLgZLqU22ODKt70s5CGA++yB7MB+ukkj6yPv7sjFYjiToxEzP
 N0rRTehdz+Ly2vkFvOgwhmXe5ldeWhjdAAEV5gCymBosVUZkPb55QFGr0NCzlBnVVbWw
 kmTedj3H944erbjQYQJhxn8xLescy1HsGzjdp1k7FVQIpyWC+1GJK8sJmJ33hZSOH/68
 GmNw==
X-Gm-Message-State: AOAM53102vwXgn0GtxOpg7Y6Z5ymwwzTjyWjTIA38mgc4/EEF3AruXYM
 H9iQ/rzNni2MPZj80q4V7pIBQ3WXce4SDjtzRZxMMM0EJ1IimS7sEl6xFyOhMO9SjDfR6K4fcll
 wH8/L7HbVLrOP9QroeNXaqL0pFMooL4E=
X-Received: by 2002:a2e:9e08:: with SMTP id e8mr7215625ljk.472.1638385511663; 
 Wed, 01 Dec 2021 11:05:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/iEIJVKBa+S4V8DRtTRUjYhrl6c/wTfdB74tfw3n7H+vdVdj81XW6Rh3MVKEAWh8OXcZMDcUNW5VPnQtoefU=
X-Received: by 2002:a2e:9e08:: with SMTP id e8mr7215601ljk.472.1638385511401; 
 Wed, 01 Dec 2021 11:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-5-leobras@redhat.com>
 <YY5Kb4hvhyXhqmRF@redhat.com>
In-Reply-To: <YY5Kb4hvhyXhqmRF@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 1 Dec 2021 16:05:00 -0300
Message-ID: <CAJ6HWG7Edc1h1WRLcYsgjUFhrWJ5=x4iVLWwGY+_9yv71F674g@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] migration: Add zerocopy parameter for QMP/HMP for
 Linux
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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

On Fri, Nov 12, 2021 at 8:05 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Fri, Nov 12, 2021 at 02:10:39AM -0300, Leonardo Bras wrote:
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
> > ---
> >  qapi/migration.json   | 18 ++++++++++++++++++
> >  migration/migration.h |  5 +++++
> >  migration/migration.c | 32 ++++++++++++++++++++++++++++++++
> >  migration/multifd.c   | 17 +++++++++--------
> >  migration/socket.c    |  5 +++++
> >  monitor/hmp-cmds.c    |  6 ++++++
> >  6 files changed, 75 insertions(+), 8 deletions(-)
> >
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index bbfd48cf0b..9534c299d7 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -730,6 +730,11 @@
> >  #                      will consume more CPU.
> >  #                      Defaults to 1. (Since 5.0)
> >  #
> > +# @zerocopy: Controls behavior on sending memory pages on migration.
> > +#            When true, enables a zerocopy mechanism for sending memor=
y
> > +#            pages, if host supports it.
> > +#            Defaults to false. (Since 6.2)
>
> Add
>
>    Requires that QEMU be permitted to use locked memory for guest
>    RAM pages.
>

Done

>
> Also 7.0 since this has missed the 6.2 deadline.
>

Done

>
>
> Both these notes apply to later in this file too
>

Replaced thrice in this file.

>
>
>
> > diff --git a/migration/multifd.c b/migration/multifd.c
> > index 7c9deb1921..ab8f0f97be 100644
> > --- a/migration/multifd.c
> > +++ b/migration/multifd.c
> > @@ -854,16 +854,17 @@ static void multifd_new_send_channel_async(QIOTas=
k *task, gpointer opaque)
> >      trace_multifd_new_send_channel_async(p->id);
> >      if (qio_task_propagate_error(task, &local_err)) {
> >          goto cleanup;
> > -    } else {
> > -        p->c =3D QIO_CHANNEL(sioc);
> > -        qio_channel_set_delay(p->c, false);
> > -        p->running =3D true;
> > -        if (!multifd_channel_connect(p, sioc, local_err)) {
> > -            goto cleanup;
> > -        }
> > -        return;
> >      }
> >
> > +    p->c =3D QIO_CHANNEL(sioc);
> > +    qio_channel_set_delay(p->c, false);
> > +    p->running =3D true;
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
> This change is just a code style alteration with no relation to
> zerocopy. Either remove it, or do this change in its own patch
> seprate from zerocopy.
>

Removed.

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

Thanks for reviewing.

Best regards,
Leo


