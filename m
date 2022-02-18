Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C73C04BBE02
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 18:07:54 +0100 (CET)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL6jZ-00022i-6w
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 12:07:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL6ZV-0007hZ-U8
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:57:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nL6ZP-0000V0-Qa
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 11:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645203439;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oobV9so6e0TzaeVdp1poQT5cI33tRdLxDi5qIVjvoXE=;
 b=e1g2ZN/5iwjas/HIeyh7mhFhRXdPVRGI1xCaDcHqXqRotRj69qjFNct9IeeYZ0VrLy7/iO
 iMSUlbcMH3Fc7dTAqzeDH6HfsfQItNGCjmTWv2dCmAnzdf1xg3v94hv5ZaM7yQj0GxaVaY
 4cund1S0bw+5t5s0cbyC9yO5+G4I1GU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-GmgKay2yPPSMVLXubydkjA-1; Fri, 18 Feb 2022 11:57:16 -0500
X-MC-Unique: GmgKay2yPPSMVLXubydkjA-1
Received: by mail-wm1-f71.google.com with SMTP id
 b17-20020a05600c4e1100b0037cc0d56524so6191657wmq.2
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 08:57:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=oobV9so6e0TzaeVdp1poQT5cI33tRdLxDi5qIVjvoXE=;
 b=ci6wLjgvCVI/smz44EoGxf/3Ul+3RaW7q0C4LKtAQmWY1RqqdsoB5BwDCc4jsQgL9k
 DsyVO0ujEGqQcsmhg/vgEjOheYCj1RFbGk5gouHThSG3e3k/jpfuW1Yot1iaCTXJlr8A
 ZQDms9HkfKS6btTDiVRthdeQjh1rDiDXNc2tspKqamfT6kD6fCYoOcfHxrt8lOE5Kz4L
 PO3KITWzZ23qtYNb0d963NMuyMJLDphnCXYSNwKhRsHzcd2KlmOASCBsF9ty3/S4Wjl5
 T6Tj9efIiQ5SLCd6tHWBUQhoBubJmguwsyd5Rt4A7VAs7w+/H4y9pYUfwZB/EkkzMyuy
 TArw==
X-Gm-Message-State: AOAM530ni25F0w8mLGJN8yGrJfZL/e5IJRd2UIs6vzBlqcT6sEsnS66w
 rqufMsn2yYYVEmkBHl3w5R2KMMJxNHBtPBpcFYdJWP3rE7UrHhLDEpIrKA0DnqmxPIWGa0sEEiN
 PClf+g5aXElMycmk=
X-Received: by 2002:adf:cc86:0:b0:1e4:b25d:cfc5 with SMTP id
 p6-20020adfcc86000000b001e4b25dcfc5mr6753201wrj.7.1645203435203; 
 Fri, 18 Feb 2022 08:57:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+VnElccx6ZdajXSebRxbQwC8Qgj5niEMmvdgILNegxpkk3Qlg3yEjRPUR+9d4mPqh1wIXzQ==
X-Received: by 2002:adf:cc86:0:b0:1e4:b25d:cfc5 with SMTP id
 p6-20020adfcc86000000b001e4b25dcfc5mr6753176wrj.7.1645203434943; 
 Fri, 18 Feb 2022 08:57:14 -0800 (PST)
Received: from localhost (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id l12sm38894352wrs.11.2022.02.18.08.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 08:57:14 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v8 5/5] multifd: Implement zero copy write in multifd
 migration (multifd-zero-copy)
In-Reply-To: <20220201062901.428838-6-leobras@redhat.com> (Leonardo Bras's
 message of "Tue, 1 Feb 2022 03:29:03 -0300")
References: <20220201062901.428838-1-leobras@redhat.com>
 <20220201062901.428838-6-leobras@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 18 Feb 2022 17:57:13 +0100
Message-ID: <87fsogcdue.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Bras <leobras@redhat.com> wrote:
> Implement zero copy send on nocomp_send_write(), by making use of QIOChannel
> writev + flags & flush interface.
>
> Change multifd_send_sync_main() so flush_zero_copy() can be called
> after each iteration in order to make sure all dirty pages are sent before
> a new iteration is started. It will also flush at the beginning and at the
> end of migration.
>
> Also make it return -1 if flush_zero_copy() fails, in order to cancel
> the migration process, and avoid resuming the guest in the target host
> without receiving all current RAM.
>
> This will work fine on RAM migration because the RAM pages are not usually freed,
> and there is no problem on changing the pages content between writev_zero_copy() and
> the actual sending of the buffer, because this change will dirty the page and
> cause it to be re-sent on a next iteration anyway.
>
> A lot of locked memory may be needed in order to use multid migration
                                                       ^^^^^^
multifd.

I can fix it on the commit.


> @@ -1479,7 +1479,16 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
>          error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
>          return false;
>      }
> -
> +#ifdef CONFIG_LINUX
> +    if (params->zero_copy_send &&
> +        (!migrate_use_multifd() ||
> +         params->multifd_compression != MULTIFD_COMPRESSION_NONE ||
> +         (params->tls_creds && *params->tls_creds))) {
> +        error_setg(errp,
> +                   "Zero copy only available for non-compressed non-TLS multifd migration");
> +        return false;
> +    }
> +#endif
>      return true;
>  }

Test is long, but it is exactly what we need.  Good.


>  
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 43998ad117..2d68b9cf4f 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -568,19 +568,28 @@ void multifd_save_cleanup(void)
>      multifd_send_state = NULL;
>  }
>  
> -void multifd_send_sync_main(QEMUFile *f)
> +int multifd_send_sync_main(QEMUFile *f)
>  {
>      int i;
> +    bool flush_zero_copy;
>  
>      if (!migrate_use_multifd()) {
> -        return;
> +        return 0;
>      }
>      if (multifd_send_state->pages->num) {
>          if (multifd_send_pages(f) < 0) {
>              error_report("%s: multifd_send_pages fail", __func__);
> -            return;
> +            return 0;
>          }
>      }
> +
> +    /*
> +     * When using zero-copy, it's necessary to flush after each iteration to
> +     * make sure pages from earlier iterations don't end up replacing newer
> +     * pages.
> +     */
> +    flush_zero_copy = migrate_use_zero_copy_send();
> +
>      for (i = 0; i < migrate_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
>  
> @@ -591,7 +600,7 @@ void multifd_send_sync_main(QEMUFile *f)
>          if (p->quit) {
>              error_report("%s: channel %d has already quit", __func__, i);
>              qemu_mutex_unlock(&p->mutex);
> -            return;
> +            return 0;
>          }
>  
>          p->packet_num = multifd_send_state->packet_num++;
> @@ -602,6 +611,17 @@ void multifd_send_sync_main(QEMUFile *f)
>          ram_counters.transferred += p->packet_len;
>          qemu_mutex_unlock(&p->mutex);
>          qemu_sem_post(&p->sem);
> +
> +        if (flush_zero_copy) {
> +            int ret;
> +            Error *err = NULL;
> +
> +            ret = qio_channel_flush(p->c, &err);
> +            if (ret < 0) {
> +                error_report_err(err);
> +                return -1;
> +            }
> +        }
>      }
>      for (i = 0; i < migrate_multifd_channels(); i++) {
>          MultiFDSendParams *p = &multifd_send_state->params[i];
> @@ -610,6 +630,8 @@ void multifd_send_sync_main(QEMUFile *f)
>          qemu_sem_wait(&p->sem_sync);
>      }
>      trace_multifd_send_sync_main(multifd_send_state->packet_num);
> +
> +    return 0;
>  }

We are leaving pages is flight for potentially a lot of time. I *think*
that we can sync shorter than that.

>  static void *multifd_send_thread(void *opaque)
> @@ -668,8 +690,8 @@ static void *multifd_send_thread(void *opaque)
>              p->iov[0].iov_len = p->packet_len;
>              p->iov[0].iov_base = p->packet;
>  
> -            ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
> -                                         &local_err);
> +            ret = qio_channel_writev_full_all(p->c, p->iov, p->iovs_num, NULL,
> +                                              0, p->write_flags, &local_err);
>              if (ret != 0) {
>                  break;
>              }

I still think that it would be better to have a sync here in each
thread.  I don't know the size, but once every couple megabytes of RAM
or so.

I did a change on:

commit d48c3a044537689866fe44e65d24c7d39a68868a
Author: Juan Quintela <quintela@redhat.com>
Date:   Fri Nov 19 15:35:58 2021 +0100

    multifd: Use a single writev on the send side
    
    Until now, we wrote the packet header with write(), and the rest of the
    pages with writev().  Just increase the size of the iovec and do a
    single writev().
    
    Signed-off-by: Juan Quintela <quintela@redhat.com>
    Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

And now we need to "perserve" this header until we do the sync,
otherwise we are overwritting it with other things.

What testing have you done after this commit?

Notice that it is not _complicated_ to fix it, I will try to come with
some idea on monday, but basically is having an array of buffers for
each thread, and store them until we call a sync().

Later, Juan.


