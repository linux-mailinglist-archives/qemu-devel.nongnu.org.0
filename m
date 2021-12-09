Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00246E4A3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 09:53:50 +0100 (CET)
Received: from localhost ([::1]:60272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFBV-0001Yi-7M
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 03:53:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mvF9x-0000oB-Q7
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 03:52:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mvF9u-00064P-5f
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 03:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639039927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UJMT5JBvMYxogPcO3vafbY1w1VmBcg6H5XKC5cGuF8E=;
 b=FL0yH3EkgW9pG0E5bYdYAUmmeIE3PgnpQ87u7CuI28HAvRKLQuF5Qq7Ztldvx9Fib49ZhZ
 TMVQaP+106DlupGD0PR/Tt8neyndHkkJh8jSMKotjr6Zzg/Z4WlsgP+kswcdPzzZzHIJd3
 zKpyyXNqzJ7MWbASsmMseritqUu1mPk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-Zu-zOt2KO3-1u8QCD-ZTuQ-1; Thu, 09 Dec 2021 03:52:06 -0500
X-MC-Unique: Zu-zOt2KO3-1u8QCD-ZTuQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 bn28-20020a05651c179c00b002222b4cc6d8so905663ljb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 00:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJMT5JBvMYxogPcO3vafbY1w1VmBcg6H5XKC5cGuF8E=;
 b=G9MbZdsXdzKN/9s9jT/Q/8BQYYHjPOt5EQibwtSX0fTNXVGl2zgsNsHR0A+w/sAmNA
 JxB2sKH9QqO4IAib567auYvaB5pJsB4lUUBTVLjUxOLgI46IrUA22DqH6iaaULyrq5fJ
 QLrkQ2hCxSFN3dU+aYOzbYkBH17JKLowpUmLg4C2xoJ4fzdCfqF2TVvY6IYvevFQjGmg
 3jGw+U2HbrUGpjoFM3z5AGmVrcWZ/4WKz4U6qR+TsDirSDr/tWjmpwpgAr2UWYFwwGmH
 He+svNcNWJgnvK763CIqMG10APbxqaFjwnl95003CBDSo1H3c5V8BRrcqnF5HvL69i9V
 ovSQ==
X-Gm-Message-State: AOAM530rP57q6DlJs25Rrmj/BcCVDDRA+Lq/5X/nMSyG7rHhN1ZjP053
 NsL7Xu1gfZgQqyOqLXg+iAwcWPkPxkIUqEFXZnXswK7RQokVZr2uBZ1QULiPBivyJPuStzlofLV
 a2wIM8LInhJMdy913cSkSloM8qzYd9Vk=
X-Received: by 2002:a05:6512:32c8:: with SMTP id
 f8mr4593377lfg.669.1639039925131; 
 Thu, 09 Dec 2021 00:52:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGYggmrER8MKo4y1wU7T3eLNmKDNmMTkafC3AgBfA1vqWuGt7dZyTH7yp6HthyTpb/r+/27sVYq1pM5XUi484=
X-Received: by 2002:a05:6512:32c8:: with SMTP id
 f8mr4593353lfg.669.1639039924930; 
 Thu, 09 Dec 2021 00:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-7-leobras@redhat.com>
 <87pmr0ulqx.fsf@secure.mitica>
In-Reply-To: <87pmr0ulqx.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 9 Dec 2021 05:51:54 -0300
Message-ID: <CAJ6HWG4hJSDSNR5GcON2z6LA0ykMv6x7BVS0vpR3zcQuCOzW+A@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Juan,

On Tue, Nov 16, 2021 at 1:08 PM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Bras <leobras@redhat.com> wrote:
> > Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
> > zerocopy interface.
> >
> > Change multifd_send_sync_main() so it can distinguish each iteration sync from
> > the setup and the completion, so a flush_zerocopy() can be called
> > at the after each iteration in order to make sure all dirty pages are sent
> > before a new iteration is started.
> >
> > Also make it return -1 if flush_zerocopy() fails, in order to cancel
> > the migration process, and avoid resuming the guest in the target host
> > without receiving all current RAM.
> >
> > This will work fine on RAM migration because the RAM pages are not usually freed,
> > and there is no problem on changing the pages content between async_send() and
> > the actual sending of the buffer, because this change will dirty the page and
> > cause it to be re-sent on a next iteration anyway.
> >
> > Given a lot of locked memory may be needed in order to use multid migration
> > with zerocopy enabled, make it optional by creating a new migration parameter
> > "zerocopy" on qapi, so low-privileged users can still perform multifd
> > migrations.
>
> How much memory can a non-root program use by default?
>
>
> >  static void *multifd_send_thread(void *opaque)
> > @@ -853,6 +875,10 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
> >          goto cleanup;
> >      }
> >
> > +    if (migrate_use_zerocopy()) {
> > +        p->write_flags = QIO_CHANNEL_WRITE_FLAG_ZEROCOPY;
> > +    }
>
> This belongs
>
>
> >      p->c = QIO_CHANNEL(sioc);
> >      qio_channel_set_delay(p->c, false);
> >      p->running = true;
> > @@ -918,6 +944,7 @@ int multifd_save_setup(Error **errp)
> >          p->packet->version = cpu_to_be32(MULTIFD_VERSION);
> >          p->name = g_strdup_printf("multifdsend_%d", i);
> >          p->tls_hostname = g_strdup(s->hostname);
> > +        p->write_flags = 0;
>
> here?
>
> >          socket_send_channel_create(multifd_new_send_channel_async, p);
> >      }
> > diff --git a/migration/socket.c b/migration/socket.c
> > index e26e94aa0c..8e40e0a3fd 100644
> > --- a/migration/socket.c
> > +++ b/migration/socket.c
> > @@ -78,8 +78,13 @@ static void socket_outgoing_migration(QIOTask *task,
> >          trace_migration_socket_outgoing_connected(data->hostname);
> >      }
> >
> > -    if (migrate_use_zerocopy()) {
> > -        error_setg(&err, "Zerocopy not available in migration");
> > +    if (migrate_use_zerocopy() &&
> > +        (!migrate_use_multifd() ||
> > +         !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_ZEROCOPY) ||
> > +          migrate_multifd_compression() != MULTIFD_COMPRESSION_NONE ||
> > +          migrate_use_tls())) {
> > +        error_setg(&err,
> > +                   "Zerocopy only available for non-compressed non-TLS multifd migration");
> >      }
> >
> >      migration_channel_connect(data->s, sioc, data->hostname, err);
>
> Do we really want to do this check here?  I think this is really too
> late.
>
> You are not patching migrate_params_check().
>
> I think that the proper way of doing this is something like:
>
>     if (params->zerocopy &&
>         (params->parameters.multifd_compression != MULTIFD_COMPRESSION_NONE ||
>          migrate_use_tls())) {
>            error_setg(&err,
>                      "Zerocopy only available for non-compressed non-TLS multifd migration");
>         return false;
>     }

Don't we also need a check for multifd enabled here?
We could have zerocopy, multifd_compression=none, tls=disabled but it
will not fail if multifd=disabled.

Is this correct?


>
> You have to do the equivalent of multifd_compression and tls enablement,
> to see that zerocopy is not enabled, of course.
>
> I would prefer to check for QIO_CHANNEL_FEATUR_WRITE_ZEROCPY there, but
> I can't see a way of doing that without a qio.
>
> Later, Juan.
>


