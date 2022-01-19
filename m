Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3754B493FFB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 19:32:11 +0100 (CET)
Received: from localhost ([::1]:50042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAFkf-0003KE-Qg
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 13:32:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFi6-0001jp-Rz
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:29:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAFi3-00068O-7X
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 13:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642616966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zR5p738ei4NLp6u5rbFc50vWB9XXj2+5CDLWGNycvuo=;
 b=SDchvP+hj8c8KtLie6GcX/kDlsMRws0e96P7ko79VwiMV3OmoKDfF0uhgS6fjL+ppr5D1C
 ucLp0sVRoNjZSMfWwWHwPDXEP/Suw8ZLpm4peWdS6tVoryVEl8lTagB1MvfnoL7dmp5gvU
 erVKJkTyg8sxE7k/1jZocUuyMfGchv0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-rAEHXHnePyy8Pg3xQGmMyg-1; Wed, 19 Jan 2022 13:29:25 -0500
X-MC-Unique: rAEHXHnePyy8Pg3xQGmMyg-1
Received: by mail-lf1-f71.google.com with SMTP id
 h15-20020ac2596f000000b0042effa72823so1982991lfp.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 10:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zR5p738ei4NLp6u5rbFc50vWB9XXj2+5CDLWGNycvuo=;
 b=ZhjJeMv3ZBYGnJJ4QQ5xG6vsgDdECZcpBBccEQOlAdikLJWkHej6p720ZwLe+t9NKH
 dUfPoWIXIzs8x8tKyj04CjthE5BdGRjJ+WN3hnv9HhG71uitE85RIIywnjvIuumIPWMM
 avGeBkUkxcxcaXXdaDtR1ZFjuzgFULXulM0ckX3Fd1J1rqb3Hy7GegRkO5jTqZdaMCvq
 M/gnyqB5fC/Tpj0YuHC88r85lQvuvgf680aFhiqV2YtvKL/Ew/CYd5RDo8Y4ouZZxLJv
 R6RKzBxbszgMGiBHfLUxLaaHrI+VhALywKAQXg6I7PuQSPyNyIQ2i4S2l7hIYA+7I8vc
 8AKw==
X-Gm-Message-State: AOAM532XzNGCIuxveiJwUxk8fiQ+o3ZFOX7eEYqfFVvhL9HR/sqSkoiD
 npLFCPl2wq4bsI/diVZLTJ0N1VB5cyFcU2f34FmsmAkmFZT3D6dRG0DntUOHaBC1UtXF7MmpLf4
 9WKxvH5w91h2aLuRkOpD906NXVvaCdUU=
X-Received: by 2002:a2e:8053:: with SMTP id p19mr25548041ljg.318.1642616963550; 
 Wed, 19 Jan 2022 10:29:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQowPsCNJkGy4Ct0lscyQxGyix3Mnld4VGLHoACiqRSjgg0P8x6ZxeAgboi+u8rVUhJGPQDp5eGcW1JF4uWg0=
X-Received: by 2002:a2e:8053:: with SMTP id p19mr25548015ljg.318.1642616963255; 
 Wed, 19 Jan 2022 10:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-2-leobras@redhat.com>
 <Yd/GhH1fExRgd4yA@xz-m1.local>
 <CAJ6HWG6_JEyH0dohWa=p9vePGb3f1jRaT_z6viDTQobXGW9oiA@mail.gmail.com>
 <YedwO5krFYGoDKCt@xz-m1.local>
In-Reply-To: <YedwO5krFYGoDKCt@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 19 Jan 2022 15:29:12 -0300
Message-ID: <CAJ6HWG5okFSETnv6ipBqOaq34SgxZAvjUCEGkp_Z_tcjS1Rr+Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] QIOChannel: Add flags on io_writev and introduce
 io_flush callback
To: Peter Xu <peterx@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 10:58 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Jan 18, 2022 at 05:45:09PM -0300, Leonardo Bras Soares Passos wrote:
> > Hello Peter,
> >
> > On Thu, Jan 13, 2022 at 3:28 AM Peter Xu <peterx@redhat.com> wrote:
> > >
> > > On Thu, Jan 06, 2022 at 07:13:38PM -0300, Leonardo Bras wrote:
> > > > diff --git a/io/channel.c b/io/channel.c
> > > > index e8b019dc36..904855e16e 100644
> > > > --- a/io/channel.c
> > > > +++ b/io/channel.c
> > > > @@ -67,12 +67,13 @@ ssize_t qio_channel_readv_full(QIOChannel *ioc,
> > > >  }
> > > >
> > > >
> > > > -ssize_t qio_channel_writev_full(QIOChannel *ioc,
> > > > -                                const struct iovec *iov,
> > > > -                                size_t niov,
> > > > -                                int *fds,
> > > > -                                size_t nfds,
> > > > -                                Error **errp)
> > > > +ssize_t qio_channel_writev_full_flags(QIOChannel *ioc,
> > > > +                                      const struct iovec *iov,
> > > > +                                      size_t niov,
> > > > +                                      int *fds,
> > > > +                                      size_t nfds,
> > > > +                                      int flags,
> > > > +                                      Error **errp)
> > > >  {
> > > >      QIOChannelClass *klass = QIO_CHANNEL_GET_CLASS(ioc);
> > > >
> > > > @@ -83,7 +84,7 @@ ssize_t qio_channel_writev_full(QIOChannel *ioc,
> > > >          return -1;
> > > >      }
> > >
> > > Should we better also check QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY here when
> > > QIO_CHANNEL_WRITE_FLAG_ZERO_COPY is set?  Just like what we do with:
> >
> > Yes, that's correct.
> > I will also test for fds + zerocopy_flag , which should also fail here.
> >
> > >
> > >     if ((fds || nfds) &&
> > >         !qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_FD_PASS)) {
> > >         error_setg_errno(errp, EINVAL,
> > >                          "Channel does not support file descriptor passing");
> > >         return -1;
> > >     }
> > >
> > > I still think it's better to have the caller be crystal clear when to use
> > > zero_copy feature because it has implication on buffer lifetime.
> >
> > I don't disagree with that suggestion.
> >
> > But the buffer lifetime limitation is something on the socket
> > implementation, right?
> > There could be some synchronous zerocopy implementation that does not
> > require flush, and thus
> > don't require the buffer to be treated any special. Or am I missing something?
>
> Currently the flush() is required for zerocopy and not required for all the
> existing non-zerocopy use cases, that's already an API difference so the caller
> needs to identify it anyway.  Then I think it's simpler we expose all of it to
> the user.

Yeah, I agree.
Since one ZC implementation uses flush, all should use them. Even if
it's a no-op.
It was just an observation that not all ZC implementations have buffer
limitations, but I agree the user should expect them anyway, since
they will exist in some implementations.

>
> Not to mention IIUC if we don't fail here, it will just fail later when the
> code will unconditionally convert the flags=ZEROCOPY into MSG_ZEROCOPY in your
> next patch:
>
>     if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
>         sflags = MSG_ZEROCOPY;
>     }
>

Correct.

> So AFAIU it'll fail anyway, either here with the cap check I mentioned, or
> later in sendmsg().
>
> IOW, I think it fails cleaner here, rather than reaching sendmsg().

I Agree.

>
> >
> > >
> > > I might have commented similar things before, but I have missed a few versions
> > > so I could also have missed some previous discussions..
> > >
> >
> > That's all great suggestions Peter!  Thanks for that!
> >
> > Some of the previous suggestions may have been missed because a lot of
> > code moved.
> > Sorry about that.
>
> Not a problem at all, I just want to make sure my question still makes
> sense. :)

Thanks for asking them!

>
> --
> Peter Xu
>

Best regards,
Leo


