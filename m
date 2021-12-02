Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC353465E78
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 07:56:49 +0100 (CET)
Received: from localhost ([::1]:48438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msg1Q-0000IO-Dl
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 01:56:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msfsc-0001Hf-NY
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:47:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msfsY-0003c4-HS
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638427656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Omeo3rJMhr1XDtHQ3DU+FBY2XraX6Qr4C7UyD29dhsM=;
 b=ShPiniUm+gVc8IVjaDg4J3AL+r98O95ylmU6MxhV5dRP7xn5iqb3h3FrLsEqswF5uWHVsZ
 GiojGvoDnBlih0J6Sk2AY9lMe2o+wGpYlQTXNXM6Maa9UxZBI17X5C5J0a0Fo3zosPgQWp
 r5ZJKPGUpA7OiDtU1hs6tzoZ6tBlD2U=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-JJk7SbEwOz2vUWnKkanYuQ-1; Thu, 02 Dec 2021 01:47:34 -0500
X-MC-Unique: JJk7SbEwOz2vUWnKkanYuQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 i6-20020a0565123e0600b00417d29eede4so6420813lfv.12
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 22:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Omeo3rJMhr1XDtHQ3DU+FBY2XraX6Qr4C7UyD29dhsM=;
 b=2xZ90N3oGXjp/IAsSVHOvhHnYnm/WVCRtc6EjED/QxIPnpFHRZ6Vr76bPPSpNizxWF
 +DrXB6cx8xS1AtmakLXyvXL6qf0nmebbjZeiwBb5Z/TMPFAba34TASux26oDB7EdWc7S
 e3E2gs2g2Hhu3yAb/r90RJGGi+xvZ0jljFTkMwbJR6kuOIUmzh1M3jtWLD64SLlOlLUE
 pyFcNvj5ELFSX4J6zruqk+rB2v3mPZ4UFVPFrY/DoYy1zvyFKgrdWvy8JV8Ef/tLGJA/
 CIWEk7mum3tgXNyc0Cwz2BSWe9+3gvUp5E+7Amw1JuuRFssOiUfM0t4C/BHWEmlPRX5f
 NDAA==
X-Gm-Message-State: AOAM530aBxYAEM4FUCGHAiu+dN85/P3dOLc0dhF0Ujf87CR+qYhjo/IB
 pLyoLkkxody1jMSHGIFJeZcvUsAbGZQ3o+FcbGPLW4vE9UJnEpVMn7n86c2VYhzCBoptMTyjG0u
 dWzQh5fvenl8FnvnoyOfLBkN59oJKU9c=
X-Received: by 2002:a05:651c:4c9:: with SMTP id
 e9mr10376270lji.10.1638427653205; 
 Wed, 01 Dec 2021 22:47:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbjpgHnHuTE2hWmLgKve7fllOSeiU23F/QO2vKnm+vBk9VHTo/MCQnoAlCSj2J5NX2n0mOatNSF100RhAhLqU=
X-Received: by 2002:a05:651c:4c9:: with SMTP id
 e9mr10376236lji.10.1638427652880; 
 Wed, 01 Dec 2021 22:47:32 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-7-leobras@redhat.com>
 <87pmr0ulqx.fsf@secure.mitica>
In-Reply-To: <87pmr0ulqx.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Dec 2021 03:47:21 -0300
Message-ID: <CAJ6HWG4EadJPwiOc3xUGs2QovLeHmDLtiT+p0UimnYd1XFu4RA@mail.gmail.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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

On RHEL 8, a standard user is created allowing 64kB max locked memory.
(memory seems 'unlimited', though)


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

yeah, makes sense.
Moving on v6.

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
>
> You have to do the equivalent of multifd_compression and tls enablement,
> to see that zerocopy is not enabled, of course.

IIUC, by following your suggestion and changing this in
migrate_params_check() instead would allow the misconfiguration to be
known before migration is attempted.
That seems the best thing to do here.


>
> I would prefer to check for QIO_CHANNEL_FEATUR_WRITE_ZEROCPY there, but
> I can't see a way of doing that without a qio.

Yeah, I think I should leave the feature testing in here, and move the
parameter testing to migrate_params_check() as commented before.

What do you think?

>
> Later, Juan.
>

Best regards,
Leo


