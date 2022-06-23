Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7705555766C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 11:16:59 +0200 (CEST)
Received: from localhost ([::1]:54226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4IxO-0005Nt-Da
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 05:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4Icr-0005zB-Oc
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4Icp-0008Vt-VF
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655974543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CoQhp+8e4ubD8QyCa9K4AzPgXearmQ+G0MVD70upAZE=;
 b=bHf6DM62A91+r3v4gqH1yawNRDLG3pNpel+ghhyx33XnuHl5zkgQ1Fy3+yA9uDOGANgsdp
 GiY2m7OG6hiXwFjCNSAfAuuOXbgODUqEfUBaVRCe8cxQ7gMQ2Vt3zdg4UYEQF33ijbkHnn
 bTUvjhECTxMvkoNUkSFu5QLM+XzBVII=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-ZohMQ3iAMMqEEOOxjrGEVQ-1; Thu, 23 Jun 2022 04:55:41 -0400
X-MC-Unique: ZohMQ3iAMMqEEOOxjrGEVQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 e5-20020adff345000000b0021b9f00e882so898720wrp.6
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 01:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=CoQhp+8e4ubD8QyCa9K4AzPgXearmQ+G0MVD70upAZE=;
 b=b6Tdv2LsAU9+jXNxTJK+Gya3392NvaZauYQXh8LUnUjNWwUxwOMsbpyHVb/63u5ugf
 dEF9Y/EqkZljubhHNivSzFoIz62dDo4ZydESDCFL7mikMycS6xi7DvT1vMnUXucgZo5O
 9yXyA6NBhPEJsNaX3QxmWu+Ga0ptLmLromSAsgsChpb+D8UQ8h2hmcJNtIR+nrWpR/2G
 esAOPx+W0m4CHwpJr4I21sdRytit8xS/lSkPIeUWbqF/CApG0KyGeaF9pCMS2pE5qzZJ
 pCDH4Gi7dCuvLeCYfOhB/yRz7SfA/fKyF6hHBUmATSfZJ+cptu532QvPoUd+nJC8V4ux
 O7cg==
X-Gm-Message-State: AJIora+KCRbLhPsLjaDfJoS3rA4klvPYJU62JD8g61kqUm43VtQEqkPI
 zVLiFmD7xlaa1fP4ABsAoLgc9jcQgYgi9wMkDmQPPa9GiZJU1lupVJ8YrA7IqUYKxlxNZ9V+lDb
 pdU/cGhfHjEg/CMM=
X-Received: by 2002:a05:600c:385:b0:3a0:2319:9a20 with SMTP id
 w5-20020a05600c038500b003a023199a20mr2950852wmd.18.1655974540754; 
 Thu, 23 Jun 2022 01:55:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vw0UfpUzmwSdNoOlRO/+BRa6uFqnmE4tMZMnNNR/08HtSwZ66b4QwzOVpedm2/jznM8W099A==
X-Received: by 2002:a05:600c:385:b0:3a0:2319:9a20 with SMTP id
 w5-20020a05600c038500b003a023199a20mr2950833wmd.18.1655974540549; 
 Thu, 23 Jun 2022 01:55:40 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 y2-20020a05600c364200b003974d0d981dsm2207995wmq.35.2022.06.23.01.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 01:55:39 -0700 (PDT)
Date: Thu, 23 Jun 2022 09:55:37 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 huangy81@chinatelecom.cn, quintela@redhat.com, leobras@redhat.com,
 jdenemar@redhat.com
Subject: Re: [PULL 22/33] migration: remove the QEMUFileOps 'get_buffer'
 callback
Message-ID: <YrQqiT3DS0hu2nO1@work-vm>
References: <20220622183917.155308-1-dgilbert@redhat.com>
 <20220622183917.155308-23-dgilbert@redhat.com>
 <YrNu3KesFVVvoWVb@xz-m1.local> <YrQm5dWbuy2l3vE8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrQm5dWbuy2l3vE8@redhat.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Jun 22, 2022 at 03:34:52PM -0400, Peter Xu wrote:
> > On Wed, Jun 22, 2022 at 07:39:06PM +0100, Dr. David Alan Gilbert (git) wrote:
> > > diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> > > index 74f919de67..e206b05550 100644
> > > --- a/migration/qemu-file.c
> > > +++ b/migration/qemu-file.c
> > > @@ -377,8 +377,22 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
> > >          return 0;
> > >      }
> > >  
> > > -    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
> > > -                             IO_BUF_SIZE - pending, &local_error);
> > > +    do {
> > > +        len = qio_channel_read(f->ioc,
> > > +                               (char *)f->buf + pending,
> > > +                               IO_BUF_SIZE - pending,
> > > +                               &local_error);
> > > +        if (len == QIO_CHANNEL_ERR_BLOCK) {
> > > +            if (qemu_in_coroutine()) {
> > > +                qio_channel_yield(f->ioc, G_IO_IN);
> > > +            } else {
> > > +                qio_channel_wait(f->ioc, G_IO_IN);
> > > +            }
> > > +        } else if (len < 0) {
> > > +            len = EIO;
> > 
> > This should be -EIO.
> 
> Yes, that's correct change. /facepalm

I'll resend with that fixed.

Dave

> 
> > 
> > > +        }
> > > +    } while (len == QIO_CHANNEL_ERR_BLOCK);
> > 
> > It's failing only with the new TLS test I added for postcopy somehow (at
> > least /x86_64/migration/postcopy/recovery/tls).. I also verified after the
> > change it'll work again.
> 
> Yeah, I guess this is a rare failure condition that's not easily hit
> in our tests. Makes sense that recovery tests could hit it though.
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


