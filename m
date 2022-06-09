Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5155453D2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 20:13:24 +0200 (CEST)
Received: from localhost ([::1]:47078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMep-0001qS-4E
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 14:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzKr8-0003Kt-Vr
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nzKr6-0001as-5j
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:17:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654791475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpWxJVAz82RhPiogAjm4KFMGk4g+ZUkYwbT3KX1mdFo=;
 b=Kzp4mDpL0uOqx2g09jruOn0Rn9NlUsQxtnjqOYDzJQRvOKfMQ0Efth5RQYEoHm5f3FRPaZ
 uaDHaGuYiVONdJuLP0r8SNms4k7DYBOFyIou4dmNelM6WRKAWjNWRl8JQpS/yAOWCE6E3c
 +9aJgdKolzgb1pCvjgWwt+d1fAKICMk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-R5jtGscKOfChVQPXyJrfwQ-1; Thu, 09 Jun 2022 12:17:54 -0400
X-MC-Unique: R5jtGscKOfChVQPXyJrfwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c1c8500b003974c5d636dso11526959wms.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=BpWxJVAz82RhPiogAjm4KFMGk4g+ZUkYwbT3KX1mdFo=;
 b=72jYyN6s5Bl0a6MBc5MQNNADEk+ykI5jp24SL55vLyhKNCD4+hSk7Nr95IRECvbCO/
 FsaA4D9GqdDrgFAPcOMSO6cAdoYjbt5fRSca4CYG4goW6PskyfNSMeMhWG+Jzq0bE1hX
 aIHXdnlr9fnm+qMs5ww1qXU7KuUYFSI+SfnbiwpCl503SYJaDLB9lRSSBV4pjz9dQfns
 IwrmH+SS4RekCnvWX9HjxlyJoTDAUURleNSE04QJNOyoS3v8m1McnmQE2+M1nU4wW4Mp
 P7AckqeOEnAgDmsIi1995cyKiG0TJrwo7VQ07bz885luQMPVG7EFAJ9EbzNgaHPJ5ruq
 eBFw==
X-Gm-Message-State: AOAM530x5FQ2UbFyOIT6dm9qnDXxWPx7rI9Yqv9ukgSCygn4e56E0eXe
 k4qbMCUuv82b1hGwXD8S+ap7kSQK3959LgFBzH8R3yaTpN91p2EVsX6LZCniN5uNwSdC3qe19SW
 ivePDhcXpxnY/SZ4=
X-Received: by 2002:a05:6000:152:b0:216:160:2e60 with SMTP id
 r18-20020a056000015200b0021601602e60mr29270129wrx.663.1654791472861; 
 Thu, 09 Jun 2022 09:17:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+gITrkuXIQEqOflqpYlep3DbW9C4+v7Hb88614H+V5hR2zIha+SGoxPwaSy2ufPtYVSmX/g==
X-Received: by 2002:a05:6000:152:b0:216:160:2e60 with SMTP id
 r18-20020a056000015200b0021601602e60mr29270095wrx.663.1654791472537; 
 Thu, 09 Jun 2022 09:17:52 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm12519954wrr.15.2022.06.09.09.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 09:17:51 -0700 (PDT)
Date: Thu, 9 Jun 2022 17:17:49 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 14/20] migration: remove the QEMUFileOps 'shut_down'
 callback
Message-ID: <YqIdLf+4qS2lQ/nZ@work-vm>
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-15-berrange@redhat.com>
 <YqIb+S+UlgJMXkSa@work-vm> <YqIcgc7J9d/kLBOu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YqIcgc7J9d/kLBOu@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Jun 09, 2022 at 05:12:41PM +0100, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > This directly implements the shutdown logic using QIOChannel APIs.
> > > 
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > ---
> > >  migration/qemu-file-channel.c | 27 ---------------------------
> > >  migration/qemu-file.c         | 10 +++++++---
> > >  migration/qemu-file.h         | 10 ----------
> > >  3 files changed, 7 insertions(+), 40 deletions(-)
> > > 
> > > diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
> > > index 5cb8ac93c0..80f05dc371 100644
> > > --- a/migration/qemu-file-channel.c
> > > +++ b/migration/qemu-file-channel.c
> > > @@ -112,31 +112,6 @@ static int channel_close(void *opaque, Error **errp)
> > >  }
> > >  
> > >  
> > > -static int channel_shutdown(void *opaque,
> > > -                            bool rd,
> > > -                            bool wr,
> > > -                            Error **errp)
> > > -{
> > > -    QIOChannel *ioc = QIO_CHANNEL(opaque);
> > > -
> > > -    if (qio_channel_has_feature(ioc,
> > > -                                QIO_CHANNEL_FEATURE_SHUTDOWN)) {
> > > -        QIOChannelShutdown mode;
> > > -        if (rd && wr) {
> > > -            mode = QIO_CHANNEL_SHUTDOWN_BOTH;
> > > -        } else if (rd) {
> > > -            mode = QIO_CHANNEL_SHUTDOWN_READ;
> > > -        } else {
> > > -            mode = QIO_CHANNEL_SHUTDOWN_WRITE;
> > > -        }
> > > -        if (qio_channel_shutdown(ioc, mode, errp) < 0) {
> > > -            return -EIO;
> > > -        }
> > > -    }
> > > -    return 0;
> > > -}
> > > -
> > > -
> > >  static int channel_set_blocking(void *opaque,
> > >                                  bool enabled,
> > >                                  Error **errp)
> > > @@ -166,7 +141,6 @@ static QEMUFile *channel_get_output_return_path(void *opaque)
> > >  static const QEMUFileOps channel_input_ops = {
> > >      .get_buffer = channel_get_buffer,
> > >      .close = channel_close,
> > > -    .shut_down = channel_shutdown,
> > >      .set_blocking = channel_set_blocking,
> > >      .get_return_path = channel_get_input_return_path,
> > >  };
> > > @@ -175,7 +149,6 @@ static const QEMUFileOps channel_input_ops = {
> > >  static const QEMUFileOps channel_output_ops = {
> > >      .writev_buffer = channel_writev_buffer,
> > >      .close = channel_close,
> > > -    .shut_down = channel_shutdown,
> > >      .set_blocking = channel_set_blocking,
> > >      .get_return_path = channel_get_output_return_path,
> > >  };
> > > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > > index 5548e1abf3..fd9f060c02 100644
> > > --- a/migration/qemu-file.c
> > > +++ b/migration/qemu-file.c
> > > @@ -74,13 +74,17 @@ struct QEMUFile {
> > >   */
> > >  int qemu_file_shutdown(QEMUFile *f)
> > >  {
> > > -    int ret;
> > > +    int ret = 0;
> > >  
> > >      f->shutdown = true;
> > > -    if (!f->ops->shut_down) {
> > > +    if (!qio_channel_has_feature(f->ioc,
> > > +                                 QIO_CHANNEL_FEATURE_SHUTDOWN)) {
> > >          return -ENOSYS;
> > >      }
> > > -    ret = f->ops->shut_down(f->ioc, true, true, NULL);
> > > +
> > > +    if (qio_channel_shutdown(f->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL) < 0) {
> > > +        ret = -EIO;
> > > +    }
> > 
> > OK, so this is following the code you're flattening; so:
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> >  I wonder if there's any reason it doesn't just pass the return value through to ret rather
> > than flattening it to -EIO?
> 
> qio methods never return errno values just positive integer or -1.
> 
> Since qemu_file_shutdown seems to want an errno, I picked EIO
> 
> Better would be for qemu_file_shutdown to have an Error **errp
> param instead but that could come later.

Ah OK.

Dave

> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


