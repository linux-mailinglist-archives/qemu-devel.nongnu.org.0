Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAEF4BF0D5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 05:12:25 +0100 (CET)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMMXI-0007X2-Lh
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 23:12:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nMMUo-0006Zb-7Y
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 23:09:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nMMUk-0007k7-1K
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 23:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645502984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RVqQd6zCVKRbqjrM30rLfCDoW74SJMf6Ra5FT0NivNI=;
 b=IC1LMwF4doy9Mjgq2jCFH6nGxYw1IasNelUM0bBGLLk2nrUWNOKh6sarfsjK5su/wsphrZ
 7SZsQrjWMMl0n2eQah161lhSHMthtvxu0ZlzWQOVxbmJ1+ekDwT7Mhs0RV8lZS485oT32M
 u8xAuDSH6p9KDVyoKYZXCxSqdb5C9c8=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-_Gk6-kHaMQG0AGGhpOUC5g-1; Mon, 21 Feb 2022 23:09:42 -0500
X-MC-Unique: _Gk6-kHaMQG0AGGhpOUC5g-1
Received: by mail-lj1-f199.google.com with SMTP id
 j17-20020a2e8011000000b002463682ffd5so3134593ljg.6
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 20:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RVqQd6zCVKRbqjrM30rLfCDoW74SJMf6Ra5FT0NivNI=;
 b=KwfGqEuR1kxUwlIpkzaet35pYdWBaZyGIVw0yFyNF2oYgiVHA0zSB8LiUGnhzx6qXC
 edowSJEdg1Ms9B/6XOkcT4IefroM/jwxYslC/jo5AJPk5Q2YkckQYYAS7IaCHq7AVDDe
 FVnuC/1hWhvPtv3G2JxRmVRBzB7Y2Q6LSyemGxuhYHr5qw8c0EOaiJ50LHXcOp5+LC3v
 oKA0lad/6C7wyefj/YONKjjRgz++DHS7ymbQ1u/+uhxmZvvpl8pDBtSzsFCWbDRO9nBG
 7oukituahBx8dLbZyw+N9jzyhs13H46qmHqoZIi7Cq1XjneR9UbeY2NxrsA4u/T5+SuU
 OyLA==
X-Gm-Message-State: AOAM532LEoyOkxdoLnd97wJQqp8q30/bAs1UqkIdqRM7ZeuMmwaF0C4B
 LMIdH+kWiRJtktzHU3zB6/6T2Q6/LM2QRdoSzM+J4eg/f0Pz9/rrzZ5UpmKbCjuahwnWzAzyOwv
 Dx4ruK6wTZX8MO0aKwAUKBQfxHk3iZJU=
X-Received: by 2002:ac2:55a9:0:b0:443:6764:7b40 with SMTP id
 y9-20020ac255a9000000b0044367647b40mr16153995lfg.370.1645502981359; 
 Mon, 21 Feb 2022 20:09:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxV3XeuQ8Yc7g1uVowBa3jt37IINNh9ZgX9vD1kuDmT3cMiixgd7hsHmyAxol5AcHtV4xGJKLhfZj8uJ2noTLg=
X-Received: by 2002:ac2:55a9:0:b0:443:6764:7b40 with SMTP id
 y9-20020ac255a9000000b0044367647b40mr16153971lfg.370.1645502981044; Mon, 21
 Feb 2022 20:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-6-leobras@redhat.com>
 <87fsogcdue.fsf@secure.mitica>
 <CAJ6HWG76LHf+1U=qkyk-Se90Q1MVWvS-SyezqfGBYuM3L1GnAg@mail.gmail.com>
In-Reply-To: <CAJ6HWG76LHf+1U=qkyk-Se90Q1MVWvS-SyezqfGBYuM3L1GnAg@mail.gmail.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 22 Feb 2022 01:09:30 -0300
Message-ID: <CAJ6HWG61mSap=MEsghdU8=DHDnANzoaAZLiA1bfvxt6a1Di7wA@mail.gmail.com>
Subject: Re: [PATCH v8 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21, 2022 at 4:41 PM Leonardo Bras Soares Passos
<leobras@redhat.com> wrote:
>
> Hello Juan, thanks for the feedback!
>
> On Fri, Feb 18, 2022 at 1:57 PM Juan Quintela <quintela@redhat.com> wrote:
> >
> > Leonardo Bras <leobras@redhat.com> wrote:
> > > Implement zero copy send on nocomp_send_write(), by making use of QIOChannel
> > > writev + flags & flush interface.
> > >
> > > Change multifd_send_sync_main() so flush_zero_copy() can be called
> > > after each iteration in order to make sure all dirty pages are sent before
> > > a new iteration is started. It will also flush at the beginning and at the
> > > end of migration.
> > >
> > > Also make it return -1 if flush_zero_copy() fails, in order to cancel
> > > the migration process, and avoid resuming the guest in the target host
> > > without receiving all current RAM.
> > >
> > > This will work fine on RAM migration because the RAM pages are not usually freed,
> > > and there is no problem on changing the pages content between writev_zero_copy() and
> > > the actual sending of the buffer, because this change will dirty the page and
> > > cause it to be re-sent on a next iteration anyway.
> > >
> > > A lot of locked memory may be needed in order to use multid migration
> >                                                        ^^^^^^
> > multifd.
> >
> > I can fix it on the commit.
>
> No worries, fixed for v9.
>
> >
> >
> > > @@ -1479,7 +1479,16 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
> > >          error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
> > >          return false;
> > >      }
> > > -
> > > +#ifdef CONFIG_LINUX
> > > +    if (params->zero_copy_send &&
> > > +        (!migrate_use_multifd() ||
> > > +         params->multifd_compression != MULTIFD_COMPRESSION_NONE ||
> > > +         (params->tls_creds && *params->tls_creds))) {
> > > +        error_setg(errp,
> > > +                   "Zero copy only available for non-compressed non-TLS multifd migration");
> > > +        return false;
> > > +    }
> > > +#endif
> > >      return true;
> > >  }
> >
> > Test is long, but it is exactly what we need.  Good.
>
> Thanks!
>
>
> >
> >
> > >
> > > diff --git a/migration/multifd.c b/migration/multifd.c
> > > index 43998ad117..2d68b9cf4f 100644
> > > --- a/migration/multifd.c
> > > +++ b/migration/multifd.c
> > > @@ -568,19 +568,28 @@ void multifd_save_cleanup(void)
> > >      multifd_send_state = NULL;
> > >  }
> > >
> > > -void multifd_send_sync_main(QEMUFile *f)
> > > +int multifd_send_sync_main(QEMUFile *f)
> > >  {
> > >      int i;
> > > +    bool flush_zero_copy;
> > >
> > >      if (!migrate_use_multifd()) {
> > > -        return;
> > > +        return 0;
> > >      }
> > >      if (multifd_send_state->pages->num) {
> > >          if (multifd_send_pages(f) < 0) {
> > >              error_report("%s: multifd_send_pages fail", __func__);
> > > -            return;
> > > +            return 0;
> > >          }
> > >      }
> > > +
> > > +    /*
> > > +     * When using zero-copy, it's necessary to flush after each iteration to
> > > +     * make sure pages from earlier iterations don't end up replacing newer
> > > +     * pages.
> > > +     */
> > > +    flush_zero_copy = migrate_use_zero_copy_send();
> > > +
> > >      for (i = 0; i < migrate_multifd_channels(); i++) {
> > >          MultiFDSendParams *p = &multifd_send_state->params[i];
> > >
> > > @@ -591,7 +600,7 @@ void multifd_send_sync_main(QEMUFile *f)
> > >          if (p->quit) {
> > >              error_report("%s: channel %d has already quit", __func__, i);
> > >              qemu_mutex_unlock(&p->mutex);
> > > -            return;
> > > +            return 0;
> > >          }
> > >
> > >          p->packet_num = multifd_send_state->packet_num++;
> > > @@ -602,6 +611,17 @@ void multifd_send_sync_main(QEMUFile *f)
> > >          ram_counters.transferred += p->packet_len;
> > >          qemu_mutex_unlock(&p->mutex);
> > >          qemu_sem_post(&p->sem);
> > > +
> > > +        if (flush_zero_copy) {
> > > +            int ret;
> > > +            Error *err = NULL;
> > > +
> > > +            ret = qio_channel_flush(p->c, &err);
> > > +            if (ret < 0) {
> > > +                error_report_err(err);
> > > +                return -1;
> > > +            }
> > > +        }
> > >      }
> > >      for (i = 0; i < migrate_multifd_channels(); i++) {
> > >          MultiFDSendParams *p = &multifd_send_state->params[i];
> > > @@ -610,6 +630,8 @@ void multifd_send_sync_main(QEMUFile *f)
> > >          qemu_sem_wait(&p->sem_sync);
> > >      }
> > >      trace_multifd_send_sync_main(multifd_send_state->packet_num);
> > > +
> > > +    return 0;
> > >  }
> >
> > We are leaving pages is flight for potentially a lot of time. I *think*
> > that we can sync shorter than that.
> >
> > >  static void *multifd_send_thread(void *opaque)
> > > @@ -668,8 +690,8 @@ static void *multifd_send_thread(void *opaque)
> > >              p->iov[0].iov_len = p->packet_len;
> > >              p->iov[0].iov_base = p->packet;
> > >
> > > -            ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
> > > -                                         &local_err);
> > > +            ret = qio_channel_writev_full_all(p->c, p->iov, p->iovs_num, NULL,
> > > +                                              0, p->write_flags, &local_err);
> > >              if (ret != 0) {
> > >                  break;
> > >              }
> >
> > I still think that it would be better to have a sync here in each
> > thread.  I don't know the size, but once every couple megabytes of RAM
> > or so.
>
> This seems a good idea, since the first iteration may take a while,
> and we may take a lot of time to fail if something goes wrong with
> zerocopy at the start of iteration 1.
>
> On the other hand, flushing takes some time, and doing it a lot may
> take away some of the performance improvements.
>
> Maybe we could move the flushing to a thread of it's own, if it
> becomes a problem.
>
>
> >
> > I did a change on:
> >
> > commit d48c3a044537689866fe44e65d24c7d39a68868a
> > Author: Juan Quintela <quintela@redhat.com>
> > Date:   Fri Nov 19 15:35:58 2021 +0100
> >
> >     multifd: Use a single writev on the send side
> >
> >     Until now, we wrote the packet header with write(), and the rest of the
> >     pages with writev().  Just increase the size of the iovec and do a
> >     single writev().
> >
> >     Signed-off-by: Juan Quintela <quintela@redhat.com>
> >     Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> > And now we need to "perserve" this header until we do the sync,
> > otherwise we are overwritting it with other things.
>
> Yeah, that is a problem I faced on non-multifd migration, and a reason
> why I choose to implement directly in multifd.
>
> >
> > What testing have you done after this commit?
>
> Not much, but this will probably become an issue with bigger guests.
>
> >
> > Notice that it is not _complicated_ to fix it, I will try to come with
> > some idea on monday, but basically is having an array of buffers for
> > each thread, and store them until we call a sync().
>
> That will probably work, we can use MultiFDRecvParams->packet as this
> array, right?
> We can start with a somehow small buffer size and grow if it ever gets full.
> (Full means a sync + g_try_malloc0 + g_free)

Or maybe use the array size as a size limiter before flushing, so it
will always flush after BUFFSIZE headers are sent.

>
> By my calculations, it should take 1,8kB each element on a 4k PAGESIZE.
>
> What do you think?
>
> Best regards,
> Leo


