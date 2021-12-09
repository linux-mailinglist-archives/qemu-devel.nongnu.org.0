Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90B746E5E8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:48:17 +0100 (CET)
Received: from localhost ([::1]:39196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvG2C-0004v6-UJ
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:48:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mvFwU-0005AE-1Q
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:42:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mvFwS-0001pa-Fk
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 04:42:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639042940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pPPmUmNI9KFPtmeSDL+aVV4Ewc0xaqmsWpxbtGhIJ9s=;
 b=StvdOZB9Rde/pTChmk5XGyXC83eD51sGuO46X1tz5rWTRpCpY1pPvtFWdM6C06XGioxn+B
 r3jEixuynSKggc+f/RHAyMRel8jnZ4K6S21Q14vLhPPQEovo3rcDNaUHQgzYIVOo35aj/+
 VfJVrTsA2Ohh4lJzsr0gpgoVA91EYeE=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-Le1W8lKRO7msVbtpPz2fvA-1; Thu, 09 Dec 2021 04:42:18 -0500
X-MC-Unique: Le1W8lKRO7msVbtpPz2fvA-1
Received: by mail-lf1-f71.google.com with SMTP id
 d2-20020a0565123d0200b0040370d0d2fbso2409493lfv.23
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 01:42:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pPPmUmNI9KFPtmeSDL+aVV4Ewc0xaqmsWpxbtGhIJ9s=;
 b=rRo7iWCD3t8ATC81rStTA00v3w8zi3XAtJ3vB1cafAIEq77fXQUTgpfNGKRE8AO61x
 yrVHwVUEexPWsm5ysuWxEBOn8y/AcFZI3a3Z5UV15lZZn9AIypzSPqQn5BvMbASjNi8X
 ac/RgLL0EV+kptgwFsrzNAEHytquksjgM/7NN1kqxXb3lGsnlH2jDqDaGKTNZm/lJVip
 mQu3Rw6AkzpI20GkiGK+yB8RZHHkwGyiLFHyR+lzuy9kmH2F/KHb3zFl1ao4Z5Mh1MKE
 YuZUlKo/lBBBV5HgkJ+65gQJqYij03abEY/qRfPBKHzeybRSu+Op7tPt3uRRRHBjhbIL
 9PZw==
X-Gm-Message-State: AOAM531leQS2mAkZv5YDYscwlCAV3QhowCROAVElT+9G1V+OaEJ8vqdP
 BdZkSdoJN+iu1LzzLrSPdE0XARTaP20dGCNA9JfYRq2MDDzsOgwqsg1vDDO56WzM5s27tMzts9S
 8MZL6Y9hz13T+R3Vgn5tlJqMENl9g5c4=
X-Received: by 2002:a05:651c:4c9:: with SMTP id
 e9mr5405928lji.10.1639042937385; 
 Thu, 09 Dec 2021 01:42:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJwg3pavRQbKb9DE7uJ8iS0c0kGYu3lpjHabAgARPvxSUSkz7RupzbkaSxQZraLnSaxy+IhEc//N0fdEreHyA=
X-Received: by 2002:a05:651c:4c9:: with SMTP id
 e9mr5405909lji.10.1639042937080; 
 Thu, 09 Dec 2021 01:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-7-leobras@redhat.com>
 <87pmr0ulqx.fsf@secure.mitica>
 <CAJ6HWG4hJSDSNR5GcON2z6LA0ykMv6x7BVS0vpR3zcQuCOzW+A@mail.gmail.com>
In-Reply-To: <CAJ6HWG4hJSDSNR5GcON2z6LA0ykMv6x7BVS0vpR3zcQuCOzW+A@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 9 Dec 2021 06:42:06 -0300
Message-ID: <CAJ6HWG7nhzC02OGTBhtd1u4SJiztgFqfYGDyOVMJAT8+7tPtag@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 9, 2021 at 5:51 AM Leonardo Bras Soares Passos
<leobras@redhat.com> wrote:
>
> Hello Juan,
>
> On Tue, Nov 16, 2021 at 1:08 PM Juan Quintela <quintela@redhat.com> wrote:
> >
> > Leonardo Bras <leobras@redhat.com> wrote:
> > > Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
> > > zerocopy interface.
> > >
> > > Change multifd_send_sync_main() so it can distinguish each iteration sync from
> > > the setup and the completion, so a flush_zerocopy() can be called
> > > at the after each iteration in order to make sure all dirty pages are sent
> > > before a new iteration is started.
> > >
> > > Also make it return -1 if flush_zerocopy() fails, in order to cancel
> > > the migration process, and avoid resuming the guest in the target host
> > > without receiving all current RAM.
> > >
> > > This will work fine on RAM migration because the RAM pages are not usually freed,
> > > and there is no problem on changing the pages content between async_send() and
> > > the actual sending of the buffer, because this change will dirty the page and
> > > cause it to be re-sent on a next iteration anyway.
> > >
> > > Given a lot of locked memory may be needed in order to use multid migration
> > > with zerocopy enabled, make it optional by creating a new migration parameter
> > > "zerocopy" on qapi, so low-privileged users can still perform multifd
> > > migrations.
> >
> > How much memory can a non-root program use by default?
> >
> >
> > >  static void *multifd_send_thread(void *opaque)
> > > @@ -853,6 +875,10 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
> > >          goto cleanup;
> > >      }
> > >
> > > +    if (migrate_use_zerocopy()) {
> > > +        p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZEROCOPY;
> > > +    }
> >
> > This belongs
> >
> >
> > >      p->c = QIO_CHANNEL(sioc);
> > >      qio_channel_set_delay(p->c, false);
> > >      p->running = true;
> > > @@ -918,6 +944,7 @@ int multifd_save_setup(Error **errp)
> > >          p->packet->version = cpu_to_be32(MULTIFD_VERSION);
> > >          p->name = g_strdup_printf("multifdsend_%d", i);
> > >          p->tls_hostname = g_strdup(s->hostname);
> > > +        p->write_flags = 0;
> >
> > here?
> >
> > >          socket_send_channel_create(multifd_new_send_channel_async, p);
> > >      }
> > > diff --git a/migration/socket.c b/migration/socket.c
> > > index e26e94aa0c..8e40e0a3fd 100644
> > > --- a/migration/socket.c
> > > +++ b/migration/socket.c
> > > @@ -78,8 +78,13 @@ static void socket_outgoing_migration(QIOTask *task,
> > >          trace_migration_socket_outgoing_connected(data->hostname);
> > >      }
> > >
> > > -    if (migrate_use_zerocopy()) {
> > > -        error_setg(&err, "Zerocopy not available in migration");
> > > +    if (migrate_use_zerocopy() &&
> > > +        (!migrate_use_multifd() ||
> > > +         !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY) ||
> > > +          migrate_multifd_compression() != MULTIFD_COMPRESSION_NONE ||
> > > +          migrate_use_tls())) {
> > > +        error_setg(&err,
> > > +                   "Zerocopy only available for non-compressed non-TLS multifd migration");
> > >      }
> > >
> > >      migration_channel_connect(data->s, sioc, data->hostname, err);
> >
> > Do we really want to do this check here?  I think this is really too
> > late.
> >
> > You are not patching migrate_params_check().
> >
> > I think that the proper way of doing this is something like:
> >
> >     if (params->zerocopy &&
> >         (params->parameters.multifd_compression != MULTIFD_COMPRESSION_NONE ||
> >          migrate_use_tls())) {
> >            error_setg(&err,
> >                      "Zerocopy only available for non-compressed non-TLS multifd migration");
> >         return false;
> >     }
>
> Don't we also need a check for multifd enabled here?
> We could have zerocopy, multifd_compression=none, tls=disabled but it
> will not fail if multifd=disabled.
>
> Is this correct?
>

I did some tests and this case actually seems to not fail, even though
it should.
So IIUC we really need to check for multifd here.

Sending v6.

>
> >
> > You have to do the equivalent of multifd_compression and tls enablement,
> > to see that zerocopy is not enabled, of course.
> >
> > I would prefer to check for QIO_CHANNEL_FEATUR_WRITE_ZEROCPY there, but
> > I can't see a way of doing that without a qio.
> >
> > Later, Juan.
> >


