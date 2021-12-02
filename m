Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450B465E7D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 08:02:54 +0100 (CET)
Received: from localhost ([::1]:52722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msg7I-0003KY-S5
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 02:02:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msfzk-0000K8-6j
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1msfzf-0004ka-NT
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 01:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638428098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYGmwa9+w1Y3CONzQU+8hjGg3WSPQDulnQ4nskGL09o=;
 b=FBJ0O//fewMPyymraOh8xHWLp8uT3p0GCpYTChh89vtargJwY4IbpiZjvzY/wk42DUErdB
 HmSAQ5ip1Lcws7qck9e5KMR8p6D/Ut+zFgLopGdMCcN0UmCwdjEb3p+DwvTt3C/aW1pwEF
 +J5KjpJYqix8ygNI6s7JvnJT292WEpQ=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-2LHjvLOaO5GHexwKstqLLw-1; Thu, 02 Dec 2021 01:54:51 -0500
X-MC-Unique: 2LHjvLOaO5GHexwKstqLLw-1
Received: by mail-lj1-f198.google.com with SMTP id
 r20-20020a2eb894000000b0021a4e932846so9271181ljp.6
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 22:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dYGmwa9+w1Y3CONzQU+8hjGg3WSPQDulnQ4nskGL09o=;
 b=Bh7eHHx4w9CZ/MPrDV22snY2RfG63Uwdi5MxYlfwyHIeLJH2pQDkHXRvZV6I7SkJ5F
 LXP4R4bFBn0DLuuu+C1alsm7bj6DaNEFlPdd0dT6iIzuEJqEZIuchTSLqM11r6ZC2Jgd
 O6USUzi7mNoFLkGR6g3nWOt7ZLTtk4dhoFEx5J9B57EFT5m05vmq5nrWMDgqckaURrnp
 szSMgSzSa5e32hBwjO7Vl65C+iytUdELc9NmF6RLQ9o20aKBw7MKC3rsxFqdGDZT90pJ
 HJXzV/1N/Pq69JOnjk0ThsKS+MjtYr3HiabkuNo42F0nKAf05OumWgUjSi5B5/x76oDi
 xRag==
X-Gm-Message-State: AOAM5301dghF9uI4bQh1vokCTm2VD2d1Mu2SIKSZ1xYDFvDCFvTpgawv
 8JVFLAF212PyO/8n9BSZcK8vvh4qEUIgvVwKIc50Kdqcyp2Pi6LFXjpEcAbEtMKI6QFY6+ukH4q
 tejZWuuFs88YiyjgHsDUx6fTDdPfxAew=
X-Received: by 2002:a19:614f:: with SMTP id m15mr10338061lfk.187.1638428089296; 
 Wed, 01 Dec 2021 22:54:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzk/EGtOEDlQUZDMGCWBoBU5D6ioXPf8bRszBr87RRZYgLrBtzu88Y8ItEZvms5euAhEqsmI2NBat5LlLgxsfg=
X-Received: by 2002:a19:614f:: with SMTP id m15mr10338035lfk.187.1638428088985; 
 Wed, 01 Dec 2021 22:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20211112051040.923746-1-leobras@redhat.com>
 <20211112051040.923746-7-leobras@redhat.com>
 <87pmr0ulqx.fsf@secure.mitica> <YZPZq5sC8F1x+TXE@redhat.com>
 <YZPdruCbvOh/huxi@redhat.com>
In-Reply-To: <YZPdruCbvOh/huxi@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Dec 2021 03:54:38 -0300
Message-ID: <CAJ6HWG6s5x7bQa7yqVOfR-VWGnnkpYZwtZbTH2=vxqMJk0LP_Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 1:35 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Nov 16, 2021 at 04:17:47PM +0000, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Nov 16, 2021 at 05:08:06PM +0100, Juan Quintela wrote:
> > > Leonardo Bras <leobras@redhat.com> wrote:
> > > > Implement zerocopy on nocomp_send_write(), by making use of QIOChan=
nel
> > > > zerocopy interface.
> > > >
> > > > Change multifd_send_sync_main() so it can distinguish each iteratio=
n sync from
> > > > the setup and the completion, so a flush_zerocopy() can be called
> > > > at the after each iteration in order to make sure all dirty pages a=
re sent
> > > > before a new iteration is started.
> > > >
> > > > Also make it return -1 if flush_zerocopy() fails, in order to cance=
l
> > > > the migration process, and avoid resuming the guest in the target h=
ost
> > > > without receiving all current RAM.
> > > >
> > > > This will work fine on RAM migration because the RAM pages are not =
usually freed,
> > > > and there is no problem on changing the pages content between async=
_send() and
> > > > the actual sending of the buffer, because this change will dirty th=
e page and
> > > > cause it to be re-sent on a next iteration anyway.
> > > >
> > > > Given a lot of locked memory may be needed in order to use multid m=
igration
> > > > with zerocopy enabled, make it optional by creating a new migration=
 parameter
> > > > "zerocopy" on qapi, so low-privileged users can still perform multi=
fd
> > > > migrations.
> > >
> > > How much memory can a non-root program use by default?
> > >
> > >
> > > >  static void *multifd_send_thread(void *opaque)
> > > > @@ -853,6 +875,10 @@ static void multifd_new_send_channel_async(QIO=
Task *task, gpointer opaque)
> > > >          goto cleanup;
> > > >      }
> > > >
> > > > +    if (migrate_use_zerocopy()) {
> > > > +        p->write_flags =3D QIO_CHANNEL_WRITE_FLAG_ZEROCOPY;
> > > > +    }
> > >
> > > This belongs
> > >
> > >
> > > >      p->c =3D QIO_CHANNEL(sioc);
> > > >      qio_channel_set_delay(p->c, false);
> > > >      p->running =3D true;
> > > > @@ -918,6 +944,7 @@ int multifd_save_setup(Error **errp)
> > > >          p->packet->version =3D cpu_to_be32(MULTIFD_VERSION);
> > > >          p->name =3D g_strdup_printf("multifdsend_%d", i);
> > > >          p->tls_hostname =3D g_strdup(s->hostname);
> > > > +        p->write_flags =3D 0;
> > >
> > > here?
> > >
> > > >          socket_send_channel_create(multifd_new_send_channel_async,=
 p);
> > > >      }
> > > > diff --git a/migration/socket.c b/migration/socket.c
> > > > index e26e94aa0c..8e40e0a3fd 100644
> > > > --- a/migration/socket.c
> > > > +++ b/migration/socket.c
> > > > @@ -78,8 +78,13 @@ static void socket_outgoing_migration(QIOTask *t=
ask,
> > > >          trace_migration_socket_outgoing_connected(data->hostname);
> > > >      }
> > > >
> > > > -    if (migrate_use_zerocopy()) {
> > > > -        error_setg(&err, "Zerocopy not available in migration");
> > > > +    if (migrate_use_zerocopy() &&
> > > > +        (!migrate_use_multifd() ||
> > > > +         !qio_channel_has_feature(sioc, QIO_CHANNEL_FEATURE_WRITE_=
ZEROCOPY) ||
> > > > +          migrate_multifd_compression() !=3D MULTIFD_COMPRESSION_N=
ONE ||
> > > > +          migrate_use_tls())) {
> > > > +        error_setg(&err,
> > > > +                   "Zerocopy only available for non-compressed non=
-TLS multifd migration");
> > > >      }
> > > >
> > > >      migration_channel_connect(data->s, sioc, data->hostname, err);
> > >
> > > Do we really want to do this check here?  I think this is really too
> > > late.
> > >
> > > You are not patching migrate_params_check().
> > >
> > > I think that the proper way of doing this is something like:
> > >
> > >     if (params->zerocopy &&
> > >         (params->parameters.multifd_compression !=3D MULTIFD_COMPRESS=
ION_NONE ||
> > >          migrate_use_tls())) {
> > >            error_setg(&err,
> > >                      "Zerocopy only available for non-compressed non-=
TLS multifd migration");
> > >         return false;
> > >     }
> > >
> > > You have to do the equivalent of multifd_compression and tls enableme=
nt,
> > > to see that zerocopy is not enabled, of course.
> > >
> > > I would prefer to check for QIO_CHANNEL_FEATUR_WRITE_ZEROCPY there, b=
ut
> > > I can't see a way of doing that without a qio.
> >
> > I don't think you need to check that feature flag.
> >
> > The combination of zerocopy and compression is simply illogical
> > and can be rejected unconditionally.
>
> Or we could think of "zerocopy"  in a more targetted way.
> It is only "zerocopy" in terms the final I/O operation.
> Earlier parts of the process may involve copies. IOW, we
> can copy as part of the compress operation, but skip the
> when then sending the compressed page.
>
> In practice though this is still unlikely to be something
> we can practically do, as we would need to keep compressed
> pages around for an entire migration iteration until we can
> call flush to ensure the data has been sent. This would be
> significant memory burden.
>
> > The combination of zerocopy and TLS is somewhat questionable.
> > You're always going to have a copy between the plain text and
> > cipher text. Avoiding an extra copy for the cipher text will
> > require kerenl work which has no ETA. If it does ever arise,
> > QEMU will need more work again to actually support it. So
> > today we can just reject it unconditonally again.
>

My idea on failing here in the combination of zerocopy & (!multifd ||
TLS || compaction) is just about how it is today.
Meaning if someone wants to use zerocopy + TLS or zerocopy +
compaction in the future, and can provide a good implementation, it
should be ok to change it here (or at migrate_params_check() where
this should be).

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
Leo


